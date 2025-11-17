//=============================================================================
// MK23AmmoPickup
//=============================================================================
// Ammo pickup class for the MK23 Pistol
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and IJC Development
//=============================================================================
class MK23AmmoPickup extends KFAmmoPickup;

defaultproperties
{
     AmmoAmount=12
     InventoryType=Class'KFMod.MK23Ammo'
     KFPickupImage=Texture'KillingFloorHUD.ClassMenu.Deagle'
     PickupMessage="Rounds (.45 ACP)"
     PickupForce="AssaultAmmoPickup"
     DrawType=DT_StaticMesh
     StaticMesh=none
}
