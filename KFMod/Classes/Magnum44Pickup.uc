//=============================================================================
// Magnum44Pickup
//=============================================================================
// 44 Magnum pistol pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class Magnum44Pickup extends KFWeaponPickup;

function inventory SpawnCopy( pawn Other )
{
	local Inventory I;

	for ( I = Other.Inventory; I != none; I = I.Inventory )
	{
		if ( Magnum44Pistol(I) != none )
		{
			if( Inventory != none )
				Inventory.Destroy();
			InventoryType = Class'Dual44Magnum';
            AmmoAmount[0] += Magnum44Pistol(I).AmmoAmount(0);
            MagAmmoRemaining += Magnum44Pistol(I).MagAmmoRemaining;
			I.Destroyed();
			I.Destroy();
			Return Super.SpawnCopy(Other);
		}
	}
	InventoryType = Default.InventoryType;
	Return Super.SpawnCopy(Other);
}

defaultproperties
{
	Weight=2.000000
	cost=450
	BuyClipSize=6
	PowerValue=60
	SpeedValue=40
	RangeValue=65
	AmmoCost=13
	Description="44 Magnum pistol, the most 'powerful' handgun in the world. Do you feel lucky?"
	ItemName="44 Magnum"
	ItemShortName="44 Magnum"
	AmmoItemName="44 Magnum Ammo"
	AmmoMesh=none
	InventoryType=Class'KFMod.Magnum44Pistol'
	PickupMessage="You got the 44 Magnum"
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups3_Trip.revolver_Pickup'
	DrawScale=1.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_RevolverSnd.WEP_Revolver_Foley_Pickup'
	EquipmentCategoryID=1
	CorrespondingPerkIndex=2
}
