//=============================================================================
// GoldenFTPickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class GoldenFTPickup extends FlamethrowerPickup;

defaultproperties
{
    Skins(0)=Texture'KF_Weapons3rd_Gold_T.Weapons.Gold_Flamethrower_3rd'
    ItemName="Golden Flamethrower"
    Description="A deadly experimental weapon designed by Horzine industries. It can fire streams of burning liquid which ignite on contact."
	ItemShortName="Golden Flamethrower"
	AmmoItemName="Napalm"
	InventoryType=Class'KFMod.GoldenFlamethrower'
	PickupMessage="You got the Golden Flamethrower."
	StaticMesh=StaticMesh'KF_pickupsGold_Trip.FlamethrowerGold_Pickup'
	PickupSound=Sound'KF_FlamethrowerSnd.FT_Pickup'
}
