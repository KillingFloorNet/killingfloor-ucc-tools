//=============================================================================
// M7A3MFire
//=============================================================================
// M7 Prototype assault rifle medic gun primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson, and IJC Development
//=============================================================================
class M7A3MFire extends KFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireSoundRef="KF_M7A3Snd.M7A3_Fire_M"
    StereoFireSoundRef="KF_M7A3Snd.M7A3_Fire_S"
    NoAmmoSoundRef="KF_SCARSnd.SCAR_DryFire"
    DamageType=Class'KFMod.DamTypeM7A3M'
    DamageMin=65
    DamageMax=70
    Momentum=7000.0
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.8
    FireLoopAnim="Fire"
    FireForce="AssaultRifleFire"
    FireRate=0.166000
    RecoilRate=0.0850000
    maxVerticalRecoilAngle=500
    maxHorizontalRecoilAngle=250
    TweenTime=0.025
    bAccuracyBonusForSemiAuto=true

    AmmoClass=Class'KFMod.M7A3MAmmo'
    AmmoPerFire=1
    BotRefireRate=0.990000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
    aimerror=42.000000
    Spread=0.01
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=2.0,Z=7.5)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.5
    ShakeRotMag=(X=30.0,Y=30.0,Z=240.0)
    ShakeRotRate=(X=8500.0,Y=8500.0,Z=8500.0)
    ShakeRotTime=2.5

    ShellEjectClass=Class'ROEffects.KFShellEjectSCAR'
    ShellEjectBoneName=Shell_eject
}
