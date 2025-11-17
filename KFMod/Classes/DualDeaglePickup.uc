//=============================================================================
// Dual 50 Cal Pickup.
//=============================================================================
class DualDeaglePickup extends KFWeaponPickup;

defaultproperties
{
	Weight=4.000000
	cost=1000
	AmmoCost=30 // Increased in Balance Round 2
	BuyClipSize=7
	PowerValue=85
	SpeedValue=35
	RangeValue=60
	Description="A pair of 50 Cal AE handguns."
	ItemName="Dual Handcannons"
	ItemShortName="Dual HCs"
	AmmoItemName=".300 JHP Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.DeagleAmmo'
	InventoryType=Class'KFMod.DualDeagle'
	PickupMessage="You found another Handcannon"
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups_Trip.deagle_pickup'
	DrawScale=1.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_HandcannonSnd.50AE_Pickup'
	EquipmentCategoryID=1
	CorrespondingPerkIndex=2

	VariantClasses[0]=class'KFMod.GoldenDualDeaglePickup'
}
