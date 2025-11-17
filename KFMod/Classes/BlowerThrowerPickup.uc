//=============================================================================
// BlowerThrowerPickup
//=============================================================================
// Pickup class for the bloat bile thrower
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class BlowerThrowerPickup extends KFWeaponPickup;

defaultproperties
{
	Weight=6.000000
	cost=1000
	AmmoCost=15
	BuyClipSize=25
	PowerValue=50
	SpeedValue=80
	RangeValue=20
	Description="A leaf blower modified to launch deadly bloat bile. Spray it around and watch 'em burn!"
	ItemName="Blower Thrower Bile Launcher"
	ItemShortName="Blower Thrower"
	AmmoItemName="Bile"
	AmmoMesh=StaticMesh'KillingFloorStatics.FT_AmmoMesh'
	InventoryType=Class'KFMod.BlowerThrower'
	PickupMessage="You got the BlowerThrower"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_IJC_Halloween_Weps2.BlowerThrower_pickup'
	DrawScale=0.900000
	CollisionRadius=30.000000
	CollisionHeight=5.000000
	EquipmentCategoryID=3
	PickupSound=Sound'KF_FY_BlowerThrowerSND.WEP_Bile_Foley_Pickup'
	CorrespondingPerkIndex=0
}
