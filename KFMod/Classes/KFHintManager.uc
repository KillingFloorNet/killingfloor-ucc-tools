//=============================================================================
// KFHintManager
//=============================================================================
// This class manages (most) of the hinting system stuff. It is spawned and
// referenced in KFPlayerController. It also interfaces with KFHud to display the hints
// on screen. Finally, config variables are used to
//=============================================================================
class KFHintManager extends Info
    config(User);

// Data structures
struct HintInfo
{
    var() int                   type;
    var() int                   priority; // 1 = highest priority, 2 = lower than 0, etc
    var() int                   delay; // how many seconds to wait before displaying the hint
    var() localized string      title;
    var() localized string      hint;   // actual hint text
    var int                     index; // set in code, do not use!
};

// Constants
const                           MAX_HINT_TYPES = 61;
const                           MAX_HINTS = 61;

// config variables
var()   float                   PostHintDisplayDelay;           // How long to wait before displaying any other hint (value higher than 0 needed)
var()   float                   SameHintTypePostDisplayDelay;   // How long to wait before authorizing a hint from same type to be displayed (value higher than 0 needed)
var()   HintInfo                Hints[MAX_HINTS];
var     config  int             bUsedUpHints[MAX_HINTS]; // 0 = hint unused, 1 = hint used before
var     float                   RandomHintTimerDelay;

// Hints array
var     int                     HintsAvailableByType[MAX_HINT_TYPES];
var     array<HintInfo>         SortedHints;

// State variables
var     HintInfo                CurrentHint; // Copy of hint for convenience
var     int                     CurrentHintIndex; // Index in the SortedHints array
var     float                   LastHintDisplayTime;
var     int                     LastHintType;


function PostBeginPlay()
{
    super.PostBeginPlay();
    LastHintType = -1;
    LoadHints();
}

static function StaticReset()
{
    local int i;
    for (i = 0; i < MAX_HINT_TYPES; i++)
        default.bUsedUpHints[i] = 0;
    StaticSaveConfig();
}

function NonStaticReset()
{
    local int i;
    for (i = 0; i < MAX_HINT_TYPES; i++)
        bUsedUpHints[i] = 0;
    SaveConfig();
    Reload();
}

function Reload()
{
    StopHinting();
    LoadHints();
}

function LoadHints()
{
    local int i, j, index, priority;

    // Initialize arrays to 0
    SortedHints.Length = 0;
    for (i = 0; i < MAX_HINT_TYPES; i++)
        HintsAvailableByType[i] = 0;

    // Sort hints in the SortedHints by priority -- highest priority hints
    // get placed first. At same time, build array of available hints
    // using id of used hints
    for (i = 0; i < MAX_HINT_TYPES; i++)
    {
        Hints[i].index = i;

        // Check if we should add this hint
        if (bUsedUpHints[i] == 0 && Hints[i].title != "")
        {
            HintsAvailableByType[Hints[i].type]++;

            // Find where we should insert the new hint
            priority = Hints[i].priority;
            index = -1;
            for (j = 0; j < SortedHints.Length; j++)
                if (SortedHints[j].priority >= priority)
                {
                    index = j;
                    break;
                }

            // Add hint to proper position
            if (index == -1)
                SortedHints[SortedHints.Length] = Hints[i];
            else
            {
                SortedHints.Insert(index, 1);
                SortedHints[index] = Hints[i];
            }
        }
    }
}

function CheckForHint(int hintType)
{
    local int i;

    if (HintsAvailableByType[hintType] == 0)
        return;

    // Check if we're allowed to display a hint of this type at this time
    if (LastHintType == hintType)
        if (level.TimeSeconds - LastHintDisplayTime < SameHintTypePostDisplayDelay)
            return;

    // We have available hints! Search array for first non-used hint of that type.
    // (first == highest priority)
    for (i = 0; i < SortedHints.Length; i++)
    {
        if (SortedHints[i].type == hintType)
        {
            CurrentHint = SortedHints[i];
            CurrentHintIndex = i;
            SetTimer(0, false);
            GotoState('PreHintDelay');
            return;
        }
    }

    // If we got here it means that hint couldn't be found. wtf?
    warn("Unable to find hint type '" $ hintType $ "' in SortedHints array, even though HintsAvailableByType"
        $ " indicates that there are " $ HintsAvailableByType[hintType] $ " hints of that type available!");
}

function StopHinting()
{
    GotoState('');
    SetTimer(0, false);
}

// Implemented in WaitHintDone state
function NotifyHintRenderingDone() {}

// Used to dump hint info to console
function DumpHints()
{
    local int i;
    log("Hint availability list:");
    for (i = 0; i < MAX_HINT_TYPES; i++)
        log("#" $ i $ " availability: " $ HintsAvailableByType[i]);
    log("Max number of hints in db: " $ MAX_HINT_TYPES);
    for (i = 0; i < MAX_HINT_TYPES; i++)
        log("#" $ i $ ", type = " $ hints[i].type
            $ ", pri = " $ hints[i].priority
            $ ", delay = " $ hints[i].delay
            $ ", used = " $ bUsedUpHints[i]
            $ ", title = '" $ hints[i].title $ "'"
            $ ", text = '" $ hints[i].hint $ "'");
    log("Hints in sorted array: " $ SortedHints.Length);
    for (i = 0; i < SortedHints.length; i++)
        log("#" $ i $ ", type = " $ SortedHints[i].type
            $ ", pri = " $ SortedHints[i].priority
            $ ", delay = " $ SortedHints[i].delay
            $ ", used = " $ bUsedUpHints[SortedHints[i].index]
            $ ", title = '" $ SortedHints[i].title $ "'"
            $ ", text = '" $ SortedHints[i].hint $ "'");

}

simulated function Timer()
{
    CheckForHint(60);
}

// This state is used when we want to show a hint.
state PreHintDelay
{
    function BeginState()
    {
        if (CurrentHint.delay ~= 0)
            GotoState('WaitHintDone');
        else
            SetTimer(CurrentHint.delay, false);
    }

    // Don't allow another hint to be scheduled when we have one scheduled already
    function CheckForHint(int hintType) {}

    function Timer()
    {
        GotoState('WaitHintDone');
    }
}

state WaitHintDone
{
    function BeginState()
    {
        local KFPlayerController player;
        
        // Tell HUDKillingFloor to display the hint
        player = KFPlayerController(Owner);
        
		if ( player != none && HUDKillingFloor(player.myHud) != none &&
             !HUDKillingFloor(player.myHud).bHideHud )
        {
            HUDKillingFloor(player.myHud).ShowHint(CurrentHint.title, CurrentHint.hint);
        }
        else
        {
            SetTimer(RandomHintTimerDelay, true);
            GotoState('');
        }
    }

    // Don't allow another hint to be scheduled when we're displaying one already
    function CheckForHint(int hintType) {}

    function NotifyHintRenderingDone()
    {
        // Hurray, hint done rendering! Switch to post-hint state.
        GotoState('PostDisplay');
    }
}

state PostDisplay
{
    function BeginState()
    {
        LastHintType = CurrentHint.type;
        LastHintDisplayTime = Level.TimeSeconds;
        SetTimer(PostHintDisplayDelay, false);
    }

    // Don't allow another hint to be scheduled until post-display delay is completed.
    function CheckForHint(int hintType) {}

    function Timer()
    {
        // Mark this hint as used up
        //log("setting hint #" $ CurrentHint.index $ " as used up.");
        log("bUsedUpHints["$CurrentHint.index$"] was:" @ bUsedUpHints[CurrentHint.index]);
		bUsedUpHints[CurrentHint.index] = 1;
        SaveConfig();
		
        log("bUsedUpHints["$CurrentHint.index$"] is now:" @ bUsedUpHints[CurrentHint.index]);

        // Update hint availability list
        HintsAvailableByType[CurrentHint.type]--;

        // Remove current hint from hints list
        //log("Removing from sortedhints array. old length = " $ SortedHints.Length);
        SortedHints.Remove(CurrentHintIndex, 1);
        //log("                                 new length = " $ SortedHints.Length);

        // Go back to 'idle' state
        SetTimer(RandomHintTimerDelay, true);
        GotoState('');
    }
}

defaultproperties
{
    PostHintDisplayDelay=1
    SameHintTypePostDisplayDelay=2
    //PostHintDisplayDelay=3
    //SameHintTypePostDisplayDelay=10
    RandomHintTimerDelay=29


    // Hint types:

	// Weapon Hints:
	Hints(00)=(type=10,priority=0,delay=1,title="Welcome!",hint="Use %ToggleAiming% to aim better, %ReloadWeapon% key to reload a clip. Use %PrevWeapon% or %NextWeapon% to switch weapons.")	
	Hints(01)=(type=11,priority=0,delay=1,title="Aiming and Reloading",hint="Use %ToggleAiming% to aim better, %ReloadWeapon% to reload a clip.")	
	Hints(03)=(type=12,priority=0,delay=1,title="Aiming and Reloading",hint="Use %ToggleAiming% to aim better, %ReloadWeapon% to reload a clip.")	
	Hints(04)=(type=13,priority=0,delay=1,title="Aiming and Reloading",hint="Use %ToggleAiming% to aim better, %ReloadWeapon% to reload a clip. Use %AltFire% to switch between full and semi auto.")
	Hints(05)=(type=14,priority=0,delay=1,title="Aiming and Reloading",hint="Use %ToggleAiming% to aim better, %ReloadWeapon% to reload.")	
	Hints(06)=(type=15,priority=0,delay=1,title="Aiming and Reloading",hint="Use %ToggleAiming% to aim better, %ReloadWeapon% to reload.")
	Hints(07)=(type=16,priority=0,delay=1,title="Aiming",hint="Use %ToggleAiming% gives you a scope for long-distance shooting.")		
	Hints(08)=(type=17,priority=0,delay=1,title="Firing",hint="Hit %Fire% for one barrel, %AltFire% for the both.")	
	Hints(09)=(type=18,priority=0,delay=1,title="Watch The Flames!",hint="Flame-thrower - it burns! Just don't let burning creatures get too close or you'll burn too!")		
	Hints(10)=(type=19,priority=0,delay=1,title="The LAW",hint="If you've got far enough to be carrying this baby, you shouldn't need any more hints on weapons!")
	Hints(11)=(type=20,priority=0,delay=1,title="Knife",hint="Switch to this weapon to run your fastest!")
	Hints(12)=(type=21,priority=0,delay=1,title="Machete",hint="Like a knife. Just bigger and nastier.")
	Hints(13)=(type=22,priority=0,delay=1,title="Fire-axe",hint="You need hints on what to do with THIS?!")
	
	//First Round Hints
	Hints(14)=(type=30,priority=0,delay=1,title="Specimen Counter",hint="Shows you how many of the blighters there are left to 'remove'. Or is that how many there are trying to 'remove' YOU?")
	
	//First Round Ended
	Hints(15)=(type=31,priority=0,delay=0,title="Way to the Trader",hint="Trader arrow and the red 'follow-me' shows you where the Trader's shop is and how far away - get there before the timer runs out!")
	Hints(16)=(type=32,priority=0,delay=0,title="Running",hint="Hit %SwitchWeapon 1% or use %PrevWeapon% or %NextWeapon% to switch to the knife so you can run your fastest")	
	Hints(17)=(type=33,priority=0,delay=0,title="Watch the time!",hint="Clock indicates how long you have before the next wave of specimens comes for you - time to go shopping!")
	
	//First Downtime
	Hints(18)=(type=40,priority=0,delay=0,title="They are coming!!",hint="You only have a few seconds left before the next wave arrives - think about where you're going to fight them!")
	
	//First wave after first shopping
	Hints(19)=(type=45,priority=0,delay=0,title="Trader arrow",hint="Shows you where the Trader will be AFTER the incoming wave.")
	
	//Environtment and Equipment
	Hints(20)=(type=50,priority=0,delay=0,title="Doors",hint="If you want to block off a door, pull out your welder and use it! It will keep them at bay - for a while.")
	Hints(21)=(type=51,priority=0,delay=0,title="Healing",hint="Use the med-syringe on yourself - %QuickHeal% for a quick boost!")
	Hints(22)=(type=52,priority=0,delay=0,title="At the shop",hint="Press %Use% to start shopping for new kit")
	Hints(23)=(type=53,priority=0,delay=0,title="Healing",hint="You must be near another player to heal them.|Press %Fire% to heal a team mate or %AltFire% to heal yourself")
	Hints(24)=(type=54,priority=0,delay=0,title="Welding",hint="You must be near a weldable door to use the welder.")
	
	Hints(40)=(type=60,priority=20,delay=1,title="Grenades",hint="Hit %ThrowNade% to toss a grenade out, if it is a target-rich environment!")
	Hints(41)=(type=60,priority=20,delay=1,title="Healing",hint="Use the med-syringe on a friend - it works way better on them than it does in your own arm!")
}

