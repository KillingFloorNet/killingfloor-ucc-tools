//=============================================================================
 //AK47 Fire
//=============================================================================
class AK47Fire extends KFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireSoundRef="KF_AK47Snd.AK47_Fire"
    StereoFireSoundRef="KF_AK47Snd.AK47_FireST"
    NoAmmoSoundRef="KF_AK47Snd.AK47_DryFire"
    DamageType=Class'KFMod.DamTypeAK47AssaultRifle'
    DamageMin=35
    DamageMax=45
    Momentum=8500.000000
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.8
    FireLoopAnim="Fire"
    FireForce="AssaultRifleFire"
    FireRate=0.109//0.085//0.077
    RecoilRate=0.07
    maxVerticalRecoilAngle=500
    maxHorizontalRecoilAngle=250
    TweenTime=0.025
    bAccuracyBonusForSemiAuto=true
    bRecoilRightOnly=true

    AmmoClass=Class'KFMod.AK47Ammo'
    AmmoPerFire=1
    BotRefireRate=0.990000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
    aimerror=42.000000
    Spread=0.015//0.0085
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=3.0,Z=7.5)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.25
    ShakeRotMag=(X=50.0,Y=50.0,Z=350.0)
    ShakeRotRate=(X=5000.0,Y=5000.0,Z=5000.0)
    ShakeRotTime=0.75

    ShellEjectClass=class'ROEffects.KFShellEjectAK'
    ShellEjectBoneName=Shell_eject
    bRandomPitchFireSound=false
}
