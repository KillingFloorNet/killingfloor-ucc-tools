//=============================================================================
// ZEDGunFire
//=============================================================================
// ZEDGun primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class ZEDGunFire extends KFShotgunFire;

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
    FireSoundRef="KF_ZEDGunSnd.KF_WEP_ZED_Primary_M"
    StereoFireSoundRef="KF_ZEDGunSnd.KF_WEP_ZED_Primary_S"
    NoAmmoSoundRef="KF_ZEDGunSnd.KF_WEP_ZED_Dryfire"
    FireRate=0.2
    FireAnimRate=1.0
    TweenTime=0.025000
    AmmoClass=Class'KFMod.ZEDGunAmmo'
    ProjectileClass=Class'KFMod.ZEDGunProjectile'
    ProjSpawnOffset=(X=50,Y=18,Z=-14.5)
    BotRefireRate=0.250000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stZEDGunPrimary'
    aimerror=42.000000
    Spread=0.017500
    RecoilRate=0.1
    maxVerticalRecoilAngle=350
    maxHorizontalRecoilAngle=200
    FireAimedAnim=Fire_Iron
    bWaitForRelease=false

	//** View shake **//
    ShakeOffsetMag=(X=6.0,Y=2.0,Z=10.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.0
    ShakeRotMag=(X=50.0,Y=50.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=12500.0)
    ShakeRotTime=3.0
    bRandomPitchFireSound=True
    RandomPitchAdjustAmt=0.05

    FireForce="AssaultRifleFire"
}

