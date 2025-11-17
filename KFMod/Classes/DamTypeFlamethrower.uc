class DamTypeFlamethrower extends KFWeaponDamageType
	abstract;

static function AwardDamage(KFSteamStatsAndAchievements KFStatsAndAchievements, int Amount)
{
	KFStatsAndAchievements.AddFlameThrowerDamage(Amount);
}

defaultproperties
{
    WeaponClass=Class'KFMod.Flamethrower'
    DeathString="%k incinerated %o (Flamethrower)."
    FemaleSuicide="%o roasted herself alive."
    MaleSuicide="%o roasted himself alive."
    bCheckForHeadShots=false
    bDealBurningDamage=true
}
