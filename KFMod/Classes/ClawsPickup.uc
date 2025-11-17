class ClawsPickup extends WeaponPickup;

// Begin code from UTWeaponPickup
var(WeaponPickup) vector StandUp;	// rotation change used by WeaponLocker
var(WeaponPickup) float LockerOffset;
// End code from UTWeaponPickup

// Begin code from UTWeaponPickup
simulated event ClientTrigger()
{
	bHidden = true;
	// KFTODO: Replace me?
	//if ( EffectIsRelevant(Location, false) && !Level.GetLocalPlayerController().BeyondViewDistance(Location, CullDistance)  )
	//	spawn(class'WeaponFadeEffect',self);
}

function RespawnEffect()
{
	//spawn(class'PlayerSpawnEffect');  // KFTODO: Replace me?
}

State FadeOut
{
	function Tick(float DeltaTime)
	{
		disable('Tick');
	}

	function BeginState()
	{
		bHidden = true;
		LifeSpan = 1.0;
		bClientTrigger = !bClientTrigger;
		if ( Level.NetMode != NM_DedicatedServer )
			ClientTrigger();
	}
}
// End code from UTWeaponPickup

defaultproperties
{
// Begin code from UTWeaponPickup
    MessageClass=class'PickupMessagePlus'
    LockerOffset=+35.0
// End code from UTWeaponPickup

     StandUp=(Y=0.250000,Z=0.000000)
     bWeaponStay=False
     MaxDesireability=0.780000
     InventoryType=Class'KFMod.Claws'
     bAmbientGlow=False
     RespawnTime=0.000000
     PickupMessage="Claws!"
     PickupSound=none
     PickupForce="AssaultRiflePickup"
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'KillingFloorStatics.3PL85_Ground'
     DrawScale=0.500000
     RotationRate=(Yaw=0)
}
