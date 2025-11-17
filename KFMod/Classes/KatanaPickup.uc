//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KatanaPickup extends KFWeaponPickup;

DefaultProperties
{
    Weight=3.000000
    cost=2000
    PowerValue=60
    SpeedValue=60
    RangeValue=-21
    Description="An incredibly sharp katana sword."
    ItemName="Katana"
	ItemShortName="Katana"
    InventoryType=Class'KFMod.Katana'
    PickupMessage="You got the Katana."
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'KF_pickups_Trip.Katana_Pickup'
    CollisionRadius=27.000000
    CollisionHeight=5.000000
    PickupSound=Sound'KF_AxeSnd.Axe_Pickup'
    EquipmentCategoryID=0
    CorrespondingPerkIndex=4

    VariantClasses[0]=class'KFMod.GoldenKatanaPickup'
}
