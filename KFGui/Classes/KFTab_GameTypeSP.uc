class KFTab_GametypeSP extends UT2K4Tab_GameTypeSP;

function InternalOnChange(GUIComponent Sender)
{
    local int Index;

    Index = FindRecordIndex(li_Games.Get());
    if ( Index < 0 || Index >= GameTypes.Length )
    	return;

    if ( Controller.LastGameType == "" || GameTypes[Index].ClassName != Controller.LastGameType )
    {
    	InitPreview();
    	Controller.LastGameType = GameTypes[Index].ClassName;
    }
	
    if (Sender == lb_Games)
    {
		if ( li_Games.IsSection() )
			return;

		OnChangeGameType(true);
	}
}

defaultproperties
{
	EpicGameCaption=""
	CustomGameCaption=""

	Begin Object Class=GUIListBox Name=UT2004Games
		WinWidth=0.438457
		WinHeight=0.796982
		WinLeft=0.045599
		WinTop=0.144225
		bSorted=True
		bBoundToParent=True
		bScaleToParent=True
		bVisibleWhenEmpty=True
		OnChange=InternalOnChange
		StyleName="NoBackground"
		SelectedStyleName="ListSelection"
		FontScale=FNS_Medium
		TabOrder=0
	End Object
	lb_Games=UT2004Games
}
