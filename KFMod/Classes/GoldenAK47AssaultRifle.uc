//=============================================================================
// GoldenAK47AssaultRifle
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================
class GoldenAK47AssaultRifle extends AK47AssaultRifle;

defaultproperties
{
	SkinRefs(0)="KF_Weapons_Gold_T.Weapons.Gold_AK47_cmb"
    PickupClass=Class'KFMod.GoldenAK47Pickup'
    AttachmentClass=Class'KFMod.GoldenAK47Attachment'
    ItemName="Golden AK47"
    Description="Take a classic AK. Gold plate every visible piece of metal. Engrave the wood for good measure. Serious blingski."

	HudImageRef="KillingFloor2HUD.WeaponSelect.Gold_AK47_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Gold_AK47"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Gold_AK47'

    FireModeClass(0)=Class'KFMod.GoldenAK47Fire'

	appID=210938

}
