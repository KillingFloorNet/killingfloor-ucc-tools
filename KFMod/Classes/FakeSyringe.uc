//=============================================================================
// Fake Syringe Inventory class. This is a hack for taking vids, because the
// color correction borks up if you aren't rendering a first person weapon.
//=============================================================================
class FakeSyringe extends Syringe;

defaultproperties
{
	AmmoRegenRate=0.300000
	HealBoostAmount=20
	weaponRange=90.000000
	//WeaponIdleMovementAnim="IdleMoveSyringe"
	Weight=0.000000
	bKFNeverThrow=False//True
	bAmmoHUDAsBar=True
	FireModeClass(0)=Class'KFMod.SyringeFire'
	FireModeClass(1)=Class'KFMod.SyringeAltFire'
	AIRating=-2.000000
	bMeleeWeapon=False
	bShowChargingBar=True
	Priority=6
	InventoryGroup=5
	GroupOffset=3
	PickupClass=Class'KFMod.SyringePickup'
	BobDamping=8.000000
	AttachmentClass=Class'KFMod.SyringeAttachment'
	IconCoords=(X1=169,Y1=39,X2=241,Y2=77)
	ItemName="Med-Syringe"
	Mesh=SkeletalMesh'KF_Weapons_Trip.Syringe_Trip'
	AmbientGlow=2
	AmmoCharge(0)=500
	PlayerViewOffset=(X=-500.000000,Y=0.000000,Z=0.000000)

	DisplayFOV=85.000000
    StandardDisplayFOV=85.0

	HudImage=Texture'KillingFloorHUD.HUD.Hud_Shield'
	SelectedHudImage=Texture'KillingFloorHUD.HUD.Hud_Weight'

	bConsumesPhysicalAmmo=false
}
