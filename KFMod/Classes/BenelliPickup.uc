//=============================================================================
// BenelliPickup
//=============================================================================
// Benellie shotgun pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class BenelliPickup extends KFWeaponPickup;

defaultproperties
{
	Weight=8.000000
	cost=2500
	BuyClipSize=6
	PowerValue=70
	SpeedValue=60
	RangeValue=15
	Description="A military tactical shotgun with semi automatic fire capability. Holds up to 6 shells. "
	ItemName="Combat Shotgun"
	ItemShortName="Combat Shotgun"
	AmmoItemName="12-gauge shells"
	AmmoMesh=none
	InventoryType=Class'KFMod.BenelliShotgun'
	PickupMessage="You got the combat shotgun."
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups3_Trip.Benelli_Pickup'
	DrawType=DT_StaticMesh
	CollisionRadius=35.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_M4ShotgunSnd.WEP_Benelli_Foley_Pickup'
	EquipmentCategoryID=2
	CorrespondingPerkIndex=1

	VariantClasses[0]=class'KFMod.GoldenBenelliPickup'
}
