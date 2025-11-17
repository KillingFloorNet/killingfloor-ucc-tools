//=============================================================================
// KrissMFire
//=============================================================================
// Kriss Medic Gun primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class KrissMFire extends KFHighROFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireLoopAnim=Fire_Loop
    FireLoopAimedAnim=Fire_Iron_Loop
    FireEndAnim=Fire_End
    FireEndAimedAnim=Fire_Iron_End
    AmbientFireSoundRef="KF_KrissSND.Kriss_Fire_Loop"
    FireEndSoundRef="KF_KrissSND.Kriss_Fire_End"
    FireEndStereoSoundRef="KF_KrissSND.KF_WEP_KRISS_END_S"
    AmbientFireSoundRadius=500
    AmbientFireVolume=255
    FireSound=none
    NoAmmoSoundRef="KF_MP7Snd.MP7_DryFire"
    DamageType=Class'KFMod.DamTypeKrissM'
    DamageMin=35
    DamageMax=40
    Momentum=12500.000000
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.8
    FireForce="AssaultRifleFire"
    FireRate=0.063
    RecoilRate=0.06
    maxVerticalRecoilAngle=75
    maxHorizontalRecoilAngle=55
    TweenTime=0.025
    bAccuracyBonusForSemiAuto=true
    RecoilVelocityScale=0.0

    AmmoClass=Class'KFMod.KrissMAmmo'
    AmmoPerFire=1
    BotRefireRate=0.10000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stMP'
    aimerror=30.000000
    Spread=0.0125
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=3.0,Z=7.5)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.25
    ShakeRotMag=(X=50.0,Y=50.0,Z=350.0)
    ShakeRotRate=(X=5000.0,Y=5000.0,Z=5000.0)
    ShakeRotTime=0.75

    ShellEjectClass=class'KFMod.ShellEjectKriss'
    ShellEjectBoneName=Shell_eject
}
