class DamTypeMAC10MP extends KFProjectileWeaponDamageType
	abstract;

defaultproperties
{
    WeaponClass=Class'KFMod.MAC10MP'
    DeathString="%k killed %o (MAC-10)."
    FemaleSuicide="%o shot herself in the foot."
    MaleSuicide="%o shot himself in the foot."

	// Make this bullet move the ragdoll when its shot
	bRagdollBullet=true
    KDeathVel=150.000000
    KDamageImpulse=1850
    KDeathUpKick=5
}
