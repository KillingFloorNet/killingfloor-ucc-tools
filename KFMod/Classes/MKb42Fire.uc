//=============================================================================
 //MKb42 Fire
//=============================================================================
class MKb42Fire extends KFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireSoundRef="KF_mkb42Snd.mkb42_Fire_Single_M"
    StereoFireSoundRef="KF_mkb42Snd.mkb42_Fire_Single_S"
    NoAmmoSoundRef="KF_AK47Snd.AK47_DryFire"
    DamageType=Class'KFMod.DamTypeMKb42AssaultRifle'
    DamageMin=35
    DamageMax=45
    Momentum=8500.000000
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.8
    FireLoopAnim="Fire"
    FireForce="AssaultRifleFire"
    FireRate=0.1
    RecoilRate=0.07
    maxVerticalRecoilAngle=425
    maxHorizontalRecoilAngle=225
    TweenTime=0.025
    bAccuracyBonusForSemiAuto=true
    bRecoilRightOnly=false

    AmmoClass=Class'KFMod.MKb42Ammo'
    AmmoPerFire=1
    BotRefireRate=0.990000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
    aimerror=42.000000
    Spread=0.009
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=3.0,Z=7.5)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.25
    ShakeRotMag=(X=50.0,Y=50.0,Z=350.0)
    ShakeRotRate=(X=5000.0,Y=5000.0,Z=5000.0)
    ShakeRotTime=0.75

    ShellEjectClass=class'ROEffects.KFShellEjectMkb'
    ShellEjectBoneName=Shell_eject
    bRandomPitchFireSound=true
    RandomPitchAdjustAmt=0.05
}
