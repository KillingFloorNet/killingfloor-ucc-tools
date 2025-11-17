//=============================================================================
// SealSquealFire
//=============================================================================
// Weapon fire class for the seal squeal harpoon bomb launcher
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SealSquealFire extends KFShotgunFire;

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

    //log("Spread = "$Spread);

	return super(WeaponFire).AllowFire();
}


function float MaxRange()
{
    return 2500;
}

defaultproperties
{
    FireAimedAnim=Iron_Fire
    KickMomentum=(X=0,y=0,Z=0)
    ProjPerFire=1
    TransientSoundVolume=1.8
    FireSoundRef="KF_FY_SealSquealSND.WEP_Harpoon_Fire_M"
    StereoFireSoundRef="KF_FY_SealSquealSND.WEP_Harpoon_Fire"
    NoAmmoSoundRef="KF_M79Snd.M79_DryFire"
    FireForce="AssaultRifleFire"
    FireRate=0.75
    AmmoClass=Class'KFMod.SealSquealAmmo'
    ProjectileClass=Class'KFMod.SealSquealProjectile'
    BotRefireRate=1.800000
    aimerror=42.000000
    Spread=0.015
    SpreadStyle=SS_Random
    ProjSpawnOffset=(X=30,Y=4,Z=-6)
    FlashEmitterClass=Class'KFMod.SealSquealMuzzleFlash1P'

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=1.0,Z=8.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.5
    ShakeRotMag=(X=75.0,Y=75.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=10000.0)
    ShakeRotTime=3.5

    EffectiveRange=2500.000000
    maxVerticalRecoilAngle=1500
    maxHorizontalRecoilAngle=250
    bWaitForRelease=true
}
