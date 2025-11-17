//=============================================================================
// Camo M32 MGL Semi automatic grenade launcher Inventory class
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class CamoM32GrenadeLauncher extends M32GrenadeLauncher;

defaultproperties
{
	SkinRefs(0)="KF_Weapons_camo_Trip_T.Weapons.M32_camo_cmb"
    PickupClass=Class'KFMod.CamoM32Pickup'
    AttachmentClass=Class'KFMod.CamoM32Attachment'
    ItemName="Camo M32 Grenade Launcher"
    Description="A camouflaged advanced semi automatic grenade launcher. Launches high explosive grenades."

	HudImageRef="KillingFloor2HUD.WeaponSelect.M32Camo_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.M32Camo"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_M32Camo'

    FireModeClass(0)=Class'KFMod.CamoM32Fire'

	appID=258752
}


