class DamTypeShockBall extends WeaponDamageType
	abstract;

static function GetHitEffects(out class<xEmitter> HitEffects[4], int VictemHealth )
{
    HitEffects[0] = class'HitSmoke';
}

defaultproperties
{
    DeathString="%o was wasted by %k's shock core."
	MaleSuicide="%o snuffed himself with the shock core."
	FemaleSuicide="%o snuffed herself with the shock core."

    WeaponClass=none//class'ShockRifle' KFTODO: Maybe replace this
    bDetonatesGoop=true

    DamageOverlayMaterial=none//Material'UT2004Weapons.ShockHitShader' KFTODO: Maybe replace this
    DamageOverlayTime=0.8
    bDelayedDamage=true
}

