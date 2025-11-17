//=============================================================================
// ThompsonDrumFire
//=============================================================================
// ThompsonDrum SMG primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - IJC Weapon Development and John "Ramm-Jaeger" Gibson
//=============================================================================
class ThompsonDrumFire extends KFHighROFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireLoopAnim=Fire_Loop
    FireLoopAimedAnim=Fire_Iron_Loop
    FireEndAnim=Fire_End
    FireEndAimedAnim=Fire_Iron_End

    FireSoundRef="KF_IJC_HalloweenSnd.Thompson_Fire_Single_M"
    StereoFireSoundRef="KF_IJC_HalloweenSnd.Thompson_Fire_Single_S"
    AmbientFireSoundRef="KF_IJC_HalloweenSnd.ThompsonSMG_Fire_Loop"
    FireEndSoundRef="KF_IJC_HalloweenSnd.ThompsonSMG_Fire_Loop_End_M"
    FireEndStereoSoundRef="KF_IJC_HalloweenSnd.ThompsonSMG_Fire_Loop_End_S"
    NoAmmoSoundRef="KF_AK47Snd.AK47_DryFire"
    DamageType=Class'KFMod.DamTypeThompsonDrum'
    DamageMin=35
    DamageMax=40
    Momentum=12500.000000
    bPawnRapidFireAnim=True
    TransientSoundVolume=1.800000
    FireForce="AssaultRifleFire"
    FireRate=0.0857 // 700 RPM
    RecoilRate=0.080000
    maxVerticalRecoilAngle=150
    maxHorizontalRecoilAngle=100
    TweenTime=0.025000

    AmmoClass=Class'kfmod.ThompsonDrumAmmo'
    AmmoPerFire=1
    BotRefireRate=0.150000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
    aimerror=42.000000
    Spread=0.012000
    SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=3.0,Z=7.5)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=1.25
    ShakeRotMag=(X=50.0,Y=50.0,Z=350.0)
    ShakeRotRate=(X=5000.0,Y=5000.0,Z=5000.0)
    ShakeRotTime=0.75

    ShellEjectClass=class'ROEffects.KFShellEjectMP5SMG'
    ShellEjectBoneName=Shell_eject
    bRandomPitchFireSound=False
}
