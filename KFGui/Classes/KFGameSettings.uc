class KFGameSettings extends Settings_Tabs;

var automated GUISectionBackground i_BG1, i_BG2;

//var automated moEditBox     ed_PlayerName;

var automated 	moCheckBox    	ch_DynNetspeed;
var automated 	moComboBox    	co_Netspeed;

var automated 	moComboBox    	co_Hints;
var 			int 			HintLevel,
								HintLevelD; // 0 = all hints, 1 = new hints, 2 = no hints
var localized 	array<string>	Hints;

var automated 	moComboBox    	co_AudioMessageLevel;
var				int             AudioMessageLevel,
								AudioMessageLevelD;
var	localized	string			AudioMessageLevels[3];

var automated 	moCheckBox		ch_TraderPath;
var				bool			bTrader;

var int     iNetspeed, iNetSpeedD;
var bool    bDynNet;
var string  sPlayerName, sPlayerNameD;

var localized string    NetSpeedText[4];

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
    local int i;

	Super.InitComponent(MyController, MyOwner);

    for(i = 0; i < ArrayCount(NetSpeedText); i++)
        co_Netspeed.AddItem(NetSpeedText[i]);

    i_BG2.ManageComponent(co_Netspeed);
    i_BG2.ManageComponent(ch_DynNetspeed);

   	i_BG1.ManageComponent(co_Hints);
	i_BG1.ManageComponent(ch_TraderPath);
	i_BG1.ManageComponent(co_AudioMessageLevel);

	for ( i = 0; i < Hints.Length; i++ )
	{
	    co_Hints.AddItem(Hints[i]);
	}
	co_Hints.ReadOnly(true);

	for (i = 0; i < 3; i++)
	{
	    co_AudioMessageLevel.AddItem(AudioMessageLevels[i]);
	}
	co_AudioMessageLevel.ReadOnly(true);

}

function InternalOnLoadINI(GUIComponent Sender, string s)
{
    local PlayerController PC;
    local int i;

    PC = PlayerOwner();

    switch (Sender)
    {
        case co_Netspeed:
        	if ( PC.Player != None )
        		i = PC.Player.ConfiguredInternetSpeed;
        	else
                i = class'Player'.default.ConfiguredInternetSpeed;

            if (i <= 2600)
                iNetSpeed = 0;

            else if (i <= 5000)
                iNetSpeed = 1;

            else if (i <= 10000)
                iNetSpeed = 2;

            else iNetSpeed = 3;

			iNetSpeedD = iNetSpeed;
            co_NetSpeed.SetIndex(iNetSpeed);
            break;

        case ch_DynNetspeed:
            bDynNet = PC.bDynamicNetSpeed;
            ch_DynNetspeed.Checked(bDynNet);
            break;

		case co_Hints:
    	 	if ( KFPlayerController(PlayerOwner()) != none )
    	    {
    	        if ( KFPlayerController(PlayerOwner()).bShowHints )
    	        {
    	            HintLevel = 1;
    	        }
    	        else
    	        {
    	            HintLevel = 2;
    	        }
    	    }
    	    else
    	    {
    	        if ( class'KFPlayerController'.default.bShowHints )
    	        {
				    HintLevel = 1;
				}
    	        else
    	        {
    	            HintLevel = 2;
    	        }
    	    }

			HintLevelD = HintLevel;
			co_Hints.SetIndex(HintLevel);
    	    break;

		case ch_TraderPath:
			if ( KFPlayerController(PlayerOwner()) != none )
    	    {
				bTrader = KFPlayerController(PlayerOwner()).bWantsTraderPath;
			}
			else
			{
				bTrader = class'KFPlayerController'.default.bWantsTraderPath;
			}

			ch_TraderPath.SetComponentValue(bTrader,true);
			break;

		case co_AudioMessageLevel:
	     	AudioMessageLevel = int(PC.ConsoleCommand("get KFMod.KFPlayerController AudioMessageLevel"));
	     	AudioMessageLevelD = AudioMessageLevel;
	     	co_AudioMessageLevel.SetIndex(AudioMessageLevel);
	        break;
    }
}

function SaveSettings()
{
    local PlayerController PC;
    local bool bSave;

	Super.SaveSettings();
    PC = PlayerOwner();

	if ( iNetSpeed != iNetSpeedD || (class'Player'.default.ConfiguredInternetSpeed == 9636) )
	{
		if ( PC.Player != None )
		{
			switch (iNetSpeed)
			{
				case 0: PC.Player.ConfiguredInternetSpeed = 2600; break;
				case 1: PC.Player.ConfiguredInternetSpeed = 5000; break;
				case 2: PC.Player.ConfiguredInternetSpeed = 10000; break;
				case 3: PC.Player.ConfiguredInternetSpeed = 15000; break;
			}

			PC.Player.SaveConfig();
		}

		else
		{
			switch (iNetSpeed)
			{
				case 0: class'Player'.default.ConfiguredInternetSpeed = 2600; break;
				case 1: class'Player'.default.ConfiguredInternetSpeed = 5000; break;
				case 2: class'Player'.default.ConfiguredInternetSpeed = 10000; break;
				case 3: class'Player'.default.ConfiguredInternetSpeed = 15000; break;
			}

			class'Player'.static.StaticSaveConfig();
		}
	}

	if ( PC.bDynamicNetSpeed != bDynNet )
	{
		PC.bDynamicNetSpeed = bDynNet;
		bSave = True;
	}

   	if ( HintLevelD != HintLevel )
	{
	    if (HintLevel == 0)
	    {
	        if (KFPlayerController(PC) != none)
	        {
	            KFPlayerController(PC).bShowHints = true;
                KFPlayerController(PC).UpdateHintManagement(true);
                if (KFPlayerController(PC).HintManager != none)
	                KFPlayerController(PC).HintManager.NonStaticReset();
                KFPlayerController(PC).SaveConfig();
	        }
	        else
	        {
	            class'KFHintManager'.static.StaticReset();
	            class'KFPlayerController'.default.bShowHints = true;
	            class'KFPlayerController'.static.StaticSaveConfig();
	        }
	    }
	    else
	    {
	        if (KFPlayerController(PC) != none)
	        {
	            KFPlayerController(PC).bShowHints = (HintLevel == 1);
	            KFPlayerController(PC).UpdateHintManagement(HintLevel == 1);
	            KFPlayerController(PC).SaveConfig();
	        }
	        else
	        {
	            class'KFPlayerController'.default.bShowHints = (HintLevel == 1);
	            class'KFPlayerController'.static.StaticSaveConfig();
	        }
	    }
	}

	if (KFPlayerController(PlayerOwner()) != none)
    {
		KFPlayerController(PlayerOwner()).bWantsTraderPath = bTrader;
        KFPlayerController(PC).SaveConfig();
	}
	else
    {
        class'KFPlayerController'.default.bWantsTraderPath = bTrader;
        class'KFPlayerController'.static.StaticSaveConfig();
    }


	if ( AudioMessageLevelD != AudioMessageLevel )
	{
		if (KFPlayerController(PlayerOwner()) != none)
	    {
		    KFPlayerController(PlayerOwner()).AudioMessageLevel = AudioMessageLevel;
		    KFPlayerController(PC).SaveConfig();
		}
		else
		{
			class'KFPlayerController'.default.AudioMessageLevel = AudioMessageLevel;
			class'KFPlayerController'.static.StaticSaveConfig();
		}
	}

	if (bSave)
        PC.SaveConfig();
}

function InternalOnChange(GUIComponent Sender)
{
    Super.InternalOnChange(Sender);

    switch (sender)
    {
        case co_Netspeed:
            iNetSpeed = co_NetSpeed.GetIndex();
            break;

        case ch_DynNetspeed:
            bDynNet = ch_DynNetspeed.IsChecked();
            break;

        case co_Hints:
    	    HintLevel = co_Hints.GetIndex();
    	    break;

    	case ch_TraderPath:
			bTrader = ch_TraderPath.IsChecked();
			break;

		case co_AudioMessageLevel:
			AudioMessageLevel = co_AudioMessageLevel.GetIndex();
			break;
    }
}

function ResetClicked()
{
	local PlayerController PC;
	local int i;

	Super.ResetClicked();

	PC = PlayerOwner();

	class'Player'.static.ResetConfig("ConfiguredInternetSpeed");
	class'PlayerController'.static.ResetConfig("bDynamicNetSpeed");

	for (i = 0; i < Components.Length; i++)
		Components[i].LoadINI();
}

DefaultProperties
{
    Begin Object class=GUISectionBackground Name=GameBK1
		WinWidth=0.5
		WinHeight=0.25
		WinLeft=0.25
		WinTop=0.05
        RenderWeight=0.1001
        Caption="Gameplay"
    End Object
    i_BG1=GameBK1


    Begin Object class=GUISectionBackground Name=GameBK2
		WinWidth=0.5
		WinHeight=0.2
		WinLeft=0.25
		WinTop=0.35
        RenderWeight=0.1002
		Caption="Network"
    End Object
    i_BG2=GameBK2

   /* Begin Object class=moEditBox Name=OnlineStatsName
		WinWidth=0.419316
		WinLeft=0.524912
		WinTop=0.373349
        INIOption="@Internal"
        OnLoadINI=InternalOnLoadINI
        OnChange=InternalOnChange
        Caption="Player Name"
        Hint="Please select a name to use ingame"
        CaptionWidth=0.5
        TabOrder=1
    End Object
    ed_PlayerName=OnlineStatsName
	*/

	Begin Object class=moComboBox Name=OnlineNetSpeed
		WinWidth=0.419297
		WinLeft=0.528997
		WinTop=0.222944
        Caption="Connection"
        INIOption="@Internal"
        INIDefault="Cable Modem/DSL"
        OnLoadINI=InternalOnLoadINI
        OnChange=InternalOnChange
        Hint="How fast is your connection?"
        CaptionWidth=0.5
        ComponentJustification=TXTA_Left
        bReadOnly=true
        bHeightFromComponent=false
        TabOrder=3
    End Object
    co_Netspeed=OnlineNetSpeed

    Begin Object class=moCheckBox Name=NetworkDynamicNetspeed
		WinWidth=0.419297
		WinLeft=0.528997
		WinTop=0.266017
        Caption="Dynamic Netspeed"
        Hint="Netspeed is automatically adjusted based on the speed of your network connection"
        CaptionWidth=0.955
        bSquare=true
        ComponentJustification=TXTA_Left
        IniOption="@Internal"
        OnLoadINI=InternalOnLoadINI
        OnChange=InternalOnChange
        TabOrder=4
    End Object
    ch_DynNetspeed=NetworkDynamicNetspeed


   	Begin Object Class=moComboBox Name=HintsCombo
	    Caption="Hint Level"
	    ComponentJustification=TXTA_Left
	    Hint="Selects whether hints should be shown or not."
		WinWidth=0.401953
		WinLeft=0.547773
		WinTop=0.335021
		CaptionWidth=0.55
	    TabOrder=0
	    bBoundToParent=True
	    bScaleToParent=True
	    OnLoadINI=InternalOnLoadINI
	    OnChange=InternalOnChange
	    IniOption="@Internal"
	End Object
	co_Hints=HintsCombo

   Begin Object class=moCheckBox Name=TraderPath
        Caption="Show the trader path"
        Hint="Enables the path to the trader"
        CaptionWidth=0.955
        bSquare=True
        ComponentJustification=TXTA_Left
        OnLoadINI=InternalOnLoadINI
        OnChange=InternalOnChange
        INIOption="@Internal"
        INIDefault="False"
        bAutoSizeCaption=True
    End Object
    ch_TraderPath=TraderPath

    Begin Object Class=moComboBox Name=AudioMessageCombo
	    Caption="Audio Message Level"
	    ComponentJustification=TXTA_Left
	    Hint="Selects what type of messages are played"
		WinWidth=0.401953
		WinLeft=0.547773
		WinTop=0.335021
		CaptionWidth=0.55
	    TabOrder=0
	    bBoundToParent=True
	    bScaleToParent=True
	    OnLoadINI=InternalOnLoadINI
	    OnChange=InternalOnChange
	    IniOption="@Internal"
	End Object
	co_AudioMessageLevel=AudioMessageCombo

	Hints(0)="All Hints (Reset)"
	Hints(1)="New Hints Only"
	Hints(2)="No Hints"

	AudioMessageLevels(0)="All Messages"
	AudioMessageLevels(1)="Important Messages"
	AudioMessageLevels(2)="Minimal Messages"

    WinTop=0.15
	WinLeft=0
	WinWidth=1
	WinHeight=0.72
	bAcceptsInput=false

    NetSpeedText(0)="Modem"
    NetSpeedText(1)="ISDN"
    NetSpeedText(2)="Cable/ADSL"
    NetSpeedText(3)="LAN/T1"

    PanelCaption="Game"
}

