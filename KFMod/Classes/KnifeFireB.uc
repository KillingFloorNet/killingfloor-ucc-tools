// Knife Stab //
class KnifeFireB extends KFMeleeFire;

defaultproperties
{
    MeleeDamage=55
    WideDamageMinHitAngle=0.7
    DamagedelayMin=0.60
    DamagedelayMax=0.60
    hitDamageClass=Class'KFMod.DamTypeKnife'
    FireAnim="Stab"
    FireRate=1.1
    BotRefireRate=1.1
    MeleeHitSounds(0)=Sound'KF_KnifeSnd.Knife_HitFlesh'
    HitEffectClass=class'KnifeHitEffect'
}
