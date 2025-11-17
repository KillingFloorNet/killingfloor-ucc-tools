//=============================================================================
// AK47 Pickup.
//=============================================================================
class AK47Pickup extends KFWeaponPickup;

defaultproperties
{
	Weight=6.000000
	cost=1000
	AmmoCost=10
	BuyClipSize=30
	PowerValue=40
	SpeedValue=80
	RangeValue=50
	Description="Standard issue military rifle. Equipped with an integrated 2X scope."
	ItemName="AK47"
	ItemShortName="AK47"
	AmmoItemName="7.62mm Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.AK47AssaultRifle'
	PickupMessage="You got the AK47"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups_Trip.AK47_pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_AK47Snd.AK47_Pickup'
	EquipmentCategoryID=2
	CorrespondingPerkIndex=3

	VariantClasses[0]=class'KFMod.GoldenAK47Pickup'
	VariantClasses[1]=class'KFMod.NeonAK47Pickup'
}
