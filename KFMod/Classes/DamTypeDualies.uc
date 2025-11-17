class DamTypeDualies extends KFProjectileWeaponDamageType
	abstract;

defaultproperties
{
    WeaponClass=Class'KFMod.Dualies'
    DeathString="%k killed %o (Dualies)."
    FemaleSuicide="%o shot herself in the foot."
    MaleSuicide="%o shot himself in the foot."
    bBulletHit=True
    FlashFog=(X=600.000000)
    VehicleDamageScaling=0.700000
    bSniperWeapon=true // Used to track Sharpshooter Headshot Kills

    // Make this bullet move the ragdoll when its shot
    bRagdollBullet=true
    KDeathVel=100.000000
    KDamageImpulse=750
    KDeathUpKick=0
}
