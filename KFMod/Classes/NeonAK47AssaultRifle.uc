//=============================================================================
// NeonAK47AssaultRifle
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class NeonAK47AssaultRifle extends AK47AssaultRifle;

defaultproperties
{
	SkinRefs(0)="KF_Weapons_Neon_Trip_T.1stPerson.AK47_Neon_SHDR"
    PickupClass=Class'KFMod.NeonAK47Pickup'
    AttachmentClass=Class'KFMod.NeonAK47Attachment'
    ItemName="Neon AK47"
    Description="It's a neon AK47"

	HudImageRef="KillingFloor2HUD.WeaponSelect.NeonAK47_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.NeonAK47"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_NeonAK47'

    FireModeClass(0)=Class'KFMod.NeonAK47Fire'

	appID=309991
}
