//=============================================================================                                                                                                                      //=============================================================================
// HuskGunProjectile_Weak
//=============================================================================
// Fireball projectile for the Husk zombie, weaker effects
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class HuskGunProjectile_Weak extends HuskGunProjectile;

defaultproperties
{
    ExplosionEmitter=class'KFMod.FlameImpact_Weak'
    FlameTrailEmitterClass=class'KFMod.FlameThrowerHusk_Weak'
    ExplosionSoundVolume=1.25
    ExplosionDecal=class'KFMod.FlameThrowerBurnMark_Small'
}
