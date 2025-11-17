// Less ugly than the UT2k4 one, anyway :)

class FlameThrowerFlame extends HitFlame;

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
          SecondaryFlame =  Spawn(class'FlameThrowerFlameB',self);
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
     mSizeRange(0)=4
     mSizeRange(1)=8

     mAttraction = 100

     mLifeRange(0)=1
     mLifeRange(1)=1.5

     Skins(0)=Texture'KFX.KFFlames'
     //LifeSpan=1
     RemoteRole=ROLE_None
     bNotOnDedServer=False
     AmbientSound=Sound'Amb_Destruction.Kessel_Fire_Small_Barrel'//Sound'PatchSounds.OnFire'
     SoundVolume = 255
     TransientSoundVolume = + 50
     TransientSoundRadius = 50

    // mSpinRange(0)=0
    // mSpinRange(1)=0

    // mSpeedRange(0)=3000
    // mSpeedRange(1)=4000

     mAttenFunc = ATF_None

     Style = STY_Additive

     mRandOrient = false
     mRandTextures = true

     mMassRange(0)=0.5
     mMassRange(1)=1


      mParticleType=PT_Stream
      mRegenRange(0)=60.000000
      mRegenRange(1)=60.000000
      Physics=PHYS_Trailer

      mAttenKa = 0
      mAttenKb = 0

      mGrowthRate = -52

      FlameSpawnInterval = 0.5


}
