Class PlayerDeathMark extends Info;

function PostBeginPlay()
{
	local KFGameType K;
	local int i;

	K = KFGameType(Level.Game);
	if( K==None )
	{
		Destroy();
		Return;
	}
	i = K.DeathMarkers.Length;
	K.DeathMarkers.Length = i+1;
	K.DeathMarkers[i] = Self;
}
function Destroyed()
{
	local KFGameType K;
	local int i;

	K = KFGameType(Level.Game);
	if( K==None )
		Return;
	for( i=0; i<K.DeathMarkers.Length; i++ )
	{
		if( K.DeathMarkers[i]==None || K.DeathMarkers[i]==Self )
		{
			K.DeathMarkers.Remove(i,1);
			i--;
		}
	}
}

defaultproperties
{
	LifeSpan=14
	CollisionHeight=40
	CollisionRadius=26
	bCollideWorld=True
	bCollideWhenPlacing=True
	Physics=PHYS_Falling
	bCollideActors=True
	bProjTarget=False
}
