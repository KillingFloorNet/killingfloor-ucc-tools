class Scaff extends Decoration;

#exec OBJ LOAD FILE=KFMapObjects.ukx

function PostBeginPlay()
{
	LoopAnim('Flutter');
}

defaultproperties
{
	bStatic=False
	bStasis=False
	Mesh=SkeletalMesh'KFMapObjects.Scaff'
	bNoDelete=True
	RemoteRole=ROLE_None
}
