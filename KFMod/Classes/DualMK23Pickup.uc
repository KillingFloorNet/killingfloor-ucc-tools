//=============================================================================
// MK23Pickup
//=============================================================================
// Dual MK23 pistol pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and IJC
//=============================================================================
class DualMK23Pickup extends KFWeaponPickup;

defaultproperties
{
    Weight=4.000000
    cost=1000
    BuyClipSize=12
    PowerValue=70
    SpeedValue=45
    RangeValue=60
    AmmoCost=16
    Description="Dual MK23 match grade pistols. Dual 45's is double the fun."
    ItemName="DualMK23"
    ItemShortName="DualMK23"
    AmmoItemName=".45 ACP Ammo"
    AmmoMesh=none
    InventoryType=Class'KFMod.DualMK23Pistol'
    PickupMessage="You found another - MK23"
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'KF_pickups4_Trip.MK23_Pickup'
    DrawScale=1.000000
    CollisionHeight=5.000000
    PickupSound=Sound'KF_MK23Snd.MK23_Pickup'
    EquipmentCategoryID=1
    CorrespondingPerkIndex=2
}
