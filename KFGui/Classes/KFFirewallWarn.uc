//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KFFirewallWarn extends UT2K4GenericMessageBox;

var automated moCheckbox ch_NeverShowAgain;
var localized string WarnString;

function HandleParameters( string Param1, string Param2 )
{
	local float f;

	l_Text2.Caption = WarnString;

	f = float(Param1);
	if ( f != 0.0 )
		SetTimer(f);
}

function Timer()
{
	Controller.CloseMenu(false);
}

function bool InternalOnClick(GUIComponent Sender)
{
	Controller.CloseMenu(false);
	return true;
}

function CheckBoxClick(GUIComponent Sender)
{
	class'KFGamePageMP'.default.bExpert = ch_NeverShowAgain.IsChecked();
	class'KFGamePageMP'.static.StaticSaveConfig();
}

function InternalOnLoadIni( GUIComponent Sender, string Value )
{
	ch_NeverShowAgain.Checked(class'KFGamePageMP'.default.bExpert);
}

defaultproperties
{
	WarnString="Please make sure Universal Plug and Play is enabled, or the ports 7707 UDP, 7708 UDP, 7717 UDP, 28852 TCP & UDP, 8075 TCP and 20560 TCP & UDP are opened on your router/firewall."

	Begin Object Class=GUIButton Name=OkButton
		Caption="OK"
		WinWidth=0.121875
		WinHeight=0.040000
		WinLeft=0.439063
		WinTop=0.620000
		OnClick=InternalOnClick
		TabOrder=0
// if _RO_
//         StyleName="SelectButton"
// end if _RO_
	End Object
    b_Ok=OKButton

	Begin Object class=GUILabel Name=DialogText
		Caption="WARNING"
		TextALign=TXTA_Center
		StyleName="TextLabel"
        FontScale=FNS_Large
		WinWidth=1
		WinLeft=0
		WinTop=0.34
		WinHeight=0.04
	End Object
    l_Text=DialogText

	Begin Object class=GUILabel Name=DialogText2
		Caption=""
		TextAlign=TXTA_Center
		StyleName="TextLabel"
		WinWidth=0.65
		WinLeft=0.2
		WinTop=0.40
		WinHeight=0.3
		bMultiLine=true
	End Object
    l_Text2=DialogText2

    Begin Object Class=moCheckBox Name=HideCheckbox
		WinWidth=0.25
		WinHeight=0.030000
		WinLeft=0.375
		WinTop=0.50
    	Caption="  do not display this warning again"
    	Hint="Check this to disable showing warning messages"
    	IniOption="@Internal"
    	OnLoadIni=InternalOnLoadIni
    	OnChange=CheckBoxClick
    	TabOrder=1
    	CaptionWidth=0.99
    	ComponentWidth=0.07
    	bFlipped=True
    	ComponentJustification=TXTA_Right
    	LabelJustification=TXTA_Left
    	FontScale=FNS_Small
    End Object
    ch_NeverShowAgain=HideCheckbox

	OpenSound=sound'KF_MenuSnd.msfxEdit'
}
