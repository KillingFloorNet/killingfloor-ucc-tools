class M32Fire extends KFShotgunFire;

function float MaxRange()
{
    return 2500;
}

defaultproperties
{
     FireAimedAnim=Iron_Fire
     KickMomentum=(X=0,y=0,Z=0)
     ProjPerFire=1
     TransientSoundVolume=1.8
     FireSoundRef="KF_M32Snd.M32_Fire"
     StereoFireSoundRef="KF_M32Snd.M32_FireST"
     NoAmmoSoundRef="KF_M79Snd.M79_DryFire"
     FireForce="AssaultRifleFire"
     FireRate=0.33
     AmmoClass=Class'KFMod.M32Ammo'
     ShakeOffsetMag=(X=3.000000,Y=3.000000,Z=3.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotMag=(X=3.000000,Y=4.000000,Z=2.000000)
     ProjectileClass=Class'KFMod.M32GrenadeProjectile'
     BotRefireRate=1.800000
     aimerror=42.000000
     Spread=0.015//0.0085
     SpreadStyle=SS_Random
     ProjSpawnOffset=(X=50,Y=10,Z=-6)
     FlashEmitterClass=Class'ROEffects.MuzzleFlash1stNadeL'

     EffectiveRange=2500.000000
     maxVerticalRecoilAngle=200
     maxHorizontalRecoilAngle=50
     bWaitForRelease=true
}
