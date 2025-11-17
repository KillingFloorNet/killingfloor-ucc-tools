//=============================================================================
// GoldenChainsaw
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class GoldenChainsaw extends Chainsaw;

DefaultProperties
{
    SkinRefs(0)="KF_Weapons_Gold_T.Weapons.Gold_chainsaw_cmb"
    BloodyMaterialRef="KF_Weapons_Gold_T.Gold_Blood_chainsaw_cmb"
    PickupClass=Class'KFMod.GoldenChainsawPickup'
    AttachmentClass=Class'KFMod.GoldenChainsawAttachment'
    ItemName="Golden Chainsaw"
    Description="A gas powered industrial strength chainsaw."

    // TODO: change these
	HudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Chainsaw_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Chainsaw"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Gold_Chainsaw'

	appID=210944
}
