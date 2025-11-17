class CrossbuzzsawFire extends KFShotgunFire;

simulated function bool AllowFire()
{
	return (Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire);
}



function float MaxRange()
{
    return 2500;
}

function DoFireEffect()
{
   Super(KFShotgunFire).DoFireEffect();
}



defaultproperties
{
    KickMomentum=(X=0,Y=0,Z=0)
    ProjPerFire=1
    TransientSoundVolume=1.8
    FireSoundRef="KF_IJC_HalloweenSnd.CrossBuzzSaw_Fire_M"
    StereoFireSoundRef="KF_IJC_HalloweenSnd.CrossBuzzSaw_Fire_S"
    NoAmmoSoundRef="KF_XbowSnd.Xbow_DryFire"
    FireForce="AssaultRifleFire"
    FireRate=2.00000
    FireAnimRate=1.0
    AmmoClass=Class'KFMod.CrossbuzzsawAmmo'
    ProjectileClass=Class'KFMod.CrossbuzzsawBlade'
    BotRefireRate=1.800000
    FlashEmitterClass=None
    aimerror=1.000000
    Spread=0.1
    maxVerticalRecoilAngle=1500
    maxHorizontalRecoilAngle=125
    RecoilRate=0.1
    SpreadStyle=SS_Random
    FireAimedAnim=Fire_Iron
    ProjSpawnOffset=(X=50.000000,Y=7.000000,Z=-8.000000)

    EffectiveRange=7500.000000

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=2.0,Z=10.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.0
    ShakeRotMag=(X=50.0,Y=50.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=12500.0)
    ShakeRotTime=3.0
    bWaitForRelease=true
    bRandomPitchFireSound=false
}
