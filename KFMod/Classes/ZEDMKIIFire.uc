//=============================================================================
// ZEDMKIIFire
//=============================================================================
// Primary fire class for the Zed Gun Mark II Weapon
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ZEDMKIIFire extends KFShotgunFire;

simulated function bool AllowFire()
{
	if(KFWeapon(Weapon).bIsReloading)
		return false;
	if(KFPawn(Instigator).SecondaryItem!=none)
		return false;
	if(KFPawn(Instigator).bThrowingNade)
		return false;

	if(KFWeapon(Weapon).MagAmmoRemaining < 1)
	{
    	if( Level.TimeSeconds - LastClickTime>FireRate )
    	{
    		LastClickTime = Level.TimeSeconds;
    	}

		if( AIController(Instigator.Controller)!=None )
			KFWeapon(Weapon).ReloadMeNow();
		return false;
	}

	return super(WeaponFire).AllowFire();
}

function float MaxRange()
{
    return 10000;
}

defaultproperties
{
    ProjPerFire=1
    AmmoPerFire=1
    TransientSoundVolume=2.000000
    TransientSoundRadius=500.000000
    FireSoundRef="KF_FY_ZEDV2SND.WEP_ZEDV2_Fire_M"
    StereoFireSoundRef="KF_FY_ZEDV2SND.WEP_ZEDV2_Fire_S"
    NoAmmoSoundRef="KF_ZEDGunSnd.KF_WEP_ZED_Dryfire"
    FireRate=0.125
    FireAnimRate=1.0
    TweenTime=0.025000
    AmmoClass=Class'KFMod.ZEDMKIIAmmo'
    ProjectileClass=Class'KFMod.ZEDMKIIPrimaryProjectile'
    ProjSpawnOffset=(X=50,Y=18,Z=-14.5)
    BotRefireRate=0.250000
    FlashEmitterClass=Class'KFMod.ZEDMKIIPrimaryMuzzleFlash1P'
    aimerror=42.000000
    Spread=0.017500
    RecoilRate=0.1
    maxVerticalRecoilAngle=225
    maxHorizontalRecoilAngle=125
    FireAimedAnim=Fire_Iron
    bWaitForRelease=false
    bModeExclusive=false

	//** View shake **//
    ShakeOffsetMag=(X=4.5,Y=1.5,Z=7.5)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.0
    ShakeRotMag=(X=30.0,Y=30.0,Z=250.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=12500.0)
    ShakeRotTime=3.0
    bRandomPitchFireSound=True
    RandomPitchAdjustAmt=0.05

    FireForce="AssaultRifleFire"
}

