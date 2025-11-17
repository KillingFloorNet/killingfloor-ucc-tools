                                       //=============================================================================
// Flashlight
//=============================================================================
class ShotGunLightFire extends KFFire;

var name FireAnim2;

simulated function ModeDoFire()
{
	if (Weapon != none && KFPlayerController(pawn(Weapon.Owner).Controller) != none )
	{
		KFPlayerController(pawn(Weapon.Owner).Controller).ToggleTorch();
		KFWeapon(Weapon).AdjustLightGraphic();
	}
	Super.ModeDoFire();
}

function DoTrace(Vector Start, Rotator Dir)
{

}

// Sends a value to the 9mm attachment telling whether the light is being used.
function bool LightFiring()
{
	return bIsFiring;
}

simulated function bool AllowFire()
{
	if(KFWeapon(Weapon).bIsReloading || KFPawn(Instigator).SecondaryItem!=none || KFPawn(Instigator).bThrowingNade )
		return false;
	if(Level.TimeSeconds - LastClickTime > FireRate)
		return true;
}



defaultproperties
{
     DamageType=Class'KFMod.DamTypeDualies'
     DamageMin=0
     DamageMax=0
     Momentum=0
     bPawnRapidFireAnim=True
     bAttachSmokeEmitter=True
     TransientSoundVolume=1.8
     FireSound=Sound'KF_9MMSnd.NineMM_AltFire1'
     FireForce="AssaultRifleFire"
     FireRate=0.5
     RecoilRate=0.15
     AmmoClass=Class'KFMod.FlashlightAmmo'
     FireAnim ="LightOn"
     AmmoPerFire=0
     ShakeRotMag=(X=0.000000,Y=0.000000,Z=0.000000)
     ShakeRotRate=(X=0.000000,Y=0.000000,Z=0.000000)
     ShakeRotTime=0.000000
     ShakeOffsetMag=(X=0.000000,Y=0.000000,Z=0.000000)
     ShakeOffsetRate=(X=0.000000,Y=0.000000,Z=0.000000)
     ShakeOffsetTime=0.000000
     BotRefireRate=0.50000
     FlashEmitterClass=none
     aimerror=0.000000
     Spread=0.00
     SpreadStyle=SS_None

     bFiringDoesntAffectMovement = true
     bDoClientRagdollShotFX=false
}
