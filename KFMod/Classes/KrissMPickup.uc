//=============================================================================
// KrissMPickup
//=============================================================================
// Pickup class for the Kriss Medic Gun
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class KrissMPickup extends MedicGunPickup;

defaultproperties
{
	Weight=3.000000
	cost=2750
	AmmoCost=10
	BuyClipSize=40
	PowerValue=50
	SpeedValue=90
	RangeValue=40
	Description="The 'Zekk has a very high rate of fire and is equipped with the attachment for the Horzine medical darts."
	ItemName="Schneidzekk Medic Gun"
	ItemShortName="Schneidzekk"
	AmmoItemName="45. ACP Ammo"
	AmmoMesh=StaticMesh'KillingFloorStatics.L85Ammo'
	InventoryType=Class'KFMod.KrissMMedicGun'
	PickupMessage="You got the Schneidzekk Medic Gun"
	PickupForce="AssaultRiflePickup"
	DrawType=DT_StaticMesh
	StaticMesh=StaticMesh'KF_pickups6_Trip.Kriss_Pickup'
	DrawScale=1.000000
	CollisionRadius=25.000000
	CollisionHeight=5.000000
	PickupSound=Sound'KF_KrissSND.KF_WEP_KRISS_Handling_Pickup'
	EquipmentCategoryID=3
	CorrespondingPerkIndex=0

	VariantClasses[0]=class'KFMod.NeonKrissMPickup'
}
