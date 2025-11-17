class FlareRevolverFire extends KFShotgunFire;

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
    ProjPerFire=1
    TransientSoundVolume=2.000000
    TransientSoundRadius=500.000000
    FireSoundRef="KF_IJC_HalloweenSnd.FlarePistol_Fire_M"
    StereoFireSoundRef="KF_IJC_HalloweenSnd.FlarePistol_Fire_S"
    NoAmmoSoundRef="KF_HandcannonSnd.50AE_DryFire"
    FireRate=0.4
    FireAnimRate=1.0
    TweenTime=0.025000
    AmmoClass=Class'KFMod.FlareRevolverAmmo'
    ProjectileClass=Class'KFMod.FlareRevolverProjectile'
    ProjSpawnOffset=(X=50.000000,Y=10.000000,Z=-5.000000)
    BotRefireRate=0.850000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stFlareRevolver'
    aimerror=42.000000
    Spread=0.017500
    RecoilRate=0.07
    maxVerticalRecoilAngle=1500
    maxHorizontalRecoilAngle=250
    FireAimedAnim=Fire_Iron
    bWaitForRelease=true

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=1.0,Z=8.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.5
    ShakeRotMag=(X=75.0,Y=75.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=10000.0)
    ShakeRotTime=3.5
    bRandomPitchFireSound=True
    RandomPitchAdjustAmt=0.05

    FireForce="AssaultRifleFire"
}

