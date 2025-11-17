//=============================================================================
// Neon SCAR MK17 Inventory class
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class NeonSCARMK17AssaultRifle extends SCARMK17AssaultRifle;

defaultproperties
{
    SkinRefs(0)="KF_Weapons_Neon_Trip_T.1stPerson.Scar_Neon_SHDR"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.Aimpoint_sight_shdr"

    PickupClass=Class'KFMod.NeonSCARMK17Pickup'
    AttachmentClass=Class'KFMod.NeonSCARMK17Attachment'
    ItemName="Neon SCAR"
    Description="Neon SCAR"

	HudImageRef="KillingFloor2HUD.WeaponSelect.NeonScar_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.NeonScar"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_NeonScar'

    FireModeClass(0)=Class'KFMod.NeonSCARMK17Fire'

	appID=309991
}
