class DamTypeCrossbuzzsaw extends KFProjectileWeaponDamageType;

 static function AwardKill(KFSteamStatsAndAchievements KFStatsAndAchievements, KFPlayerController Killer, KFMonster Killed )
{
	if ( KFStatsAndAchievements != none )
	{
		if (Killed.IsA('ZombieHusk'))
		{
			KFStatsAndAchievements.AddHuskAndZedOneShotKill(true, false);
		}
		else
		{
        	KFStatsAndAchievements.AddHuskAndZedOneShotKill(false, true);
		}
	}
}
defaultproperties
{
    WeaponClass=Class'KFMod.Crossbuzzsaw'

    HeadShotDamageMult=1.000000
    bKUseOwnDeathVel=True
    bThrowRagdoll=True
    bFlaming=False
    DamageThreshold=1
    KDamageImpulse=7500.000000
	bSniperWeapon=False

    // Make this bullet move the ragdoll when its shot
    bRagdollBullet=true
    KDeathVel=250.000000
    KDeathUpKick=25

    bIsMeleeDamage=True
}
