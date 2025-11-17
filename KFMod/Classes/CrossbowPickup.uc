class CrossbowPickup extends KFWeaponPickup;

#exec OBJ LOAD FILE=KillingFloorWeapons.utx
#exec OBJ LOAD FILE=WeaponStaticMesh.usx

defaultproperties
{
	cost=800
	AmmoCost=20 // Increased in Balance Round 1
	BuyClipSize=6 // Increased in Balance Round 1(but has no real effect)
	Weight=9.000000 // Decreased in Balance Round 7/8
	PowerValue=64
	SpeedValue=50
	RangeValue=100
	Description="Recreational hunting weapon, equipped with powerful scope and firing trigger. Exceptional headshot damage."
	ItemName="Crossbow"
	ItemShortName="Crossbow"
	AmmoItemName="Crossbow Bolts"
	AmmoMesh=StaticMesh'KillingFloorStatics.XbowAmmo'
	MaxDesireability=0.790000
	InventoryType=Class'KFMod.Crossbow'
	PickupMessage="You got the Xbow."
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups_Trip.crossbow_pickup'
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_XbowSnd.Xbow_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=2
}
