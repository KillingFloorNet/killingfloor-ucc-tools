//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DamTypeRocketImpact extends DamTypeKFSnipe
	abstract;

defaultproperties
{
    HeadShotDamageMult=2.000000
    WeaponClass=Class'KFMod.Law'
    DeathString="%k killed %o (LAW Impact)."
    FemaleSuicide="%o shot herself in the foot."
    MaleSuicide="%o shot himself in the foot."

    KDeathVel=200.000000
    KDamageImpulse=5000
	KDeathUpKick=50
}
