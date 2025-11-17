//=============================================================================
// BlowerThrowerPrimaryEmitter
//=============================================================================
// Primary emitter for the bloat bile thrower projectile
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class BlowerThrowerPrimaryEmitter extends HitFlameBig;

var float LastFlameSpawnTime;
var () float FlameSpawnInterval;

var Emitter SecondaryFlame;

state Ticking
{
    simulated function Tick( float dt )
    {
        if( LifeSpan < 2.0 )
        {
            mRegenRange[0] *= LifeSpan * 0.5;
            mRegenRange[1] = mRegenRange[0];
            SoundVolume = byte(float(SoundVolume) * (LifeSpan * 0.5));
        }

        if (Level.TimeSeconds - LastFlameSpawnTime > FlameSpawnInterval)
        {
            if( SecondaryFlame != none )
            {
                SecondaryFlame.Kill();
            }
          SecondaryFlame =  Spawn(class'BlowerThrowerSecondaryEmitter',self);
        }
    }
}

simulated function Destroyed()
{
    if( SecondaryFlame != none )
    {
        SecondaryFlame.Kill();
    }
}

defaultproperties
{
    mParticleType=PT_Stream
    mDirDev=(X=0.000000,Y=0.000000,Z=0.000000)
    mPosDev=(X=0.000000,Y=0.000000,Z=0.000000)
	mSpeedRange(0)=0.000000
	mSpeedRange(1)=0.000000
	mRegen=True
	mRegenRange(0)=60.000000
	mRegenRange(1)=60.000000
	mRegenDist=0.000000
	mStartParticles=0
	mAttenuate=true
	Physics=PHYS_Trailer
	lifespan=2.9
	mNumTileColumns=1
	mNumTileRows=1
    mSpawnVecB=(X=20.0,Y=0.0,Z=0.0)
    mMaxParticles=100
    mLifeRange(0)=0.300000
    mLifeRange(1)=0.300000
    mGrowthRate=6.000000
    mColorRange(0)=(B=255,G=255,R=255,A=255)
    mColorRange(1)=(B=255,G=255,R=255,A=255)
    mAttenKa=0.000000
    mSizeRange(0)=6.000000
    mSizeRange(1)=6.000000
    Skins(0)=Texture'kf_fx_trip_t.Misc.vomit_trail_d'
    Style=STY_Alpha
}
