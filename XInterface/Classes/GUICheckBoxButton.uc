// ====================================================================
//  Class:  UT2K4UI.GUIGFXButton
//
//  Written by Joe Wilcox
//  (c) 2002, Epic Games, Inc.  All Rights Reserved
// ====================================================================

class GUICheckBoxButton extends GUIGFXButton
	Native;

cpptext
{
		void Draw(UCanvas* Canvas);
}

var()	Material	CheckedOverlay[10];
var()   bool		bAllOverlay;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	local int i;

	Super.InitComponent(MyController, MyOwner);

	for ( i = 0; i < ArrayCount(CheckedOverlay); i++ )
	{
		if ( CheckedOverlay[i] == None )
			CheckedOverlay[i] = Graphic;
	}
}

defaultproperties
{
    CheckedOverlay(0)=Texture'KF_InterfaceArt_tex.Menu.CheckBox'
	CheckedOverlay(1)=Texture'KF_InterfaceArt_tex.Menu.checkbox_highlight'
	CheckedOverlay(2)=Texture'KF_InterfaceArt_tex.Menu.CheckBox'
	CheckedOverlay(3)=Texture'KF_InterfaceArt_tex.Menu.CheckBox'
	CheckedOverlay(4)=Texture'KF_InterfaceArt_tex.Menu.CheckBox'
	
	bCheckBox=true
	Position=ICP_Scaled
	bRepeatClick=false
    bTabStop=true
   	StyleName="CheckBox"
    ImageIndex=4
}
