//=============================================================================
// Quick Perk Select Menu for the trader
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================
class KFQuickPerkSelect extends GUIMultiComponent;

var				texture							CurPerkBack;

var	automated	GUIImage						PerkBack0;
var	automated	GUIImage						PerkBack1;
var	automated	GUIImage						PerkBack2;
var	automated	GUIImage						PerkBack3;
var	automated	GUIImage						PerkBack4;
var	automated	GUIImage						PerkBack5;

var	automated	KFIndexedGUIImage				PerkSelectIcon0;
var	automated	KFIndexedGUIImage				PerkSelectIcon1;
var	automated	KFIndexedGUIImage				PerkSelectIcon2;
var	automated	KFIndexedGUIImage				PerkSelectIcon3;
var	automated	KFIndexedGUIImage				PerkSelectIcon4;
var	automated	KFIndexedGUIImage				PerkSelectIcon5;

var 			KFIndexedGUIImage				PerkSelectIcons[6];

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

	if ( PlayerOwner() != none )
	{
		KFStatsAndAchievements = KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements);

		if ( KFStatsAndAchievements != none )
		{
			CheckPerks(KFStatsAndAchievements);
		}
	}
}

event Closed(GUIComponent Sender, bool bCancelled)
{
	KFStatsAndAchievements = none;

	super.Closed(Sender, bCancelled);
}

event ResolutionChanged( int ResX, int ResY )
{
	super.ResolutionChanged(ResX, ResY);
	bResized = false;
}

function bool MyOnDraw(Canvas C)
{
	local int i, j;

	super.OnDraw(C);

	C.SetDrawColor(255, 255, 255, 255);

	// make em square
	if ( !bResized )
	{
		ResizeIcons(C);
	}

	// Current perk background
	C.SetPos(WinLeft * C.ClipX , WinTop * C.ClipY);
	C.DrawTileScaled(CurPerkBack, (WinHeight * C.ClipY) / CurPerkBack.USize, (WinHeight * C.ClipY) / CurPerkBack.USize);

	// check if the current perk has changed recently

	CheckPerks(KFStatsAndAchievements);

	j = 0;

	// Draw the available perks
	for ( i = 0; i < MaxPerks; i++ )
	{
		if ( i != CurPerk )
		{
			PerkSelectIcons[j].Image = class'KFGameType'.default.LoadedSkills[i].default.OnHUDIcon;
			PerkSelectIcons[j].Index = i;

			if ( KFPlayerController(PlayerOwner()).bChangedVeterancyThisWave )
			{
				PerkSelectIcons[j].ImageColor.A = 64;
			}
			else
			{
				PerkSelectIcons[j].ImageColor.A = 255;
			}

			j++;
		}
	}

	// Draw current perk
	DrawCurrentPerk(C, CurPerk);

	return false;
}

function bool InternalOnClick(GUIComponent Sender)
{
	local PlayerController PC;

	// Grab the Player Controller for later use
	PC = PlayerOwner();

	if ( Sender.IsA('KFIndexedGUIImage') && !KFPlayerController(PC).bChangedVeterancyThisWave )
	{
		if ( KFPlayerController(PC) != none )
		{
				class'KFPlayerController'.default.SelectedVeterancy = class'KFGameType'.default.LoadedSkills[KFIndexedGUIImage(Sender).Index];
				KFPlayerController(PC).SetSelectedVeterancy( class'KFGameType'.default.LoadedSkills[KFIndexedGUIImage(Sender).Index] );
				KFPlayerController(PC).SendSelectedVeterancyToServer();
				PC.SaveConfig();
		}
		else
		{
			class'KFPlayerController'.default.SelectedVeterancy = class'KFGameType'.default.LoadedSkills[KFIndexedGUIImage(Sender).Index];
			class'KFPlayerController'.static.StaticSaveConfig();
		}

		bPerkChange = true;
	}

	return false;
}

function DrawCurrentPerk(Canvas C, Int PerkIndex)
{
	C.SetPos(WinLeft * C.ClipX , WinTop * C.ClipY);
	C.DrawTileScaled(class'KFGameType'.default.LoadedSkills[PerkIndex].default.OnHUDIcon, (WinHeight * C.ClipY) / class'KFGameType'.default.LoadedSkills[PerkIndex].default.OnHUDIcon.USize, (WinHeight * C.ClipY) / class'KFGameType'.default.LoadedSkills[PerkIndex].default.OnHUDIcon.USize);
}

function ResizeIcons(Canvas C)
{
	PerkBack0.WinWidth = (C.ClipY / C.ClipX) * BoxSizeX;
	PerkBack1.WinWidth = (C.ClipY / C.ClipX) * BoxSizeX;
	PerkBack2.WinWidth = (C.ClipY / C.ClipX) * BoxSizeX;
	PerkBack3.WinWidth = (C.ClipY / C.ClipX) * BoxSizeX;
	PerkBack4.WinWidth = (C.ClipY / C.ClipX) * BoxSizeX;
	PerkBack5.WinWidth = (C.ClipY / C.ClipX) * BoxSizeX;

	PerkSelectIcon0.WinWidth = (C.ClipY / C.ClipX) * BoxSizeY;
	PerkSelectIcons[0] = PerkSelectIcon0;
	PerkSelectIcon1.WinWidth = (C.ClipY / C.ClipX) * BoxSizeY;
	PerkSelectIcons[1] = PerkSelectIcon1;
	PerkSelectIcon2.WinWidth = (C.ClipY / C.ClipX) * BoxSizeY;
	PerkSelectIcons[2] = PerkSelectIcon2;
	PerkSelectIcon3.WinWidth = (C.ClipY / C.ClipX) * BoxSizeY;
	PerkSelectIcons[3] = PerkSelectIcon3;
	PerkSelectIcon4.WinWidth = (C.ClipY / C.ClipX) * BoxSizeY;
	PerkSelectIcons[4] = PerkSelectIcon4;
	PerkSelectIcon5.WinWidth = (C.ClipY / C.ClipX) * BoxSizeY;
	PerkSelectIcons[5] = PerkSelectIcon5;

	bResized = true;
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
	//SetIndex(0);

	for ( i = 0; i < MaxPerks; i++ )
	{
		if ( (KFPC != none && class'KFGameType'.default.LoadedSkills[i] == KFPC.SelectedVeterancy) ||
			 (KFPC == none && class'KFGameType'.default.LoadedSkills[i] == class'KFPlayerController'.default.SelectedVeterancy) )
		{
			CurPerk = i;
		}
	}

	bPerkChange = false;
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

	Begin Object class=GUIImage Name=PB0
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.09
		WinTop=0.0294
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
	End Object
	PerkBack0=PB0

	Begin Object class=GUIImage Name=PB1
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.125
		WinTop=0.0294
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
	End Object
	PerkBack1=PB1

	Begin Object class=GUIImage Name=PB2
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.160
		WinTop=0.0294
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
	End Object
	PerkBack2=PB2

	Begin Object class=GUIImage Name=PB3
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.195
		WinTop=0.0294
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
	End Object
	PerkBack3=PB3

	Begin Object class=GUIImage Name=PB4
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.23
		WinTop=0.0294
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
	End Object
	PerkBack4=PB4

	Begin Object class=GUIImage Name=PB5
        WinWidth=0.04
		WinHeight=0.04
		WinLeft=0.265
		WinTop=0.0294
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.5
	End Object
	PerkBack5=PB5

	Begin Object class=KFIndexedGUIImage Name=PSI0
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.090
		WinTop=0.0314
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
	End Object
	PerkSelectIcon0=PSI0

	Begin Object class=KFIndexedGUIImage Name=PSI1
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.125
		WinTop=0.0314
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
	End Object
	PerkSelectIcon1=PSI1

	Begin Object class=KFIndexedGUIImage Name=PSI2
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.160
		WinTop=0.0314
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
	End Object
	PerkSelectIcon2=PSI2

	Begin Object class=KFIndexedGUIImage Name=PSI3
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.195
		WinTop=0.0314
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
	End Object
	PerkSelectIcon3=PSI3

	Begin Object class=KFIndexedGUIImage Name=PSI4
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.230
		WinTop=0.0314
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
	End Object
	PerkSelectIcon4=PSI4

	Begin Object class=KFIndexedGUIImage Name=PSI5
        WinWidth=0.040
		WinHeight=0.040
		WinLeft=0.265
		WinTop=0.0314
		Image=Texture'KF_InterfaceArt_tex.Menu.Perk_box_unselected'
		ImageStyle=ISTY_Scaled
		Renderweight=0.6
		OnClick=InternalOnClick
	End Object
	PerkSelectIcon5=PSI5
}

