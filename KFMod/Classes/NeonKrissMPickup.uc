//=============================================================================
// NeonKrissMPickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class NeonKrissMPickup extends KrissMPickup;

//#exec OBJ LOAD FILE=KF_Weapons3rd_Gold_T.utx

defaultproperties
{
    Skins(0)=Shader'KF_Weapons_Neon_Trip_T.3rdPerson.Kriss_Neon_SHDR_3P'
    ItemName="Neon Schneidzekk Medic Gun"
	Description="Neon Schneidzekk Medic Gun"
	ItemShortName="Neon Schneidzekk"

	InventoryType=Class'KFMod.NeonKrissMMedicGun'
	PickupMessage="You got the Neon Schneidzekk Medic Gun"
	PickupForce="AssaultRiflePickup"
	PickupSound=Sound'KF_KrissSND.KF_WEP_KRISS_Handling_Pickup'
}
