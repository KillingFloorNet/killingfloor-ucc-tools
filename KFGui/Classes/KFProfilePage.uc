class KFProfilePage extends UT2K4GUIPage;

var automated KFTab_Profile						ProfilePanel;
var	automated KFProfileAndAchievements_Footer	t_Footer;
var editconst noexport float					SavedPitch;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	local rotator PlayerRot;

	Super.InitComponent(MyController, MyOwner);

	// Set camera's pitch to zero when menu initialised (otherwise spinny weap goes kooky)
	PlayerRot = PlayerOwner().Rotation;
	SavedPitch = PlayerRot.Pitch;
	PlayerRot.Pitch = 0;
	PlayerRot.Roll = 0;
	PlayerOwner().SetRotation(PlayerRot);

	t_Footer.OnSaveButtonClicked = SaveButtonClicked;

	ProfilePanel.InitComponent(MyController, self);
	ProfilePanel.Opened(self);
	ProfilePanel.ShowPanel(true);
}

function InternalOnClose(optional Bool bCanceled)
{
    local rotator NewRot;

    // Reset player
    NewRot = PlayerOwner().Rotation;
    NewRot.Pitch = SavedPitch;
    PlayerOwner().SetRotation(NewRot);

    Super.OnClose(bCanceled);
}

function SaveButtonClicked()
{
	ProfilePanel.SaveSettings();
	Controller.CloseMenu(False);
}

defaultproperties
{
	OnClose=InternalOnClose

	bRenderWorld=True
	bAllowedAsLast=True
	BackgroundColor=(B=0,G=20,R=0,A=20)
	InactiveFadeColor=(G=0,R=0,A=64)
	BackgroundRStyle=MSTY_Alpha

	WinWidth=1.0
	WinHeight=1.0
	WinTop=0.0
	WinLeft=0.0

	Begin Object class=KFTab_Profile name=Panel
		WinWidth=0.98
		WinHeight=0.96
		WinLeft=0.01
		WinTop=0.01
	End Object
	ProfilePanel=Panel

	Begin Object class=KFProfileAndAchievements_Footer name=Footer
		RenderWeight=0.3
		TabOrder=4
	End Object
	t_Footer=Footer
}
