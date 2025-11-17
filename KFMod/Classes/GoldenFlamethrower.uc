//=============================================================================
// GoldenFlamethrower
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class GoldenFlamethrower extends Flamethrower;

defaultproperties
{
	SkinRefs(0)="KF_Weapons_Gold_T.Weapons.Gold_Flamethrower_cmb"
    PickupClass=Class'KFMod.GoldenFTPickup'
    AttachmentClass=Class'KFMod.GoldenFTAttachment'
    FireModeClass(0)=Class'KFMod.GoldenFlameBurstFire'

    ItemName="Golden Flamethrower"
    Description="A deadly experimental weapon designed by Horzine industries. It can fire streams of burning liquid which ignite on contact."

    // TODO: Change these
	HudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Flamethrower_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Flamethrower"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Gold_Flamethrower'

	appID=210944
}


