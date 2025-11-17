class DamTypeMP7M extends KFProjectileWeaponDamageType
	abstract;

defaultproperties
{
    WeaponClass=Class'KFMod.MP7MMedicGun'
    DeathString="%k killed %o (MP7M)."
    FemaleSuicide="%o shot herself in the foot."
    MaleSuicide="%o shot himself in the foot."

	// Make this bullet move the ragdoll when its shot
	bRagdollBullet=true
    KDeathVel=115.000000
    KDamageImpulse=850
    KDeathUpKick=2
}
