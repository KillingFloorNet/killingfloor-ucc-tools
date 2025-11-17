//=============================================================================
// BoomStick Pickup.
//=============================================================================
class BoomStickPickup extends KFWeaponPickup;

var int SingleShotCount;

function ShowShotgunInfo(Canvas C)
{
	C.SetPos((C.SizeX - C.SizeY) / 2,0);
	C.DrawTile( Texture'KillingfloorHUD.ClassMenu.Shotgun', C.SizeY, C.SizeY, 0.0, 0.0, 256, 256);
}

function InitDroppedPickupFor(Inventory Inv)
{
    Super.InitDroppedPickupFor(Inv);

	if ( Boomstick(Inv) != none )
	{
        SingleShotCount = BoomStick(Inv).SingleShotCount;
	}
}

defaultproperties
{
	cost=750
	AmmoCost=15 // Adjusted from 25 in Balance Round 2
	BuyClipSize=6
	PowerValue=90
	SpeedValue=30
	RangeValue=12
	Description="A double barreled shotgun used by big game hunters."
	ItemName="Hunting Shotgun"
	ItemShortName="Hunting Shotgun"
	AmmoItemName="12-gauge Hunting shells"
	AmmoMesh=none
	InventoryType=Class'KFMod.BoomStick'
	PickupMessage="You got the Hunting Shotgun"
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups_Trip.boomstick_pickup'
	PickupSound=Sound'KF_DoubleSGSnd.2Barrel_Pickup'
	CollisionRadius=35.000000
	CollisionHeight=5.000000
	EquipmentCategoryID=3
	CorrespondingPerkIndex=1
	SingleShotCount=2
}
