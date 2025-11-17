class KFControlBinder extends KeyBindMenu;

var localized string BindingLabel[150];

function LoadCommands()
{
    local int i;

    Super.LoadCommands();

    // Update the MultiColumnList's sortdata array to reflect the indexes of our Bindings array
    for (i = 0; i < Bindings.Length; i++)
        li_Binds.AddedItem();
}

function MapBindings()
{
    LoadCustomBindings();
    Super.MapBindings();
}

protected function LoadCustomBindings()
{
    local int i;
    local array<string> KeyBindClasses;
    local class<GUIUserKeyBinding> CustomKeyBindClass;

    // Load custom keybinds from .int files
    PlayerOwner().GetAllInt("XInterface.GUIUserKeyBinding",KeyBindClasses);
    for (i = 0; i < KeyBindClasses.Length; i++)
    {
        CustomKeyBindClass = class<GUIUserKeyBinding>(DynamicLoadObject(KeyBindClasses[i],class'Class'));
        if (CustomKeyBindClass != None)
            AddCustomBindings( CustomKeyBindClass.default.KeyData );
    }
}

function AddCustomBindings( array<GUIUserKeyBinding.KeyInfo> KeyData )
{
    local int i;

    for ( i = 0; i < KeyData.Length; i++ )
        CreateAliasMapping( KeyData[i].Alias, KeyData[i].KeyLabel, KeyData[i].bIsSection );
}

function ClearBindings()
{
    local int i, max;

    Super.ClearBindings();
    Bindings = default.Bindings;
    max = Min(Bindings.Length, ArrayCount(BindingLabel));
    for ( i = 0; i < max; i++ )
    {
        if ( BindingLabel[i] != "" )
            Bindings[i].KeyLabel = BindingLabel[i];
    }
}

defaultproperties
{
    PageCaption="Configure Keys"
    Headings(0)="Action"
    Bindings(0)=(bIsSectionLabel=true,KeyLabel="Movement")
    BindingLabel(0)="Movement"
    Bindings(1)=(KeyLabel="Forward",Alias="MoveForward")
    BindingLabel(1)="Forward"
    Bindings(2)=(KeyLabel="Backward",Alias="MoveBackward")
    BindingLabel(2)="Backward"
    Bindings(3)=(KeyLabel="Strafe Left",Alias="StrafeLeft")
    BindingLabel(3)="Strafe Left"
    Bindings(4)=(KeyLabel="Strafe Right",Alias="StrafeRight")
    BindingLabel(4)="Strafe Right"
    Bindings(5)=(KeyLabel="Jump",Alias="Jump")
    BindingLabel(5)="Jump"
    Bindings(6)=(KeyLabel="Walk",Alias="Walking")
    BindingLabel(6)="Walk"
    Bindings(7)=(KeyLabel="Crouch",Alias="Duck")
    BindingLabel(7)="Crouch"
    Bindings(8)=(KeyLabel="Strafe Toggle",Alias="Strafe")
    BindingLabel(8)="Strafe Toggle"

    Bindings(9)=(bIsSectionLabel=true,KeyLabel="Looking")
    BindingLabel(9)="Looking"
    Bindings(10)=(KeyLabel="Turn Left",Alias="TurnLeft")
    BindingLabel(10)="Turn Left"
    Bindings(11)=(KeyLabel="Turn Right",Alias="TurnRight")
    BindingLabel(11)="Turn Right"
    Bindings(12)=(KeyLabel="Look Up",Alias="LookUp")
    BindingLabel(12)="Look Up"
    Bindings(13)=(KeyLabel="Look Down",Alias="LookDown")
    BindingLabel(13)="Look Down"
    Bindings(14)=(KeyLabel="Center View",Alias="CenterView")
    BindingLabel(14)="Center View"
    Bindings(15)=(KeyLabel="Toggle 'BehindView'",Alias="ToggleBehindView")
    BindingLabel(15)="Toggle 'BehindView'"
    Bindings(16)=(KeyLabel="Toggle Camera Mode",Alias="ToggleFreeCam")
    BindingLabel(16)="Toggle Camera Mode"

    Bindings(17)=(bIsSectionLabel=true,KeyLabel="Weapons")
    BindingLabel(17)="Weapons"
    Bindings(18)=(KeyLabel="Fire",Alias="Fire")
    BindingLabel(18)="Fire"
    Bindings(19)=(KeyLabel="Alt-Fire/Flashlight",Alias="AltFire")
    BindingLabel(19)="Alt-Fire"
    BindingLabel(20)="Aiming"
    Bindings(20)=(KeyLabel="Aiming",Alias="Aiming")
    BindingLabel(21)="Toggle Aiming"
    Bindings(21)=(KeyLabel="Toggle Aiming",Alias="ToggleAiming")
    BindingLabel(22)="Reload"
    Bindings(22)=(KeyLabel="Reload Weapon",Alias="ReloadWeapon")
    Bindings(23)=(KeyLabel="Throw Weapon",Alias="ThrowWeapon")
    BindingLabel(23)="Throw Weapon"
    Bindings(24)=(KeyLabel="Best Weapon",Alias="SwitchToBestWeapon")
    BindingLabel(24)="Best Weapon"

    BindingLabel(25)="Switch to Knife"
    Bindings(25)=(KeyLabel="Switch to Knife",Alias="SwitchToBestMeleeWeapon")

    Bindings(26)=(KeyLabel="Next Weapon",Alias="NextWeapon")
    BindingLabel(26)="Next Weapon"

    Bindings(27)=(KeyLabel="Prev Weapon",Alias="PrevWeapon")
    BindingLabel(27)="Prev Weapon"
    Bindings(28)=(KeyLabel="Last Weapon",Alias="SwitchToLastWeapon")
    BindingLabel(28)="Last Weapon"

    Bindings(29)=(KeyLabel="Throw Grenade",Alias="ThrowNade")
    BindingLabel(29)="Throw Grenade"

    Bindings(30)=(bIsSectionLabel=true,KeyLabel="Communication")
    BindingLabel(30)="Communication"
    Bindings(31)=(KeyLabel="Say",Alias="Talk")
    BindingLabel(31)="Say"
    Bindings(32)=(KeyLabel="Team Say",Alias="TeamTalk")
    BindingLabel(32)="Team Say"
    Bindings(33)=(KeyLabel="In Game Chat",Alias="InGameChat")
    BindingLabel(33)="In Game Chat"
    Bindings(34)=(KeyLabel="Perks Menu",Alias="OpenVeterancyMenu")
    BindingLabel(34)="Perks Menu"
    Bindings(35)=(KeyLabel="Activate Microphone",Alias="VoiceTalk")
    BindingLabel(35)="Activate Microphone"
    Bindings(36)=(KeyLabel="Speak in Public Channel",Alias="Speak Public")
    BindingLabel(36)="Speak in Public Channel"
    Bindings(37)=(KeyLabel="Speak in local Channel",Alias="Speak Local")
    BindingLabel(37)="Speak in local Channel"
    Bindings(38)=(KeyLabel="Speak in Team Channel",Alias="Speak Team")
    BindingLabel(38)="Speak in Team Channel"
    Bindings(39)=(KeyLabel="Toggle Public Chatroom",Alias="TogglePublicChat")
    BindingLabel(39)="Toggle Public Channel"
    Bindings(40)=(KeyLabel="Toggle local Chatroom",Alias="ToggleLocalChat")
    BindingLabel(40)="Toggle local Channel"
    Bindings(41)=(KeyLabel="Toggle Team Chatroom",Alias="ToggleTeamChat")
    BindingLabel(41)="Toggle Team Channel"

    BindingLabel(42)="ShoutSupport"
    Bindings(42)=(KeyLabel="Shout: Need Support",Alias="ShoutSupport")
    BindingLabel(43)="ShoutFormUp"
    Bindings(43)=(KeyLabel="Shout: Form Up On Me",Alias="ShoutFormUp")
    BindingLabel(44)="ShoutTakeThis"
    Bindings(44)=(KeyLabel="Shout: Take This",Alias="ShoutTakeThis")
    BindingLabel(45)="ShoutTrading"
    Bindings(45)=(KeyLabel="Shout: I'm Going Trading",Alias="ShoutTrading")
    BindingLabel(46)="ShoutMedic"
    Bindings(46)=(KeyLabel="Shout: MEDIC!",Alias="ShoutMedic")
    BindingLabel(47)="ShoutWelding"
    Bindings(47)=(KeyLabel="I'm Welding!",Alias="ShoutWelding")
    BindingLabel(48)="ShoutCovering"
    Bindings(48)=(KeyLabel="I'll Cover You!",Alias="ShoutCovering")


    Bindings(49)=(bIsSectionLabel=true,KeyLabel="Taunts")
    BindingLabel(49)="Taunts"
    Bindings(50)=(KeyLabel="Pelvic Thrust",Alias="taunt pthrust")
    BindingLabel(50)="Pelvic Thrust"
    Bindings(51)=(KeyLabel="Ass Smack",Alias="taunt asssmack")
    BindingLabel(51)="Ass Smack"
    Bindings(52)=(KeyLabel="Throat Cut",Alias="taunt throatcut")
    BindingLabel(52)="Throat Cut"
    Bindings(53)=(KeyLabel="Brag",Alias="taunt gesture_point")
    BindingLabel(53)="Brag"

    Bindings(54)=(bIsSectionLabel=true,KeyLabel="Hud")
    BindingLabel(54)="Hud"
    Bindings(55)=(KeyLabel="Grow Hud",Alias="GrowHud")
    BindingLabel(55)="Grow Hud"
    Bindings(56)=(KeyLabel="Shrink Hud",Alias="ShrinkHud")
    BindingLabel(56)="Shrink Hud"

    Bindings(57)=(bIsSectionLabel=true,KeyLabel="Game")
    BindingLabel(57)="Game"
    Bindings(58)=(KeyLabel="Use",Alias="use")
    BindingLabel(58)="Use"
    Bindings(59)=(KeyLabel="Pause",Alias="Pause")
    BindingLabel(59)="Pause"
    Bindings(60)=(KeyLabel="Screenshot",Alias="shot")
    BindingLabel(60)="Screenshot"
    Bindings(61)=(KeyLabel="Drop Cash",Alias="TossCash")
    BindingLabel(61)="Drop Cash"

    Bindings(62)=(KeyLabel="Show Personal Stats",Alias="ShowStats")
    BindingLabel(62)="Show Personal Stats"
    Bindings(63)=(KeyLabel="View Next Player's Stats",Alias="NextStats")
    BindingLabel(63)="View Next Player's Stats"
    Bindings(64)=(KeyLabel="Server Info",Alias="ServerInfo")
    BindingLabel(64)="Server Info"

    Bindings(65)=(bIsSectionLabel=true,KeyLabel="Miscellaneous")
    BindingLabel(65)="Miscellaneous"

    Bindings(66)=(KeyLabel="Show Objectives",Alias="ShowScores")
    BindingLabel(66)="Show Objectives"

    Bindings(67)=(KeyLabel="Menu",Alias="ShowMenu")
    BindingLabel(67)="Menu"
    Bindings(68)=(KeyLabel="Music Player",Alias="MusicMenu")
    BindingLabel(68)="Music Player"
    Bindings(69)=(KeyLabel="Voting Menu",Alias="ShowVoteMenu")
    BindingLabel(69)="Voting Menu"
    Bindings(70)=(KeyLabel="Toggle Console",Alias="ConsoleToggle")
    BindingLabel(70)="Toggle Console"
    Bindings(71)=(KeyLabel="View Connection Status",Alias="Stat Net")
    BindingLabel(71)="View Connection Status"
    Bindings(72)=(KeyLabel="Cancel Pending Connection",Alias="Cancel")
    BindingLabel(72)="Cancel Pending Connection"

    Bindings(73)=(KeyLabel="Select Melee",Alias="SwitchWeapon 1")
    BindingLabel(73)="Select Melee"
    Bindings(74)=(KeyLabel="Select Pistol/Bullpup",Alias="SwitchWeapon 2")
    BindingLabel(74)="Select Pistol/Bullpup"
    Bindings(75)=(KeyLabel="Select Handcannon/Shotgun",Alias="SwitchWeapon 3")
    BindingLabel(75)="Select Handcannon/Shotgun"
    Bindings(76)=(KeyLabel="Select LAW/Crossbow/Rifle",Alias="SwitchWeapon 4")
    BindingLabel(76)="Select LAW/Crossbow/Rifle"
    Bindings(77)=(KeyLabel="Select Syringe/Welder",Alias="SwitchWeapon 6")
    BindingLabel(77)="Select Syringe/Welder"
    Bindings(78)=(KeyLabel="Quick Self-Heal",Alias="QuickHeal")
    BindingLabel(78)="Quick Self-Heal"
}

