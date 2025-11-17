//=============================================================================
// DwarfAxeFireB
//=============================================================================
// Dwarf Axe secondary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class DwarfAxeFireB extends KFMeleeFire;

DefaultProperties
{
    MeleeDamage=325
    WideDamageMinHitAngle=0.9
    ProxySize=0.150000
    weaponRange=90.000000
    DamagedelayMin=0.74
    DamagedelayMax=0.74
    hitDamageClass=Class'KFMod.DamTypeDwarfAxeSecondary'
    FireRate=1.5
    FireAnim="PowerAttack"
    BotRefireRate=1.1
    MeleeHitSounds(0)=Sound'KF_AxeSnd.Axe_HitFlesh'
    HitEffectClass=class'AxeHitEffect'
    bWaitForRelease=True
}
