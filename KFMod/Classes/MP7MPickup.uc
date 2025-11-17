//=============================================================================
// MP7M Pickup.
//=============================================================================
class MP7MPickup extends MedicGunPickup;

defaultproperties
{
	Weight=3.000000
	cost=825
	AmmoCost=10
	BuyClipSize=20
	PowerValue=22
	SpeedValue=95
	RangeValue=45
	Description="Prototype sub machine gun. Modified to fire healing darts."
	ItemName="MP7M Medic Gun"
	ItemShortName="MP7M"
	AmmoItemName="4.6x30mm Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.MP7MMedicGun'
	PickupMessage="You got the MP7M Medic Gun"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups2_Trip.MP7_Pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_MP7Snd.MP7_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=0
}
