class Drapes extends Decoration;     // Decoration

#exec OBJ LOAD FILE=KFMapObjects.ukx

function PostBeginPlay() {
   LinkSkelAnim(MeshAnimation'Drapes');
   LoopAnim('Flap');

}

defaultproperties
{
     bStatic=False
     bStasis=False
     Mesh=SkeletalMesh'KFMapObjects.Drapes'
     bNoDelete=True
      RemoteRole=Role_None
}
