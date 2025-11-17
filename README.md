# Killing Floor UCC Tools

## Contents

This repository contains the **official Killing Floor SDK files** from the Steam version. All rights to these files belong to Tripwire Interactive Inc.

**Killing Floor UCC Tools** is a NodeJS-based compilation tool (UCC wrapper) built by [Geekrainian](https://github.com/geekrainian/?utm_source=gitlab&utm_medium=killingfloor&utm_campaign=killingfloor-ucc-tools).

## Requirements

- **Node.js 12+** - [Download from nodejs.org](https://nodejs.org)

## Quick Start

1. Copy your mutators folders to the root directory
2. Run `node build.js`, this will:
   - Auto-detect your mutator(s)
   - Update `KillingFloor.ini` automatically
   - Compile, strip, compress, and copy to the target directories

## Configuration

Edit `build.config.json` to add additional output directories:

## CLI Usage

```bash
npm run build  # Build all
npm run build:specific ServerPerksMut  # Build specific
```

## Info

`ucc dumpint <PackageName.ext>` — Runs the DumpInt commandlet. It extracts all localized properties from the package and generates an .int file (the localization string table). In UT2003/UT2004 the new .int is written to the game’s System directory; the -mod= switch can be used when working inside a mod folder.

`ucc exportcache <PackageName.ext>` — Runs the ExportCache commandlet. It builds a .ucl file listing the package’s “cacheable” classes (mutators, gametypes, weapons, etc.) so they appear in in-game menus. The .ucl is written to the first directory listed in the CacheRecordPath array (as configured in INI).

`ucc BatchExport <PackageName.ext> <export class> <export extension> <export path>` — Runs the BatchExport commandlet to bulk-export objects from a package. Example to dump all UnrealScript classes to source files:
ucc BatchExport MyMutator.u class uc ..\MyMutator\Classes
If you omit the final path, .uc files default to the game’s System folder. Some asset types (notably animation formats like .psk/.psa) cannot be exported with this commandlet.

`ucc compress <File>` — Runs the compress commandlet and produces a .uz2 alongside the source file. .uz2 files are used for HTTP redirect downloads on UT2003/UT2004/KF servers (faster client downloads). Example: ucc compress VCTF-Powerlines-LD.ut2 → VCTF-Powerlines-LD.ut2.uz2.

`ucc decompress <File.uz2>` (or `ucc IpDrv.DecompressCommandlet <File.uz2>`) — Runs the Decompress commandlet from IpDrv to restore the original file from a .uz2. Note: the decompressor does not support wildcards (e.g., \*.uz2), so batch jobs require a loop in a script.
