class DamTypeLAW extends DamTypeFrag;

static function AwardKill(KFSteamStatsAndAchievements KFStatsAndAchievements, KFPlayerController Killer, KFMonster Killed );

defaultproperties
{
    WeaponClass=Class'KFMod.Law'
	HumanObliterationThreshhold=350

	DeathOverlayMaterial=Material'Effects_Tex.PlayerDeathOverlay'
	DeathOverlayTime=999
	bIsPowerWeapon=false
	KDeathUpKick=300
}
