//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KFTab_Perks extends UT2K4TabPanel;

var automated GUISectionBackground	i_BGPerks;
var	automated KFPerkSelectListBox	lb_PerkSelect;

var automated GUISectionBackground	i_BGPerkEffects;
var automated GUIScrollTextBox		lb_PerkEffects;

var automated GUISectionBackground	i_BGPerkNextLevel;
var	automated KFPerkProgressListBox	lb_PerkProgress;

var	automated GUIButton	b_Save;

var	automated GUIButton	b_Done;

var	automated GUILabel	l_ChangePerkOncePerWave;

var KFSteamStatsAndAchievements KFStatsAndAchievements;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.InitComponent(MyController, MyOwner);

	lb_PerkSelect.List.OnChange = OnPerkSelected;
}

event Closed(GUIComponent Sender, bool bCancelled)
{
	KFStatsAndAchievements = none;

	super.Closed(Sender, bCancelled);
}

function ShowPanel(bool bShow)
{
	super.ShowPanel(bShow);

	if ( bShow )
	{
		if ( PlayerOwner() != none )
		{
			KFStatsAndAchievements = KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements);

			if ( KFStatsAndAchievements != none )
			{
				// Initialize the List
				lb_PerkSelect.List.InitList(KFStatsAndAchievements);
				lb_PerkProgress.List.InitList();
			}
		}

		l_ChangePerkOncePerWave.SetVisibility(false);
	}
}

function OnPerkSelected(GUIComponent Sender)
{
	if ( KFStatsAndAchievements.bUsedCheats )
	{
		lb_PerkEffects.SetContent(class'LobbyMenu'.default.PerksDisabledString);
	}
	else
	{
		lb_PerkEffects.SetContent(class'KFGameType'.default.LoadedSkills[lb_PerkSelect.GetIndex()].default.LevelEffects[KFStatsAndAchievements.PerkHighestLevelAvailable(lb_PerkSelect.GetIndex())]);

		lb_PerkProgress.List.PerkChanged(KFStatsAndAchievements, lb_PerkSelect.GetIndex());
	}
}

function bool OnSaveButtonClicked(GUIComponent Sender)
{
	local PlayerController PC;

	PC = PlayerOwner();

	if ( KFPlayerController(PC) != none )
	{
		if ( KFPlayerController(PC).bChangedVeterancyThisWave && KFPlayerController(PC).SelectedVeterancy != class'KFGameType'.default.LoadedSkills[lb_PerkSelect.GetIndex()] )
		{
			l_ChangePerkOncePerWave.SetVisibility(true);
		}
		else
		{
			class'KFPlayerController'.default.SelectedVeterancy = class'KFGameType'.default.LoadedSkills[lb_PerkSelect.GetIndex()];
			KFPlayerController(PC).SetSelectedVeterancy( class'KFGameType'.default.LoadedSkills[lb_PerkSelect.GetIndex()] );
			KFPlayerController(PC).SendSelectedVeterancyToServer();
			PC.SaveConfig();
		}
	}
	else
	{
		class'KFPlayerController'.default.SelectedVeterancy = class'KFGameType'.default.LoadedSkills[lb_PerkSelect.GetIndex()];
		class'KFPlayerController'.static.StaticSaveConfig();
	}

	return true;
}

function bool OnDoneClick(GUIComponent Sender)
{
	GUIBuyMenu(OwnerPage()).CloseSale(false);

	return true;
}

defaultproperties
{
	PropagateVisibility=False

	WinWidth=.5
	WinHeight=.75
	WinTop=0.125
	WinLeft=0.25

	Begin Object class=GUISectionBackground Name=BGPerks
		WinWidth=0.457166
		WinHeight=0.798982   //0.828982
		WinLeft=0.019240
		WinTop=0.029674
		Caption="Select Perk"
		bFillClient=true
	End Object
	i_BGPerks=BGPerks

	Begin Object class=KFPerkSelectListBox Name=PerkSelectList
		WinWidth=0.437166
		WinHeight=0.742836  //0.772836
		WinLeft=0.029240
		WinTop=0.091627
	End Object
	lb_PerkSelect=PerkSelectList

	Begin Object class=GUISectionBackground Name=BGPerkEffects
		WinWidth=0.491566
		WinHeight=0.369766
		WinLeft=0.486700
		WinTop=0.029674
		Caption="Perk Effects"
		bFillClient=true
	End Object
	i_BGPerkEffects=BGPerkEffects

	Begin Object Class=GUIScrollTextBox Name=PerkEffectsScroll
		WinWidth=0.465143
		WinHeight=0.323477
		WinLeft=0.500554
		WinTop=0.093121
		CharDelay=0.0025
		EOLDelay=0.1
		TabOrder=9
		StyleName="NoBackground"
	End Object
	lb_PerkEffects=PerkEffectsScroll

	Begin Object class=GUISectionBackground Name=BGPerksNextLevel
		WinWidth=0.490282
		WinHeight=0.415466
		WinLeft=0.486700
		WinTop=0.413209
		Caption="Next Level Requirements"
		bFillClient=true
	End Object
	i_BGPerkNextLevel=BGPerksNextLevel

	Begin Object class=KFPerkProgressListBox Name=PerkProgressList
		WinWidth=0.463858
		WinHeight=0.341256
		WinLeft=0.499269
		WinTop=0.476850
	End Object
	lb_PerkProgress=PerkProgressList

	Begin Object Class=GUIButton Name=SaveButton
		Caption="Select Perk"
		Hint="Use Selected Perk"
		StyleName="SquareButton"
		WinWidth=0.363829
		WinHeight=0.042757
		WinLeft=0.302670
		WinTop=0.852604
		TabOrder=2
		bBoundToParent=True
		OnClick=OnSaveButtonClicked
	End Object
	b_Save=SaveButton

	Begin Object Class=GUILabel Name=ChangePerkOncePerWaveLabel
		WinWidth=0.500000
		WinHeight=0.035000
		WinLeft=0.017283
		WinTop=0.897148
		Caption="You can only change your Perk once per Wave"
		TextAlign=TXTA_Left
		TextFont="UT2MenuFont"
		TextColor=(R=255,G=255,B=255,A=255)
	End Object
	l_ChangePerkOncePerWave=ChangePerkOncePerWaveLabel

	Begin Object Class=GUIButton Name=Done
		WinWidth=0.207213
		WinHeight=0.035000
		WinLeft=0.790508
		WinTop=0.941472
		Caption="Exit Trader Menu"
		OnClick=OnDoneClick
		CaptionAlign=TXTA_Center
		OnKeyEvent=Cancel.InternalOnKeyEvent
	End Object
	b_Done=Done
}

