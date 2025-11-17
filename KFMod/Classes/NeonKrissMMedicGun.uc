//=============================================================================
// NeonKrissMMedicGun
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class NeonKrissMMedicGun extends KrissMMedicGun;

defaultproperties
{
	SkinRefs(0)="KF_Weapons_Neon_Trip_T.1stPerson.Kriss_Neon_SHDR"
    PickupClass=Class'KFMod.NeonKrissMPickup'
    AttachmentClass=Class'KFMod.NeonKrissMAttachment'
    ItemName="Neon Schneidzekk Medic Gun"
    Description="Neon Schneidzekk Medic Gun"

	HudImageRef="KillingFloor2HUD.WeaponSelect.NeonKris_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.NeonKris"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_NeonKris'

    FireModeClass(0)=Class'KFMod.NeonKrissMFire'

	appID=309991
}
