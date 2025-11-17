//=============================================================================
// Dual44MagnumPickup
//=============================================================================
// Dual 44 Magnum pistol pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class Dual44MagnumPickup extends KFWeaponPickup;

defaultproperties
{
	Weight=4.000000
	cost=900
	AmmoCost=26 // Increased in Balance Round 2
	BuyClipSize=6
	PowerValue=80
	SpeedValue=50
	RangeValue=65
	Description="A pair of 44 Magnum Pistols. Make my day!"
	ItemName="Dual 44 Magnums"
	ItemShortName="Dual 44s"
	AmmoItemName="44 Magnum Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.DeagleAmmo'
	InventoryType=Class'KFMod.Dual44Magnum'
	PickupMessage="You found another 44 Magnum"
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups3_Trip.revolver_Pickup'
	DrawScale=1.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_RevolverSnd.WEP_Revolver_Foley_Pickup'
	EquipmentCategoryID=1
	CorrespondingPerkIndex=2
}
