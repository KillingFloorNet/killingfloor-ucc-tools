class WaterHitEmitter extends KFHitEmitter;

defaultproperties
{
     ImpactSounds(0)=sound'ProjectileSounds.Bullets.Impact_Snow'
     ImpactSounds(1)=sound'ProjectileSounds.Bullets.Impact_Snow'
     ImpactSounds(2)=sound'ProjectileSounds.Bullets.Impact_Snow'
     ImpactSounds(3)=Sound'Inf_Player.FootstepWaterShallow'
     ImpactSounds(4)=Sound'Inf_Player.FootstepWaterShallow'
     ImpactSounds(5)=sound'Inf_Player.FootStepWaterDeep'
     Begin Object Class=SpriteEmitter Name=SpriteEmitter0
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UniformSize=True
         AutomaticInitialSpawning=False
         BlendBetweenSubdivisions=True
         Acceleration=(Z=-200.000000)
         ColorMultiplierRange=(X=(Min=0.200000,Max=0.200000),Y=(Min=0.250000,Max=0.250000),Z=(Min=0.300000,Max=0.300000))
         FadeOutStartTime=0.500000
         MaxParticles=20
         StartSpinRange=(X=(Min=10000.000000,Max=10000.000000))
         StartSizeRange=(X=(Min=5.000000,Max=10.000000))
         InitialParticlesPerSecond=1000.000000
         DrawStyle=PTDS_Brighten
         Texture=none//Texture'EmitterTextures.MultiFrame.MistTexture' KFTODO: Replace this
         TextureUSubdivisions=2
         TextureVSubdivisions=2
         LifetimeRange=(Min=2.000000,Max=3.000000)
         StartVelocityRange=(X=(Min=50.000000,Max=100.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000,Max=50.000000))
     End Object
     Emitters(0)=SpriteEmitter'KFMod.WaterHitEmitter.SpriteEmitter0'

}
