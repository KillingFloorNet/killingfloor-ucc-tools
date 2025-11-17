//=============================================================================
// MP5MPickup
//=============================================================================
// Ammo pickup class for the MP5 Medic Gun primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class MP5MAmmoPickup extends KFAmmoPickup;

defaultproperties
{
     AmmoAmount=20
     InventoryType=Class'KFMod.MP5MAmmo'
     PickupMessage="Rounds 9x19mm"
     PickupForce="AssaultAmmoPickup"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'KillingFloorStatics.L85Ammo'
}
