//=============================================================================
// KFProjectileWeaponDamageType
//=============================================================================
// Base damage type for weapons that fire projectiles
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProjectileWeaponDamageType extends KFWeaponDamageType
	abstract;

defaultproperties
{
	PawnDamageEmitter=class'ROEffects.ROBloodPuff'
	LowDetailEmitter=ROEffects.ROBloodPuffSmall
	LowGoreDamageEmitter=ROEffects.ROBloodPuffNoGore
}


