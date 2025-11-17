//=============================================================================
// Welder Pickup.
//=============================================================================
class WelderPickup extends KFWeaponPickup;

#exec obj load file="..\StaticMeshes\NewPatchSM.usx"

defaultproperties
{
     Weight=0.000000
     InventoryType=Class'KFMod.Welder'
     PickupMessage="You got the Welder."
     PickupSound=Sound'Inf_Weapons_Foley.AmmoPickup'
     PickupForce="AssaultRiflePickup"
     StaticMesh=StaticMesh'KF_pickups_Trip.welder_pickup'
     CollisionHeight=5.000000
     EquipmentCategoryID=0
     ItemName="Welder"
}
