class Deco_SkyboxAirShips extends Decoration;

#exec OBJ LOAD FILE=Pier_anim.ukx


simulated function PostBeginPlay()
{
	if( Level.NetMode!=NM_DedicatedServer )
		LoopAnim('AirShips_Fly');
}

defaultproperties
{
    bStatic=False
    bStasis=False
	Mesh=SkeletalMesh'Pier_anim.Airships'
	bNoDelete=True
	RemoteRole=ROLE_None
}
