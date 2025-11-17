class Flag extends Decoration;

#exec OBJ LOAD FILE=KFMapObjects.ukx

function PostBeginPlay()
{
	if( Level.NetMode!=NM_DedicatedServer )
		LoopAnim('Fly');
}

defaultproperties
{
	bStatic=False
	bStasis=False
	Mesh=SkeletalMesh'KFMapObjects.flag'
	RemoteRole=ROLE_None
	bNoDelete=True
}
