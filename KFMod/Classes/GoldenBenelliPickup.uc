//=============================================================================
// GoldenM79Pickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================
class GoldenBenelliPickup extends BenelliPickup;

defaultproperties
{
    Skins(0)=Texture'KF_Weapons3rd_Gold_T.Gold_Benelli_3rd'
    ItemName="Golden Combat Shotgun"
    Description="Gold plating, polished until it shines and twinkles. Just the thing for the serious Zed-slayer."
	ItemShortName="Golden Combat Shotgun"
	AmmoItemName="12-gauge shells"
	InventoryType=Class'KFMod.GoldenBenelliShotgun'
	PickupMessage="You got the golden combat shotgun."
	StaticMesh=StaticMesh'KF_pickups3_Trip.Benelli_Pickup'
	PickupSound=Sound'KF_M4ShotgunSnd.WEP_Benelli_Foley_Pickup'
}
