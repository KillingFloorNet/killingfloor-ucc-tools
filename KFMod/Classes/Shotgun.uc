//=============================================================================
// Shotgun Inventory class
//=============================================================================
class Shotgun extends KFWeaponShotgun;


defaultproperties
{
    Skins(0)=Combiner'KF_Weapons_Trip_T.Shotguns.shotgun_cmb'

    WeaponReloadAnim=Reload_Shotgun

    MagCapacity=8
    ReloadRate=0.66666666667//0.900000
    ReloadAnim="Reload"
    ReloadAnimRate=1.0
    IdleAimAnim=Idle_Iron
    Weight=8.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.ShotgunFire'
    FireModeClass(1)=Class'KFMod.ShotGunLightFire'
    PutDownAnim="PutDown"
    SelectSound=Sound'KF_PumpSGSnd.SG_Select'
    bShowChargingBar=True
    Description="A rugged tactical pump action shotgun common to police divisions the world over. It accepts a maximum of 8 shells and can fire in rapid succession. "
    Priority=135
    InventoryGroup=3
    GroupOffset=2
    PickupClass=Class'KFMod.ShotgunPickup'

    BobDamping=7.000000
    AttachmentClass=Class'KFMod.ShotgunAttachment'
    IconCoords=(X1=169,Y1=172,X2=245,Y2=208)
    ItemName="Shotgun"
    Mesh=SkeletalMesh'KF_Weapons_Trip.Shotgun_Trip'
    TransientSoundVolume=1.000000
    PlayerViewOffset=(X=20.000000,Y=18.750000,Z=-7.500000)
    AmbientGlow=0
    AIRating=0.6
    CurrentRating=0.6

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    bTorchEnabled=true
    ForceZoomOutOnFireTime=0.01

    DisplayFOV=65.0
    StandardDisplayFOV=65.0
    PlayerIronSightFOV=70
    ZoomedDisplayFOV=40

	HudImage=texture'KillingFloorHUD.WeaponSelect.combat_shotgun_unselected'
	SelectedHudImage=texture'KillingFloorHUD.WeaponSelect.combat_shotgun'
	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_Combat_Shotgun'
	FirstPersonFlashlightOffset=(X=-25.000000,Y=-18.000000,Z=8.000000)
}
