class Sign extends Decoration;

#exec OBJ LOAD FILE=KFMapObjects.ukx

simulated function PostBeginPlay()
{
	LoopAnim('swing');
}

defaultproperties
{
     bStatic=False
     bStasis=False
     bReplicateAnimations=False
	RemoteRole=ROLE_None
	bNoDelete=True
     Mesh=SkeletalMesh'KFMapObjects.sign'
}
