//=============================================================================
// SPSniperFire
//=============================================================================
// Steampunk Sniper Rifle Primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SPSniperFire extends KFFire;

defaultproperties
{
	FireAimedAnim=Fire_Iron
	FireSoundRef="KF_SP_LongmusketSnd.KFO_Sniper_Fire_M"
	StereoFireSoundRef="KF_SP_LongmusketSnd.KFO_Sniper_Fire_S"
	NoAmmoSoundRef="KF_M14EBRSnd.M14EBR_DryFire"
	DamageType=Class'KFMod.DamTypeSPSniper'
	DamageMin=150
	DamageMax=180
	Momentum=13000.000000
	bPawnRapidFireAnim=False
	TransientSoundVolume=1.8
	FireLoopAnim="Fire"
	FireForce="AssaultRifleFire"
	FireRate=0.94
	RecoilRate=0.12
	maxVerticalRecoilAngle=500
	maxHorizontalRecoilAngle=350
	TweenTime=0.025
	bWaitForRelease=true

	AmmoClass=Class'KFMod.SPSniperAmmo'
	AmmoPerFire=1
	BotRefireRate=0.990000
	FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSPSniper'
	aimerror=42.000000
	Spread=0.005//0.0085
	SpreadStyle=SS_Random

    //** View shake **//
    ShakeOffsetMag=(X=10.0,Y=3.0,Z=12.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.0
    ShakeRotMag=(X=100.0,Y=100.0,Z=500.0)
    ShakeRotRate=(X=10000.0,Y=10000.0,Z=10000.0)
    ShakeRotTime=2.0

	ShellEjectClass=class'ROEffects.KFShellEjectEBR'
	ShellEjectBoneName=Shell_eject
}
