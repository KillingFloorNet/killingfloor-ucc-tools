//=============================================================================
// MKb42 Pickup.
//=============================================================================
class MKb42Pickup extends KFWeaponPickup;

defaultproperties
{
	Weight=6.000000
	cost=1100
	AmmoCost=10
	BuyClipSize=30
	PowerValue=40
	SpeedValue=85
	RangeValue=55
	Description="German WWII era prototype assault rifle. Many heroes were known to have used this weapon in Stalingrad."
	ItemName="MKb42"
	ItemShortName="MKb42"
	AmmoItemName="7.92mm Kurz Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.MKb42AssaultRifle'
	PickupMessage="You got the MKb42"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups5_Trip.Rifles.MKB42_Pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_mkb42Snd.mkb42_Handling_Bolt_Back'
	EquipmentCategoryID=2
	CorrespondingPerkIndex=3
}
