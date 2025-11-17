//-----------------------------------------------------------
//
//-----------------------------------------------------------
class GUIForSaleHeaderPanel extends GUIPanel;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.Initcomponent(MyController, MyOwner);
}

DefaultProperties
{
    Begin Object Class=GUILabel Name=ItemText
        Caption="Available In Shop"
        TextAlign=TXTA_Left
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.000000
        WinWidth=0.500000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
    End Object
    Controls(0)=GUILabel'ItemText'

    Begin Object Class=GUILabel Name=ItemPrice
        Caption="Price"
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.500000
        WinWidth=0.250000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
    End Object
    Controls(1)=GUILabel'ItemPrice'

    Begin Object Class=GUILabel Name=BuyText
        Caption="Buy"
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.750000
        WinWidth=0.250000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
    End Object
    Controls(2)=GUILabel'BuyText'
}

