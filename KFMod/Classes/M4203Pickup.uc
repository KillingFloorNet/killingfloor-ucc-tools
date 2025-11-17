//=============================================================================
// M4203Pickup
//=============================================================================
// M4 203 Assault Rifle pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class M4203Pickup extends M4Pickup;

defaultproperties
{
	Weight=6.000000
	cost=2750
	AmmoCost=10
	BuyClipSize=1
	PowerValue=90
	SpeedValue=90
	RangeValue=75
	Description="An assault rifle with an attached grenade launcher."
	ItemName="M4 203"
	ItemShortName="M4 203"
	SecondaryAmmoShortName="M4 203 Grenades"
	AmmoItemName="5.56mm Ammo"
	PrimaryWeaponPickup=class'KFMod.M4Pickup'
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.M4203AssaultRifle'
	PickupMessage="You got the M4 203"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups3_Trip.M4M203_Pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_M4RifleSnd.WEP_M4_Foley_Pickup'
	EquipmentCategoryID=2
	CorrespondingPerkIndex=6
}
