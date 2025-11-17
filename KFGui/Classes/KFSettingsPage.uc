class KFSettingsPage extends UT2K4SettingsPage;

function bool InternalOnCanClose(optional bool bCanceled)
{
    return true;
}

DefaultProperties
{
	PanelCaption(0)="Game"
	PanelCaption(1)="Display"
	PanelCaption(2)="Audio"
	PanelCaption(3)="Controls"
	PanelCaption(4)="Input"
	PanelCaption(5)="Hud"
	PanelCaption(6)=none

	PanelClass(0)="KFGUI.KFGameSettings"
	PanelClass(1)="KFGUI.KFTab_DetailSettings"
	PanelClass(2)="KFGUI.KFAudioSettingsTab"
//	PanelClass(2)="KFGUI.KFPlayerSettings"
	PanelClass(3)="KFGUI.KFTab_Controls"
	PanelClass(4)="KFGUI.KFInputSettings"
	PanelClass(5)="KFGUI.KFHUDSettings" // KFHUDSettings
	PanelClass(6)=""

	PanelHint(0)="Configure your Killing Floor game..."
	PanelHint(1)="Select your resolution or change your display and detail settings..."
	PanelHint(2)="Adjust your audio experience..."
	PanelHint(3)="Configure your keyboard controls..."
	PanelHint(4)="Configure misc. input options..."
	PanelHint(5)="Customize your HUD..."
	PanelHint(6)=none


    Begin Object Class=BackgroundImage Name=PageBackground
         Image=Texture'KillingFloor2HUD.menu.menuBackground'
         ImageStyle=ISTY_Justified
		 ImageAlign=IMGA_Center
         RenderWeight=0.010000
     End Object
     i_Background=PageBackground

	Begin Object Class=UT2K4Settings_Footer Name=SettingFooter
        RenderWeight=0.3
        TabOrder=4
        Spacer=0.01
    End Object
    t_Footer=SettingFooter
}

