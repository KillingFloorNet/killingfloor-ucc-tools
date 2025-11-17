//=============================================================================
// M4Fire
//=============================================================================
// M4 Assault Rifle primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class M4Fire extends KFHighROFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireLoopAnim=Fire_Loop
    FireLoopAimedAnim=Fire_Iron_Loop
    FireEndAnim=Fire_End
    FireEndAimedAnim=Fire_Iron_End
    FireSoundRef="KF_M4RifleSnd.M4Rifle_Fire_Single_M"
    StereoFireSoundRef="KF_M4RifleSnd.M4Rifle_Fire_Single_S"
    AmbientFireSoundRef="KF_M4RifleSnd.M4Rifle_Fire_Loop"
    FireEndSoundRef="KF_M4RifleSnd.M4Rifle_Fire_Loop_End_M"
    FireEndStereoSoundRef="KF_M4RifleSnd.M4Rifle_Fire_Loop_End_S"
    NoAmmoSoundRef="KF_AK47Snd.AK47_DryFire"
    DamageType=Class'KFMod.DamTypeM4AssaultRifle'
    DamageMin=25
    DamageMax=35
    Momentum=8500.000000
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.8
    FireForce="AssaultRifleFire"
    FireRate=0.075
    RecoilRate=0.065
    maxVerticalRecoilAngle=250
    maxHorizontalRecoilAngle=100
    TweenTime=0.025
    bAccuracyBonusForSemiAuto=true

    AmmoClass=Class'KFMod.M4Ammo'
    AmmoPerFire=1
    BotRefireRate=0.990000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
    aimerror=42.000000
    Spread=0.008//0.0085
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=3.0,Z=7.5)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.25
    ShakeRotMag=(X=50.0,Y=50.0,Z=350.0)
    ShakeRotRate=(X=5000.0,Y=5000.0,Z=5000.0)
    ShakeRotTime=0.75

    ShellEjectClass=class'ROEffects.KFShellEjectM4Rifle'
    ShellEjectBoneName=Shell_eject
    bRandomPitchFireSound=true
}
