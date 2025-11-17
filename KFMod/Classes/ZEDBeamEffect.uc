//=============================================================================
// ZEDBeamEffect
//=============================================================================
// Zed Eradication Device Beam Effect
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
// Portions derived from LinkBeamEffect Copyright (C) Epic Games
//=============================================================================
class ZEDBeamEffect extends xEmitter;

var Vector	StartEffect, EndEffect;
var bool	bLockedOn, bHitSomething;
var Vector	EffectOffset;
var Vector	PrevLoc;
var Rotator PrevRot;
var float	scorchtime;

var ZedBeamSparks			Sparks;
var ZEDBeamSplashEffect		ProtSphere;

var float SphereCharge;


replication
{
    unreliable if (Role == ROLE_Authority)
        bHitSomething, SphereCharge;

    unreliable if ( (Role == ROLE_Authority) && (!bNetOwner || bDemoRecording || bRepClientDemo)  )
        StartEffect, EndEffect;
}


simulated function Destroyed()
{
    if ( Sparks != None )
    {
        Sparks.SetTimer(0, false);
        Sparks.mRegen = false;
        Sparks.LightType = LT_None;
    }

    if ( ProtSphere != None )
        ProtSphere.Destroy();

    Super.Destroyed();
}

simulated function SetBeamLocation()
{
	local KFWeaponAttachment Attachment;

	if ( Level.NetMode == NM_DedicatedServer )
    {
        StartEffect = Instigator.Location + Instigator.EyeHeight*Vect(0,0,1);
        SetLocation( StartEffect );
        return;
    }

    if ( Instigator == None )
    {
        SetLocation( StartEffect );
    }
    else
    {
		if ( Instigator.IsFirstPerson() )
        {
            if ( (Instigator.Weapon == None) || (Instigator.Weapon.Instigator == None) )
 		        SetLocation( Instigator.Location );
            else
				SetLocation(ZEDGun(Instigator.Weapon).GetFirstPersonBeamFireStart());//SetLocation(Instigator.Weapon.GetEffectStart() - 120 * vector(Instigator.Controller.Rotation));
        }
        else
        {
            Attachment = KFWeaponAttachment(xPawn(Instigator).WeaponAttachment);
            if ( Attachment != None && (Level.TimeSeconds - Attachment.LastRenderTime) < 1 )
                SetLocation( Attachment.GetTipLocation() );
            else
                SetLocation( Instigator.Location + Normal(EndEffect - Instigator.Location) * 25.0 );
        }
        if ( Role == ROLE_Authority ) // what clients will use if their instigator is not relevant yet
            StartEffect = Location;
    }
}

simulated function Vector SetBeamRotation()
{
    if ( (Instigator != None) && PlayerController(Instigator.Controller) != None )
        SetRotation( Instigator.Controller.GetViewRotation() );
    else
        SetRotation( Rotator(EndEffect - Location) );

	return Normal(EndEffect - Location);
}

simulated function bool CheckMaxEffectDistance(PlayerController P, vector SpawnLocation)
{
	return !P.BeyondViewDistance(SpawnLocation,1000);
}


simulated function Tick(float dt)
{
    local float LocDiff, RotDiff, WiggleMe,ls;
    local Vector BeamDir, HitLocation, HitNormal;
    local actor HitActor;
	local PlayerController P;
    if ( Role == ROLE_Authority && (Instigator == None || Instigator.Controller == None) )
    {
        Destroy();
        return;
    }

	// set beam start location
	SetBeamLocation();
	BeamDir = SetBeamRotation();

	if ( Level.NetMode != NM_DedicatedServer )
	{
		if ( Sparks == None && EffectIsRelevant(EndEffect, false) )
		{
			P = Level.GetLocalPlayerController();
			if ( (P == Instigator.Controller) || CheckMaxEffectDistance(P, Location) )
				Sparks = Spawn(class'ZedBeamSparks', self);
		}

        if ( (ProtSphere == None) && (Level.NetMode != NM_DedicatedServer) )
        {
            ProtSphere = Spawn(class'ZEDBeamSplashEffect');
        }
	}
    ls = 1.0;

    if ( Level.bDropDetail || Level.DetailMode == DM_Low )
    {
		bDynamicLight = false;
        LightType = LT_None;
    }
    else if ( bDynamicLight )
        LightType = LT_Steady;

    mSpawnVecA = EndEffect;

    mWaveLockEnd = bLockedOn;

    // magic wiggle code
    if ( bLockedOn )
    {
        mWaveAmplitude = FMax(0.0, mWaveAmplitude - (mWaveAmplitude+5)*4.0*dt);
    }
    else
    {
        LocDiff			= VSize((Location - PrevLoc) * Vect(1,1,5));
        RotDiff			= VSize(Vector(Rotation) - Vector(PrevRot));
        WiggleMe		= FMax(LocDiff*0.02, RotDiff*4.0);
        mWaveAmplitude	= FMax(1.0, mWaveAmplitude - mWaveAmplitude*1.0*dt);
        mWaveAmplitude	= FMin(16.0, mWaveAmplitude + WiggleMe);
    }

    PrevLoc = Location;
    PrevRot = Rotation;

    if ( Sparks != None )
    {
        Sparks.SetLocation( EndEffect - BeamDir*10.0 );
        if ( bHitSomething )
            Sparks.SetRotation( Rotation);
        else
            Sparks.SetRotation( Rotator(-BeamDir) );
        Sparks.mRegenRange[0] = Sparks.DesiredRegen;
        Sparks.mRegenRange[1] = Sparks.DesiredRegen;
        Sparks.bDynamicLight = true;
    }

    if ( bHitSomething )
    {
        if ( ProtSphere != None )
        {
            ProtSphere.SetLocation( EndEffect );
            ProtSphere.SetRotation( Rotation );
            ProtSphere.bHidden = false;
            ProtSphere.Emitters[0].SizeScale[0].RelativeSize = Lerp( SphereCharge, 0, 3.75 );
            ProtSphere.Emitters[0].SizeScale[1].RelativeSize = Lerp( SphereCharge, 0, 3.75 );
        }
    }
    else
    {
        if ( ProtSphere != None )
			ProtSphere.bHidden = true;
    }

    if ( bHitSomething && (Level.NetMode != NM_DedicatedServer) && (Level.TimeSeconds - ScorchTime > 0.07) )
    {
		ScorchTime = Level.TimeSeconds;
		HitActor = Trace(HitLocation, HitNormal, EndEffect + 100*BeamDir, EndEffect - 100*BeamDir, true);
		if ( (HitActor != None) && HitActor.bWorldGeometry )
			spawn(class'KFMod.FlameThrowerBurnMark_Small',,,HitLocation,rotator(-HitNormal));
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
    mSizeRange(0)=6.0 // width
    mRegenDist=65.0 // section length
    mMaxParticles=3 // planes
    mColorRange(0)=(R=240,B=240,G=240)
    mColorRange(1)=(R=240,B=240,G=240)
    mSpinRange(0)=45000 // spin
    mAttenKa=0.0
    mWaveFrequency=0.06
    mWaveAmplitude=8.0
    mWaveShift=100000.0
    mBendStrength=3.0
    mWaveLockEnd=true

    Skins(0)=FinalBlend'KFZED_FX_T.Energy.ZED_FX_Beam_FB'
    Style=STY_Additive
    bUnlit=true
    EffectOffset=(X=22,Y=11,Z=1.4)

    bDynamicLight=true
    LightType=LT_Steady
    LightRadius=4
    LightHue=100 // 0=red 160=blue 40=yellow
    LightSaturation=100
    LightBrightness=255
    LightEffect=LE_QuadraticNonIncidence
}
