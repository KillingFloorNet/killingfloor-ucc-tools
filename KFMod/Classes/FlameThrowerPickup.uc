//=============================================================================
// L85 Pickup.
//=============================================================================
class FlameThrowerPickup extends KFWeaponPickup;


defaultproperties
{
	Weight=10.000000
	cost=750//400
	AmmoCost=30
	BuyClipSize=50
	PowerValue=30
	SpeedValue=100
	RangeValue=40
	Description="A deadly experimental weapon designed by Horzine industries. It can fire streams of burning liquid which ignite on contact."
	ItemName="FlameThrower"
	ItemShortName="FlameThrower"
	AmmoItemName="Napalm"
	AmmoMesh=StaticMesh'KillingFloorStatics.FT_AmmoMesh'
	InventoryType=Class'KFMod.FlameThrower'
	PickupMessage="You got the FlameThrower"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups_Trip.Flamethrower_pickup'
	DrawScale=1.000000
	CollisionRadius=30.000000
	CollisionHeight=5.000000
	EquipmentCategoryID=3
	PickupSound=Sound'KF_FlamethrowerSnd.FT_Pickup'
	CorrespondingPerkIndex=5

	VariantClasses[0]=class'KFMod.GoldenFTPickup'
}
