//=============================================================================
// Single Pickup.
//=============================================================================
class SinglePickup extends KFWeaponPickup;

function inventory SpawnCopy( pawn Other )
{
	local Inventory I;

	For( I=Other.Inventory; I!=None; I=I.Inventory )
	{
		if( Single(I)!=None )
		{
			if( Inventory!=None )
				Inventory.Destroy();
			InventoryType = Class'Dualies';
			I.Destroyed();
			I.Destroy();
			return Super.SpawnCopy(Other);
		}
	}
	InventoryType = Default.InventoryType;
	Return Super.SpawnCopy(Other);
}

defaultproperties
{
	Weight=0.000000
	cost=0
	AmmoCost=10
	BuyClipSize=30
	PowerValue=20
	SpeedValue=50
	RangeValue=35
	Description="A 9mm handgun."
	ItemName="9mm Pistol"
	ItemShortName="9mm Pistol"
	AmmoItemName="9mm Rounds"
	AmmoMesh=StaticMesh'KillingFloorStatics.DualiesAmmo'
	InventoryType=Class'KFMod.Single'
	PickupMessage="You got the 9mm handgun"
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups_Trip.9mm_Pickup'
	CollisionHeight=5.000000
	PickupSound=Sound'KF_9MMSnd.9mm_Pickup'
	EquipmentCategoryID=1
	CorrespondingPerkIndex=2
}
