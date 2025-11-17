//=============================================================================
// Buy Menu Filter for the trader
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// Jeff "Captain Mallard" Robinson
//=============================================================================
class KFBuyMenuFilter extends GUIMultiComponent;

var				texture							CurPerkBack;
var             texture                         NoPerkIcon;
var             texture                         FavoritesIcon;

var	automated	GUIImage						PerkBack0;
var	automated	GUIImage						PerkBack1;
var	automated	GUIImage						PerkBack2;
var	automated	GUIImage						PerkBack3;
var	automated	GUIImage						PerkBack4;
var	automated	GUIImage						PerkBack5;
var	automated	GUIImage						PerkBack6;
var	automated	GUIImage						PerkBack7;
var	automated	GUIImage						PerkBack8;

var	automated	KFIndexedGUIImage				PerkSelectIcon0;
var	automated	KFIndexedGUIImage				PerkSelectIcon1;
var	automated	KFIndexedGUIImage				PerkSelectIcon2;
var	automated	KFIndexedGUIImage				PerkSelectIcon3;
var	automated	KFIndexedGUIImage				PerkSelectIcon4;
var	automated	KFIndexedGUIImage				PerkSelectIcon5;
var	automated	KFIndexedGUIImage				PerkSelectIcon6;
var	automated	KFIndexedGUIImage				PerkSelectIcon7;
var	automated	KFIndexedGUIImage				PerkSelectIcon8;

const                                           NUM_FILTERS = 9;
var             GUIImage                        PerkSelectBacks[9];
var 			GUIImage				        PerkSelectIcons[9];

var		 		int								MaxPerks;
var				int								CurPerk;
var				bool							bPerkChange;

var 			float 							CurX;
var				float							CurY;
var 			float							BoxSizeX;
var 			float							BoxSizeY;
var 			float							SpacerX;
var 			float							SpacerY;

var 			KFSteamStatsAndAchievements 	KFStatsAndAchievements;
var 			bool							bResized;

event InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.InitComponent(MyController, MyOwner);
}

event Opened(GUIComponent Sender)
{
    super.Opened( Sender );
    CheckPerks(KFStatsAndAchievements);
}

event Closed(GUIComponent Sender, bool bCancelled)
{
	super.Closed(Sender, bCancelled);
}

event ResolutionChanged( int ResX, int ResY )
{
	super.ResolutionChanged(ResX, ResY);
}

function bool MyOnDraw(Canvas C)
{
	local int i;

	super.OnDraw(C);

	// make em square
	if ( !bResized )
	{
		ResizeIcons(C);
		RealignIcons();
	}

	// Draw the available perks
	for ( i = 0; i < NUM_FILTERS; i++ )
	{
	    // no icon for non-perk weapons, what to do?
	    if( i < MaxPerks )
	    {
	        PerkSelectIcons[i].Image = class'KFGameType'.default.LoadedSkills[i].default.OnHUDIcon;
	    }
	    else if( i == MaxPerks ) // No-perk
	    {
	        PerkSelectIcons[i].Image = NoPerkIcon;
	    }
	    else if( i == MaxPerks + 1 ) // favorites
	    {
	        PerkSelectIcons[i].Image = FavoritesIcon;
	    }

		if ( i != CurPerk )
		{
			PerkSelectIcons[i].ImageColor.A = 95;
		}
		else
		{
			PerkSelectIcons[i].ImageColor.A = 255;
		}
	}

	return false;
}

function bool InternalOnClick(GUIComponent Sender)
{
	local PlayerController PC;

	// Grab the Player Controller for later use
	PC = PlayerOwner();

	if ( Sender.IsA('KFIndexedGUIImage') )
	{
		if ( KFPlayerController(PC) != none )
		{
		    CurPerk = KFIndexedGUIImage(Sender).Index;
		    KFPlayerController(PC).BuyMenuFilterIndex = KFIndexedGUIImage(Sender).Index;
		}
	}

	return false;
}

function ResizeIcons(Canvas C)
{
    local float sizeX, sizeY;

    sizeX = (C.ClipY / C.ClipX) * BoxSizeX;
    sizeY = (C.ClipY / C.ClipX) * BoxSizeY;

	PerkBack0.WinWidth = sizeX;
	PerkSelectBacks[0] = PerkBack0;
	PerkBack1.WinWidth = sizeX;
	PerkSelectBacks[1] = PerkBack1;
	PerkBack2.WinWidth = sizeX;
	PerkSelectBacks[2] = PerkBack2;
	PerkBack3.WinWidth = sizeX;
	PerkSelectBacks[3] = PerkBack3;
	PerkBack4.WinWidth = sizeX;
	PerkSelectBacks[4] = PerkBack4;
	PerkBack5.WinWidth = sizeX;
	PerkSelectBacks[5] = PerkBack5;
	PerkBack6.WinWidth = sizeX;
	PerkSelectBacks[6] = PerkBack6;
	PerkBack7.WinWidth = sizeX;
	PerkSelectBacks[7] = PerkBack7;
	PerkBack8.WinWidth = sizeX;
	PerkSelectBacks[8] = PerkBack8;

	PerkSelectIcon0.WinWidth = sizeY;
	PerkSelectIcons[0] = PerkSelectIcon0;
	PerkSelectIcon1.WinWidth = sizeY;
	PerkSelectIcons[1] = PerkSelectIcon1;
	PerkSelectIcon2.WinWidth = sizeY;
	PerkSelectIcons[2] = PerkSelectIcon2;
	PerkSelectIcon3.WinWidth = sizeY;
	PerkSelectIcons[3] = PerkSelectIcon3;
	PerkSelectIcon4.WinWidth = sizeY;
	PerkSelectIcons[4] = PerkSelectIcon4;
	PerkSelectIcon5.WinWidth = sizeY;
	PerkSelectIcons[5] = PerkSelectIcon5;
	PerkSelectIcon6.WinWidth = sizeY;
	PerkSelectIcons[6] = PerkSelectIcon6;
	PerkSelectIcon7.WinWidth = sizeY;
	PerkSelectIcons[7] = PerkSelectIcon7;
	PerkSelectIcon8.WinWidth = sizeY;
	PerkSelectIcons[8] = PerkSelectIcon8;

	bResized = true;
}

function RealignIcons()
{
    local int i;
    local float IconWidth, TotalWidth, WidthLeft, WidthLeftForEachIcon, IconPadding;

    IconWidth = PerkSelectIcons[0].WinWidth;
    TotalWidth = IconWidth * 9.f;
    WidthLeft = 1.f - TotalWidth;
    WidthLeftForEachIcon = WidthLeft / 9.f;
    IconPadding = WidthLeftForEachIcon / 2.f;
    for( i = 0; i < 9; ++i ) // size of PerkSelectIcons
    {
        PerkSelectIcons[i].WinLeft = IconPadding + (IconPadding + IconWidth + IconPadding) * i;
        PerkSelectBacks[i].WinLeft = IconPadding + (IconPadding + IconWidth + IconPadding) * i;
    }
}

function CheckPerks(KFSteamStatsAndAchievements StatsAndAchievements)
{
	local int i;
	local KFPlayerController KFPC;

	// Grab the Player Controller for later use
	KFPC = KFPlayerController(PlayerOwner());

	// Hold onto our reference
	KFStatsAndAchievements = StatsAndAchievements;

	// Update the ItemCount and select the first item
	MaxPerks = class'KFGameType'.default.LoadedSkills.Length;

	for ( i = 0; i < MaxPerks; i++ )
	{
		if ( (KFPC != none && class'KFGameType'.default.LoadedSkills[i] == KFPC.SelectedVeterancy) ||
			 (KFPC == none && class'KFGameType'.default.LoadedSkills[i] == class'KFPlayerController'.default.SelectedVeterancy) )
		{
			CurPerk = i;
			KFPC.BuyMenuFilterIndex = CurPerk;
		}
	}
}

defaultproperties
{
	OnDraw=MyOnDraw

	BoxSizeX=0.04
	BoxSizeY=0.04
	SpacerX=0.001
	SpacerY=0.004

	MaxPerks=6

	CurPerkBack=Texture'KF_InterfaceArt_tex.Menu.Perk_box'
	NoPerkIcon=Texture'KillingFloor2HUD.PerkIcons.No_Perk_Icon'
	FavoritesIcon=Texture'KillingFloor2HUD.PerkIcons.Favorite_Perk_Icon'

	Begin Object class=GUIImage Name=PB0
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.7
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack0=PB0

	Begin Object class=GUIImage Name=PB1
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.735
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack1=PB1

	Begin Object class=GUIImage Name=PB2
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.77
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack2=PB2

	Begin Object class=GUIImage Name=PB3
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.805
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack3=PB3

	Begin Object class=GUIImage Name=PB4
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.84
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack4=PB4

	Begin Object class=GUIImage Name=PB5
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.875
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack5=PB5

	Begin Object class=GUIImage Name=PB6
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.91
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack6=PB6

	Begin Object class=GUIImage Name=PB7
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.945
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack7=PB7

	Begin Object class=GUIImage Name=PB8
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.98
		WinTop=0.05
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
		bBoundToParent=true
	End Object
	PerkBack8=PB8

	Begin Object class=KFIndexedGUIImage Name=PSI0
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.7
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Medic"
		Index=0
		bBoundToParent=true
	End Object
	PerkSelectIcon0=PSI0

	Begin Object class=KFIndexedGUIImage Name=PSI1
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.735
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Support"
		Index=1
		bBoundToParent=true
	End Object
	PerkSelectIcon1=PSI1

	Begin Object class=KFIndexedGUIImage Name=PSI2
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.770
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Sharpshooter"
		Index=2
		bBoundToParent=true
	End Object
	PerkSelectIcon2=PSI2

	Begin Object class=KFIndexedGUIImage Name=PSI3
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.805
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Commando"
		Index=3
		bBoundToParent=true
	End Object
	PerkSelectIcon3=PSI3

	Begin Object class=KFIndexedGUIImage Name=PSI4
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.840
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Berserker"
		Index=4
		bBoundToParent=true
	End Object
	PerkSelectIcon4=PSI4

	Begin Object class=KFIndexedGUIImage Name=PSI5
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.875
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Firebug"
		Index=5
		bBoundToParent=true
	End Object
	PerkSelectIcon5=PSI5

	Begin Object class=KFIndexedGUIImage Name=PSI6
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.91
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Demolitions"
		Index=6
		bBoundToParent=true
	End Object
	PerkSelectIcon6=PSI6

	Begin Object class=KFIndexedGUIImage Name=PSI7
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.945
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Non-perk"
		Index=7
		bBoundToParent=true
	End Object
	PerkSelectIcon7=PSI7

	Begin Object class=KFIndexedGUIImage Name=PSI8
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.98
		WinTop=0.052
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
		Hint="Favorites"
		Index=8
		bBoundToParent=true
	End Object
	PerkSelectIcon8=PSI8
}

