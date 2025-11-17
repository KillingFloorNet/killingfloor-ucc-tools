class KFLawMuzzFlash extends Emitter;

defaultproperties
{
  
  Begin Object Class=SpriteEmitter Name=LAWMuzzFlashEmitter
    FadeOut=True
    SpinParticles=True
    BlendBetweenSubdivisions=True
    ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
    ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
    FadeOutStartTime=0.037500
    CoordinateSystem=PTCS_Relative
    MaxParticles=3
    Name="LAWMuzzFlashEmitter"
    StartLocationOffset=(X=8.000000)
    SpinsPerSecondRange=(X=(Max=0.200000))
    StartSpinRange=(X=(Max=0.500000))
    StartSizeRange=(X=(Min=25.000000,Max=35.000000))
    InitialParticlesPerSecond=5000.000000
    Texture=Texture'PatchTex.Common.1PMuzzFlashSkin'
    TextureUSubdivisions=1
    TextureVSubdivisions=1
    LifetimeRange=(Min=0.10000,Max=0.10000)

    RespawnDeadParticles=False
    AutomaticInitialSpawning=False

End Object

  Emitters(0) = SpriteEmitter'LAWMuzzFlashEmitter'

  bHardAttach=true
  bNoDelete=false
  bBlockActors=false
  bCollideActors=false
  RemoteRole=ROLE_None
  Physics=PHYS_None
}

