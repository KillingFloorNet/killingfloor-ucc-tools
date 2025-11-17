class KFGUIController extends UT2K4GUIController;

#exec OBJ LOAD FILE=KFInterfaceContent.utx
#exec OBJ LOAD FILE=2K4MenuSounds.uax
#exec OBJ LOAD FILE=2K4Menus.utx


simulated event ResolutionChanged()
{
    if( ViewportOwner.Actor != none && KFPlayerController(ViewportOwner.Actor) != none )
    {
        KFPlayerController(ViewportOwner.Actor).InitFOV();
    }
}

event InitializeController()
{
	Super.InitializeController();
	
	// Enter the mp_lobby zone to get a new movie
	class'PlayerController'.static.Advertising_EnterZone("mp_lobby");
}

function PurgeComponentClasses()
{
	if ( RegisteredClasses.Length > 0 )
		RegisteredClasses.Remove(0, RegisteredClasses.Length);

	Super.PurgeComponentClasses();
}

function ReturnToMainMenu()
{ 
    // Closing all the menus also force an Advertising_ExitZone
    CloseAll(true);

    // Re-enter the mp_lobby zone to get a new movie
    if( ViewportOwner.Actor != none )
    {
    	ViewportOwner.Actor.Advertising_EnterZone("mp_lobby");    	
    }

    if ( MenuStack.Length == 0 )
        OpenMenu(GetMainMenuClass());
}

static simulated function string GetServerBrowserPage()
{
	return "KFGUI.KFServerBrowser";
}

defaultproperties
{
     //STYLE_NUM=67
    STYLE_NUM=63

    MapVotingMenu="KFGUI.KFMapVotingPage"
    FilterMenu="KFGUI.KFUT2K4_FilterListPage"

     // RO Styles
    DefaultStyleNames(1)="ROInterface.ROSTY_RoundScaledButton"
  	DefaultStyleNames(4)="ROInterface.ROSTY2ScrollZone"
    DefaultStyleNames(8)="ROInterface.ROSTY_Footer"
    DefaultStyleNames(15)="ROInterface.ROSTY_ServerBrowserGridHeader"

    DefaultStyleNames(21)="ROInterface.ROSTY_SquareBar"
  	DefaultStyleNames(22)="ROInterface.ROSTY_MidGameButton"
  	DefaultStyleNames(24)="ROInterface.ROSTY2ComboListBox"

    DefaultStyleNames(26)="ROInterface.ROSTY2IRCText"
    DefaultStyleNames(27)="ROInterface.ROSTY2IRCEntry"

  	DefaultStyleNames(35)="ROInterface.ROSTY2CheckBox"
    //DefaultStyleNames(36)="ROInterface.STY2CheckBoxCheck"
    DefaultStyleNames(37)="ROInterface.ROSTY2SliderKnob"

    DefaultStyleNames(40)="ROInterface.ROSTY2ItemOutline"

    DefaultStyleNames(42)="ROInterface.ROSTY2MouseOverLabel"
    DefaultStyleNames(43)="ROInterface.ROSTY2SliderBar"

    DefaultStyleNames(45)="ROInterface.ROSTY2TextButtonEffect"

    DefaultStyleNames(50)="ROInterface.ROSTY2ComboButton"
    DefaultStyleNames(51)="ROInterface.ROSTY2VertUpButton"
    DefaultStyleNames(52)="ROInterface.ROSTY2VertDownButton"
    DefaultStyleNames(53)="ROInterface.ROSTY2_VertGrip"
    DefaultStyleNames(54)="ROInterface.ROSTY2Spinner"
    DefaultStyleNames(55)="ROInterface.ROSTY2SectionHeaderTop"
    DefaultStyleNames(56)="ROInterface.ROSTY2SectionHeaderBar"
    DefaultStyleNames(57)="ROInterface.ROSTY2CloseButton"



     DefaultStyleNames(0)="KFGUI.KF_RoundButton"
     DefaultStyleNames(2)="KFGUI.KF_SquareButton"
     DefaultStyleNames(3)="KFGUI.KF_ListBox"
     DefaultStyleNames(5)="KFGUI.KF_TextButton"
     DefaultStyleNames(7)="KFGUI.KF_Header"
     DefaultStyleNames(9)="KFGUI.KF_TabButton"
     DefaultStyleNames(13)="KFGUI.KF_ServerBrowserGrid"
     DefaultStyleNames(14)="GUI2K4.STY2NoBackground"//"KFGUI.KF_NoBackground"
     DefaultStyleNames(23)="KFGUI.KF_TextLabel"
     DefaultStyleNames(29)="KFGUI.KF_ContextMenu"
     DefaultStyleNames(30)="KFGUI.KF_ServerListContextMenu"
     DefaultStyleNames(31)="KFGUI.KF_ListSelection"
     DefaultStyleNames(32)="ROInterface.ROSTY2TabBackground"
     DefaultStyleNames(33)="KFGUI.KF_BrowserListSel"
     DefaultStyleNames(34)="KFGUI.KF_EditBox"
     DefaultStyleNames(39)="KFGUI.KF_ListSectionHeader"
     DefaultStyleNames(41)="KFGUI.KF_ListHighlight"
     DefaultStyleNames(48)="KFGUI.KF_FooterButton"
     DefaultStyleNames(59)="GUI2K4.STY2AltComboButton"
     DefaultStyleNames(60)="KFGUI.KF_ItemBoxInfo"
      // Veterancy Styles

     // Menu Tooltip style
     DefaultStyleNames(61)="KFGUI.GUIVetToolTipMOStyle"
     DefaultStyleNames(62)="KFGUI.KFSTY2NoBackground"

     MainMenuOptions(2)="KFGUI.KFGamePageMP"
     MainMenuOptions(3)="KFGUI.KFGamePageSP"
     MainMenuOptions(5)="KFGUI.KFSettingsPage"
     MainMenuOptions(6)="KFGUI.KFQuitPage"

     NetworkMsgMenu="KFGUI.KFNetworkStatusMsg"

    MouseCursors(0)=material'InterfaceArt_tex.Cursors.Pointer'          // Arrow
    MouseCursors(1)=material'InterfaceArt_tex.Cursors.ResizeAll'       // SizeAll
    MouseCursors(2)=material'InterfaceArt_tex.Cursors.ResizeSWNE'       // Size NE SW
    MouseCursors(3)=material'InterfaceArt_tex.Cursors.Resize'   // Size NS
    MouseCursors(4)=material'InterfaceArt_tex.Cursors.ResizeNWSE'       // Size NW SE
    MouseCursors(5)=material'InterfaceArt_tex.Cursors.ResizeHorz'       // Size WE
    MouseCursors(6)=material'InterfaceArt_tex.Cursors.Pointer'          // Wait

    ImageList(0)=Texture'InterfaceArt_tex.Menu.checkBoxBall_b'
    ImageList(1)=Texture'InterfaceArt_tex.Menu.AltComboTickBlurry'
	ImageList(2)=Texture'KF_InterfaceArt_tex.Menu.LeftMark'
	ImageList(3)=Texture'KF_InterfaceArt_tex.Menu.RightMark'
	ImageList(4)=Texture'KF_InterfaceArt_tex.Menu.RightMark'
	ImageList(5)=Texture'KF_InterfaceArt_tex.Menu.RightMark'
	ImageList(6)=Texture'KF_InterfaceArt_tex.Menu.UpMark'
	ImageList(7)=Texture'KF_InterfaceArt_tex.Menu.DownMark'
}
