class FlakMuzFlash1st extends MinigunMuzFlash1st;

//#exec OBJ LOAD FILE=xGameShaders.utx
//#exec STATICMESH IMPORT NAME=FlakMuzFlashMesh FILE=Models\FlakMuzFlash.lwo COLLISION=0

defaultproperties
{
    mTileAnimation=false
    mNumTileRows=1
    mNumTileColumns=1
	Skins(0)=none//FinalBlend'XGameShaders.WeaponShaders.FlakFlashFinal' KFTODO: Maybe Replace this texture
	mMeshNodes(0)=none//StaticMesh'FlakMuzFlashMesh' KFTODO: Maybe Replace this Mesh
    mGrowthRate=7.0
    DrawScale=2.2
}

