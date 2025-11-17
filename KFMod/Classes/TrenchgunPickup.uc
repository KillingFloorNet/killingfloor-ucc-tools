//=============================================================================
// Trenchgun Pickup.
//=============================================================================
class TrenchgunPickup extends KFWeaponPickup;

defaultproperties
{
	Weight=8.000000
	cost=1250
	BuyClipSize=6
	PowerValue=75
	SpeedValue=40
	RangeValue=15
	Description="A WWII era trench shotgun. Oh, this one has been filled with dragon's breath flame rounds."
	ItemName="Trenchgun"
	ItemShortName="Trenchgun"
	AmmoItemName="Dragon's breath shells"
	AmmoMesh=none
	InventoryType=Class'KFMod.Trenchgun'
	PickupMessage="You got the Trenchgun."
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups5_Trip.Rifles.TrenchGun_Pickup'
	DrawType=DT_StaticMesh
	//Mesh=Mesh'KFWeaponModels.Shotgun_new3p'
	CollisionRadius=35.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_ShotgunDragonsBreathSnd.TrenchGun_Pump_Back'
	EquipmentCategoryID=2
	CorrespondingPerkIndex=5
}
