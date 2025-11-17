class GoldenM79AmmoPickup extends KFAmmoPickup;

//duplicates by m79ammopickup
defaultproperties
{
     AmmoAmount=3
     InventoryType=Class'KFMod.GoldenM79Ammo'
     PickupMessage="M79 Grenades"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'KillingFloorStatics.FragPickup' // TODO: Put in the real static
     CollisionRadius=25.000000
}
