//=============================================================================
// Shotgun Pickup.
//=============================================================================
class ShotgunPickup extends KFWeaponPickup;

/*
function ShowShotgunInfo(Canvas C)
{
  C.SetPos((C.SizeX - C.SizeY) / 2,0);
  C.DrawTile( Texture'KillingfloorHUD.ClassMenu.Shotgun', C.SizeY, C.SizeY, 0.0, 0.0, 256, 256);
}
*/

defaultproperties
{
	Weight=8.000000
	cost=500
	BuyClipSize=8
	PowerValue=70
	SpeedValue=40
	RangeValue=15
	Description="A rugged 12-gauge pump action shotgun. "
	ItemName="Shotgun"
	ItemShortName="Shotgun"
	AmmoItemName="12-gauge shells"
	AmmoMesh=none
	InventoryType=Class'KFMod.Shotgun'
	PickupMessage="You got the Shotgun."
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'KF_pickups_Trip.shotgun_pickup'
	DrawType=DT_StaticMesh
	//Mesh=Mesh'KFWeaponModels.Shotgun_new3p'
	CollisionRadius=35.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_PumpSGSnd.SG_Pickup'
	EquipmentCategoryID=2
	CorrespondingPerkIndex=1

	VariantClasses[0]=class'KFMod.CamoShotgunPickup'
}
