#!/usr/bin/env node
const fs = require("fs");
const path = require("path");
const { spawn } = require("child_process");

const BASEDIR = __dirname;
const SYSTEMDIR = path.join(BASEDIR, "System");
const BACKUPDIR = path.join(BASEDIR, "_BACKUP");
const COMPRESSDIR = path.join(BASEDIR, "_COMPRESS");
const OUTDIR = path.join(BASEDIR, "_OUTPUT");
const CONFIGFILE = path.join(BASEDIR, "build.config.json");
const INI_FILE = path.join(SYSTEMDIR, "KillingFloor.ini");

const STANDARD_PACKAGES = [
  // kf sdk files
  "Animations",
  "Classes",
  "Core",
  "Editor",
  "Engine",
  "Fire",
  "ForceFeedback",
  "FrightScript",
  "GamePlay",
  "GoodKarma",
  "GUI2K4",
  "IPDrv",
  "KarmaData",
  "KFChar",
  "KFGui",
  "KFMod",
  "KFMutators",
  "KFStoryGame",
  "KFStoryUI",
  "Music",
  "Old2K4",
  "ROEffects",
  "ROEngine",
  "ROInterface",
  "SideshowScript",
  "Sounds",
  "StaticMeshes",
  "System",
  "Textures",
  "UnrealGame",
  "UTV2004c",
  "UWeb",
  "XAdmin",
  "XGame",
  "XInterface",
  "XVoting",
  "XWebAdmin",
  // custom
  "_BACKUP",
  "_COMPRESS",
  "_OUTPUT",
  // nodejs
  "node_modules",
];

const buildErrors = [];

function getTimestamp() {
  const now = new Date();
  const yyyy = now.getFullYear();
  const mm = String(now.getMonth() + 1).padStart(2, "0");
  const dd = String(now.getDate()).padStart(2, "0");
  const hh = String(now.getHours()).padStart(2, "0");
  const min = String(now.getMinutes()).padStart(2, "0");
  const sec = String(now.getSeconds()).padStart(2, "0");
  return `${yyyy}-${mm}-${dd}_${hh}-${min}-${sec}`;
}

function ensureDir(dir) {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
}

function moveFile(source, dest) {
  if (fs.existsSync(source)) {
    try {
      fs.renameSync(source, dest);
    } catch {
      fs.copyFileSync(source, dest);
      fs.unlinkSync(source);
    }
  }
}

function copyFile(source, dest) {
  if (fs.existsSync(source)) {
    fs.copyFileSync(source, dest);
  }
}

function deleteFile(filePath) {
  try {
    if (fs.existsSync(filePath)) fs.unlinkSync(filePath);
  } catch {}
}

function detectMutators() {
  console.log("\n> Detecting custom mutators...");

  const mutators = [];
  const items = fs.readdirSync(BASEDIR, { withFileTypes: true });

  for (const item of items) {
    if (!item.isDirectory() || STANDARD_PACKAGES.includes(item.name)) continue;

    const classesDir = path.join(BASEDIR, item.name, "Classes");
    if (fs.existsSync(classesDir) && fs.statSync(classesDir).isDirectory()) {
      mutators.push(item.name);
      console.log(`  Found: ${item.name}`);
    }
  }

  if (mutators.length === 0) {
    console.log(`\nNo custom mutators detected!`);
    console.log(`Place your mutator folders in: ${BASEDIR}\n`);
  } else {
    console.log(`\nDetected ${mutators.length} custom mutator(s)`);
  }

  return mutators;
}

function getBuildConfig() {
  if (!fs.existsSync(CONFIGFILE)) {
    const defaultConfig = {
      _comment: "Configure additional output directories here",
      additionalDirsToCopy: [],
    };
    fs.writeFileSync(
      CONFIGFILE,
      JSON.stringify(defaultConfig, null, 2),
      "utf8"
    );
    return defaultConfig;
  }

  try {
    return JSON.parse(fs.readFileSync(CONFIGFILE, "utf8"));
  } catch (err) {
    console.error(`Failed to parse config file: ${err.message}`);
    process.exit(1);
  }
}

function updateKillingFloorIni(allMutators, currentMutator = null) {
  if (!fs.existsSync(INI_FILE)) {
    console.error(`KillingFloor.ini not found: ${INI_FILE}`);
    process.exit(1);
  }

  const mutatorsToAdd = currentMutator ? [currentMutator] : allMutators;
  const iniContent = fs.readFileSync(INI_FILE, "utf8").split("\n");
  const newContent = [];
  let inEditorSection = false;

  for (let line of iniContent) {
    line = line.replace(/\r$/, "");

    if (line.match(/^\[Editor\.EditorEngine\]/)) {
      inEditorSection = true;
      newContent.push(line);
      continue;
    } else if (line.match(/^\[.*\]/)) {
      inEditorSection = false;
      newContent.push(line);
      continue;
    }

    if (inEditorSection) {
      if (
        line.match(/^;\s*</) ||
        line.match(/^;\s*MUTATOR TO COMPILE/) ||
        line.match(/^;\s*-/)
      ) {
        continue;
      }

      const match = line.match(/^EditPackages=(.+)$/);
      if (match) {
        const pkg = match[1];

        if (allMutators.includes(pkg)) continue;

        if (pkg === "FrightScript") {
          newContent.push(line);
          newContent.push("; <!-- AUTO-GENERATED -->");
          mutatorsToAdd.forEach((mut) =>
            newContent.push(`EditPackages=${mut}`)
          );
          newContent.push("; -->");
          continue;
        }
      }
    }

    newContent.push(line);
  }

  fs.writeFileSync(INI_FILE, newContent.join("\r\n"), "utf8");
}

function executeCommand(command, args, workingDir, captureOutput = false) {
  return new Promise((resolve, reject) => {
    const options = {
      cwd: workingDir,
      stdio: captureOutput ? "pipe" : "inherit",
      shell: true,
    };

    const proc = spawn(command, args, options);
    let output = "";

    if (captureOutput) {
      proc.stdout?.on("data", (data) => {
        const text = data.toString();
        process.stdout.write(text);
        output += text;
      });
      proc.stderr?.on("data", (data) => {
        const text = data.toString();
        process.stderr.write(text);
        output += text;
      });
    }

    proc.on("close", (code) => resolve({ code, output }));
    proc.on("error", reject);
  });
}

async function buildMutator(mutatorName, allMutators) {
  console.log(`\n> Building: ${mutatorName}`);

  const timestamp = getTimestamp();
  const startTime = Date.now();

  try {
    [BACKUPDIR, COMPRESSDIR, OUTDIR].forEach(ensureDir);

    updateKillingFloorIni(allMutators, mutatorName);

    const uFile = path.join(SYSTEMDIR, `${mutatorName}.u`);
    const uclFile = path.join(SYSTEMDIR, `${mutatorName}.ucl`);
    const uccPath = path.join(SYSTEMDIR, "ucc.exe");

    console.log("  [1/6] Backup...");
    if (fs.existsSync(uFile)) {
      moveFile(uFile, path.join(BACKUPDIR, `${mutatorName}_${timestamp}.u`));
    }
    if (fs.existsSync(uclFile)) {
      moveFile(
        uclFile,
        path.join(BACKUPDIR, `${mutatorName}_${timestamp}.ucl`)
      );
    }

    deleteFile(path.join(COMPRESSDIR, `${mutatorName}.u.uz2`));
    deleteFile(path.join(COMPRESSDIR, `${mutatorName}.ucl.uz2`));
    deleteFile(path.join(OUTDIR, `${mutatorName}.u`));
    deleteFile(path.join(OUTDIR, `${mutatorName}.ucl`));

    console.log("  [2/6] Compiling...");
    const result = await executeCommand(uccPath, ["make"], SYSTEMDIR, true);
    if (result.code !== 0) {
      const errorLogPath = path.join(BASEDIR, "error.log");
      const timestamp = new Date().toISOString();
      const logContent = `
${"=".repeat(64)}
Compilation Error - ${mutatorName}
Time: ${timestamp}
Exit Code: ${result.code}
${"=".repeat(64)}

${result.output}

`;
      fs.appendFileSync(errorLogPath, logContent, "utf8");
      throw new Error(
        `UCC failed with exit code: ${result.code}\nLogs saved to: error.log`
      );
    }
    if (!fs.existsSync(uFile)) {
      throw new Error(`Compiled file not found: ${mutatorName}.u`);
    }

    console.log("  [3/6] Stripping...");
    const stripResult = await executeCommand(
      uccPath,
      ["Editor.StripSourceCommandlet", `${mutatorName}.u`],
      SYSTEMDIR
    );

    console.log("  [4/6] Compressing...");
    await executeCommand(uccPath, ["compress", `${mutatorName}.u`], SYSTEMDIR);
    moveFile(
      path.join(SYSTEMDIR, `${mutatorName}.u.uz2`),
      path.join(COMPRESSDIR, `${mutatorName}.u.uz2`)
    );

    await executeCommand(
      uccPath,
      ["compress", `${mutatorName}.ucl`],
      SYSTEMDIR
    );
    moveFile(
      path.join(SYSTEMDIR, `${mutatorName}.ucl.uz2`),
      path.join(COMPRESSDIR, `${mutatorName}.ucl.uz2`)
    );

    console.log("  [5/6] Copying to _OUTPUT...");
    copyFile(uFile, path.join(OUTDIR, `${mutatorName}.u`));
    copyFile(uclFile, path.join(OUTDIR, `${mutatorName}.ucl`));

    console.log("  [6/6] Copying to additional directories...");
    const config = getBuildConfig();
    let copiedCount = 0;

    if (config.additionalDirsToCopy?.length > 0) {
      for (const dir of config.additionalDirsToCopy) {
        if (fs.existsSync(dir)) {
          copyFile(uFile, path.join(dir, `${mutatorName}.u`));
          copyFile(uclFile, path.join(dir, `${mutatorName}.ucl`));
          copiedCount++;
        }
      }
    }

    if (copiedCount === 0) {
      console.log("    No additional directories configured");
    }

    const duration = ((Date.now() - startTime) / 1000).toFixed(1);
    console.log(`\n✓ Build completed in ${duration}s\n`);

    return true;
  } catch (err) {
    console.error(`\n✗ Build failed: ${err.message}`);

    console.log("  Restoring backup...");
    moveFile(
      path.join(BACKUPDIR, `${mutatorName}_${timestamp}.u`),
      path.join(SYSTEMDIR, `${mutatorName}.u`)
    );
    moveFile(
      path.join(BACKUPDIR, `${mutatorName}_${timestamp}.ucl`),
      path.join(SYSTEMDIR, `${mutatorName}.ucl`)
    );

    buildErrors.push({ mutator: mutatorName, error: err.message });
    return false;
  }
}

async function main() {
  console.clear();

  const args = process.argv.slice(2);
  const specificMutator = args
    .find((arg) => arg.startsWith("--mutator="))
    ?.split("=")[1];

  if (!fs.existsSync(SYSTEMDIR)) {
    console.error(`System directory not found: ${SYSTEMDIR}`);
    process.exit(1);
  }

  if (!fs.existsSync(path.join(SYSTEMDIR, "ucc.exe"))) {
    console.error("UCC.exe not found in System directory!");
    process.exit(1);
  }

  if (!fs.existsSync(INI_FILE)) {
    console.error(`KillingFloor.ini not found: ${INI_FILE}`);
    process.exit(1);
  }

  let mutators = detectMutators();

  if (mutators.length === 0) {
    console.log("\nPress Enter to exit...");
    process.stdin.once("data", () => process.exit(0));
    return;
  }

  if (specificMutator) {
    if (mutators.includes(specificMutator)) {
      mutators = [specificMutator];
    } else {
      console.error(
        `Mutator '${specificMutator}' not found: ${mutators.join(", ")}`
      );
      process.exit(1);
    }
  }

  const allMutators = mutators;
  console.log(`\nBuilding ${mutators.length} mutator(s)`);

  let successCount = 0;
  let failCount = 0;

  for (const mut of mutators) {
    const result = await buildMutator(mut, allMutators);
    result ? successCount++ : failCount++;
  }

  if (successCount > 0) {
    console.log("> Updating INI with all built mutators...");
    updateKillingFloorIni(allMutators);
  }

  console.log("\n" + "=".repeat(64));
  console.log("  BUILD SUMMARY");
  console.log("=".repeat(64));
  console.log(`  Successful: ${successCount}`);

  if (failCount > 0) {
    console.log(`  Failed: ${failCount}\n`);
    buildErrors.forEach((err) => {
      console.log(`    - ${err.mutator}: ${err.error}`);
    });
  }

  console.log("=".repeat(64));
  console.log("\nPress Enter to exit...");
  process.stdin.once("data", () => {
    process.exit(failCount > 0 ? 1 : 0);
  });
}

main().catch((err) => {
  console.error(`Unexpected error: ${err.message}`);
  console.error(err);
  process.exit(1);
});
