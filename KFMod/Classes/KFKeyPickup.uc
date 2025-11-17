class KFKeyPickup extends Pickup;

function inventory SpawnCopy( pawn Other )
{
	local inventory Copy;

	Copy = Super.SpawnCopy(Other);
	Copy.Tag = Tag;
	if( KFKeyInventory(Copy)!=None )
		KFKeyInventory(Copy).MyPickup = self;
	return Copy;
}

State Sleeping
{
	ignores Touch;
Begin:
}

simulated static function UpdateHUD(HUD H)
{
	H.LastPickupTime = H.Level.TimeSeconds;
}

defaultproperties
{
     RespawnTime=0
     InventoryType=class'KFMod.KFKeyInventory'
     PickupMessage="You found a key"
     DrawType= DT_StaticMesh
     StaticMesh = StaticMesh'KillingFloorLabStatics.KeyCard1'
     DrawScale = 0.1
     CollisionHeight = 5
     CollisionRadius = 20
     PickupSound = Sound'PatchSounds.slide1-3'

     Physics=PHYS_Falling
     
     AmbientGlow = 40
     UV2Texture = FadeColor'PatchTex.Common.PickupOverlay'
     
     MessageClass=class'PickupMessagePlus'
}