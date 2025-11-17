//=============================================================================
// MP5MFire
//=============================================================================
// MP5 Medic Gun primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class MP5MFire extends KFHighROFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireLoopAnim=Fire_Loop
    FireLoopAimedAnim=Fire_Iron_Loop
    FireEndAnim=Fire_End
    FireEndAimedAnim=Fire_Iron_End
    AmbientFireSoundRef="KF_MP5Snd.MP5_Fire_Loop"
    FireEndSoundRef="KF_MP5Snd.MP5_Fire_Loop_End_M"
    FireEndStereoSoundRef="KF_MP5Snd.MP5_Fire_Loop_End_S"
    AmbientFireSoundRadius=500
    AmbientFireVolume=255
    FireSound=none
    NoAmmoSoundRef="KF_MP7Snd.MP7_DryFire"
    DamageType=Class'KFMod.DamTypeMP5M'
    DamageMin=25
    DamageMax=30
    Momentum=5500.000000
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.8
    //FireLoopAnim="Fire"
    FireForce="AssaultRifleFire"
    FireRate=0.075
    RecoilRate=0.06
    maxVerticalRecoilAngle=124
    maxHorizontalRecoilAngle=75
    TweenTime=0.025
    bAccuracyBonusForSemiAuto=true
    RecoilVelocityScale=0.0

    AmmoClass=Class'KFMod.MP5MAmmo'
    AmmoPerFire=1
    BotRefireRate=0.10000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stMP'
    aimerror=30.000000
    Spread=0.01
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=4.0,Y=2.5,Z=5.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.25
    ShakeRotMag=(X=25.0,Y=25.0,Z=125.0)
    ShakeRotRate=(X=10000.0,Y=10000.0,Z=10000.0)
    ShakeRotTime=3.0

    ShellEjectClass=class'ROEffects.KFShellEjectMP5SMG'
    ShellEjectBoneName=Shell_eject
}
