// Zombie Monster for KF Invasion gametype
class ZombieFleshPoundMix extends ZombieFleshPound;

simulated function BeginPlay()
{
	LinkSkelAnim(MeshAnimation'FleshPound_anim');
	Super.BeginPlay();
}

// changes colors on Device (notified in anim)
simulated function DeviceGoRed();
simulated function DeviceGoNormal();

defaultproperties
{
	Mesh=SkeletalMesh'GoreFast_Freak'
	Skins(0)=Combiner'KF_Specimens_Trip_T.gorefast_cmb'
	KFRagdollName="GoreFast_Trip"
}