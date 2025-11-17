// In case you want to put a basic mesh in the world which spawns Squirrelzero's lightsourced Shadows...

class RealTimeShadowMeshActor extends pawn;

var Effect_ShadowController RealtimeShadow;
var () bool bRealtimeShadows; // Advanced Shadows care of Squirrelzero's code.


simulated function PostBeginPlay()
{

  if (bActorShadows &&(Level.NetMode != NM_DedicatedServer))
	{
		// decide which type of shadow to spawn
		if (bRealtimeShadows)
		{
			RealtimeShadow = Spawn(class'Effect_ShadowController',self,'',Location);
			RealtimeShadow.Instigator = self;
			RealtimeShadow.Initialize();
		}
	}

}

function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType, optional int HitIndex){}


defaultproperties
{
  bRealtimeShadows = true


  bMovable = false
  bStasis = false
  DrawType=DT_StaticMesh
  StaticMesh=StaticMesh'GKStaticMeshes.basicShapes.BasicCube'

  ControllerClass=none

  bCanBeDamaged=false
  bInvulnerableBody = true
  bJumpCapable=false
  bCanJump=false
  bCanWalk=false
  bCanSwim=false
  bCanFly=false

  Physics = PHYS_None

  CollisionHeight = 40
  CollisionRadius = 20

  bStaticLighting = true

}

