//=============================================================================
// Knife Pickup.
//=============================================================================
class KnifePickup extends KFWeaponPickup;

/*
function ShowKnifeInfo(Canvas C)
{
    C.SetPos((C.SizeX - C.SizeY) / 2,0);
  C.DrawTile( Texture'KillingfloorHUD.ClassMenu.Knife', C.SizeY, C.SizeY, 0.0, 0.0, 256, 256);
}
*/

defaultproperties
{
	Weight=0.000000
	cost=50
	PowerValue=5
	SpeedValue=60
	RangeValue=-20
	Description="Basic kitchen utensil. Sharp."
	ItemName="Knife"
	ItemShortName="Knife"
	InventoryType=Class'KFMod.Knife'
	PickupMessage="You got the Kitchen Knife."
	PickupSound=none // can't ever drop this weapon
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups_Trip.Knife_pickup'
	CollisionHeight=5.000000
	CorrespondingPerkIndex=4
}
