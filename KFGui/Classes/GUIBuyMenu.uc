//=============================================================================
// The Trader menu with a tab for the store and the perks
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================


class GUIBuyMenu extends UT2k4MainPage;

//The "Header"
var 	automated 			GUIImage				HeaderBG_Left;
var 	automated 			GUIImage				HeaderBG_Center;
var 	automated 			GUIImage				HeaderBG_Right;

var 	automated			GUILabel				CurrentPerkLabel;
var		automated			GUILabel				TimeLeftLabel;
var 	automated			GUILabel				WaveLabel;

var 	automated			GUILabel				HeaderBG_Left_Label;

var		automated			KFQuickPerkSelect		QuickPerkSelect;

var     automated           KFBuyMenuFilter         BuyMenuFilter;

var 	automated			GUIButton				StoreTabButton;
var 	automated			GUIButton				PerkTabButton;

//The "Footer"
var 	automated 			GUIImage				WeightBG;
var 	automated 			GUIImage				WeightIcon;
var 	automated 			GUIImage				WeightIconBG;
var		automated			KFWeightBar				WeightBar;

//const               BUYLIST_CATS                =7;
var() 	editconst noexport 	float 					SavedPitch;
var							color					RedColor;
var							color					GreenGreyColor;

var() 						UT2K4TabPanel			ActivePanel;

var		localized			string					CurrentPerk;
var		localized			string					NoActivePerk;
var		localized			string					TraderClose;
var		localized			string					WaveString;
var		localized			string					LvAbbrString;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
	local int i;

	super.InitComponent(MyC, MyO);

	c_Tabs.BackgroundImage = none;
	c_Tabs.BackgroundStyle = none;

	InitTabs();

	for ( i = 0; i < c_Tabs.TabStack.Length; i++ )
	{
		c_Tabs.TabStack[i].bVisible = false;
	}

	UpdateWeightBar();
}

function InitTabs()
{
	local int i;

	for ( i = 0; i < PanelCaption.Length && i < PanelClass.Length && i < PanelHint.Length; i++ )
	{
		c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i]);
	}
}

function UpdateWeightBar()
{
	if ( KFHumanPawn(PlayerOwner().Pawn) != none )
	{
		WeightBar.MaxBoxes = KFHumanPawn(PlayerOwner().Pawn).MaxCarryWeight;
		WeightBar.CurBoxes = KFHumanPawn(PlayerOwner().Pawn).CurrentWeight;
	}
}

event Opened(GUIComponent Sender)
{
	local rotator PlayerRot;

	super.Opened(Sender);

	c_Tabs.ActivateTabByName(PanelCaption[0], true);

	// Tell the controller that he is on a shopping spree
    if ( KFPlayerController(PlayerOwner()) != none )
	{
        KFPlayerController(PlayerOwner()).bShopping = true;
    }

    if ( KFWeapon(KFHumanPawn(PlayerOwner().Pawn).Weapon).bAimingRifle )
	{
		KFWeapon(KFHumanPawn(PlayerOwner().Pawn).Weapon).IronSightZoomOut();
	}

	// Set camera's pitch to zero when menu initialised (otherwise spinny weap goes kooky)
	PlayerRot = PlayerOwner().Rotation;
	SavedPitch = PlayerRot.Pitch;
	PlayerRot.Yaw = PlayerRot.Yaw % 65536;
	PlayerRot.Pitch = 0;
	PlayerRot.Roll = 0;
	PlayerOwner().SetRotation(PlayerRot);
	SetTimer(0.05f, true);
}

function Timer()
{
	UpdateHeader();
	UpdateWeightBar();
}

function InternalOnClose(optional bool bCanceled)
{
    local rotator NewRot;

    // Reset player
    NewRot = PlayerOwner().Rotation;
    NewRot.Pitch = SavedPitch;
    PlayerOwner().SetRotation(NewRot);

    Super.OnClose(bCanceled);
}

function UpdateHeader()
{
	local int TimeLeftMin, TimeLeftSec;
	local string TimeString;

	if ( KFPlayerController(PlayerOwner()) == none || PlayerOwner().PlayerReplicationInfo == none ||
		 PlayerOwner().GameReplicationInfo == none )
	{
		return;
	}

	// Current Perk
	if ( KFPlayerController(PlayerOwner()).SelectedVeterancy != none )
    {
		CurrentPerkLabel.Caption = CurrentPerk$":" @ KFPlayerController(PlayerOwner()).SelectedVeterancy.default.VeterancyName @ LvAbbrString$KFPlayerReplicationInfo(PlayerOwner().PlayerReplicationInfo).ClientVeteranSkillLevel;
	}
    else
	{
		CurrentPerkLabel.Caption = CurrentPerk$":" @ NoActivePerk;
	}

	// Trader time left
	TimeLeftMin = KFGameReplicationInfo(PlayerOwner().GameReplicationInfo).TimeToNextWave / 60;
	TimeLeftSec = KFGameReplicationInfo(PlayerOwner().GameReplicationInfo).TimeToNextWave % 60;

	if ( TimeLeftMin < 1 )
	{
		TimeString = "00:";
	}
	else
	{
		TimeString = "0" $ TimeLeftMin $ ":";
	}

	if ( TimeLeftSec >= 10 )
	{
		TimeString = TimeString $ TimeLeftSec;
	}
	else
	{
		TimeString = TimeString $ "0" $ TimeLeftSec;
	}

	TimeLeftLabel.Caption = TraderClose @ TimeString;

	if ( KFGameReplicationInfo(PlayerOwner().GameReplicationInfo).TimeToNextWave < 10 )
	{
		TimeLeftLabel.TextColor = RedColor;
	}
	else
	{
		TimeLeftLabel.TextColor = GreenGreyColor;
	}

	// Wave Counter
	WaveLabel.Caption = WaveString$":" @ (KFGameReplicationInfo(PlayerOwner().GameReplicationInfo).WaveNumber + 1)$"/"$KFGameReplicationInfo(PlayerOwner().GameReplicationInfo).FinalWave;
}

function KFBuyMenuClosed(optional bool bCanceled)
{
	local rotator NewRot;

	// Reset player
	NewRot = PlayerOwner().Rotation;
	NewRot.Pitch = SavedPitch;
	PlayerOwner().SetRotation(NewRot);

	Super.OnClose(bCanceled);

	if ( KFPlayerController(PlayerOwner()) != none )
	{
        KFPlayerController(PlayerOwner()).bShopping = false;
    }
}

function CloseSale(bool savePurchases)
{
	Controller.CloseMenu(!savePurchases);
}

function bool ButtonClicked(GUIComponent Sender)
{
	if ( Sender == PerkTabButton )
    {
		HandleParameters(PanelCaption[1], "OhHi!");
	}

	if ( Sender == StoreTabButton )
    {
		HandleParameters(PanelCaption[0], "OhHi!");
	}

	return true;
}

defaultproperties
{
	PanelClass(0)="KFGUI.KFTab_BuyMenu"
	PanelClass(1)="KFGUI.KFTab_Perks"

	PanelCaption(0)="Store"
    PanelCaption(1)="Perks"

	PanelHint(0)="Trade equipment and ammunition"
	PanelHint(1)="Select your current Perk"

	OnClose=KFBuyMenuClosed

	bAllowedAsLast=true

	WhiteColor=(R=255,G=255,B=255,A=255)
	RedColor=(R=255,G=0,B=0,A=255)
	GreenGreyColor=(R=175,G=176,B=158,A=255)

	CurrentPerk="Current Perk"
	NoActivePerk="No Active Perk!"
	TraderClose="Trader Closes in"
	WaveString="Wave"
	LvAbbrString="Lv"

	Begin Object class=GUIImage Name=HBGLeft
		WinWidth=0.33230
		WinHeight=0.10000
		WinLeft=0.00100
		WinTop=0.00100
		Image=Texture'KF_InterfaceArt_tex.Menu.Thin_border'
		ImageStyle=ISTY_Stretched
		Hint="Perk Quick Select"
		RenderWeight=0.1
	End Object
	HeaderBG_Left=HBGLeft

	Begin Object class=GUIImage Name=HBGCenter
		WinWidth=0.331023
		WinHeight=0.10000
		WinLeft=0.33400
		WinTop=0.00100
		Image=Texture'KF_InterfaceArt_tex.Menu.Thin_border'
		ImageStyle=ISTY_Stretched
		Hint="Trading Time Left"
	End Object
	HeaderBG_Center=HBGCenter

	Begin Object class=GUIImage Name=HBGRight
		WinWidth=0.33200
		WinHeight=0.10000
		WinLeft=0.66600
		WinTop=0.00100
		Image=Texture'KF_InterfaceArt_tex.Menu.Thin_border'
		ImageStyle=ISTY_Stretched
		Hint="Current Perk"
	End Object
	HeaderBG_Right=HBGRight

	Begin Object Class=GUILabel Name=HBGLL
		WinTop=0.007238
        WinLeft=0.024937
        WinWidth=0.329761
        WinHeight=0.019524
		Caption="Quick Perk Select"
		TextAlign=TXTA_Center
		TextFont="UT2ServerListFont"
		TextColor=(R=175,G=176,B=158,A=255)
	End Object
	HeaderBG_Left_Label=HBGLL

	Begin Object class=KFQuickPerkSelect Name=QS
		WinTop=0.011906
		WinLeft=0.008008
		WinWidth=0.316601
		WinHeight=0.082460
	End Object
	QuickPerkSelect=QS

	Begin Object class=KFBuyMenuFilter Name=Filter
		WinTop=0.051
		WinLeft=0.67
		WinWidth=0.305
		WinHeight=0.082460
		RenderWeight=0.5
	End Object
	BuyMenuFilter=Filter

	Begin Object class=GUIButton Name=PerkTabB
		StyleName="SquareButton"
		WinTop=0.072762
	    WinLeft=0.127234
        WinWidth=0.050000
        WinHeight=0.022000
		Caption="Perk"
		FontScale=FNS_Small
		OnClick=ButtonClicked
	End Object
	PerkTabButton=PerkTabB

	Begin Object class=GUIButton Name=StoreTabB
		StyleName="SquareButton"
      	WinTop=0.072762
        WinLeft=0.202801
        WinWidth=0.050000
        WinHeight=0.022000
		FontScale=FNS_Small
		Caption="Store"
		OnClick=ButtonClicked
	End Object
	StoreTabButton=StoreTabB

	Begin Object Class=GUILabel Name=Perk
        WinTop=0.01
        WinLeft=0.665000
        WinWidth=0.329761
        WinHeight=0.050000
		Caption=""
		TextAlign=TXTA_Center
		TextFont="UT2MenuFont"
		TextColor=(R=175,G=176,B=158,A=255)
	End Object
	CurrentPerkLabel=Perk

	Begin Object Class=GUILabel Name=Time
		WinTop=0.020952
        WinLeft=0.335000
        WinWidth=0.330000
        WinHeight=0.035000
		Caption="Trader closes in 00:31"
		TextAlign=TXTA_center
		TextFont="UT2LargeFont"
		TextColor=(R=175,G=176,B=158,A=255)
	End Object
	TimeLeftLabel=Time

	Begin Object Class=GUILabel Name=Wave
        WinTop=0.052857
        WinLeft=0.336529
        WinWidth=0.327071
        WinHeight=0.035000
		Caption="Wave: 7/10"
		TextAlign=TXTA_Center
		TextFont="UT2MenuFont"
		TextColor=(R=175,G=176,B=158,A=255)
	End Object
	WaveLabel=Wave

	Begin Object Class=GUITabControl Name=PageTabs
		WinWidth=0.99
		WinLeft=0.005
		WinTop=0.07800
		WinHeight=0.025
		TabHeight=0.025
		TabOrder=0
		RenderWeight=0.49
		bFillSpace=False
		bAcceptsInput=True
		bDockPanels=True
		OnChange=InternalOnChange
		BackgroundStyleName="TabBackground"
	End Object
	c_Tabs=PageTabs

	Begin Object Class=BackgroundImage Name=PageBackground
		Image=material'Engine.WhiteSquareTexture'
		ImageStyle=ISTY_Tiled
		ImageColor=(R=20,G=20,B=20,A=255)
		WinWidth=1
		WinHeight=1
		WinTop=0
		WinLeft=0
		RenderWeight=0.001
	End Object
	i_Background=PageBackground

	Begin Object class=GUIImage Name=Weight
	   	WinWidth=0.663086
        WinHeight=0.065828
		WinLeft=0.001
        WinTop=0.934206
		Image=Texture'KF_InterfaceArt_tex.Menu.Thin_border'
		ImageStyle=ISTY_Stretched
		Hint=""
	End Object
	WeightBG=Weight

	Begin Object class=GUIImage Name=WeightIco
	    WinTop=0.946166
        WinLeft=0.009961
        WinWidth=0.033672
        WinHeight=0.048992
		RenderWeight=0.46
		Image=Texture'KillingFloorHUD.HUD.Hud_Weight'
		ImageStyle=ISTY_Scaled
	End Object
	WeightIcon=WeightIco

	Begin Object class=GUIImage Name=WeightIcoBG
 	    WinTop=0.942416
        WinLeft=0.006055
        WinWidth=0.041484
        WinHeight=0.054461
		RenderWeight=0.45
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
	End Object
	WeightIconBG=WeightIcoBG

	Begin Object class=KFWeightBar Name=WeightB
        WinTop=0.945302
        WinLeft=0.055266
        WinWidth=0.443888
        WinHeight=0.053896
	End Object
	WeightBar=WeightB
}
