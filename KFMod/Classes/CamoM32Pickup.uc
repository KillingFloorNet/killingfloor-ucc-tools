class CamoM32Pickup extends M32Pickup;

defaultproperties
{
    Description="A camouflaged advanced semi automatic grenade launcher. Launches high explosive grenades."
    ItemName="Camo M32 Grenade Launcher"
	ItemShortName="Camo M32 Launcher"
    AmmoItemName="M32 Grenades"
    AmmoMesh=StaticMesh'KillingFloorStatics.XbowAmmo'
    InventoryType=Class'KFMod.CamoM32GrenadeLauncher'
    PickupMessage="You got the Camo M32 Multiple Grenade Launcher"
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'KF_pickupsCAMO_Trip.M32_MGL_CAMO_Pickup'
    PickupSound=Sound'KF_M79Snd.M79_Pickup'
}
