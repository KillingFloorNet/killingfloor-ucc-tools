//-----------------------------------------------------------
//
//-----------------------------------------------------------
class GUIForSaleBodyPanel extends GUIPanel;

var     automated   GUIImage    BG;
var()               GUIBuyable  SaleItemInfo;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.Initcomponent(MyController, MyOwner);
}

defaultproperties
{
    Begin Object Class=GUISaleLabel Name=ItemText
        Caption="Available In Shop"
        TextAlign=TXTA_Left
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.000000
        WinWidth=0.500000
        WinHeight=0.800000
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

    Begin Object Class=GUIInvButton Name=BuyButton
        Caption="Buy"
        FontScale=FNS_Small
        WinTop=0.000000
        WinLeft=0.750000
        WinWidth=0.250000
        WinHeight=0.800000
        bBoundToParent=true
        bScaleToParent=true
        ToolTip=none
    End Object
    Controls(2)=GUIInvButton'BuyButton'

    /*
    Begin Object Class=GUIImage Name=Background
        Image=Texture'Engine.WhiteSquareTexture'
        ImageColor=(B=128,G=128,R=128)
        ImageStyle=ISTY_Stretched
        ImageRenderStyle=MSTY_Normal
        WinHeight=1.000000
        WinWidth=1.000000
    End Object
    BG=Background
    */
}

