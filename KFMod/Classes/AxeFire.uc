// Axe Fire //
class AxeFire extends KFMeleeFire;

var() array<name> FireAnims;

simulated event ModeDoFire()
{
    local int AnimToPlay;

    if(FireAnims.length > 0)
    {
        AnimToPlay = rand(FireAnims.length);
        FireAnim = FireAnims[AnimToPlay];
    }

    Super.ModeDoFire();

}

defaultproperties
{
     FireAnims(0)="fire"
     FireAnims(1)="fire2"
     FireAnims(2)="fire3"
     FireAnims(3)="fire4"

     MeleeDamage=175
     WideDamageMinHitAngle=0.65
     ProxySize=0.150000
     weaponRange=90.000000
     DamagedelayMin=0.60//0.800000
     DamagedelayMax=0.60//0.800000
     hitDamageClass=Class'KFMod.DamTypeAxe'
     FireRate=1.1
     BotRefireRate=0.850000
     MeleeHitSounds(0)=Sound'KF_AxeSnd.Axe_HitFlesh'
     HitEffectClass=class'AxeHitEffect'
}
