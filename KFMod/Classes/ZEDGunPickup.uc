//=============================================================================
// ZEDGunPickup
//=============================================================================
// ZEDGun pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ZEDGunPickup extends KFWeaponPickup;

defaultproperties
{
    Weight=8.000000
    cost=2000
    AmmoCost=100
    BuyClipSize=100
    PowerValue=30
    SpeedValue=25
    RangeValue=25
    Description="Zed Eradication Device. A highly advanced Horzine device useful for 'crowd control' - secondary fire stuns groups of zeds momentarily."
    ItemName="Zed Eradication Device"
	ItemShortName="ZED Gun"
    AmmoItemName="ZED Gun Power Cells"
    AmmoMesh=StaticMesh'KillingFloorStatics.FT_AmmoMesh'
    MaxDesireability=0.790000
    InventoryType=Class'KFMod.ZEDGun'
    PickupMessage="You got the Zed Eradication Device."
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'KF_pickups6_Trip.Rifles.ZED_Pickup'
    CollisionRadius=25.000000
    CollisionHeight=10.000000
    PickupSound=Sound'KF_ZEDGunSnd.KF_WEP_ZED_Handling_Pickup'
    EquipmentCategoryID=4
    CorrespondingPerkIndex=7
}
