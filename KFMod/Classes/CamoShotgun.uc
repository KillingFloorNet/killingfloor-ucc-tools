//=============================================================================
// CamoShotgun
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class CamoShotgun extends Shotgun;

defaultproperties
{
    MeshRef="KF_Weapons_Trip.Shotgun_Trip"
    SkinRefs(0)="KF_Weapons_camo_Trip_T.Shotguns.combat_shotgun_camo_cmb"
    Skins(0)=none
    Mesh=none

    FireModeClass(0)=Class'KFMod.CamoShotgunFire'

    Description="A camoflaged, rugged tactical pump action shotgun common to police divisions the world over. It accepts a maximum of 8 shells and can fire in rapid succession. "

    ItemName="Camo Shotgun"

    PickupClass=Class'KFMod.CamoShotgunPickup'

    AttachmentClass=Class'KFMod.CamoShotgunAttachment'

	HudImageRef="KillingFloor2HUD.WeaponSelect.CombatShotgunCamo_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.CombatShotgunCamo"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Images.Trader_CombatShotgunCamo'

	appID=258752
}


