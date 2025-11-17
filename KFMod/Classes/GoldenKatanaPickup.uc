//=============================================================================
// GoldenM79Pickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================
class GoldenKatanaPickup extends KatanaPickup;

DefaultProperties
{
    Skins(0)=Texture'KF_Weapons3rd_Gold_T.Gold_Katana_3rd'
    ItemName="Golden Katana"
    Description="Stunning craftsmanship, taking decades to perfect. And then someone just has to go and gold plate it... Pretty, ain't it?"
	ItemShortName="Golden Katana"
    InventoryType=Class'KFMod.GoldenKatana'
    PickupMessage="You got the Golden Katana."
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'KF_pickups_Trip.Katana_Pickup'
    PickupSound=Sound'KF_AxeSnd.Axe_Pickup'
}
