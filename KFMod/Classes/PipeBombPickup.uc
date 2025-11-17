//=============================================================================
// PipeBombPickup Pickup.
//=============================================================================
class PipeBombPickup extends KFWeaponPickup;

defaultproperties
{
	Weight=1.000000
	cost=1500 // Increased in Balance Round 1
	AmmoCost=750 // Was left at 400 in Balance Round 1(fixed in Round 2)
	BuyClipSize=1
	PowerValue=100
	SpeedValue=5
	RangeValue=15
	Description="An improvised proximity explosive. Blows up when enemies get close."
	ItemName="Pipe Bomb"
	ItemShortName="Pipe Bomb"
	AmmoItemName="Pipe Bomb"
	AmmoMesh=none
	InventoryType=Class'KFMod.PipeBombExplosive'
	PickupMessage="You got the PipeBomb proximity explosive."
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups2_Trip.Pipebomb_Pickup'
	DrawType=DT_StaticMesh
	CollisionRadius=35.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_AA12Snd.AA12_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=6
}
