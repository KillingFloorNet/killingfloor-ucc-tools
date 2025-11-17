class Trader extends Decoration;

#exec OBJ LOAD FILE=KFMapObjects.ukx

simulated function PostBeginPlay()
{
	if( Level.NetMode!=NM_DedicatedServer )
		LoopAnim('Idle');
}

defaultproperties
{
	bStatic=False
	bStasis=False
	Mesh=SkeletalMesh'KFMapObjects.Trader'
	bNoDelete=True
	RemoteRole=ROLE_None
}
