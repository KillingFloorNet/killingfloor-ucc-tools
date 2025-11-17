//=============================================================================
// M14EBR Pickup.
//=============================================================================
class M14EBRPickup extends KFWeaponPickup;

defaultproperties
{
	Weight=8.000000
	cost=2500
	AmmoCost=15
	BuyClipSize=20
	PowerValue=55
	SpeedValue=20
	RangeValue=95
	Description="Updated M14 Enhanced Battle Rifle - Semi Auto variant. Equipped with a laser sight."
	ItemName="M14EBR"
	ItemShortName="M14EBR"
	AmmoItemName="7.62x51mm Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.M14EBRBattleRifle'
	PickupMessage="You got the M14 EBR"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups2_Trip.M14_EBR_Pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_M14EBRSnd.M14EBR_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=2
}
