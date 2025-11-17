//=============================================================================
// GoldenKatana
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================
class GoldenKatana extends Katana;

DefaultProperties
{
    SkinRefs(0)="KF_Weapons_Gold_T.Weapons.Gold_Katana_cmb"
    BloodyMaterialRef="KF_Weapons_Gold_T.Gold_Bloody_Katana_cmb"
    PickupClass=Class'KFMod.GoldenKatanaPickup'
    AttachmentClass=Class'KFMod.GoldenKatanaAttachment'
    ItemName="Golden Katana"
    Description="Stunning craftsmanship, taking decades to perfect. And then someone just has to go and gold plate it... Pretty, ain't it?"

	HudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Katana_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Gold_Katana"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Gold_Katana'

	appID=210938
}
