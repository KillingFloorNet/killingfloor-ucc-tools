class KFMonstersHalloween extends KFMonstersCollection;

defaultproperties
{
	MonsterClasses(0)=(MClassName="KFChar.ZombieClot_HALLOWEEN",MID="A")
	MonsterClasses(1)=(MClassName="KFChar.ZombieCrawler_HALLOWEEN",MID="B")
	MonsterClasses(2)=(MClassName="KFChar.ZombieGoreFast_HALLOWEEN",MID="C")
	MonsterClasses(3)=(MClassName="KFChar.ZombieStalker_HALLOWEEN",MID="D")
	MonsterClasses(4)=(MClassName="KFChar.ZombieScrake_HALLOWEEN",MID="E")
	MonsterClasses(5)=(MClassName="KFChar.ZombieFleshpound_HALLOWEEN",MID="F")
	MonsterClasses(6)=(MClassName="KFChar.ZombieBloat_HALLOWEEN",MID="G")
	MonsterClasses(7)=(MClassName="KFChar.ZombieSiren_HALLOWEEN",MID="H")
	MonsterClasses(8)=(MClassName="KFChar.ZombieHusk_HALLOWEEN",MID="I")

	StandardMonsterClasses(0)=(MClassName="KFChar.ZombieClot_HALLOWEEN",MID="A")
	StandardMonsterClasses(1)=(MClassName="KFChar.ZombieCrawler_HALLOWEEN",MID="B")
	StandardMonsterClasses(2)=(MClassName="KFChar.ZombieGoreFast_HALLOWEEN",MID="C")
	StandardMonsterClasses(3)=(MClassName="KFChar.ZombieStalker_HALLOWEEN",MID="D")
	StandardMonsterClasses(4)=(MClassName="KFChar.ZombieScrake_HALLOWEEN",MID="E")
	StandardMonsterClasses(5)=(MClassName="KFChar.ZombieFleshpound_HALLOWEEN",MID="F")
	StandardMonsterClasses(6)=(MClassName="KFChar.ZombieBloat_HALLOWEEN",MID="G")
	StandardMonsterClasses(7)=(MClassName="KFChar.ZombieSiren_HALLOWEEN",MID="H")
	StandardMonsterClasses(8)=(MClassName="KFChar.ZombieHusk_HALLOWEEN",MID="I")


    FinalSquads(0)=(ZedClass=("KFChar.ZombieClot_HALLOWEEN"),NumZeds=(4))
    FinalSquads(1)=(ZedClass=("KFChar.ZombieClot_HALLOWEEN","KFChar.ZombieCrawler_HALLOWEEN"),NumZeds=(3,1))
    FinalSquads(2)=(ZedClass=("KFChar.ZombieClot_HALLOWEEN","KFChar.ZombieStalker_HALLOWEEN","KFChar.ZombieCrawler_HALLOWEEN"),NumZeds=(3,1,1))

	ShortSpecialSquads(2)=(ZedClass=("KFChar.ZombieCrawler_HALLOWEEN","KFChar.ZombieGorefast_HALLOWEEN","KFChar.ZombieStalker_HALLOWEEN","KFChar.ZombieScrake_HALLOWEEN"),NumZeds=(2,2,1,1))
	ShortSpecialSquads(3)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_HALLOWEEN","KFChar.ZombieFleshPound_HALLOWEEN"),NumZeds=(1,2,1))

	NormalSpecialSquads(3)=(ZedClass=("KFChar.ZombieCrawler_HALLOWEEN","KFChar.ZombieGorefast_HALLOWEEN","KFChar.ZombieStalker_HALLOWEEN","KFChar.ZombieScrake_HALLOWEEN"),NumZeds=(2,2,1,1))
	NormalSpecialSquads(4)=(ZedClass=("KFChar.ZombieFleshPound_HALLOWEEN"),NumZeds=(1))
	NormalSpecialSquads(5)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_HALLOWEEN","KFChar.ZombieFleshPound_HALLOWEEN"),NumZeds=(1,1,1))
	NormalSpecialSquads(6)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_HALLOWEEN","KFChar.ZombieFleshPound_HALLOWEEN"),NumZeds=(1,1,2))

	LongSpecialSquads(4)=(ZedClass=("KFChar.ZombieCrawler_HALLOWEEN","KFChar.ZombieGorefast_HALLOWEEN","KFChar.ZombieStalker_HALLOWEEN","KFChar.ZombieScrake_HALLOWEEN"),NumZeds=(2,2,1,1))
	LongSpecialSquads(6)=(ZedClass=("KFChar.ZombieFleshPound_HALLOWEEN"),NumZeds=(1))
	LongSpecialSquads(7)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_HALLOWEEN","KFChar.ZombieFleshPound_HALLOWEEN"),NumZeds=(1,1,1))
	LongSpecialSquads(8)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_HALLOWEEN","KFChar.ZombieScrake_HALLOWEEN","KFChar.ZombieFleshPound_HALLOWEEN"),NumZeds=(1,2,1,1))
    LongSpecialSquads(9)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_HALLOWEEN","KFChar.ZombieScrake_HALLOWEEN","KFChar.ZombieFleshPound_HALLOWEEN"),NumZeds=(1,2,1,2))

    FallbackMonsterClass="KFChar.ZombieStalker_HALLOWEEN"
    EndGameBossClass="KFChar.ZombieBoss_HALLOWEEN"
}
