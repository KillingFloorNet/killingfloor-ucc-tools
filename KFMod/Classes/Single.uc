//=============================================================================
// Tac 9mm SP only  (Dual Possible)
//=============================================================================
class Single extends KFWeapon;

var bool bDualMode;
var bool bWasDualMode;
var bool bFireLeft;
var float DualPickupTime;

function bool HandlePickupQuery( pickup Item )
{
	if ( Item.InventoryType == Class )
	{
		if ( KFHumanPawn(Owner) != none && !KFHumanPawn(Owner).CanCarry(Class'Dualies'.Default.Weight) )
		{
			PlayerController(Instigator.Controller).ReceiveLocalizedMessage(Class'KFMainMessages', 2);
			return true;
		}

		return false; // Allow to "pickup" so this weapon can be replaced with dualies.
	}
	Return Super.HandlePickupQuery(Item);
}

function byte BestMode()
{
	return 0;
}

simulated function bool PutDown()
{
	if (  Instigator.PendingWeapon != none && Instigator.PendingWeapon.class == class'Dualies' )
	{
		bIsReloading = false;
	}

	return super.PutDown();
}

defaultproperties
{
	Skins(0)=Combiner'KF_Weapons_Trip_T.Pistols.Ninemm_cmb''

	WeaponReloadAnim=Reload_Single9mm

	ModeSwitchAnim="LightOn"
	IdleAimAnim=Idle_Iron
	MagCapacity=15
	ReloadRate=2.0
	ReloadAnim="Reload"
	ReloadAnimRate=1.000000
	Weight=0.000000
	bKFNeverThrow=True
	bModeZeroCanDryFire=True
	FireModeClass(0)=Class'KFMod.SingleFire'
	FireModeClass(1)=Class'KFMod.SingleALTFire'
	PutDownAnim="PutDown"
	SelectSound=Sound'KF_9MMSnd.9mm_Select'
	bShowChargingBar=True
	Description="A 9mm Pistol"
	Priority=60
	InventoryGroup=2
	GroupOffset=1
	PickupClass=Class'KFMod.SinglePickup'
	PlayerViewOffset=(X=20.000000,Y=25.000000,Z=-10.000000)//(X=4.000000,Y=5.000000,Z=-2.000000)
	BobDamping=6.000000
	AttachmentClass=Class'KFMod.SingleAttachment'
	IconCoords=(X1=434,Y1=253,X2=506,Y2=292)
	ItemName="9mm Tactical"
	Mesh=SkeletalMesh'KF_Weapons_Trip.9mm_Trip'

	AIRating=0.25
	CurrentRating=0.25

	bTorchEnabled = true
	bHasAimingMode=true

	DisplayFOV=70.000000
	StandardDisplayFOV=70.0
	PlayerIronSightFOV=75
	ZoomedDisplayFOV=65

	HudImage=texture'KillingFloorHUD.WeaponSelect.single_9mm_unselected'
	SelectedHudImage=texture'KillingFloorHUD.WeaponSelect.single_9mm'
	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_9mm'
	FirstPersonFlashlightOffset=(X=-20.000000,Y=-22.000000,Z=8.000000)//(X=0.000000,Y=-16.000000,Z=4.000000)
}
