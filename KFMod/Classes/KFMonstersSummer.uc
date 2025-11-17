class KFMonstersSummer extends KFMonstersCollection;

defaultproperties
{
    MonsterClasses(0)=(MClassName="KFChar.ZombieClot_CIRCUS",MID="A")
    MonsterClasses(1)=(MClassName="KFChar.ZombieCrawler_CIRCUS",MID="B")
    MonsterClasses(2)=(MClassName="KFChar.ZombieGoreFast_CIRCUS",MID="C")
    MonsterClasses(3)=(MClassName="KFChar.ZombieStalker_CIRCUS",MID="D")
    MonsterClasses(4)=(MClassName="KFChar.ZombieScrake_CIRCUS",MID="E")
    MonsterClasses(5)=(MClassName="KFChar.ZombieFleshpound_CIRCUS",MID="F")
    MonsterClasses(6)=(MClassName="KFChar.ZombieBloat_CIRCUS",MID="G")
    MonsterClasses(7)=(MClassName="KFChar.ZombieSiren_CIRCUS",MID="H")
    MonsterClasses(8)=(MClassName="KFChar.ZombieHusk_CIRCUS",MID="I")

    StandardMonsterClasses(0)=(MClassName="KFChar.ZombieClot_CIRCUS",MID="A")
    StandardMonsterClasses(1)=(MClassName="KFChar.ZombieCrawler_CIRCUS",MID="B")
    StandardMonsterClasses(2)=(MClassName="KFChar.ZombieGoreFast_CIRCUS",MID="C")
    StandardMonsterClasses(3)=(MClassName="KFChar.ZombieStalker_CIRCUS",MID="D")
    StandardMonsterClasses(4)=(MClassName="KFChar.ZombieScrake_CIRCUS",MID="E")
    StandardMonsterClasses(5)=(MClassName="KFChar.ZombieFleshpound_CIRCUS",MID="F")
    StandardMonsterClasses(6)=(MClassName="KFChar.ZombieBloat_CIRCUS",MID="G")
    StandardMonsterClasses(7)=(MClassName="KFChar.ZombieSiren_CIRCUS",MID="H")
    StandardMonsterClasses(8)=(MClassName="KFChar.ZombieHusk_CIRCUS",MID="I")


    FinalSquads(0)=(ZedClass=("KFChar.ZombieClot_CIRCUS"),NumZeds=(4))
    FinalSquads(1)=(ZedClass=("KFChar.ZombieClot_CIRCUS","KFChar.ZombieCrawler_CIRCUS"),NumZeds=(3,1))
    FinalSquads(2)=(ZedClass=("KFChar.ZombieClot_CIRCUS","KFChar.ZombieStalker_CIRCUS","KFChar.ZombieCrawler_CIRCUS"),NumZeds=(3,1,1))

    ShortSpecialSquads(2)=(ZedClass=("KFChar.ZombieCrawler_CIRCUS","KFChar.ZombieGorefast_CIRCUS","KFChar.ZombieStalker_CIRCUS","KFChar.ZombieScrake_CIRCUS"),NumZeds=(2,2,1,1))
    ShortSpecialSquads(3)=(ZedClass=("KFChar.ZombieBloat_CIRCUS","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieFleshPound_CIRCUS"),NumZeds=(1,2,1))

    NormalSpecialSquads(3)=(ZedClass=("KFChar.ZombieCrawler_CIRCUS","KFChar.ZombieGorefast_CIRCUS","KFChar.ZombieStalker_CIRCUS","KFChar.ZombieScrake_CIRCUS"),NumZeds=(2,2,1,1))
    NormalSpecialSquads(4)=(ZedClass=("KFChar.ZombieFleshPound_CIRCUS"),NumZeds=(1))
    NormalSpecialSquads(5)=(ZedClass=("KFChar.ZombieBloat_CIRCUS","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieFleshPound_CIRCUS"),NumZeds=(1,1,1))
    NormalSpecialSquads(6)=(ZedClass=("KFChar.ZombieBloat_CIRCUS","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieFleshPound_CIRCUS"),NumZeds=(1,1,2))

    LongSpecialSquads(4)=(ZedClass=("KFChar.ZombieCrawler_CIRCUS","KFChar.ZombieGorefast_CIRCUS","KFChar.ZombieStalker_CIRCUS","KFChar.ZombieScrake_CIRCUS"),NumZeds=(2,2,1,1))
    LongSpecialSquads(6)=(ZedClass=("KFChar.ZombieFleshPound_CIRCUS"),NumZeds=(1))
    LongSpecialSquads(7)=(ZedClass=("KFChar.ZombieBloat_CIRCUS","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieFleshPound_CIRCUS"),NumZeds=(1,1,1))
    LongSpecialSquads(8)=(ZedClass=("KFChar.ZombieBloat_CIRCUS","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieScrake_CIRCUS","KFChar.ZombieFleshPound_CIRCUS"),NumZeds=(1,2,1,1))
    LongSpecialSquads(9)=(ZedClass=("KFChar.ZombieBloat_CIRCUS","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieScrake_CIRCUS","KFChar.ZombieFleshPound_CIRCUS"),NumZeds=(1,2,1,2))

    FallbackMonsterClass="KFChar.ZombieStalker_CIRCUS"
    EndGameBossClass="KFChar.ZombieBoss_CIRCUS"
}
