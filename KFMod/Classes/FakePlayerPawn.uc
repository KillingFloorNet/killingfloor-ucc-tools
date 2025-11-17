// Blame me for doing "Team-Kill" attempt!
Class FakePlayerPawn extends Pawn
	NotPlaceable;

Auto state DoNothing
{
Ignores Trigger,Bump,HitWall,HeadVolumeChange,PhysicsVolumeChange,Falling,BreathTimer,Timer,TakeDamage,Died,TurnOff,PostRender2D;
}

defaultproperties
{
	RemoteRole=ROLE_None
	bHidden=True
	bMovable=False
	bCollideWorld=False
	bCollideActors=False
	Health=0
	CollisionRadius=0
	CollisionHeight=0
	DrawType=DT_None
	bNoTeamBeacon=True
}
