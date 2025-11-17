//=============================================================================
// MP7M Standard Fire
//=============================================================================
class MP7MFire extends KFHighROFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireLoopAnim=Fire_Loop
    FireLoopAimedAnim=Fire_Iron_Loop
    FireEndAnim=Fire_End
    FireEndAimedAnim=Fire_Iron_End
    AmbientFireSoundRef="KF_MP7Snd.MP7_FireLoop"
    FireEndSoundRef="KF_MP7Snd.MP7_tail"
    FireEndStereoSoundRef="KF_MP7Snd.MP7_tailST"
    AmbientFireSoundRadius=500
    AmbientFireVolume=255
    FireSound=none
    NoAmmoSoundRef="KF_MP7Snd.MP7_DryFire"
    DamageType=Class'KFMod.DamTypeMP7M'
    DamageMin=20
    DamageMax=25
    Momentum=5500.000000
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.8
    //FireLoopAnim="Fire"
    FireForce="AssaultRifleFire"
    FireRate=0.063
    RecoilRate=0.06
    maxVerticalRecoilAngle=100
    maxHorizontalRecoilAngle=75
    TweenTime=0.025
    bAccuracyBonusForSemiAuto=true
    RecoilVelocityScale=0.0

    AmmoClass=Class'KFMod.MP7MAmmo'
    AmmoPerFire=1
    BotRefireRate=0.10000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stMP'
    aimerror=30.000000
    Spread=0.012000
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=4.0,Y=2.5,Z=5.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.25
    ShakeRotMag=(X=25.0,Y=25.0,Z=125.0)
    ShakeRotRate=(X=10000.0,Y=10000.0,Z=10000.0)
    ShakeRotTime=3.0

    ShellEjectClass=class'ROEffects.KFShellEjectMP'
    ShellEjectBoneName=Shell_eject
}
