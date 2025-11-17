// A ship mounted gun turret that shoots bloat bile at random players.

class DeckGun extends Actor
placeable;

// is the deck gun actively looking for targets?
var () protected bool bActive;
// Number of seconds between shots
var () const float FireInterval;
// Number of seconds between bursts of projectiles.
var () const float BurstInterval;
// The time the burst last finished.
var protected float LastBurstEndTime;
// The number of projectiles fired in the current burst
var protected int NumFired;
// Amount of time the Projectiles stay up in the air for before hitting.
var () const float ProjectileHangTime;
// Number of projectiles to spawn in each burst before 'cooling down'.
var() const int NumProjectilesPerBurst;
// Type of projectile to fire
var () const class<Projectile> ProjectileType;
// The last time the gun was fired
var protected float LastFireTime;
// amount of spread / aim error when Firing
var () const float AimError;
// The player who we're currently aiming at.
var protected Pawn  TargetPlayer;
// the guy we were last aiming at.
var protected Pawn  LastTarget;
// Jack looks for a new enemy every this amount of seconds.
var () const float FindNewEnemyInterval;
// Time at which we last found a new enemy to throw stuff at.
var protected float LastAcquiredTargetTime;
// Rotation of the gun in the map.
var protected Rotator InitialRotation;
// Animation we want to play on the client.
var protected name PendingClientAnim;
// name of the firing animation for the deck gun.
var () const name FireAnimName;
// Rate to play the firing animation at.  1.f  == Normal speed.
var () const float FireAnimRate;
// Maximum range at which the gun will acquire targets
var () const float MaxAggroRange;
// Sound the gun makes every time it fires.
var() const Sound FiringSound;
// The volume of the shoot sound.
var() const float FiringSoundVolume;
// The radius of the shoot sound.
var() const float FiringSoundRadius;

var protected bool PendingClientStopAnim;

replication
{
    unreliable if(Role == Role_Authority)
        PendingClientAnim,PendingClientStopAnim;
}

simulated function PostNetReceive()
{
    if(PendingClientAnim != '')
    {
        LoopAnim(PendingClientAnim,FireAnimRate,0.1,0);
        PendingClientAnim = '';
    }

    if(PendingClientStopAnim)
    {
        PendingClientStopAnim = false;
        StopAnimating();
    }
}

simulated function PostBeginPlay()
{
    InitialRotation = Rotation;
    DesiredRotation = InitialRotation;
}

/**
 * Randomly picks a living player to shoot at from the controller list.
 *
 * @network						All.
 */
simulated function Tick(float DeltaTime)
{
    if(bActive)
    {
        FindTarget();
        TrackTarget(DeltaTime);
        CheckFire();
    }
}

/**
 * Orients the gun so that it's facing what it's about to shoot at.
 *
 * @network						All.
 */

simulated function TrackTarget(float DeltaTime)
{
    local Rotator TargetDir;

    if(TargetPlayer != none)
    {
        TargetDir = Rotator(TargetPlayer.Location - Location) ;
        DesiredRotation = TargetDir;
    }
}

/**
 * Randomly picks a living player to shoot at from the controller list.
 *
 * @network						Server.
 */

function FindTarget()
{
    local Controller C;
    local array<Pawn> ValidTargets;

    if(level.TimeSeconds - LastAcquiredTargetTime >
    FindNewEnemyInterval || TargetPlayer == none ||
    TargetPlayer.health <= 0)
    {
        for (C = Level.ControllerList; C != None; C = C.NextController)
        {
            if(C.bIsPlayer && C.Pawn != none && C.Pawn.health > 0 &&
            C.Pawn != LastTarget && (MaxAggroRange == 0 || VSize(C.Pawn.Location - Location) <= MaxAggroRange))
            {
                ValidTargets[ValidTargets.length] = C.Pawn;
            }
        }

        // Nothing to aim at.  Check to see if maybe the only guy who's left is our previous target.
        if(ValidTargets.length == 0)
        {
            if(LastTarget != none &&
            LastTarget.Health > 0)
            {
                SetTarget(LastTarget);
            }
        }
        else
        {
            // Randomly pick from the available players.
            SetTarget(ValidTargets[Rand(ValidTargets.length)]);
        }
    }
}

/**
 * Set the specified pawn to be our currently active target.
 *
 * @param		NewTarget		The guy we want to start shooting at.
 * @network						Server.
 */

function SetTarget( Pawn NewTarget)
{
    LastAcquiredTargetTime = Level.TimeSeconds;
    LastTarget = TargetPlayer;
    TargetPlayer = NewTarget;
}

/**
 * Decide if it's time to shoot again.
 *
 * @network						All.
 */

simulated function CheckFire()
{
    if(TargetPlayer != none &&
    Level.TimeSeconds - LastFireTime > FireInterval)
    {
        if(BarrelsAreFacingTarget())
        {
            if(NumFired < NumProjectilesPerBurst)
            {
                LastFireTime = Level.TimeSeconds;
                DoFire();
            }
            else
            {
                if(Level.TimeSeconds - LastBurstEndTime > BurstInterval)
                {
                    NumFired = 0;
                }
            }
        }
    }
}


simulated function bool BarrelsAreFacingTarget()
{
    return true;
}

/**
 * Actually fire the gun.
 *
 * @network						Server.
 */
function DoFire()
{
    local Projectile NewProj;
    local vector SpawnLocation;
    local vector AimErrorVect;
    local float GravityZ;
    local vector TargetLocation;
    local float fTimeEnd;
    local vector NewVelocity;

    if(Role < Role_Authority ||
    ProjectileType == none)
    {
        return;
    }

    SpawnLocation = Location;
    AimErrorVect = VRand() * AimError;
    TargetLocation =  TargetPlayer.Location + AimErrorVect;

    NewProj = Spawn(ProjectileType ,,,SpawnLocation, Rotation);
    if(NewProj == none)
    {
        return;
    }

	fTimeEnd = ProjectileHangTime * ( 1.1/Level.TimeDilation );
	GravityZ = PhysicsVolume.Gravity.Z;
	fTimeEnd = FMax( 0.0001f, fTimeEnd );
	NewVelocity = ( TargetLocation - SpawnLocation ) / fTimeEnd;
	NewVelocity.z = ( ( TargetLocation.z - SpawnLocation.z ) - ( 0.5f * GravityZ * ( fTimeEnd*fTimeEnd ) ) ) / fTimeEnd;

    NewProj.Velocity = NewVelocity;

    NumFired ++ ;

    if(FiringSound != none)
    {
        PlaySound(FiringSound,SLOT_Misc,FiringSoundVolume,false,FiringSoundRadius,,false);
    }

    if(NumFired == NumProjectilesPerBurst)
    {
        LastBurstEndTime = Level.TimeSeconds;
        PendingClientStopAnim = true;
        PendingClientAnim = '' ;
        StopAnimating();
    }
    else
    {
        // Play firing animation.
        PendingClientStopAnim = false;
        PendingClientAnim = FireAnimName;
        if(Level.NetMode != NM_DedicatedServer)
        {
            LoopAnim(PendingClientAnim,FireAnimRate,0.1,0);
        }
    }

}

// Triggering the Deck-gun actives it.
function Trigger( Actor Other, Pawn EventInstigator )
{
    bActive = !bActive;
    if(!bActive)
    {
        DesiredRotation = InitialRotation;
    }
}


defaultproperties
{
    MaxAggroRange = 5000

    FireAnimName="Fire"
    FireAnimRate = 2.f

    FiringSoundVolume=2.0
    FiringSoundRadius=1000.0

    NumProjectilesPerBurst = 9
    BurstInterval = 3.0
    ProjectileHangTime = 3

    bDirectional = true
    bBlockActors = false
    bCollideActors = false

    bFixedRotationDir = false
    Physics = PHYS_Rotating
    RotationRate=(Pitch=0,Yaw=15000,Roll=0)

    DrawType = DT_Mesh
    Mesh = Mesh'Frightyard_SKM.DeckGunSKM'

    bNoDelete = true
    RemoteRole = Role_SimulatedProxy
    bAlwaysRelevant = true
    NetUpdateFrequency = 8
    bNetNotify=true

    bRotateToDesired = true

    ProjectileType = class 'DeckGunProjectile'
}
