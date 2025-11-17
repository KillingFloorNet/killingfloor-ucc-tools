//=============================================================================
// ChainsawAltFire
//=============================================================================
// Power slash chainsaw fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ChainsawAltFire extends KFMeleeFire;

var()   array<name>     FireAnims;
var 	sound   		FireEndSound;				// The sound to play at the end of firing

var		string			FireEndSoundRef;

static function PreloadAssets(optional KFMeleeFire Spawned)
{
	super.PreloadAssets(Spawned);

	default.FireEndSound = sound(DynamicLoadObject(default.FireEndSoundRef, class'sound', true));

	if ( ChainsawAltFire(Spawned) != none )
	{
		ChainsawAltFire(Spawned).FireEndSound = default.FireEndSound;
	}
}

static function bool UnloadAssets()
{
	super.UnloadAssets();

	default.FireEndSound = none;

	return true;
}

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

simulated Function Timer()
{
    super.Timer();

    Weapon.PlayOwnedSound(FireEndSound,SLOT_Interact,TransientSoundVolume,,TransientSoundRadius,,false);
}

defaultproperties
{
     FireAnims(0)="fire2"
     FireAnims(1)="fire3"

     MeleeDamage=270
     WideDamageMinHitAngle=0.8
     DamagedelayMin=0.65
     DamagedelayMax=0.65
     hitDamageClass=Class'KFMod.DamTypeChainsaw'
     TransientSoundVolume=1.8
     FireAnim="fire2"
     FireSoundRef="KF_ChainsawSnd.Chainsaw_RevLong_Start"
     FireEndSoundRef="KF_ChainsawSnd.Chainsaw_RevLong_End"
     FireRate=1.1
     BotRefireRate=0.8
     ChainsawHitEffect
     HitEffectClass=class'ChainsawHitEffect'
}
