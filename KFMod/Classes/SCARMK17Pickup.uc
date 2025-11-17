//=============================================================================
// AK47 Pickup.
//=============================================================================
class SCARMK17Pickup extends KFWeaponPickup;

defaultproperties
{
	Weight=5.000000
	cost=2500
	AmmoCost=15
	BuyClipSize=20
	PowerValue=45
	SpeedValue=85
	RangeValue=70
	Description="Advanced tactical assault rifle. Equipped with an aimpoint sight."
	ItemName="SCARMK17"
	ItemShortName="SCARMK17"
	AmmoItemName="7.62x51mm Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.SCARMK17AssaultRifle'
	PickupMessage="You got the SCARMK17"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups2_Trip.SCAR_Pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_SCARSnd.SCAR_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=3

	VariantClasses[0]=class'KFMod.NeonSCARMK17Pickup'
}
