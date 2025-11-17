class SurveillanceCam extends Decoration;     // Decoration

#exec OBJ LOAD FILE=KFMapObjects.ukx

simulated function PostBeginPlay()
{
    if( Level.NetMode != NM_DedicatedServer )
    {
        LinkSkelAnim(MeshAnimation'camera_rotation');
        LoopAnim('Cam_rotation');
    }
}

defaultproperties
{
     bStatic=False
     bStasis=False
     Mesh=SkeletalMesh'KFMapObjects.Trader_Cam'
     bNoDelete=True
     RemoteRole=Role_None
}
