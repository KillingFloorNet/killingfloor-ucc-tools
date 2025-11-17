//=============================================================================
// Dualies Pickup.
//=============================================================================
class DualiesPickup extends KFWeaponPickup;

function ShowDualiesInfo(Canvas C)
{
	C.SetPos((C.SizeX - C.SizeY) / 2,0);
	C.DrawTile( Texture'KillingfloorHUD.ClassMenu.Dualies', C.SizeY, C.SizeY, 0.0, 0.0, 256, 256);
}

defaultproperties
{
	Weight=4.000000
	cost=150
	AmmoCost=20 // Increased in Balance Round 2
	BuyClipSize=30
	PowerValue=35
	SpeedValue=85
	RangeValue=35
	Description="A pair of custom 9mm handguns."
	ItemName="Dual 9mms"
	ItemShortName="Dual 9mms"
	AmmoItemName="9mm Rounds"
	AmmoMesh=StaticMesh'KillingFloorStatics.DualiesAmmo'
	InventoryType=Class'KFMod.Dualies'
	PickupMessage="You found another 9mm handgun"
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups_Trip.double9mm_pickup'
	CollisionHeight=5.000000
	EquipmentCategoryID=1
	CorrespondingPerkIndex=2
}
