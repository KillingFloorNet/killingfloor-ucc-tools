//=============================================================================
// SealSquealAmmo
//=============================================================================
// Ammo class for the seal squeal harpoon bomb launcher
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SealSquealAmmo extends KFAmmunition;

defaultproperties
{
     MaxAmmo=30
     InitialAmount=15
     AmmoPickupAmount=3
     PickupClass=Class'KFMod.SealSquealAmmoPickup'
     IconMaterial=Texture'KillingFloorHUD.Generic.HUD'
     IconCoords=(X1=4,Y1=350,X2=110,Y2=395)
     ItemName="SealSqueal Harpoon Bombs"
}
