//=============================================================================
// ClaymoreSwordFireB
//=============================================================================
// Claymore sword secondary fire class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ClaymoreSwordFireB extends KFMeleeFire;

DefaultProperties
{
	MeleeDamage=320
	ProxySize=0.150000
	weaponRange=110.000000
	DamagedelayMin=0.97
	DamagedelayMax=0.97
	hitDamageClass=Class'KFMod.DamTypeClaymoreSword'
	FireRate=1.25
	FireAnim="HardAttack"
	BotRefireRate=1.1
	MeleeHitSoundRefs(0)="KF_ClaymoreSnd.Claymore_Impact_Flesh"
	HitEffectClass=class'AxeHitEffect'
	bWaitForRelease=True
	WideDamageMinHitAngle=0.6
}
