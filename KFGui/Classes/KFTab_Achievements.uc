class KFTab_Achievements extends UT2K4TabPanel;

var	automated GUISectionBackground	i_BGAchievements;
var	automated GUIProgressBar		pb_AchievementProgress;
var	automated GUILabel				l_AchievementProgress;
var	automated KFAchievementsListBox	lb_Achievements;

var	localized string	OutOfString;
var	localized string	UnlockedString;

function ShowPanel(bool bShow)
{
	local KFSteamStatsAndAchievements KFStatsAndAchievements;
	local int CompletedCount;

	if ( bShow )
	{
		if ( PlayerOwner() != none )
		{
			KFStatsAndAchievements = KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements);

			if ( KFStatsAndAchievements != none )
			{
				// Initialize the List
				lb_Achievements.List.InitList(KFStatsAndAchievements);

				// Initialize Achievement Progress
				CompletedCount = KFStatsAndAchievements.GetAchievementCompletedCount();
				pb_AchievementProgress.Value = CompletedCount;
				pb_AchievementProgress.High = KFStatsAndAchievements.Achievements.Length;
				l_AchievementProgress.Caption = CompletedCount @ OutOfString @ KFStatsAndAchievements.Achievements.Length @ UnlockedString;
		    }
		}
	}

	super.ShowPanel(bShow);
}

defaultproperties
{
	OutOfString="of"
	UnlockedString="unlocked"

	WinTop=0.15
	WinLeft=0
	WinWidth=1
	WinHeight=0.72

	Begin Object class=GUISectionBackground Name=BGAchievements
		WinWidth=0.9
		WinHeight=0.96
		WinLeft=0.05
		WinTop=0.018
		Caption="My Achievements"
		HeaderBase=Texture'KF_InterfaceArt_tex.Menu.Med_border'
	End Object
	i_BGAchievements=BGAchievements

	Begin Object class=GUIProgressBar Name=AchievementProgressBar
		BarColor=(R=255,G=255,B=255,A=255)
		Value=0.0
		WinWidth=0.655610
		WinHeight=0.030000
		WinLeft=0.180867
		WinTop=0.090000
		RenderWeight=1.2
		BarBack=Texture'KF_InterfaceArt_tex.Menu.Innerborder'
		BarTop=Texture'InterfaceArt_tex.Menu.progress_bar'
		CaptionWidth=0
		Caption=""
		bShowValue=false
		BorderSize=3.0
	End Object
	pb_AchievementProgress=AchievementProgressBar

	Begin Object Class=GUILabel Name=AchievementProgressLabel
		Caption="0 of 0 unlocked"
		TextAlign=TXTA_Left
		bMultiline=False
		FontScale=FNS_Medium
		TextColor=(R=192,G=192,B=192,A=255)
		WinWidth=0.655610
		WinHeight=0.030000
		WinLeft=0.180867
		WinTop=0.120000
	End Object
	l_AchievementProgress=AchievementProgressLabel

	Begin Object class=KFAchievementsListBox Name=AchievementsList
		WinWidth=0.851529
		WinHeight=0.777808
		WinLeft=0.072959
		WinTop=0.187382
	End Object
	lb_Achievements=AchievementsList
}

