//=============================================================================
// Trenchgun with Dragon's Breath Inventory class
//=============================================================================
class Trenchgun extends KFWeaponShotgun;

defaultproperties
{
    SkinRefs(0)="KF_Weapons8_Trip_T.Weapons.Trenchgun_cmb"

    WeaponReloadAnim=Reload_Shotgun

    MagCapacity=6
    ReloadRate=0.7
    ReloadAnim="Reload"
    ReloadAnimRate=1.0
    IdleAimAnim=Idle_Iron
    Weight=8.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.TrenchgunFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_PumpSGSnd.SG_Select"
    bShowChargingBar=True
    Description="A WWII-era trench shotgun in 12 gauge, loaded with Dragon's Breath flame rounds. Toasty."
    Priority=142
    InventoryGroup=3
    GroupOffset=14
    PickupClass=Class'KFMod.TrenchgunPickup'

    BobDamping=7.000000
    AttachmentClass=Class'KFMod.TrenchgunAttachment'
    IconCoords=(X1=169,Y1=172,X2=245,Y2=208)
    ItemName="Dragon's Breath Trenchgun"
    MeshRef="KF_Wep_TrenchGun.TrenchGun"
    TransientSoundVolume=1.000000
    PlayerViewOffset=(X=20.000000,Y=18.750000,Z=-8.000000)
    AmbientGlow=0
    AIRating=0.6
    CurrentRating=0.6

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    bTorchEnabled=false
    ForceZoomOutOnFireTime=0.01

    DisplayFOV=65.0
    StandardDisplayFOV=65.0
    PlayerIronSightFOV=70
    ZoomedDisplayFOV=50

	HudImageRef="KillingFloor2HUD.WeaponSelect.TrenchGun_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.TrenchGun"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_TrenchGun'

	bIsTier2Weapon=true
}
