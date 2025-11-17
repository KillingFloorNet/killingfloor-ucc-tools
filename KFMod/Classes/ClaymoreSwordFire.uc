//=============================================================================
// ClaymoreSwordFire
//=============================================================================
// Claymore sword primary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ClaymoreSwordFire extends KFMeleeFire;
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
     FireAnims(4)="fire5"
     FireAnims(5)="fire6"

     MeleeDamage=210
     ProxySize=0.150000
     weaponRange=110.000000
     DamagedelayMin=0.63
     DamagedelayMax=0.63
     hitDamageClass=Class'KFMod.DamTypeClaymoreSword'
     FireRate=1.05
     BotRefireRate=1.00000
     MeleeHitSoundRefs(0)="KF_ClaymoreSnd.Claymore_Impact_Flesh"
     HitEffectClass=class'AxeHitEffect'
     //bWaitForRelease=True // Turned off in Balance Round 1 to allow Auto Fire again
     WideDamageMinHitAngle=0.65
}
