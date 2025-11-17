class KFTab_DLCAll extends UT2K4TabPanel;

var	automated GUISectionBackground	i_BGDLC;
var	automated KFDLCListBox			lb_DLC;

function ShowPanel(bool bShow)
{
	if ( bShow )
	{
		if ( PlayerOwner() != none )
		{
			// Initialize the List
			lb_DLC.List.InitList(PlayerOwner(), PlayerOwner().SteamStatsAndAchievements, lb_DLC.bShowCharacters, lb_DLC.bShowWeapons);
		}
	}

	super.ShowPanel(bShow);
}

defaultproperties
{
	WinTop=0.15
	WinLeft=0
	WinWidth=1
	WinHeight=0.72

	Begin Object class=GUISectionBackground Name=BGDLC
		WinWidth=0.9
		WinHeight=0.96
		WinLeft=0.05
		WinTop=0.018
		Caption=""
		HeaderBase=Texture'KF_InterfaceArt_tex.Menu.Med_border'
	End Object
	i_BGDLC=BGDLC

	Begin Object class=KFDLCListBox Name=DLCList
		WinWidth=0.851529
		WinHeight=0.867808
		WinLeft=0.072959
		WinTop=0.090000
		bShowCharacters=true
		bShowWeapons=true
	End Object
	lb_DLC=DLCList
}
