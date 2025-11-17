class Tarp extends Decoration;     // Decoration

#exec OBJ LOAD FILE=KFMapObjects.ukx

simulated function PostBeginPlay()
{
	if( Level.NetMode!=NM_DedicatedServer )
		LoopAnim('bLow');
}

defaultproperties
{
     bStatic=False
     bStasis=False
	bNoDelete=True
	RemoteRole=ROLE_None
     Mesh=SkeletalMesh'KFMapObjects.Tarp'
}
