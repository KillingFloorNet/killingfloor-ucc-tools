class AnimatedRachel extends Decoration;     // Decoration

#exec OBJ LOAD FILE=KF_RachelC_anim.ukx

var bool bTriggered;
var bool bTriggeredAnimation;

simulated function PostBeginPlay()
{
If ( Level.NetMode != NM_DedicatedServer)
	{
		LoopAnim('Idle_Fidget');
	}
}

simulated function Trigger( actor Other, pawn EventInstigator )
{
	if ( Level.NetMode != NM_DedicatedServer )
	{
		if (!bTriggeredAnimation)
		{
			bTriggeredAnimation = TRUE;
			LoopAnim('Idle_Gesticulate');
		}
		ELSE
		{
			bTriggeredAnimation = FALSE;
			LoopAnim('Idle_Fidget');
		}
	}

	bClientTrigger = !bClientTrigger;

}

simulated event ClientTrigger()
{
	if ( Level.NetMode != NM_DedicatedServer )
	{
		if (!bTriggeredAnimation)
		{
			bTriggeredAnimation = TRUE;
			LoopAnim('Idle_Gesticulate');
		}
		ELSE
		{
			bTriggeredAnimation = FALSE;
			LoopAnim('Idle_Fidget');
		}
	}
}

defaultproperties
{
	bStatic=False
	bStasis=False
	Mesh=SkeletalMesh'KF_RachelC_anim.RachelC_mesh''
	DrawScale=1
	RemoteRole=ROLE_SimulatedProxy
	bNoDelete=True
	NetUpdateFrequency=0.5
	bSkipActorPropertyReplication=True
	bAlwaysRelevant=True
}
