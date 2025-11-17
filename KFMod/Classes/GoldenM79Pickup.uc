//=============================================================================
// GoldenM79Pickup
//=============================================================================
//
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================

class GoldenM79Pickup extends M79Pickup;

defaultproperties
{
    Skins(0)=Texture'KF_Weapons3rd_Gold_T.Gold_M79_3rd'
    ItemName="Golden M79 Grenade Launcher"
    Description="Gold plating. Gold filigree inlay on the woodwork. You probably want the rounds gold as well. Bosh! "
	ItemShortName="Golden M79"
    AmmoItemName="M79 Grenades"
    InventoryType=Class'KFMod.GoldenM79GrenadeLauncher'
    PickupMessage="You got the M79 Grenade Launcher."
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'KF_pickups2_Trip.M79_Pickup'
    PickupSound=Sound'KF_M79Snd.M79_Pickup'
    EquipmentCategoryID=2
    CorrespondingPerkIndex=6
}
