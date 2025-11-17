class KF_StoryNPC_AI extends ScriptedController;

var		KF_StoryNPC 	StoryPawn;

simulated function int GetTeamNum()
{
	if(StoryPawn == none)
	{
		return 255;
	}
	else
	{
		return StoryPawn.TeamIndex;
	}
}

function bool SameTeamAs(Controller C)
{
	if(KFMonsterController(C) != none)
	{
		return false;
	}

	return true;
}

function Possess(Pawn aPawn)
{
	Super.Possess(aPawn);

	StoryPawn = KF_StoryNPC(Pawn);
	if(StoryPawn != none)
	{
		bIsPlayer = true;
	}
}


defaultproperties
{
	FovAngle=+00085.000000
	bCanOpenDoors=true
	bCanDoSpecial=true
	bIsPlayer=false
	bStasis=false
 	RotationRate=(Pitch=3072,Yaw=30000,Roll=2048)
	RemoteRole=ROLE_None
}
