//=============================================================================
// Golden AA12
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class GoldenAA12AutoShotgun extends AA12AutoShotgun;

defaultproperties
{
	SkinRefs(0)="KF_Weapons_Gold_T.Weapons.Gold_AA12_cmb"
    PickupClass=Class'KFMod.GoldenAA12Pickup'
    AttachmentClass=Class'KFMod.GoldenAA12Attachment'
    FireModeClass(0)=Class'KFMod.GoldenAA12Fire'

    ItemName="Golden AA12"
    Description="An advanced automatic shotgun. Fires steel ball shot in semi or full auto."

    // TODO: change these
	HudImageRef="KillingFloor2HUD.WeaponSelect.Gold_AA12_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Gold_AA12"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Gold_AA12'

	appID=210944
}


