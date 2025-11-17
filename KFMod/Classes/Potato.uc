//=============================================================================
// My Potato
//=============================================================================
class Potato extends KFWeaponPickup
	notplaceable;

defaultproperties
{
    Weight=0.000000
    cost=70000
    PowerValue=100
    SpeedValue=100
    RangeValue=100
    Description="Potato"
    ItemName="Potato"
	ItemShortName="Potato"
    InventoryType=none
    PickupMessage="You gots a Potato"
    PickupForce="AssaultRiflePickup"
    StaticMesh=StaticMesh'Potato_S.potato'
    CollisionRadius=27.000000
    CollisionHeight=5.000000
    PickupSound=Sound'KF_InventorySnd.Cash_Pickup'
    EquipmentCategoryID=10
    CorrespondingPerkIndex=7
}
