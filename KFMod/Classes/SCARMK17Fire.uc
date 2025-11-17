//=============================================================================
 //SCARMK17 Fire
//=============================================================================
class SCARMK17Fire extends KFFire;

defaultproperties
{
	FireAimedAnim=Fire_Iron
	FireSoundRef="KF_SCARSnd.SCAR_Fire"
	StereoFireSoundRef="KF_SCARSnd.SCAR_FireST"
	NoAmmoSoundRef="KF_SCARSnd.SCAR_DryFire"
	DamageType=Class'KFMod.DamTypeSCARMK17AssaultRifle'
	DamageMin=60
	DamageMax=65
	Momentum=8500.000000
	bPawnRapidFireAnim=True
	TransientSoundVolume=1.8
	FireLoopAnim="Fire"
	FireForce="AssaultRifleFire"
	FireRate=0.096//0.085//0.077
	RecoilRate=0.07
	maxVerticalRecoilAngle=500
	maxHorizontalRecoilAngle=250
	TweenTime=0.025
	bAccuracyBonusForSemiAuto=true

	AmmoClass=Class'KFMod.SCARMK17Ammo'
	AmmoPerFire=1
	BotRefireRate=0.990000
	FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
	aimerror=42.000000
	Spread=0.0075//0.0085
	SpreadStyle=SS_Random

	//** View shake **//
	ShakeOffsetMag=(X=6.0,Y=3.0,Z=7.5)
	ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
	ShakeOffsetTime=1.15
	ShakeRotMag=(X=50.0,Y=50.0,Z=300.0)
	ShakeRotRate=(X=7500.0,Y=7500.0,Z=7500.0)
	ShakeRotTime=0.65

	ShellEjectClass=class'ROEffects.KFShellEjectSCAR'
	ShellEjectBoneName=Shell_eject
}
