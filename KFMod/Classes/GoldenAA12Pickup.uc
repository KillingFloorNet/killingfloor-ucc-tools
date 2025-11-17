//=============================================================================
// GoldenM79Pickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class GoldenAA12Pickup extends AA12Pickup;

defaultproperties
{
    Skins(0)=Texture'KF_Weapons3rd_Gold_T.Weapons.Gold_AA12_3rd'
    ItemName="Golden AA12 Shotgun"
    Description="An advanced fully automatic shotgun."
	ItemShortName="Golden AA12 Shotgun"
	AmmoItemName="12-gauge shells"
	InventoryType=Class'KFMod.GoldenAA12AutoShotgun'
	PickupMessage="You got the Golden AA12 auto shotgun."
	StaticMesh=StaticMesh'KF_pickupsGold_Trip.AA12Gold_Pickup'
	PickupSound=Sound'KF_AA12Snd.AA12_Pickup'
}
