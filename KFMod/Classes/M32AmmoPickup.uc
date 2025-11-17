class M32AmmoPickup extends KFAmmoPickup;

defaultproperties
{
     AmmoAmount=6
     InventoryType=Class'KFMod.M32Ammo'
     PickupMessage="M32 Grenades"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'KillingFloorStatics.FragPickup' // TODO: Put in the real static
     CollisionRadius=25.000000
}
