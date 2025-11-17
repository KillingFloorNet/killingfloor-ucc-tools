// Zombie Monster for KF Invasion gametype
class ZombieBossMix extends ZombieBoss;

simulated function BeginPlay()
{
	LinkSkelAnim(MeshAnimation'Patriarch_Anim');
	Super.BeginPlay();
}

defaultproperties
{
	Mesh=SkeletalMesh'CLOT_Freak'
	Skins(0)=Combiner'KF_Specimens_Trip_T.clot_cmb'
	KFRagdollName="Clot_Trip"
}