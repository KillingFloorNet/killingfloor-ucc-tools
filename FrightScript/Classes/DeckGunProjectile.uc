// The projectiles fired by the Deck Gun in the 2013 Halloween map.

class DeckGunProjectile extends ROBallisticProjectile;

var Emitter Trail;

var Sound ExplosionSound;
var     float       ExplosionSoundVolume;

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    if(Level.NetMode != NM_DedicatedServer)
    {
        Trail = Spawn(class 'DeckGunProjectile_Trail');
        Trail.LifeSpan = LifeSpan;
        Trail.SetBase(self);
    }
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
    local ProjectedDecal VomitDecal ;

    if(Trail != none)
    {
        Trail.Kill();
    }

    if(Level.NetMode != NM_DedicatedServer)
    {
   	    Spawn(class'FrightScript.DeckGunProjectile_Explosion');
    }

    if(Role == Role_Authority && ExplosionSound != none)
    {
        PlaySound(ExplosionSound,SlOT_Misc,ExplosionSoundVolume,true,TransientSoundRadius,,false);
    }

    VomitDecal = Spawn(class'KFMod.VomitDecalGlow',,,, rotator(-HitNormal));
//    VomitDecal = Spawn(class'KFMod.VomitDecalGlow',,,, rotator(-HitNormal));
//    VomitDecal = Spawn(class'KFMod.VomitDecalGlow',,,, rotator(-HitNormal));

    bHidden = true;

    BlowUp(HitLocation);
    Super.Explode(HitLocation,HitNormal);
}


simulated function Tick(float DeltaTime)
{
    SetRotation(Rotator(Normal(Velocity)));
}

simulated event Landed( vector HitNormal )
{
    Super.Landed(HitNormal);
    Explode(Location,HitNormal);
}

function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType, optional int HitIndex)
{
    if(InstigatedBy != none && InstigatedBy.GetTeamNum() == 0)
    {
        Explode(HitLocation, vect(0,0,1));
    }
}


defaultproperties
{
    bCollideActors=true
    bCollideWorld=true

    Skins(0)=Shader'kf_fx_trip_t.Gore.Intestines_Glow_SHDR'
    bProjTarget=true

    Physics=PHYS_Falling
    DrawType=DT_StaticMesh
    StaticMesh = StaticMesh 'kf_gore_trip_sm.bloat_explode'//StaticMesh'DebugObjects.Arrows.debugarrow1'

    AmbientSound = Sound 'Vehicle_Weapons.projectile_whistle01'
    ExplosionSound = sound'KF_EnemiesFinalSnd.Bloat_DeathPop'
    AmbientVolumeScale = 3.5f

    DrawScale=1.0
    Damage=5.000000
    DamageRadius=320.000000

    MaxSpeed=0

    CollisionRadius=30
    CollisionHeight=30

    SoundRadius = 250
    SoundVolume = 255
    ExplosionSoundVolume=2.0

    bTrueBallistics=false
    bInitialAcceleration=false


    MyDamageType=Class'KFMod.DamTypeBileDeckGun'
}
