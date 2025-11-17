// Chainsaw Zombie Monster for KF Invasion gametype
// He's not quite as speedy as the other Zombies, But his attacks are TRULY damaging.
class ZombieScrakeMix extends ZombieScrake;

simulated function BeginPlay()
{
	LinkSkelAnim(MeshAnimation'Scrake_Anim');
	Super.BeginPlay();
}

defaultproperties
{
     Mesh=SkeletalMesh'Crawler_Freak'
     Skins(0)=Combiner'KF_Specimens_Trip_T.crawler_cmb'
	KFRagdollName="Crawler_Trip"
	PrePivot=(Z=-30)
	DrawScale=1.3
}
