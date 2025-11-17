class SeekerSixAmmoPickup extends KFAmmoPickup;

defaultproperties
{
     AmmoAmount=6
     InventoryType=Class'KFMod.SeekerSixAmmo'
     PickupMessage="SeekerSix Rockets"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'KillingFloorStatics.FragPickup' // TODO: Put in the real static
     CollisionRadius=25.000000
}
