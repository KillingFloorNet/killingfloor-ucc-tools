  //===================================================================
// ProjectileBodyPart
// Copyright (C) 2012 Tripwire Interactive LLC
// John "Ramm-Jaeger"  Gibson
//
// Base class for body parts that have been blown and attached to a
// projectile to fly through the air, stick to a wall, etc
//===================================================================
class ProjectileBodyPart extends Actor;

var class <Emitter>		BleedingEmitterClass;		// class of the bleeding emitter
var() Emitter Trail;
var() float	MaxSpeed;	// Maximum speed this Gib should move

simulated function PostBeginPlay()
{
   SpawnTrail();
}

simulated function Destroyed()
{
    if( Trail != none )
        Trail.Destroy();

	Super.Destroyed();
}

simulated function SpawnTrail()
{
    if ( Level.NetMode != NM_DedicatedServer )
    {
		Trail = Spawn(BleedingEmitterClass, self,, Location, Rotation);
		Trail.LifeSpan = LifeSpan;//1.8;

		Trail.SetPhysics( PHYS_Trailer );
	}
}

defaultproperties
{
	bUnlit=false
	TransientSoundVolume=+0.17
	BleedingEmitterClass=class'ROBloodSpurt'
	LifeSpan=8.0
    bCollideWorld=false
    bCollideActors=false
    MaxSpeed=100000
    DrawType=DT_StaticMesh
    bHardAttach=True

    RemoteRole=ROLE_None

    Physics=PHYS_none
    bBounce=False

    Mass=30
    bUseCylinderCollision=false
}

