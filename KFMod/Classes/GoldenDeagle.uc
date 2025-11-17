//=============================================================================
// GoldenDeagle
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class GoldenDeagle extends Deagle;

simulated function bool PutDown()
{
	if ( Instigator.PendingWeapon.class == class'GoldenDualDeagle' )
	{
		bIsReloading = false;
	}

	return super(KFWeapon).PutDown();
}


defaultproperties
{
    SkinRefs(0)="KF_Weapons_Gold_T.Weapons.Gold_deagle_cmb"
    PickupClass=Class'KFMod.GoldenDeaglePickup'
    AttachmentClass=Class'KFMod.GoldenDeagleAttachment'
    FireModeClass(0)=Class'KFMod.GoldenDeagleFire'

    ItemName="Golden Handcannon"
    Description=".50 calibre action express handgun. This is about as big and nasty as personal weapons are going to get. But with a 7 round magazine, it should be used conservatively.  "

	HudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Deagle_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Deagle"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Gold_Deagle'

	appID=210944
}


