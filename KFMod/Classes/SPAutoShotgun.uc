//=============================================================================
// SPAutoShotgun
//=============================================================================
// Steam Punk Fully Automatic Shotgun class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SPAutoShotgun extends AA12AutoShotgun;

// Use alt fire to switch fire modes
simulated function AltFire(float F)
{
    super(KFWeapon).AltFire(F);
}

// Toggle semi/auto fire
simulated function DoToggle (){}

// Set the new fire mode on the server
function ServerChangeFireMode(bool bNewWaitForRelease){}

exec function SwitchModes(){}


simulated function WeaponTick(float dt)
{
    local float SecondaryCharge;
    local rotator DialRot;

    super.WeaponTick(dt);

	if ( Level.NetMode!=NM_DedicatedServer )
	{
        if( FireMode[1].NextFireTime >= Level.TimeSeconds )
        {
            log("Remaining = "$(FireMode[1].NextFireTime - Level.TimeSeconds)$" FireMode[1].FireRate = "$FireMode[1].FireRate$" Scale = "$((FireMode[1].NextFireTime - Level.TimeSeconds)/FireMode[1].FireRate));
            SecondaryCharge = 1.0 - ((FireMode[1].NextFireTime - Level.TimeSeconds)/FireMode[1].FireRate);
        }
        else
        {
            SecondaryCharge = 1.0;
        }

        if( SecondaryCharge > 0.1 && FireMode[0].NextFireTime >= Level.TimeSeconds )
        {
            //log("Remaining = "$(FireMode[1].NextFireTime - Level.TimeSeconds)$" FireMode[1].FireRate = "$FireMode[1].FireRate$" Scale = "$((FireMode[1].NextFireTime - Level.TimeSeconds)/FireMode[1].FireRate));
            SecondaryCharge -= 0.1 * ((FireMode[0].NextFireTime - Level.TimeSeconds)/FireMode[0].FireRate);
        }

        DialRot.roll = 26500 - ( 53000 * SecondaryCharge );
        SetBoneRotation('Dail2',DialRot,1.0);
    }
}

defaultproperties
{
	SkinRefs(1)="KF_IJC_Summer_Weapons.Jackhammer.jackhammer_cmb"
    SleeveNum=0

    WeaponReloadAnim=Reload_IJC_spJackHammer
    IdleAimAnim=Idle_Iron

    MagCapacity=10
    ReloadRate=3.3
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=10.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.SPShotgunFire'
    FireModeClass(1)=Class'KFMod.SPShotgunAltFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_SP_ZEDThrowerSnd.KFO_Shotgun_Select"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    Description="A device for throwing lead and getting sodding enemies out of your face."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=167
    InventoryGroup=4
    GroupOffset=15
    PickupClass=Class'KFMod.SPShotgunPickup'
    PlayerViewOffset=(X=20.000000,Y=23.000000,Z=-2.000000)
    //PlayerViewPivot=(Pitch=400)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.SPShotgunAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="Multichamber ZED Thrower"
    MeshRef="KF_IJC_Summer_Weps1.Jackhammer"
    DrawScale=1.00000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    AIRating=0.55
    CurrentRating=0.55

    DisplayFOV=65.000000
    StandardDisplayFOV=65.0//60.0
    PlayerIronSightFOV=80
    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ZoomedDisplayFOV=45

	HudImageRef="KF_IJC_HUD.WeaponSelect.Jackhammer_unselected"
	SelectedHudImageRef="KF_IJC_HUD.WeaponSelect.Jackhammer"
	TraderInfoTexture=texture'KF_IJC_HUD.Trader_Weapon_Icons.Trader_Jackhammer'

	// Achievement Helpers
	bIsTier2Weapon=true
	AppID=210943
}
