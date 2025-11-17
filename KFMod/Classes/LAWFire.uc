class LAWFire extends KFShotgunFire;

function bool AllowFire()
{
    if( Instigator != none && Instigator.IsHumanControlled() )
    {
        if( !KFWeapon(Weapon).bAimingRifle || KFWeapon(Weapon).bZoomingIn )
        {
            return false;
        }
    }
	return ( Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire);
}
function ServerPlayFiring()
{
	Super.ServerPlayFiring();
    KFWeapon(Weapon).ZoomOut(false);
}
function PlayFiring()
{
	Super.PlayFiring();
    KFWeapon(Weapon).ZoomOut(false);
}

defaultproperties
{
    KickMomentum=(X=-45.000000,Z=25.000000)
    ProjSpawnOffset=(X=50.000000,Z=0)
    bSplashDamage=True
    bRecommendSplashDamage=True
    TransientSoundVolume=1.8
    FireAnim="AimFire"
    //PreFireAnim ="FireShort"
    FireSoundRef="KF_LAWSnd.LAW_Fire"
    StereoFireSoundRef="KF_LAWSnd.LAW_FireST"
    NoAmmoSoundRef="KF_LAWSnd.LAW_DryFire"
    FireForce="redeemer_shoot"
    FireRate=3.250000
    AmmoClass=Class'KFMod.LAWAmmo'
    AmmoPerFire=1
    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=2.0,Z=10.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=3.0
    ShakeRotMag=(X=50.0,Y=50.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=12500.0)
    ShakeRotTime=5.0
    ProjectileClass=Class'KFMod.LAWProj'
    BotRefireRate=3.250000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stKar'
    Spread=0.1
    SpreadStyle=SS_Random
    ProjPerFire=1

    // Lets not make poeple wait to shoot, it feels broken - Ramm
    PreFireTime=0.0

    CrouchedAccuracyBonus = 0.1

    maxVerticalRecoilAngle=1000
    maxHorizontalRecoilAngle=250
    bWaitForRelease=true
    bRandomPitchFireSound=false
}
