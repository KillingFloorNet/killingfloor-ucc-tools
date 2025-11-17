class KFPlayerReadyBar extends GUIMultiComponent;

var automated 	GUIImage 	PerkBackGround;
var automated 	GUIImage  	PlayerBackGround;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
	Super.InitComponent(MyC, MyO);
	
	ResizeMe();
}

function ResolutionChanged( int ResX, int ResY )
{
	Super.ResolutionChanged(ResX,ResY);
	
	ResizeMe();
}

function ResizeMe()
{
	PerkBackGround.WinWidth = PerkBackGround.ActualHeight();
	PlayerBackGround.WinLeft = PerkBackGround.Winleft + PerkBackGround.ActualHeight();
	PlayerBackGround.WinWidth = ActualWidth() - PerkBackGround.ActualHeight();	
}

defaultproperties
{
	Begin Object Class=GUIImage Name=PerkBG
		Image=texture'KF_InterfaceArt_tex.Menu.Item_box_box'
		ImageColor=(B=255,G=255,R=255,A=255)
		ImageStyle=ISTY_Scaled
		ImageRenderStyle=MSTY_Normal
		WinTop=0.00000
		WinLeft=0.00000
		WinWidth=0.00000
		WinHeight=1
		bScaleToParent=true
		bBoundToParent=true
	End Object
	PerkBackground=PerkBG
	
	Begin Object Class=GUIImage Name=PlayerBG
		Image=texture'KF_InterfaceArt_tex.Menu.Item_box_bar'
		ImageColor=(B=255,G=255,R=255,A=255)
		ImageStyle=ISTY_Stretched
		ImageRenderStyle=MSTY_Normal
		WinTop=0.10000
		WinLeft=0.00000
		WinWidth=1.00000
		WinHeight=0.8
		bScaleToParent=true
		bBoundToParent=true
	End Object
	PlayerBackground=PlayerBG
}
