class KFTab_DLCWeapons extends KFTab_DLCAll;

function ShowPanel(bool bShow)
{
	super.ShowPanel(bShow);
}

defaultproperties
{
	Begin Object class=KFDLCListBox Name=DLCList
		WinWidth=0.851529
		WinHeight=0.867808
		WinLeft=0.072959
		WinTop=0.090000
		bShowCharacters=false
		bShowWeapons=true
	End Object
	lb_DLC=KFDLCListBox'KFGui.KFTab_DLCWeapons.DLCList'
}

