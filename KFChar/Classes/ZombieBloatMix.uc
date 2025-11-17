// Zombie Monster for KF Invasion gametype
class ZombieBloatMix extends ZombieBloat;

simulated function BeginPlay()
{
	LinkSkelAnim(MeshAnimation'Bloat_anim');
	Super.BeginPlay();
}

defaultproperties
{
	Mesh=SkeletalMesh'FleshPound_Freak'
	Skins(0)=Combiner'KF_Specimens_Trip_T.fleshpound_cmb'
	Skins(1)=Shader'KFCharacters.FPAmberBloomShader'
	KFRagdollName="FleshPound_Trip"
}