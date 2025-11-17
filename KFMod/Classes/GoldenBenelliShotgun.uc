//=============================================================================
// GoldenBenelliShotgun
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================
class GoldenBenelliShotgun extends BenelliShotgun;

defaultproperties
{
	SkinRefs(0)="KF_Weapons_Gold_T.Weapons.Gold_Benelli_cmb"
    PickupClass=Class'KFMod.GoldenBenelliPickup'
    AttachmentClass=Class'KFMod.GoldenBenelliAttachment'
    ItemName="Golden Combat Shotgun"
    Description="Gold plating, polished until it shines and twinkles. Just the thing for the serious Zed-slayer."

	HudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Benelli_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Benelli"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Gold_Benelli'

    FireModeClass(0)=Class'KFMod.GoldenBenelliFire'

	appID=210938
}


