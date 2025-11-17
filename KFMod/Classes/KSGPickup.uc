//=============================================================================
// KSGPickup
//=============================================================================
// KSG shotgun pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and IJC
//=============================================================================
class KSGPickup extends KFWeaponPickup;

defaultproperties
{
	Weight=6.000000
	cost=1250
	AmmoCost=30
	BuyClipSize=12
	PowerValue=70
	SpeedValue=50
	RangeValue=30
	Description="An advanced Horzine prototype tactical shotgun. Features a large capacity ammo magazine and selectable tight/wide spread fire modes."
	ItemName="HSG-1 Shotgun"
	ItemShortName="HSG-1 Shotgun"
	AmmoItemName="12-gauge mag"
	AmmoMesh=none
	InventoryType=Class'KFMod.KSGShotgun'
	PickupMessage="You got the Horzine HSG-1 shotgun."
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups4_Trip.KSG_Pickup'
	DrawType=DT_StaticMesh
	//Mesh=Mesh'KFWeaponModels.Shotgun_new3p'
	CollisionRadius=35.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_KSGSnd.KSG_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=1
	DrawScale=1.0

	VariantClasses[0]=class'KFMod.NeonKSGPickup'
}
