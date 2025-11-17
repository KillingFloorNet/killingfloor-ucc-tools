class WebPickup extends Pickup
	notplaceable;

var() int WhichOne;

function Touch(Actor Other)
{
	if ( WhichOne < 100000 && KFPawn(Other) != none )
	{
		//KFPawn(Other).ClientDoIt(WhichOne);
	}
}

auto state Pickup
{
	function Touch(Actor Other)
	{
		if ( WhichOne < 100000 && KFPawn(Other) != none )
		{
			//KFPawn(Other).ClientDoIt(WhichOne);
		}
	}
}

event UsedBy(Pawn User)
{
	if ( KFPawn(User) != none )
	{
		//KFPawn(User).ClientDoIt(WhichOne);
	}
}

defaultproperties
{
 	 RespawnTime=9999.0
	 InventoryType=class'UnrealGame.KeyInventory'
     PickupMessage="You picked up a Key."

     DrawType= DT_StaticMesh
     StaticMesh = none
     DrawScale = 0.1
     CollisionHeight = 5
     CollisionRadius = 20
     PickupSound = none

     Physics=PHYS_Falling

     AmbientGlow = 0
     UV2Texture = none
}
