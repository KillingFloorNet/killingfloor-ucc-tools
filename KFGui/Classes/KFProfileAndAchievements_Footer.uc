class KFProfileAndAchievements_Footer extends ButtonFooter;

var automated GUIButton b_Save;

delegate OnSaveButtonClicked();

function bool InternalOnClick(GUIComponent Sender)
{
	if ( Sender == b_Save )
	{
		OnSaveButtonClicked();
	}

	return true;
}

defaultproperties
{
	bAutoSize=false

	Begin Object Class=GUIButton Name=BackB
		Caption="SAVE"
		Hint="Save and return to the previous menu"
		WinHeight=0.036482
		WinTop=0.085678
		WinWidth=0.09
		RenderWeight=2
		TabOrder=1
		bBoundToParent=True
		StyleName="FooterButton"
		OnClick=InternalOnClick
	End Object
	b_Save=BackB
}
