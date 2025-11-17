//=============================================================================
// DamTypeMK23Pistol
//=============================================================================
// Damage type for the MK23 Pistol primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and IJC Development
//=============================================================================
class DamTypeMK23Pistol extends KFProjectileWeaponDamageType
	abstract;

defaultproperties
{
    WeaponClass=Class'KFMod.MK23Pistol'
    DeathString="%k killed %o with MK23."
    FemaleSuicide="%o shot herself in the foot."
    MaleSuicide="%o shot himself in the foot."
    bBulletHit=True
    FlashFog=(X=600.000000)
    VehicleDamageScaling=0.800000
    bIsPowerWeapon=false
    bSniperWeapon=true // Used to track Sharpshooter Headshot Kills

    // Make this bullet move the ragdoll when its shot
    bRagdollBullet=True
    KDamageImpulse=1850.000000
    KDeathVel=150.000000
    KDeathUpKick=5.000000
}
