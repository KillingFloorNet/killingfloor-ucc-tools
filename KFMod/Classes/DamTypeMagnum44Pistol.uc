//=============================================================================
// DamTypeM4AssaultRifle
//=============================================================================
// Damage type for the M4 assault rifle primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class DamTypeMagnum44Pistol extends KFProjectileWeaponDamageType
	abstract;

defaultproperties
{
    WeaponClass=Class'KFMod.Magnum44Pistol'
    DeathString="%k killed %o (44 Magnum)."
    FemaleSuicide="%o shot herself in the foot."
    MaleSuicide="%o shot himself in the foot."
    bBulletHit=True
    FlashFog=(X=600.000000)
    //KDamageImpulse=9500.000000
    VehicleDamageScaling=0.800000
    bIsPowerWeapon=false
    bSniperWeapon=true // Used to track Sharpshooter Headshot Kills

	// Make this bullet move the ragdoll when its shot
	bRagdollBullet=true
	KDamageImpulse=3500
	KDeathVel=175.000000
	KDeathUpKick=15
}
