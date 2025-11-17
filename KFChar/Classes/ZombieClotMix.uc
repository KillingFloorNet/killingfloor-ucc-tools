// Zombie Monster for KF Invasion gametype
class ZombieClotMix extends ZombieClot;

simulated function BeginPlay()
{
	LinkSkelAnim(MeshAnimation'Clot_anim');
	Super.BeginPlay();
}

defaultproperties
{
	Mesh=SkeletalMesh'Stalker_Freak'
	Skins(0)=Combiner'KF_Specimens_Trip_T.stalker_cmb'
	Skins(1)=FinalBlend'KF_Specimens_Trip_T.stalker_fb'
	KFRagdollName="Stalker_Trip"
}
