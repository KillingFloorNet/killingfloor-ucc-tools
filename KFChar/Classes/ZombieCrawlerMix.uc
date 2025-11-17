// Zombie Monster for KF Invasion gametype
class ZombieCrawlerMix extends ZombieCrawler;

simulated function BeginPlay()
{
	LinkSkelAnim(MeshAnimation'Crawler_Anim');
	Super.BeginPlay();
}

defaultproperties
{
	Mesh=SkeletalMesh'Siren_Freak'
	Skins(0)=FinalBlend'KF_Specimens_Trip_T.siren_hair_fb'
	Skins(1)=Combiner'KF_Specimens_Trip_T.siren_cmb'
	KFRagdollName="Siren_Trip"
	PrePivot=(Z=20)
}
