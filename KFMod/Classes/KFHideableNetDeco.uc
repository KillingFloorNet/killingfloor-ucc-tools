class KFHideableNetDeco extends Actor
placeable;

defaultproperties
{
    DrawType=DT_StaticMesh
    StaticMesh=StaticMesh'GKStaticMeshes.basicShapes.BasicCube'
    CollisionRadius=0.0
    CollisionHeight=0.0
    RemoteRole=ROLE_DumbProxy
    bStasis=True
    //bReplicateAnimations=True
}