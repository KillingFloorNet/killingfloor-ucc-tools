//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KFEventListener extends Actor;

var Actor MyActor;

function SetEventListenerInfo( Actor AttachedActor, Name EventName )
{
	MyActor = AttachedActor;
	Tag = EventName;
}

function Trigger( actor Other, pawn EventInstigator )
{
	if ( MyActor != none )
	{
	 	MyActor.ReceivedEvent( Tag );
 	}
}

defaultproperties
{
	bHidden=True
 	CollisionRadius=1
	CollisionHeight=1
	bBlockZeroExtentTraces= False
  	bBlockNonZeroExtentTraces= False
  	RemoteRole = Role_None
}
