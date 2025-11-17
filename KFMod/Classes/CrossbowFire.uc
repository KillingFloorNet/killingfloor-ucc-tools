class CrossbowFire extends KFShotgunFire;

simulated function bool AllowFire()
{
	return (Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire);
}

function float MaxRange()
{
    return 2500;
}

function DoFireEffect()
{
   Super(KFShotgunFire).DoFireEffect();
}

defaultproperties
{
     FireAimedAnim=Fire_Iron
     KickMomentum=(X=0,y=0,Z=0)
     ProjPerFire=1
     TransientSoundVolume=1.8
     FireSoundRef="KF_XbowSnd.Xbow_Fire"
     NoAmmoSoundRef="KF_XbowSnd.Xbow_DryFire"
     FireForce="AssaultRifleFire"
     FireRate=1.800000
     AmmoClass=Class'KFMod.CrossbowAmmo'
     ShakeOffsetMag=(X=3.000000,Y=3.000000,Z=3.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotMag=(X=3.000000,Y=4.000000,Z=2.000000)
     ProjectileClass=Class'KFMod.CrossbowArrow'
     BotRefireRate=1.800000
     FlashEmitterClass=None
     aimerror=1.000000
     Spread=0.75
     SpreadStyle=SS_None
     ProjSpawnOffset=(X=25,Y=0,Z=0)//(X=5,Y=5,Z=-25)

     EffectiveRange=2500.000000
     maxVerticalRecoilAngle=200
     maxHorizontalRecoilAngle=50
     bWaitForRelease=true
     bRandomPitchFireSound=false
}
