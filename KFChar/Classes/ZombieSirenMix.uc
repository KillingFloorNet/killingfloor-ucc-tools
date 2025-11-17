// Zombie Monster for KF Invasion gametype
class ZombieSirenMix extends ZombieSiren;

simulated function BeginPlay()
{
	LinkSkelAnim(MeshAnimation'Siren_Anim');
	Super.BeginPlay();
}

defaultproperties
{
     Mesh=SkeletalMesh'Patriarch_Freak'
     Skins(0)=Combiner'KF_Specimens_Trip_T.gatling_cmb'
     Skins(1)=Combiner'KF_Specimens_Trip_T.patriarch_cmb'
	KFRagdollName="Patriarch_Trip"
}
