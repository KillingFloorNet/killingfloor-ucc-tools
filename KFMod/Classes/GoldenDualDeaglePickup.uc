//=============================================================================
// GoldenDualDeaglePickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class GoldenDualDeaglePickup extends DualDeaglePickup;

defaultproperties
{
    Skins(0)=Texture'KF_Weapons3rd_Gold_T.Weapons.Gold_Handcannon_3rd'
    ItemName="Dual Gold Handcannons"
    Description="50 Cal AE handgun. A powerful personal choice for personal defense."
	ItemShortName="Dual Gold Handcannons"
	AmmoItemName=".300 JHP Ammo"
	InventoryType=Class'KFMod.GoldenDualDeagle'
	PickupMessage="You got another gold handcannon."
	StaticMesh=StaticMesh'KF_pickupsGold_Trip.HandcannonGold_Pickup'
	PickupSound=Sound'KF_HandcannonSnd.50AE_Pickup'
}
