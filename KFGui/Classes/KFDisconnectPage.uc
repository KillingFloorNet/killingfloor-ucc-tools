// Fancy new in-game disconnect page

class KFDisconnectPage extends GUIPage;

var bool bIgnoreEsc;

var		localized string LeaveMPButtonText;
var		localized string LeaveSPButtonText;

var		float ButtonWidth;
var		float ButtonHeight;
var		float ButtonHGap;
var		float ButtonVGap;
var		float BarHeight;
var		float BarVPos;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.InitComponent(Mycontroller, MyOwner);
	PlayerOwner().ClearProgressMessages();
}

function bool InternalOnClick(GUIComponent Sender)
{
	if ( Sender==Controls[1] ) // OK
    {
		Controller.OpenMenu("KFGui.KFServerBrowser");
	}

	return true;
}

event HandleParameters(string Param1, string Param2)
{
	GUILabel(Controls[2]).Caption = Param1$"|"$Param2;
	PlayerOwner().ClearProgressMessages();
}

defaultproperties
{
	Begin Object Class=AltSectionBackground name=NetStatBackground
		bAcceptsInput=false
		bNeverFocus=true
		WinHeight=0.25
		WinWidth=0.75
		WinLeft=0.125
		WinTop=0.375
	End Object
	Controls(0)=AltSectionBackground'NetStatBackground'

	Begin Object Class=GUIButton Name=NetStatOk
		Caption="OK"
		StyleName="MidGameButton"
		OnClick=InternalOnClick
		bBoundToParent=true
		WinWidth=0.250000
		WinHeight=0.050000
		WinLeft=0.375000
		WinTop=0.675000
	End Object
	Controls(1)=GUIButton'NetStatOK'

	Begin Object Class=GUILabel Name=NetStatLabel
		Caption=""
		TextFont="UT2HeaderFont"
		TextALign=TXTA_Center
		TextColor=(R=255,G=255,B=255,A=255)
		WinWidth=1
		WinHeight=0.5
		WinLeft=0
		WinTop=0.125
		bMultiLine=true
		bBoundToParent=true
	End Object
	Controls(2)=GUILabel'NetStatLabel'

    // Replaceme
	OpenSound=sound'ROMenuSounds.msfxEdit'

	bIgnoreEsc=true
	bRequire640x480=false

	WinTop=0.375;
	WinHeight=0.25;
	WinWidth=1.0;
	WinLeft=0.0;
}
