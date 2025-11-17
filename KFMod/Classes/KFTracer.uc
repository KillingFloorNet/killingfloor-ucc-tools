//=============================================================================
// Tracer Bullet
//=============================================================================
class KFTracer extends pclSmoke;

defaultproperties
{
	//Style=STY_Translucent
    Style=STY_Additive
    mParticleType=PT_Stream
    mDirDev=(X=0.000000,Y=0.000000,Z=0.000000)
    mPosDev=(X=0.000000,Y=0.000000,Z=0.000000)
	mLifeRange(0)=0.1
	mLifeRange(1)=0.1
	mSpeedRange(0)=0.000000
	mSpeedRange(1)=0.000000
    mSizeRange(0)=5.000000
    mSizeRange(1)=5.000000
	mRegen=True
	mRegenRange(0)=60.000000
	mRegenRange(1)=60.000000
	mRegenDist=0.000000
	mStartParticles=0
	mAttenuate=true
	mMaxParticles=40
	mGrowthRate=-0.5
	Skins(0)=Texture'KFX.TransTrailT'
	Physics=PHYS_Trailer
	lifespan=2.9
	mNumTileColumns=1
	mNumTileRows=1
    mColorRange(0)=(R=252,G=231,B=82,A=100)
    mColorRange(1)=(R=252,G=231,B=82,A=100)

    mSpawnVecB=(X=20.0,Y=0.0,Z=0.0)

}
