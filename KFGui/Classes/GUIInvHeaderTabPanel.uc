//-----------------------------------------------------------
//
//-----------------------------------------------------------
class GUIInvHeaderTabPanel extends GUIPanel;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.Initcomponent(MyController, MyOwner);
}

DefaultProperties
{
    Begin Object Class=GUILabel Name=InventoryText
        Caption="Inventory"
        TextAlign=TXTA_Left
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        //TextFont="UT2MediumFont"
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.000000
        WinWidth=0.230000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
        //WinHeight=0.070000
    End Object
    Controls(0)=GUILabel'InventoryText'

    Begin Object Class=GUILabel Name=AmmoText
        Caption="Ammo"
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        //TextFont="UT2MediumFont"
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.230000
        WinWidth=0.140000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
        //WinHeight=0.070000
    End Object
    Controls(1)=GUILabel'AmmoText'

    Begin Object Class=GUILabel Name=ClipText
        Caption="Buy Clip"
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        //TextFont="UT2MediumFont"
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.370000
        WinWidth=0.160000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
        //WinHeight=0.070000
    End Object
    Controls(2)=GUILabel'ClipText'

    Begin Object Class=GUILabel Name=FillText
        Caption="Fill Up"
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        //TextFont="UT2MediumFont"
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.54000
        WinWidth=0.160000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
        //WinHeight=0.070000
    End Object
    Controls(3)=GUILabel'FillText'

    Begin Object Class=GUILabel Name=PriceText
        Caption="Price"
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        //TextFont="UT2MediumFont"
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.700000
        WinWidth=0.140000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
        //WinHeight=0.070000
    End Object
    Controls(4)=GUILabel'PriceText'

    Begin Object Class=GUILabel Name=SellText
        Caption="Sell"
        TextAlign=TXTA_Center
        bMultiline=False
        VertAlign=TXTA_Center
        FontScale=FNS_Small
        //TextFont="UT2MediumFont"
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.000000
        WinLeft=0.840000
        WinWidth=0.160000
        WinHeight=1.000000
        bBoundToParent=true
        bScaleToParent=true
        //WinHeight=0.070000
    End Object
    Controls(5)=GUILabel'SellText'
}

