//=============================================================================
// MAC-10 Pickup.
//=============================================================================
class MAC10Pickup extends KFWeaponPickup;

defaultproperties
{
	Weight=4.000000
	cost=500
	AmmoCost=10
	BuyClipSize=30
	PowerValue=30
	SpeedValue=98
	RangeValue=40
	Description="A highly compact machine pistol. Can be fired in semi or full auto."
	ItemName="MAC-10"
	ItemShortName="MAC-10"
	AmmoItemName=".45 Cal"
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.MAC10MP'
	PickupMessage="You got the MAC-10"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups2_Trip.Supers.MAC10_Pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_MAC10MPSnd.MAC10_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=5
}
