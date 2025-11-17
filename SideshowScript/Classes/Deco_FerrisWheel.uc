class Deco_FerrisWheel extends Decoration;

#exec OBJ LOAD FILE=Pier_anim.ukx


simulated function PostBeginPlay()
{
	if( Level.NetMode!=NM_DedicatedServer )
		LoopAnim('Ferriswheel_Spin');
}

defaultproperties
{
    bStatic=False
    bStasis=False
	Mesh=SkeletalMesh'Pier_anim.Ferriswheel'
	bNoDelete=True
	RemoteRole=ROLE_None
}
