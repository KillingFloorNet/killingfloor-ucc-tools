//=============================================================================
// GoldenM79Pickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================
class GoldenAK47Pickup extends AK47Pickup;

#exec OBJ LOAD FILE=KF_Weapons3rd_Gold_T.utx

defaultproperties
{
    Skins(0)=Texture'KF_Weapons3rd_Gold_T.Gold_AK47_3rd'
    ItemName="Golden AK47"
    Description="Take a classic AK. Gold plate every visible piece of metal. Engrave the wood for good measure. Serious blingski."
	ItemShortName="Golden AK47"

	InventoryType=Class'KFMod.GoldenAK47AssaultRifle'
	PickupMessage="You got the Golden AK47"
	PickupForce="AssaultRiflePickup"
	PickupSound=Sound'KF_AK47Snd.AK47_Pickup'
}
