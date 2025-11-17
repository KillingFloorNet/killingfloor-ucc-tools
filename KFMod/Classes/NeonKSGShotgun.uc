//=============================================================================
// NeonKSGShotgun
//=============================================================================
// NeonKSG Prototype/Modified Shotgun Inventory Class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class NeonKSGShotgun extends KSGShotgun;

defaultproperties
{
    SkinRefs(0)="KF_Weapons_Neon_Trip_T.1stPerson.KSG_Neon_SHDR"

    FireModeClass(0)=Class'KFMod.NeonKSGFire'

    Description="An advanced, neon Horzine prototype tactical shotgun. Features a large capacity ammo magazine and selectable tight/wide spread fire modes."
    PickupClass=Class'KFMod.NeonKSGPickup'
    AttachmentClass=Class'KFMod.NeonKSGAttachment'
    ItemName="Neon HSG-1 Shotgun"
    //MeshRef="KF_Wep_KSG_Shotgun.KSG_Shotgun"

	HudImageRef="KillingFloor2HUD.WeaponSelect.NeonKSG_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.NeonKSG"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_NeonKSG'

	appID=309991
}
