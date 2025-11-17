//=============================================================================
// Laser beam effect for a third person laser site.
// This class is pretty placeholder right now and needs to be cleaned up
//=============================================================================
class LaserBeamEffect extends xEmitter;

#exec OBJ LOAD FILE=kf_fx_trip_t.utx

var Vector StartEffect, EndBeamEffect;
var() vector EffectOffset;
var vector EffectHitNormal;
var LaserDot Spot;
var() float SpotProjectorPullback;

var bool    bLaserActive;
var bool    bCurrentLaserActive;

replication
{
    reliable if (Role == ROLE_Authority)
        StartEffect, EndBeamEffect, EffectHitNormal, bLaserActive;
}

simulated event PostNetReceive()
{
    if( bLaserActive != bCurrentLaserActive )
    {
        bCurrentLaserActive = bLaserActive;

        if( !bLaserActive )
        {
            bHidden = true;
            Spot.Destroy();
        }
        else
        {
            bHidden = false;
        }
    }
}

simulated function SetActive(bool bNewActive)
{
    bLaserActive = bNewActive;
    bCurrentLaserActive = bLaserActive;

    if( !bLaserActive )
    {
        bHidden = true;
        if (Spot != None)
            Spot.Destroy();

        NetUpdateFrequency=5;
    }
    else
    {
        bHidden = false;
        NetUpdateFrequency=100;
    }
}

simulated function Destroyed()
{
    if (Spot != None)
        Spot.Destroy();

    Super.Destroyed();
}

simulated function Tick(float dt)
{
    local Vector BeamDir;
    local BaseKFWeaponAttachment Attachment;
    local rotator NewRotation;
    local float LaserDist;

    if (Role == ROLE_Authority && (Instigator == None || Instigator.Controller == None))
    {
        Destroy();
        return;
    }

    // set beam start location
    if ( Instigator == None )
    {
        // do nothing
    }
    else
    {
        if ( Instigator.IsFirstPerson() && Instigator.Weapon != None )
        {
            bHidden=True;
            if (Spot != None)
            {
                Spot.Destroy();
            }
        }
        else
        {
            bHidden=!bLaserActive;
            if( Level.NetMode != NM_DedicatedServer && Spot == none && bLaserActive)
            {
                Spot = Spawn(class'LaserDot', self);
            }

            LaserDist = VSize(EndBeamEffect - StartEffect);
            if( LaserDist > 100 )
            {
                LaserDist = 100;
            }
            else
            {
                LaserDist *= 0.5;
            }

            Attachment = BaseKFWeaponAttachment(xPawn(Instigator).WeaponAttachment);
            if (Attachment != None && (Level.TimeSeconds - Attachment.LastRenderTime) < 1)
            {
                StartEffect= Attachment.GetTipLocation();
                NewRotation = Rotator(-Attachment.GetBoneCoords('tip').XAxis);
                SetLocation( StartEffect + Attachment.GetBoneCoords('tip').XAxis * LaserDist );
            }
            else
            {
                StartEffect = Instigator.Location + Instigator.EyeHeight*Vect(0,0,1) + Normal(EndBeamEffect - Instigator.Location) * 25.0;
                SetLocation( StartEffect + Normal(EndBeamEffect - StartEffect) * LaserDist );
                NewRotation = Rotator(Normal(StartEffect - Location));
            }
        }
    }

    BeamDir = Normal(StartEffect - Location);
    SetRotation(NewRotation);

    mSpawnVecA = StartEffect;


    if (Spot != None)
    {
        Spot.SetLocation(EndBeamEffect + BeamDir * SpotProjectorPullback);

        if( EffectHitNormal == vect(0,0,0) )
        {
            Spot.SetRotation(Rotator(-BeamDir));
        }
        else
        {
            Spot.SetRotation(Rotator(-EffectHitNormal));
        }
    }
}

defaultproperties
{
    RemoteRole=ROLE_SimulatedProxy
    bNetTemporary=false
    bReplicateInstigator=true

    mParticleType=PT_Beam
    mStartParticles=1
    mAttenuate=false
    mSizeRange(0)=4.0 // width
    mSizeRange(1)=5.0 // width
    mRegenDist=100.0 // section length
    mMaxParticles=3 // planes
    mColorRange(0)=(R=100,B=100,G=100)
    mColorRange(1)=(R=100,B=100,G=100)
    mSpinRange(0)=0 // spin
    mAttenKa=1.0

    Skins(0)=Texture'kf_fx_trip_t.Red_Laser'
    Style=STY_Additive
    bUnlit=true

    SoundVolume=45
    SoundRadius=120
    LifeSpan=99999999
    SpotProjectorPullback=1.0
    bNetNotify=true
    bHidden=true
    bAlwaysRelevant=true
    NetUpdateFrequency=5 // This is always relevant so poeple will see the dot even if the player using the weapon isn't relevant, so keep the net update rate low when its not in use
}
