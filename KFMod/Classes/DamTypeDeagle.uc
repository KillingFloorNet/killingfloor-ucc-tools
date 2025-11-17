class DamTypeDeagle extends KFProjectileWeaponDamageType
	abstract;

defaultproperties
{
    WeaponClass=Class'KFMod.Deagle'
    DeathString="%k killed %o (Deagle)."
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
	KDamageImpulse=4500
	KDeathVel=200.000000
	KDeathUpKick=20
}
