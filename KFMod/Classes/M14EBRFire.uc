//=============================================================================
 //M14EBR Fire
//=============================================================================
class M14EBRFire extends KFFire;

defaultproperties
{
	FireAimedAnim=Fire_Iron
	FireSoundRef="KF_M14EBRSnd.M14EBR_Fire"
	StereoFireSoundRef="KF_M14EBRSnd.M14EBR_FireST"
	NoAmmoSoundRef="KF_M14EBRSnd.M14EBR_DryFire"
	DamageType=Class'KFMod.DamTypeM14EBR'
	DamageMin=75
	DamageMax=80
	Momentum=9500.000000
	bPawnRapidFireAnim=True
	TransientSoundVolume=1.8
	FireLoopAnim="Fire"
	FireForce="AssaultRifleFire"
	FireRate=0.25 // Increased in Balance Round 2 to reduce M14 spam fest
	RecoilRate=0.085
	maxVerticalRecoilAngle=2000
	maxHorizontalRecoilAngle=500
	TweenTime=0.025
	bWaitForRelease=true

	AmmoClass=Class'KFMod.M14EBRAmmo'
	AmmoPerFire=1
	BotRefireRate=0.990000
	FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
	aimerror=42.000000
	Spread=0.005//0.0085
	SpreadStyle=SS_Random

	//** View shake **//
	ShakeOffsetMag=(X=6.0,Y=3.0,Z=7.5)
	ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
	ShakeOffsetTime=1.15
	ShakeRotMag=(X=50.0,Y=50.0,Z=300.0)
	ShakeRotRate=(X=7500.0,Y=7500.0,Z=7500.0)
	ShakeRotTime=0.65

	ShellEjectClass=class'ROEffects.KFShellEjectEBR'
	ShellEjectBoneName=Shell_eject
}
