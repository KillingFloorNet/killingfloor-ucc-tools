// Zombie Monster for KF Invasion gametype

class ZombieWretch extends KFMonster ;

#exec OBJ LOAD FILE=PlayerSounds.uax

defaultproperties
{
     MeleeDamage=10
     damageForce=5000
     HitSound(0)=Sound'KF_EnemiesFinalSnd.Stalker_Pain'
     ScoringValue=1
     GroundSpeed=135.000000
     WaterSpeed=125.000000
     Health=165
     MovementAnims(0)="WalkStalk"
     WalkAnims(0)="WalkStalk"
     WalkAnims(1)="WalkStalk"
     WalkAnims(2)="WalkStalk"
     WalkAnims(3)="WalkStalk"
     AmbientSound=Sound'KFPlayerSound.Zombiesbreath'
     //Mesh=SkeletalMesh'KFCharacterModels.InfectedWhiteMale2'
     Skins(0)=Shader'KFCharacters.Zombie2Shader'
     AmbientGlow=0
     CollisionRadius=26.000000
     Mass=500.000000
     RotationRate=(Yaw=45000,Roll=0)
	MenuName="Wertch"
}
