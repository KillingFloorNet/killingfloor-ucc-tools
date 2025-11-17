//=============================================================================
// SealSquealPickup
//=============================================================================
// Pickup class for the seal squeal harpoon bomb launcher
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SealSquealPickup extends KFWeaponPickup;

defaultproperties
{
    Weight=6.000000
    cost=2000
    AmmoCost=30
    BuyClipSize=3
    PowerValue=90
    SpeedValue=35
    RangeValue=85
    Description="Shoot the zeds with this harpoon gun and watch them squeal.. and then explode!"
    ItemName="SealSqueal Harpoon Bomber"
	ItemShortName="SealSqueal"
    AmmoItemName="SealSqueal Harpoon Bombs"
    AmmoMesh=none
    MaxDesireability=0.790000
    InventoryType=Class'KFMod.SealSquealHarpoonBomber'
    PickupMessage="You got the SealSqueal Harpoon Bomb Launcher."
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'KF_IJC_Halloween_Weps2.SealSqueal_Pickup'
    CollisionRadius=25.000000
    CollisionHeight=10.000000
    DrawScale=1.000000
    PickupSound=Sound'KF_FY_SealSquealSND.WEP_Harpoon_Foley_Pickup'
    EquipmentCategoryID=2
    CorrespondingPerkIndex=6
}
