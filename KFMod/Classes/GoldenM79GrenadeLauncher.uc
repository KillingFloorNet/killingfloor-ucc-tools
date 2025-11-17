//=============================================================================
// GoldenM79GrenadeLauncher
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================

class GoldenM79GrenadeLauncher extends M79GrenadeLauncher;

defaultproperties
{
    SkinRefs(0)="KF_Weapons_Gold_T.Weapons.Gold_M79_cmb"
    PickupClass=Class'KFMod.GoldenM79Pickup'
    AttachmentClass=Class'KFMod.GoldenM79Attachment'
    ItemName="Golden M79 Grenade Launcher"
    Description="Gold plating. Gold filigree inlay on the woodwork. You probably want the rounds gold as well. Bosh! "

	HudImageRef="KillingFloor2HUD.WeaponSelect.Gold_M79_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Gold_M79"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Gold_M79'

    FireModeClass(0)=Class'KFMod.GoldenM79Fire'

	appID=210938
}
