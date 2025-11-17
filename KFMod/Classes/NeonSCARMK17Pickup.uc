//=============================================================================
// NeonSCARMK17Pickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class NeonSCARMK17Pickup extends SCARMK17Pickup;

//#exec OBJ LOAD FILE=KF_Weapons3rd_Gold_T.utx

defaultproperties
{
    Skins(0)=Shader'KF_Weapons_Neon_Trip_T.3rdPerson.Scar_Neon_SHDR_3P'
    ItemName="Neon SCAR"
	Description="Neon SCAR"
	ItemShortName="Neon SCAR"

	InventoryType=Class'KFMod.NeonSCARMK17AssaultRifle'
	PickupMessage="You got the Neon SCAR"
	PickupForce="AssaultRiflePickup"
	PickupSound=Sound'KF_SCARSnd.SCAR_Pickup'
}
