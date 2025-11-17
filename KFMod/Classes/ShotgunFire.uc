//=============================================================================
// Shotgun Fire
//=============================================================================
class ShotgunFire extends KFShotgunFire;

defaultproperties
{
    KickMomentum=(X=-85.000000,Z=15.000000)
    ProjPerFire=7
    bAttachSmokeEmitter=True
    TransientSoundVolume=2.0
    TransientSoundRadius=500.000000
    FireSound=Sound'KF_PumpSGSnd.SG_Fire'
    StereoFireSoundRef="KF_PumpSGSnd.SG_FireST"
    NoAmmoSound=Sound'KF_PumpSGSnd.SG_DryFire'
    FireRate=0.965//0.83//1.500000
    FireAnimRate=0.95
    AmmoClass=Class'KFMod.ShotgunAmmo'
    ProjectileClass=Class'KFMod.ShotgunBullet'
    BotRefireRate=1.500000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stKar'
    aimerror=1.000000
    Spread=1125.0//1500.000000
    maxVerticalRecoilAngle=1500
    maxHorizontalRecoilAngle=900
    FireAimedAnim=Fire_Iron

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=2.0,Z=10.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=3.0
    ShakeRotMag=(X=50.0,Y=50.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=12500.0)
    ShakeRotTime=5.0
    bWaitForRelease=true
    bRandomPitchFireSound=false
}
