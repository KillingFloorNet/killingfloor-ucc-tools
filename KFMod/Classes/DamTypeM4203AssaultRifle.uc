//=============================================================================
// DamTypeM4203AssaultRifle
//=============================================================================
// Damage type for the M4 with M203 launcher assault rifle primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class DamTypeM4203AssaultRifle extends KFProjectileWeaponDamageType
	abstract;

defaultproperties
{
    WeaponClass=Class'KFMod.M4203AssaultRifle'
    DeathString="%k killed %o (M4 203)."
    FemaleSuicide="%o shot herself in the foot."
    MaleSuicide="%o shot himself in the foot."

	// Make this bullet move the ragdoll when its shot
	bRagdollBullet=true
    KDeathVel=110.000000
    KDamageImpulse=1500
    KDeathUpKick=2
}
