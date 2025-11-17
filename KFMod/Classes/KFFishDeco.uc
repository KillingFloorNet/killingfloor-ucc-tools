class KFFishDeco extends Decoration;     // Decoration

#exec OBJ LOAD FILE=HillbillyHorror_anim.ukx

simulated function PostBeginPlay()
{
	if( Level.NetMode!=NM_DedicatedServer )
		LoopAnim('deadfish_anim');
}

defaultproperties
{
	Mesh=SkeletalMesh'HillbillyHorror_anim.deadfish_anim'
	bStatic=False
	bStasis=False	
	bClientAnim=True
	RemoteRole=ROLE_SimulatedProxy
	NetUpdateFrequency=0.5
	bSkipActorPropertyReplication=True
	bAlwaysRelevant=True
}
