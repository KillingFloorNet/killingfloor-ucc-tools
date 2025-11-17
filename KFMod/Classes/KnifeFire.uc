// Knife Fire //

class KnifeFire extends KFMeleeFire;

var() array<name> FireAnims;
var name LastFireAnim;


function PlayFiring()
{
     Super.PlayFiring();
}

simulated event ModeDoFire()
{
     local int AnimToPlay;

     if(FireAnims.length > 0)
     {

         AnimToPlay = rand(FireAnims.length);

          LastFireAnim = FireAnim;
          FireAnim = FireAnims[AnimToPlay];

          DamagedelayMin = default.DamagedelayMin;

           //  3  and 2 should never play consecutively. it looks screwey.
            //  3 should never repeat directly after itself. buffer with 1

          if(LastFireAnim == FireAnims[1] && FireAnim == FireAnims[2] ||
           LastFireAnim == FireAnims[2] && FireAnim == FireAnims[1] ||
            LastFireAnim == FireAnims[2] && FireAnim == FireAnims[2])
            FireAnim = FireAnims[0];
     }



  Super(KFMeleeFire).ModeDoFire();

}

defaultproperties
{
    FireAnims(0)="fire"
    FireAnims(1)="fire2"
    FireAnims(2)="fire3"
    FireAnims(3)="fire4"

    MeleeDamage=19
    WideDamageMinHitAngle=0.75
    DamagedelayMin=0.45//0.100000
    DamagedelayMax=0.450000
    hitDamageClass=Class'KFMod.DamTypeKnife'
    FireRate=0.600000
    BotRefireRate=0.300000
    MeleeHitSounds(0)=Sound'KF_KnifeSnd.Knife_HitFlesh'
    HitEffectClass=class'KnifeHitEffect'
}
