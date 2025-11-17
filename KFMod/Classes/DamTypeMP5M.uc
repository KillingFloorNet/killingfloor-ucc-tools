//=============================================================================
// DamTypeMP5M
//=============================================================================
// Damage type for the MP5 medic gun primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class DamTypeMP5M extends KFProjectileWeaponDamageType
	abstract;

defaultproperties
{
    WeaponClass=Class'KFMod.MP5MMedicGun'
    DeathString="%k killed %o (MP5M)."
    FemaleSuicide="%o shot herself in the foot."
    MaleSuicide="%o shot himself in the foot."

	// Make this bullet move the ragdoll when its shot
	bRagdollBullet=true
    KDeathVel=100.000000
    KDamageImpulse=750
    KDeathUpKick=1
}
