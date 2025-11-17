//=============================================================================
// KrissMAmmo
//=============================================================================
// Ammo for the Kriss Medic Gun primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class KrissMAmmo extends KFAmmunition;

defaultproperties
{
     MaxAmmo=350
     InitialAmount=175
     AmmoPickupAmount=25
     PickupClass=Class'KFMod.KrissMAmmoPickup'
     IconMaterial=Texture'KillingFloorHUD.Generic.HUD'
     IconCoords=(X1=336,Y1=82,X2=382,Y2=125)
     ItemName="45. ACP bullets"
}
