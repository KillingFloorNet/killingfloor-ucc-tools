//=============================================================================                                                                                                                      //=============================================================================
// HuskGunProjectile_Strong
//=============================================================================
// Fireball projectile for the Husk zombie, stronger effects
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class HuskGunProjectile_Strong extends HuskGunProjectile;

defaultproperties
{
    ExplosionEmitter=class'KFMod.FlameImpact_Strong'
    FlameTrailEmitterClass=class'KFMod.FlameThrowerHusk_Strong'
    ExplosionSoundVolume=2.0
    ExplosionDecal=class'KFMod.FlameThrowerBurnMark_Large'
}
