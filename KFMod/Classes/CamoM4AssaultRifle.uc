//=============================================================================
// CamoM4AssaultRifle
//=============================================================================
// An M4 Assault Rifle
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class CamoM4AssaultRifle extends M4AssaultRifle
	config(user);

#exec OBJ LOAD FILE=KillingFloorWeapons.utx
#exec OBJ LOAD FILE=KillingFloorHUD.utx
#exec OBJ LOAD FILE=Inf_Weapons_Foley.uax

defaultproperties
{
	SkinRefs(0)="KF_Weapons_camo_Trip_T.Weapons.m4_camo_cmb"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.Aimpoint_sight_shdr" // TODO: CHANGE?

    CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross5"

    FireModeClass(0)=Class'KFMod.CamoM4Fire'

    SelectSoundRef="KF_M4RifleSnd.WEP_M4_Foley_Select"
    Description="A camouflaged compact assault rifle. Can be fired in semi or full auto with good damage and good accuracy."
    PickupClass=Class'KFMod.CamoM4Pickup'
    AttachmentClass=Class'KFMod.CamoM4Attachment'
    ItemName="Camo M4"
    MeshRef="KF_Wep_M4.M4_Trip" // TODO: CHANGE?

	HudImageRef="KillingFloor2HUD.WeaponSelect.M4Camo_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.M4Camo"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_M4Camo'

	appID=258752
}
