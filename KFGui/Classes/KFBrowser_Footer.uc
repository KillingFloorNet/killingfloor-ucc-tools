class KFBrowser_Footer extends UT2K4Browser_Footer;

var	localized 	string			StopCaption;

function UpdateActiveButtons(UT2K4Browser_Page CurrentPanel)
{
    if (CurrentPanel == None)
        return;

	UpdateButtonState( b_Join,     CurrentPanel.IsJoinAvailable( b_Join.Caption ) );
	UpdateButtonState( b_Refresh,  CurrentPanel.IsRefreshAvailable( b_Refresh.Caption ) );
	//UpdateButtonState( b_Spectate, CurrentPanel.IsSpectateAvailable( b_Spectate.Caption ) );
	//UpdateButtonState( b_Filter,   CurrentPanel.IsFilterAvailable( b_Filter.Caption ) );
}

function bool InternalOnClick(GUIComponent Sender)
{
    if (GUIButton(Sender) == None)
        return false;

    if (Sender == b_Back)
    {
       	Controller.CloseMenu(False);
    	if ( PlayerOwner().Level.NetMode != NM_Client )
    	{
			Controller.CloseAll(true, true);
			Controller.OpenMenu(Controller.GetMainMenuClass());
        }

        return true;
    }

    if ( Sender == b_Join )
    {
    	p_Anchor.JoinClicked();
    	return true;
    }

    if ( Sender == b_Spectate )
    {
    	p_Anchor.SpectateClicked();
    	return true;
    }

    if ( Sender == b_Refresh )
    {
    	p_Anchor.RefreshClicked();

    	if(  KFServerListPageInternet( p_Anchor .c_Tabs.ActiveTab.MyPanel ) != none )
    	{
    	    if( KFServerListPageInternet( p_Anchor .c_Tabs.ActiveTab.MyPanel ).bQueryRunning  )
    	    {
    	        b_refresh.Caption = StopCaption;
    	    }
            else
    	    {
    	        b_refresh.Caption = KFServerListPageInternet( p_Anchor .c_Tabs.ActiveTab.MyPanel ).RefreshCaption;
    	    }
    	}

    	return true;
    }

    /*if ( Sender == b_Filter )
    {
    	p_Anchor.FilterClicked();
    	return true;
    }
	*/

    return false;
}

function UpdateButtonState( GUIButton But, bool Active )
{
	if ( Active )
		EnableComponent(But);
	else DisableComponent(But);
}

function PositionButtons( Canvas C )
{
//	local bool b;

/*	b                 = b_Filter.bVisible;
	b_Filter.bVisible = false;
*/
	super(ButtonFooter).PositionButtons(C);

/*	b_Filter.bVisible = b;
	b_Filter.WinLeft  = GetMargin();
*/
}

function float GetButtonLeft()
{
//	local bool bWasVisible;
	local float Result;

/*	bWasVisible = b_Filter.bVisible;
	b_Filter.bVisible = False;


	b_Filter.bVisible = bWasVisible;
*/
	Result = super(ButtonFooter).GetButtonLeft();
	return Result;
}


defaultproperties
{
	WinHeight=0.05
	ButtonHeight=0.035
	ButtonWidth=0.12
	WinLeft=0.000000
	WinTop=0.95000

	Padding=0.40

	Begin Object class=GUITitleBar name=BrowserStatus
		WinLeft=0.0
		WinTop=0.3
		WinWidth=0.5
		WinHeight=0.4
        StyleName="TextLabel"
        Caption=""
        bUseTextHeight=false
        Justification=TXTA_Left
        bBoundToParent=True
        bScaleToParent=True
        FontScale=FNS_Small
    End Object
    t_StatusBar=BrowserStatus

    b_Filter=none
	b_Spectate=none

	StopCaption="STOP"
}
