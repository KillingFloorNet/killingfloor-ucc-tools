//==============================================================================
//==============================================================================
class KFGameFooter extends UT2K4GameFooter;

DefaultProperties
{	
    bFullHeight=False
	WinHeight=0.05
	ButtonHeight=0.035
    Justification=TXTA_Right
	WinWidth=1.000000

	Begin Object Class=GUIButton Name=GamePrimaryButton
        //WinWidth=0.15
        WinHeight=0.033203
        WinTop=0.906146
        //WinLeft=0.88
        TabOrder=0
        bBoundToParent=True
        MenuState=MSAT_Disabled
        bAutoSize=true
        AutoSizePadding=(HorzPerc=0.4)
    End Object
    b_Primary=GamePrimaryButton

    Begin Object Class=GUIButton Name=GameSecondaryButton
        //WinWidth=0.150000
        WinHeight=0.033203
        WinTop=0.906146
        //WinLeft=0.758125
        TabOrder=1
        bBoundToParent=True
        MenuState=MSAT_Disabled
        bAutoSize=true
        AutoSizePadding=(HorzPerc=0.4)
    End Object
    b_Secondary=GameSecondaryButton

    Begin Object Class=GUIButton Name=GameBackButton
        Caption="BACK"
        Hint="Return to Previous Menu"
        //WinWidth=0.15
        WinHeight=0.033203
        WinTop=0.906146
        //WinLeft=0
        TabOrder=2
        bBoundToParent=True
        bAutoSize=true  
        AutoSizePadding=(HorzPerc=0.4)
    End Object
    b_Back=GameBackButton
}
