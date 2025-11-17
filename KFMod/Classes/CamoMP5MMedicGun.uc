//=============================================================================
// CamoMP5MMedicGun
//=============================================================================
// A modified MP5 SMG and Medic Gun
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class CamoMP5MMedicGun extends MP5MMedicGun;

defaultproperties
{
	SkinRefs(0)="KF_Weapons_camo_Trip_T.Weapons.MP5_camo_cmb"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.Aimpoint_sight_shdr" // TODO: CHANGE?

    FireModeClass(0)=Class'KFMod.CamoMP5MFire'
    FireModeClass(1)=Class'KFMod.MP5MAltFire'

    Description="Camouflaged MP5 sub machine gun. Modified to fire healing darts. Better damage and healing than MP7M with a larger mag."

    PickupClass=Class'KFMod.CamoMP5MPickup'

    AttachmentClass=Class'KFMod.CamoMP5MAttachment'

    ItemName="Camo MP5M Medic Gun"
    MeshRef="KF_Wep_MP5.MP5_Trip" // TODO: CHANGE?

	HudImageRef="KillingFloor2HUD.WeaponSelect.MP5Camo_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.MP5Camo"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Mp5Camo'

	appID=258752
}
