//=============================================================================
// AA12 Shotgun Pickup.
//=============================================================================
class AA12Pickup extends KFWeaponPickup;

defaultproperties
{
	Weight=10.000000
	cost=4000
	AmmoCost=40
	BuyClipSize=20
	PowerValue=85
	SpeedValue=65
	RangeValue=20
	Description="An advanced fully automatic shotgun."
	ItemName="AA12 Shotgun"
	ItemShortName="AA12 Shotgun"
	AmmoItemName="12-gauge drum"
	AmmoMesh=none
	InventoryType=Class'KFMod.AA12AutoShotgun'
	PickupMessage="You got the AA12 auto shotgun."
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups2_Trip.AA12_Pickup'
	DrawType=DT_StaticMesh
	CollisionRadius=35.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_AA12Snd.AA12_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=1

	VariantClasses[0]=class'KFMod.GoldenAA12Pickup'
}
