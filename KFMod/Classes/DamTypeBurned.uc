class DamTypeBurned extends KFWeaponDamageType;

static function AwardDamage(KFSteamStatsAndAchievements KFStatsAndAchievements, int Amount)
{
	KFStatsAndAchievements.AddFlameThrowerDamage(Amount);
}

defaultproperties
{
	DeathString="%o was sauteed."
	FlashFog=(X=800,Y=600,Z=240)
	bLocationalHit=false
	bDealBurningDamage=true
}
