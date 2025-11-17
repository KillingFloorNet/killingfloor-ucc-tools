//=============================================================================
// FNFALFire
//=============================================================================
// FN FAL Assault rifle primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson, and IJC Development
//=============================================================================
class FNFALFire extends KFHighROFFire;

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireLoopAnim=Fire_Loop
    FireLoopAimedAnim=Fire_Iron_Loop
    FireEndAnim=Fire_End
    FireEndAimedAnim=Fire_Iron_End

    FireSoundRef="KF_FNFALSnd.FNFAL_Fire_Single_M"
    StereoFireSoundRef="KF_FNFALSnd.FNFAL_Fire_Single_S"
    AmbientFireSoundRef="KF_FNFALSnd.FNFAL_Fire_Loop"
    FireEndSoundRef="KF_FNFALSnd.FNFAL_Fire_Loop_End_M"
    FireEndStereoSoundRef="KF_FNFALSnd.FNFAL_Fire_Loop_End_S"

    AmbientFireSoundRadius=500
    AmbientFireVolume=255
    FireSound=none
	NoAmmoSoundRef="KF_SCARSnd.SCAR_DryFire"
	DamageType=Class'KFMod.DamTypeFNFALAssaultRifle'
	DamageMin=60
	DamageMax=65
	Momentum=8500.000000
	bPawnRapidFireAnim=True
	TransientSoundVolume=1.8
	FireForce="AssaultRifleFire"
	FireRate=0.0857 //700 rpm
	RecoilRate=0.08
	maxVerticalRecoilAngle=150
	maxHorizontalRecoilAngle=115
	TweenTime=0.025
	bAccuracyBonusForSemiAuto=true

	AmmoClass=Class'KFMod.FNFALAmmo'
	AmmoPerFire=1
	BotRefireRate=0.990000
	FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
	aimerror=42.000000
	Spread=0.0085
	SpreadStyle=SS_Random

	//** View shake **//
	ShakeOffsetMag=(X=6.0,Y=3.0,Z=8.5)
	ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
	ShakeOffsetTime=1.15
	ShakeRotMag=(X=80.0,Y=80.0,Z=450.0)
	ShakeRotRate=(X=7500.0,Y=7500.0,Z=7500.0)
	ShakeRotTime=0.65

	ShellEjectClass=class'KFMod.KFShellEjectFAL'
	ShellEjectBoneName=Shell_eject
	bRandomPitchFireSound=false
}
