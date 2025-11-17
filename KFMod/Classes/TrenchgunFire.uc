//=============================================================================
// Trenchgun Dragon's Breath Fire
//=============================================================================
class TrenchgunFire extends KFShotgunFire;

defaultproperties
{
    KickMomentum=(X=-85.000000,Z=15.000000)
    ProjPerFire=14//7
    bAttachSmokeEmitter=True
    TransientSoundVolume=2.0
    TransientSoundRadius=500.000000
    FireSoundRef="KF_ShotgunDragonsBreathSnd.ShotgunDragon_Fire_Single_M"
    StereoFireSoundRef="KF_ShotgunDragonsBreathSnd.ShotgunDragon_Fire_Single_S"
    NoAmmoSoundRef="KF_PumpSGSnd.SG_DryFire"
    FireRate=0.965//0.83//1.500000
    FireAnimRate=0.95
    AmmoClass=Class'KFMod.TrenchgunAmmo'
    ProjectileClass=Class'KFMod.TrenchgunBullet'
    BotRefireRate=1.500000
    FlashEmitterClass=Class'KFMod.TrenchgunMuzzFlash'
    aimerror=1.000000
    Spread=1125.0
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
    bRandomPitchFireSound=true
    RandomPitchAdjustAmt=0.05
}
