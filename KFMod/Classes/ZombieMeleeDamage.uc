// for the Purposes of Gibbing and various nasty shit.
class ZombieMeleeDamage extends DamTypeZombieAttack;

defaultproperties
{
    PawnDamageEmitter=class'ROEffects.ROBloodPuff'
    LowDetailEmitter=ROEffects.ROBloodPuffSmall
    LowGoreDamageEmitter=ROEffects.ROBloodPuffNoGore

    DeathString="%o was eaten by %k."
    FemaleSuicide="%o ate herself."
    MaleSuicide="%o ate himself."
}
