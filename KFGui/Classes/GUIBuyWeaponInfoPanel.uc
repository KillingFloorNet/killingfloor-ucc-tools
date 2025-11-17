//=============================================================================
// Selected weapon info in the trader menu
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================
class GUIBuyWeaponInfoPanel extends GUIBuyDescInfoPanel;

var automated 	GUILabel		ItemName, WeightLabel;
var automated 	GUIImage 		ItemImage, ItemNameBG, WeightLabelBG;

var automated 	GUILabel 		ItemPower,ItemRange,ItemSpeed; //Weapon stats captions
var automated	GUIWeaponBar 	b_power,b_range,b_speed; //Weapon stats bars

var automated	localized 	String Weight;
var				class<Pickup> 	OldPickupClass;

var automated   GUIButton       FavoriteButton;

var             bool            bFavorited;

var localized   string          FavoriteString;
var localized   string          UnfavoriteString;

// cache it!
var KFLevelRules KFLR;

function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
	Super.InitComponent(MyController,MyOwner);

	b_power.SetValue(0);
	b_power.SetVisibility(false);
	b_speed.SetValue(0);
	b_speed.SetVisibility(false);
	b_range.SetValue(0);
	b_range.SetVisibility(false);

	ItemPower.SetVisibility(false);
	ItemRange.SetVisibility(false);
	ItemSpeed.SetVisibility(false);
}

function Opened( GUIComponent Sender )
{
    super.Opened( Sender );

    foreach PlayerOwner().DynamicActors(class'KFLevelRules', KFLR)
    {
        break;
	}
}

function Display(GUIBuyable NewBuyable)
{
	if ( NewBuyable == none || NewBuyable.bIsFirstAidKit || NewBuyable.bIsVest )
	{
		b_power.SetValue(0);
		b_power.SetVisibility(false);
		b_speed.SetValue(0);
		b_speed.SetVisibility(false);
		b_range.SetValue(0);
		b_range.SetVisibility(false);

		ItemPower.SetVisibility(false);
		ItemRange.SetVisibility(false);
		ItemSpeed.SetVisibility(false);

		WeightLabel.SetVisibility(false);
		WeightLabelBG.SetVisibility(false);

		FavoriteButton.SetVisibility(false);
	}
	else
	{
		b_power.SetValue(NewBuyable.ItemPower);
		b_speed.SetValue(NewBuyable.ItemSpeed);
		b_range.SetValue(NewBuyable.ItemRange);

		b_power.SetVisibility(true);
		b_speed.SetVisibility(true);
		b_range.SetVisibility(true);

		ItemPower.SetVisibility(true);
		ItemRange.SetVisibility(true);
		ItemSpeed.SetVisibility(true);

		WeightLabel.SetVisibility(true);
		WeightLabelBG.SetVisibility(true);

        if( NewBuyable.bSaleList )
        {
    		FavoriteButton.SetVisibility(true);
    	}
    	else
    	{
    	   FavoriteButton.SetVisibility(false);
    	}
    	bFavorited = KFLR.IsFavorited( NewBuyable.ItemPickupClass );
    	RefreshFavoriteButton();
	}

	if ( NewBuyable != none )
	{
		ItemName.Caption = NewBuyable.ItemName;
		ItemNameBG.bVisible = true;
		ItemImage.Image = NewBuyable.ItemImage;
		WeightLabel.Caption = Repl(Weight, "%i", int(NewBuyable.ItemWeight));

		OldPickupClass = NewBuyable.ItemPickupClass;
	}
	else
	{
		ItemName.Caption = "";
		ItemNameBG.bVisible = false;
		ItemImage.Image = none;
		WeightLabel.Caption = "";
	}

	Super.Display(NewBuyable);
}

function RefreshFavoriteButton()
{
    if( bFavorited )
	{
	    FavoriteButton.Caption = UnfavoriteString;
	}
	else
	{
	    FavoriteButton.Caption = FavoriteString;
	}
}

function bool InternalOnClick( GUIComponent Sender )
{
    if( Sender == FavoriteButton )
    {
        if( OldPickupClass != none )
        {
            if( bFavorited )
            {
                KFLR.RemoveFromFavorites( OldPickupClass );
            }
            else
            {
                KFLR.AddToFavorites( OldPickupClass );
            }

            bFavorited = !bFavorited;
            RefreshFavoriteButton();
        }
    }

    return true;
}

defaultproperties
{
	Weight="Weight: %i blocks"
	FavoriteString="Favorite"
	UnfavoriteString="Un-favorite"

	Begin Object Class=GUILabel Name=IName
		TextFont="UT2LargeFont"
		Caption=""
		TextColor=(R=175,G=176,B=158,A=255)
     	WinTop=0.005236
        WinLeft=0.035800
        WinWidth=0.928366
        WinHeight=0.070000
		bScaleToParent=true
		bBoundToParent=true
		bAcceptsInput=false
		bNeverFocus=true
		TextAlign=TXTA_Center
	End Object
	ItemName=GUILabel'KFGui.GUIBuyWeaponInfoPanel.IName'

	Begin Object class=GUIImage Name=INameBG
        WinTop=-0.015493
        WinLeft=0.035800
        WinWidth=0.928366
        WinHeight=0.105446
		Image=Texture'KF_InterfaceArt_tex.Menu.Innerborder_transparent'
		ImageStyle=ISTY_Stretched
	End Object
	ItemNameBG=INameBG

	Begin Object Class=GUILabel Name=LWeight
		Caption=""
		TextColor=(R=175,G=176,B=158,A=255)
        WinTop=0.879874
        WinLeft=0.058031
        WinWidth=0.885273
        WinHeight=0.093913
		bScaleToParent=true
		bBoundToParent=true
		bAcceptsInput=false
		bNeverFocus=true
		TextFont="UT2LargeFont"
		TextAlign=TXTA_Center
	End Object
	WeightLabel=GUILabel'KFGui.GUIBuyWeaponInfoPanel.LWeight'

	Begin Object class=GUIImage Name=LWeightBG
		WinTop=0.873124
        WinLeft=0.112600
        WinWidth=0.765905
        WinHeight=0.108400
		Image=Texture'KF_InterfaceArt_tex.Menu.Innerborder_transparent'
		ImageStyle=ISTY_Stretched
	End Object
	WeightLabelBG=LWeightBG

	Begin Object Class=GUIButton Name=FavoriteB
        WinTop=1
        WinLeft=0.25
        WinWidth=0.5
        WinHeight=0.08
        Caption="Favorite"
		RenderWeight=0.9
		OnClick=InternalOnClick
	End Object
	FavoriteButton=FavoriteB

	Begin Object Class=GUIImage Name=IImage
     	WinTop=0.113025
	    WinLeft=0.237005
        WinWidth=0.524539
        WinHeight=0.574359
		bScaleToParent=true
		bBoundToParent=true
		RenderWeight=2.0
		ImageStyle=ISTY_Justified
	End Object
	ItemImage=GUIImage'KFGUI.GUIBuyWeaponInfoPanel.IImage'

	Begin Object Class=GUILabel Name=PowerCap
		Caption="Power:"
		TextColor=(R=175,G=176,B=158,A=255)
        WinTop=0.588943
        WinLeft=0.131552
        WinWidth=0.739260
        WinHeight=0.070000
		bScaleToParent=true
		bBoundToParent=true
		FontScale=FNS_Large
	End Object
	ItemPower=GUILabel'KFGui.GUIBuyWeaponInfoPanel.PowerCap'

	Begin Object Class=GUILabel Name=RangeCap
		Caption="Range:"
		TextColor=(R=175,G=176,B=158,A=255)
        WinTop=0.688943
        WinLeft=0.131552
        WinWidth=0.739260
        WinHeight=0.070000
		bScaleToParent=true
		bBoundToParent=true
		FontScale=FNS_Large
	End Object
	ItemRange=GUILabel'KFGui.GUIBuyWeaponInfoPanel.RangeCap'

	Begin Object Class=GUILabel Name=SpeedCap
		Caption="Speed:"
		TextColor=(R=175,G=176,B=158,A=255)
        WinTop=0.788943
        WinLeft=0.131552
        WinWidth=0.739260
        WinHeight=0.070000
		bScaleToParent=true
		bBoundToParent=true
		FontScale=FNS_Large
	End Object
	ItemSpeed=GUILabel'KFGui.GUIBuyWeaponInfoPanel.SpeedCap'

	Begin Object Class=GUIWeaponBar Name=PowerBar
        WinTop=0.598943
        WinLeft=0.366433
        WinWidth=0.471784
        WinHeight=0.050000
		bScaleToParent=true
		bBoundToParent=true
		BorderSize=3.0
	End Object
	b_power=GUIWeaponBar'KFGui.GUIBuyWeaponInfoPanel.PowerBar'

	Begin Object Class=GUIWeaponBar Name=RangeBar
		Value=-5.000000
        WinTop=0.698943
        WinLeft=0.366433
        WinWidth=0.471784
        WinHeight=0.050000
		bScaleToParent=true
		bBoundToParent=true
		BorderSize=3.0
	End Object
	b_range=GUIWeaponBar'KFGui.GUIBuyWeaponInfoPanel.RangeBar'

	Begin Object Class=GUIWeaponBar Name=SpeedBar
        WinTop=0.798943
        WinLeft=0.366433
        WinWidth=0.471784
        WinHeight=0.050000
		bScaleToParent=true
		bBoundToParent=true
		BorderSize=3.0
	End Object
	b_speed=GUIWeaponBar'KFGui.GUIBuyWeaponInfoPanel.SpeedBar'
}

