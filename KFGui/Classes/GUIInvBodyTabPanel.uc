//-----------------------------------------------------------
//
//-----------------------------------------------------------
class GUIInvBodyTabPanel extends GUIPanel;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.Initcomponent(MyController, MyOwner);
}

//function InitPanel()
//{
//    super.InitPanel();
//}


DefaultProperties
{
    Begin Object Class=GUILabel Name=ItemName
        Caption=""
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.000000
        WinWidth=0.230000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
    End Object
    Controls(0)=GUILabel'ItemName'

    Begin Object Class=GUILabel Name=Ammo
        Caption=""
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.230000
        WinWidth=0.140000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
    End Object
    Controls(1)=GUILabel'Ammo'

    Begin Object Class=GUIInvButton Name=ClipButton
        Caption=""
        CaptionAlign=TXTA_Center
        FontScale=FNS_Small
        WinTop=0.000000
        WinLeft=0.370000
        WinWidth=0.160000
        WinHeight=0.800000
        bBoundToParent=true
        bScaleToParent=true
        bHasFocus=false
        ToolTip=none
    End Object
    Controls(2)=GUIInvButton'ClipButton'

    Begin Object Class=GUIInvButton Name=FillButton
        Caption=""
        FontScale=FNS_Small
        WinTop=0.000000
        WinLeft=0.54000
        WinWidth=0.160000
        WinHeight=0.800000
        bBoundToParent=true
        bScaleToParent=true
        bHasFocus=false
        ToolTip=none
    End Object
    Controls(3)=GUIInvButton'FillButton'

    Begin Object Class=GUILabel Name=ItemPrice
        Caption=""
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.700000
        WinWidth=0.140000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
    End Object
    Controls(4)=GUILabel'ItemPrice'

    Begin Object Class=GUIInvButton Name=SellButton
        Caption=""
        FontScale=FNS_Small
        WinTop=0.000000
        WinLeft=0.840000
        WinWidth=0.160000
        WinHeight=0.800000
        bBoundToParent=true
        bScaleToParent=true
        bHasFocus=false
        ToolTip=none
    End Object
    Controls(5)=GUIInvButton'SellButton'

}

