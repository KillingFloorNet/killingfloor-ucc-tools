class Blinds extends Decoration;

simulated function PostBeginPlay()
{
	if( Level.NetMode!=NM_DedicatedServer )
		LoopAnim('bLow');
}

defaultproperties
{
	bStatic=False
	bStasis=False
	Mesh=SkeletalMesh'KFMapObjects.Blinds'
	bNoDelete=True
	RemoteRole=ROLE_None
}
