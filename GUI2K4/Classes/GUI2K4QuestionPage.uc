//==============================================================================
// UT2004 Style Question Page
//
// Written by Michiel Hendriks
// (c) 2003, Epic Games, Inc.  All Rights Reserved
//==============================================================================

class GUI2K4QuestionPage extends GUIQuestionPage;

function bool ButtonClick(GUIComponent Sender)
{
	local int T;

	T = GUIButton(Sender).Tag;
	ParentPage.InactiveFadeColor=ParentPage.Default.InactiveFadeColor;
	if ( NewOnButtonClick(T) ) Controller.CloseMenu( bool(T & (QBTN_Cancel|QBTN_Abort)) );
	OnButtonClick(T);
	return true;
}

defaultproperties
{
	Begin Object Class=GUIImage Name=imgBack
// if _RO_
        // easier to change here than change everywhere else --emh
//		Image=Texture'InterfaceArt_tex.Menu.Quitmenu'
//		ImageStyle=ISTY_Scaled
//		ImageRenderStyle=MSTY_Normal
// else
		Image=Texture'KF_InterfaceArt_tex.Menu.Med_border_SlightTransparent'
		ImageStyle=ISTY_Stretched
		ImageRenderStyle=MSTY_Normal
		//DropShadow=Material'2K4Menus.Controls.shadow'
// end if _RO_
		DropShadowX=0
		DropShadowY=10
    	WinTop=0.297917
        WinLeft=0.100000
        WinWidth=0.800000
        WinHeight=0.401563
	End Object

	Begin Object Class=GUILabel Name=lblQuestion
	    WinTop=0.366483
        WinLeft=0.150000
        WinWidth=0.700000
        WinHeight=0.065714
		bMultiLine=true
		StyleName="TextLabel"
        TextAlign=TXTA_Center
	End Object
	Controls(0)=imgBack
	Controls(1)=lblQuestion

    WinTop=0.352899
    WinLeft=0.116072
    WinWidth=0.765486
    WinHeight=0.319917
}
