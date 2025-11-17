//=============================================================================
// ClaymoreSwordPickup
//=============================================================================
// Claymore sword pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ClaymoreSwordPickup extends KFWeaponPickup;

DefaultProperties
{
    Weight=6.000000
    cost=3000
    PowerValue=75
    SpeedValue=40
    RangeValue=-23
    Description="A medieval claymore sword."
    ItemName="Claymore Sword"
	ItemShortName="Claymore"
    InventoryType=Class'KFMod.ClaymoreSword'
    PickupMessage="You got the Claymore Sword."
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'KF_pickups3_Trip.Claymore_Pickup'
    CollisionRadius=27.000000
    CollisionHeight=5.000000
    PickupSound=Sound'KF_ClaymoreSnd.WEP_Claymore_Foley_Pickup'
    EquipmentCategoryID=0
    CorrespondingPerkIndex=4
}
