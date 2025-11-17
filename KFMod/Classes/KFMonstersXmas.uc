class KFMonstersXmas extends KFMonstersCollection;

defaultproperties
{
	MonsterClasses(0)=(MClassName="KFChar.ZombieClot_XMAS",MID="A")
	MonsterClasses(1)=(MClassName="KFChar.ZombieCrawler_XMAS",MID="B")
	MonsterClasses(2)=(MClassName="KFChar.ZombieGoreFast_XMAS",MID="C")
	MonsterClasses(3)=(MClassName="KFChar.ZombieStalker_XMAS",MID="D")
	MonsterClasses(4)=(MClassName="KFChar.ZombieScrake_XMAS",MID="E")
	MonsterClasses(5)=(MClassName="KFChar.ZombieFleshpound_XMAS",MID="F")
	MonsterClasses(6)=(MClassName="KFChar.ZombieBloat_XMAS",MID="G")
	MonsterClasses(7)=(MClassName="KFChar.ZombieSiren_XMAS",MID="H")
	MonsterClasses(8)=(MClassName="KFChar.ZombieHusk_XMAS",MID="I")

	StandardMonsterClasses(0)=(MClassName="KFChar.ZombieClot_XMAS",MID="A")
	StandardMonsterClasses(1)=(MClassName="KFChar.ZombieCrawler_XMAS",MID="B")
	StandardMonsterClasses(2)=(MClassName="KFChar.ZombieGoreFast_XMAS",MID="C")
	StandardMonsterClasses(3)=(MClassName="KFChar.ZombieStalker_XMAS",MID="D")
	StandardMonsterClasses(4)=(MClassName="KFChar.ZombieScrake_XMAS",MID="E")
	StandardMonsterClasses(5)=(MClassName="KFChar.ZombieFleshpound_XMAS",MID="F")
	StandardMonsterClasses(6)=(MClassName="KFChar.ZombieBloat_XMAS",MID="G")
	StandardMonsterClasses(7)=(MClassName="KFChar.ZombieSiren_XMAS",MID="H")
	StandardMonsterClasses(8)=(MClassName="KFChar.ZombieHusk_XMAS",MID="I")


    FinalSquads(0)=(ZedClass=("KFChar.ZombieClot_XMAS"),NumZeds=(4))
    FinalSquads(1)=(ZedClass=("KFChar.ZombieClot_XMAS","KFChar.ZombieCrawler_XMAS"),NumZeds=(3,1))
    FinalSquads(2)=(ZedClass=("KFChar.ZombieClot_XMAS","KFChar.ZombieStalker_XMAS","KFChar.ZombieCrawler_XMAS"),NumZeds=(3,1,1))

	ShortSpecialSquads(2)=(ZedClass=("KFChar.ZombieCrawler_XMAS","KFChar.ZombieGorefast_XMAS","KFChar.ZombieStalker_XMAS","KFChar.ZombieScrake_XMAS"),NumZeds=(2,2,1,1))
	ShortSpecialSquads(3)=(ZedClass=("KFChar.ZombieBloat_XMAS","KFChar.ZombieSiren_XMAS","KFChar.ZombieFleshPound_XMAS"),NumZeds=(1,2,1))

	NormalSpecialSquads(3)=(ZedClass=("KFChar.ZombieCrawler_XMAS","KFChar.ZombieGorefast_XMAS","KFChar.ZombieStalker_XMAS","KFChar.ZombieScrake_XMAS"),NumZeds=(2,2,1,1))
	NormalSpecialSquads(4)=(ZedClass=("KFChar.ZombieFleshPound_XMAS"),NumZeds=(1))
	NormalSpecialSquads(5)=(ZedClass=("KFChar.ZombieBloat_XMAS","KFChar.ZombieSiren_XMAS","KFChar.ZombieFleshPound_XMAS"),NumZeds=(1,1,1))
	NormalSpecialSquads(6)=(ZedClass=("KFChar.ZombieBloat_XMAS","KFChar.ZombieSiren_XMAS","KFChar.ZombieFleshPound_XMAS"),NumZeds=(1,1,2))

	LongSpecialSquads(4)=(ZedClass=("KFChar.ZombieCrawler_XMAS","KFChar.ZombieGorefast_XMAS","KFChar.ZombieStalker_XMAS","KFChar.ZombieScrake_XMAS"),NumZeds=(2,2,1,1))
	LongSpecialSquads(6)=(ZedClass=("KFChar.ZombieFleshPound_XMAS"),NumZeds=(1))
	LongSpecialSquads(7)=(ZedClass=("KFChar.ZombieBloat_XMAS","KFChar.ZombieSiren_XMAS","KFChar.ZombieFleshPound_XMAS"),NumZeds=(1,1,1))
	LongSpecialSquads(8)=(ZedClass=("KFChar.ZombieBloat_XMAS","KFChar.ZombieSiren_XMAS","KFChar.ZombieScrake_XMAS","KFChar.ZombieFleshPound_XMAS"),NumZeds=(1,2,1,1))
    LongSpecialSquads(9)=(ZedClass=("KFChar.ZombieBloat_XMAS","KFChar.ZombieSiren_XMAS","KFChar.ZombieScrake_XMAS","KFChar.ZombieFleshPound_XMAS"),NumZeds=(1,2,1,2))

    FallbackMonsterClass="KFChar.ZombieStalker_XMAS"
    EndGameBossClass="KFChar.ZombieBoss_XMAS"
}
