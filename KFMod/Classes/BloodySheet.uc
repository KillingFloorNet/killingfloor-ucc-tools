class BloodySheet extends Decoration;

simulated function PostBeginPlay()
{
	if( Level.NetMode!=NM_DedicatedServer )
		LoopAnim('Sway');
}

defaultproperties
{
	bStatic=False
	Mesh=SkeletalMesh'KFMapObjects.BloodySheet'
	bNoDelete=True
	RemoteRole=ROLE_None
}
