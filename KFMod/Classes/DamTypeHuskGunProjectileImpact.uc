//=============================================================================
// DamTypeHuskGunProjectileImpact
//=============================================================================
// Damage type for the husk gun projectile impacting something
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class DamTypeHuskGunProjectileImpact extends KFProjectileWeaponDamageType;

static function GetHitEffects(out class<xEmitter> HitEffects[4], int VictimHealth)
{
	HitEffects[0] = class'HitSmoke';
	if( VictimHealth <= 0 )
		HitEffects[1] = class'KFHitFlame';
	else if ( FRand() < 0.8 )
		HitEffects[1] = class'KFHitFlame';
}

static function AwardDamage(KFSteamStatsAndAchievements KFStatsAndAchievements, int Amount)
{
	KFStatsAndAchievements.AddFlameThrowerDamage(Amount);
}

defaultproperties
{
    WeaponClass=Class'KFMod.HuskGun'
    DeathString="%k killed %o (Husk Gun)."
    FemaleSuicide="%o blew up."
    MaleSuicide="%o blew up."

    bRagdollBullet=True
    bBulletHit=True

    KDamageImpulse=10000.000000
    KDeathVel=300.000000
    KDeathUpKick=100.000000

    bIsPowerWeapon=false

	DeathOverlayMaterial=Material'Effects_Tex.PlayerDeathOverlay'
	DeathOverlayTime=999

	HumanObliterationThreshhold=200
    HeadShotDamageMult=1.500000
}
