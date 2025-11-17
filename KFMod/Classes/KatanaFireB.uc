//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KatanaFireB extends KFMeleeFire;

DefaultProperties
{
	MeleeDamage=205
	WideDamageMinHitAngle=0.65
	ProxySize=0.150000
	weaponRange=95.000000
	DamagedelayMin=0.65//0.800000
	DamagedelayMax=0.65//0.800000
	hitDamageClass=Class'KFMod.DamTypeKatana'
	FireRate=1.000
	FireAnim="HardAttack"
	BotRefireRate=0.850000
	MeleeHitSoundRefs(0)="KF_AxeSnd.Axe_HitFlesh"
	HitEffectClass=class'AxeHitEffect'
	bWaitForRelease=True
}
