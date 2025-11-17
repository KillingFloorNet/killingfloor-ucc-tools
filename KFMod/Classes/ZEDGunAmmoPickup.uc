//=============================================================================
// ZEDGunAmmoPickup
//=============================================================================
// Ammo pickup class for the ZEDGun primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ZEDGunAmmoPickup extends KFAmmoPickup;

defaultproperties
{
     AmmoAmount=100
     InventoryType=Class'KFMod.ZEDGunAmmo'
     PickupMessage="ZED Gun Power Cells"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'KillingFloorStatics.FT_AmmoMesh' // TODO: Put in the real static
     CollisionRadius=25.000000
}
