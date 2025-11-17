//=============================================================================
// KFAltMonsterFlame
//=============================================================================
// Low gore "fire" emitter used when zeds are on "fire"
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================

class KFAltMonsterFlame extends Emitter;

defaultproperties
{
    Begin Object Class=SpriteEmitter Name=SpriteEmitter0
        UseColorScale=True
        FadeOut=True
        FadeIn=True
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        Acceleration=(Z=100.000000)
        ColorScale(0)=(Color=(B=190,G=190,R=190,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        FadeOutStartTime=0.540000
        FadeInEndTime=0.460000
        Name="SpriteEmitter0"
        StartLocationRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=-50.000000))
        SpinsPerSecondRange=(X=(Min=0.100000,Max=0.200000))
        StartSpinRange=(X=(Min=-0.500000,Max=0.500000))
        SizeScale(0)=(RelativeTime=1.000000,RelativeSize=10.000000)
        StartSizeRange=(X=(Min=3.000000,Max=6.000000),Y=(Min=3.000000,Max=6.000000),Z=(Min=3.000000,Max=6.000000))
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Effects_Tex.explosions.DSmoke_2'
        SecondsBeforeInactive=0.000000
        LifetimeRange=(Min=1.000000,Max=2.000000)
    End Object
    Emitters(0)=SpriteEmitter'SpriteEmitter0'

	bNoDelete = false

	SoundVolume = 255
	bFullVolume = true
	AmbientSound = Sound'KF_FlamethrowerSnd.FT_SetFire_Self'

	RemoteRole=ROLE_None

	bNotOnDedServer=False
	bOnlyDrawIfAttached = true
}
