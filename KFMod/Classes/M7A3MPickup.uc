//=============================================================================
// M7A3MPickup
//=============================================================================
// M7A3M pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and IJC
//=============================================================================
class M7A3MPickup extends MedicGunPickup;

defaultproperties
{
    Weight=6.000000
    cost=2050
    AmmoCost=10
    BuyClipSize=15
    PowerValue=45
    SpeedValue=60
    RangeValue=55
    Description="An advanced Horzine prototype assault rifle. Modified to fire healing darts."
    ItemName="M7A3 Medic Gun"
    ItemShortName="M7A3M"
    AmmoItemName="7.6x40mm Ammo"
    AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
    InventoryType=Class'KFMod.M7A3MMedicGun'
    PickupMessage="You got the M7A3 Medic Gun"
    PickupForce="AssaultRiflePickup"
    DrawType=DT_StaticMesh
    StaticMesh=StaticMesh'KF_pickups4_Trip.M7A3_Pickup'
    DrawScale=1.000000
    CollisionRadius=25.000000
    CollisionHeight=5.000000
    PickupSound=Sound'KF_M7A3Snd.M7A3_Pickup'
    EquipmentCategoryID=3
    CorrespondingPerkIndex=0
}
