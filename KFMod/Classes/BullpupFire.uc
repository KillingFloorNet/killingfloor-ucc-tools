//=============================================================================
 //L85 Fire
//=============================================================================
class BullpupFire extends KFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireSound=Sound'KF_BullpupSnd.Bullpup_Fire'
    StereoFireSoundRef="KF_BullpupSnd.Bullpup_FireST"
    NoAmmoSound=Sound'KF_9MMSnd.9mm_DryFire'
    DamageType=Class'KFMod.DamTypeBullpup'
    DamageMin=16
    DamageMax=26
    Momentum=8500.000000
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.8
    FireLoopAnim="Fire"
    FireForce="AssaultRifleFire"
    FireRate=0.100000
    RecoilRate=0.07
    maxVerticalRecoilAngle=200
    maxHorizontalRecoilAngle=75
    TweenTime=0.025
    bAccuracyBonusForSemiAuto=true

    AmmoClass=Class'KFMod.BullpupAmmo'
    AmmoPerFire=1
    BotRefireRate=0.990000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
    aimerror=42.000000
    Spread=0.0085
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=3.0,Z=10.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.0
    ShakeRotMag=(X=75.0,Y=75.0,Z=250.0)
    ShakeRotRate=(X=10000.0,Y=10000.0,Z=10000.0)
    ShakeRotTime=0.5

    ShellEjectClass=class'ROEffects.KFShellEjectBullpup'
    ShellEjectBoneName=Bullpup
}
