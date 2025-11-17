//=============================================================================
// L85 Pickup.
//=============================================================================
class BullpupPickup extends KFWeaponPickup;

/*
simulated function RenderPickupImage(Canvas C)
{
  C.SetPos((C.SizeX - C.SizeY) / 2,0);
  C.DrawTile( Texture'KillingfloorHUD.ClassMenu.L85', C.SizeY, C.SizeY, 0.0, 0.0, 256, 256);

}
*/

defaultproperties
{
	Weight=6.000000
	cost=400
	AmmoCost=10
	BuyClipSize=40
	PowerValue=24
	SpeedValue=90
	RangeValue=60
	Description="Standard issue military rifle. Equipped with an integrated 2X scope."
	ItemName="Bullpup"
	ItemShortName="Bullpup"
	AmmoItemName="5.56 NATO Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.Bullpup'
	PickupMessage="You got the Bullpup"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups_Trip.Bullpup_Pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_BullpupSnd.Bullpup_Pickup'
	EquipmentCategoryID=2
	CorrespondingPerkIndex=3
}
