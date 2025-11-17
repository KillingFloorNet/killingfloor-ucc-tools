//=============================================================================
// GoldenChainsawPickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class GoldenChainsawPickup extends ChainsawPickup;

defaultproperties
{
    Skins(0)=Texture'KF_Weapons3rd_Gold_T.Weapons.Gold_Chainsaw_3rd'
    ItemName="Golden Chainsaw"
    Description="A gas powered industrial strength chainsaw. This tool may rely on a steady supply of gasoline, but it can cut through a variety of surfaces with ease."
	ItemShortName="Golden Chainsaw"
	InventoryType=Class'KFMod.GoldenChainsaw'
	PickupMessage="You got the Golden Chainsaw."
	StaticMesh=StaticMesh'KF_pickupsGold_Trip.ChainsawGold_Pickup'
	PickupSound=Sound'KF_ChainsawSnd.Chainsaw_Pickup'
}
