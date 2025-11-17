// ====================================================================
// (C) 2002, Epic Games
// ====================================================================

class STY2FooterButton extends STY2TabButton;

defaultproperties
{
	KeyName="FooterButton"
	BorderOffsets(0)=10
	BorderOffsets(1)=0
	BorderOffsets(2)=10
	BorderOffsets(3)=0

	Images(0)=Texture'InterfaceArt_tex.Menu.changeme_texture' //Material'2K4Menus.NewControls.FooterButton'
//	Images(1)=Material'2K4Menus.NewControls.FooterButtonWatched'
//	Images(2)=Material'2K4Menus.NewControls.FooterButton'
//	Images(3)=Material'2K4Menus.NewControls.FooterButtonPressed'
//	Images(4)=Material'2K4Menus.NewControls.FooterButton'
//	Images(0)=Material'2K4Menus.NewControls.GradientButtonBlurry'
	Images(1)=Texture'InterfaceArt_tex.Menu.changeme_texture' //Material'2K4Menus.NewControls.GradientButtonWatched'
	Images(2)=Texture'InterfaceArt_tex.Menu.changeme_texture' //Material'2K4Menus.NewControls.GradientButtonFocused'
	Images(3)=Texture'InterfaceArt_tex.Menu.changeme_texture' //Material'2K4Menus.NewControls.GradientButtonPressed'
	Images(4)=Texture'InterfaceArt_tex.Menu.changeme_texture' //Material'2K4Menus.NewControls.GradientButtonDisabled'
	
	FontColors(0)=(R=0,G=0,B=0,A=255)
	FontColors(1)=(R=255,G=255,B=255,A=255)
	FontColors(2)=(R=255,G=255,B=255,A=255)
	FontColors(3)=(R=255,G=255,B=255,A=255)
	FontColors(4)=(R=0,G=0,B=0,A=255)
}
