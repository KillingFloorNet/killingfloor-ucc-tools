//=============================================================================
// ZEDBeamSplashEffect
//=============================================================================
// Effect of splash damage from the zed gun beam
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// Created by - David Henseley
//=============================================================================
class ZEDBeamSplashEffect extends Emitter;

defaultproperties
{

    Begin Object Class=MeshEmitter Name=MeshEmitter0
        StaticMesh=StaticMesh'kf_generic_sm.fx.siren_scream_ball'
        UseParticleColor=True
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        ColorMultiplierRange=(X=(Min=0.100000,Max=0.100000),Y=(Min=0.100000,Max=0.100000),Z=(Min=0.100000,Max=0.100000))
        FadeOutStartTime=0.100000
        CoordinateSystem=PTCS_Relative
        MaxParticles=1
        Name="MeshEmitter0"
        SpinsPerSecondRange=(X=(Min=0.050000,Max=0.100000),Y=(Min=0.050000,Max=0.100000),Z=(Min=0.050000,Max=0.100000))
        StartSpinRange=(X=(Max=1.000000),Y=(Max=1.000000),Z=(Max=1.000000))
        SizeScale(0)=(RelativeSize=1.000000)
        SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
        InitialParticlesPerSecond=1.000000
        DrawStyle=PTDS_Regular
        LifetimeRange=(Min=0.100000,Max=0.100000)
    End Object
    Emitters(0)=MeshEmitter'MeshEmitter0'






    Skins(0)=Shader'KFZED_FX_T.Energy.ZED_EnergyBall_Shdr'

    bDirectional=True
    bHardAttach=false
    bUnlit=False
    bNoDelete=False
	RemoteRole=ROLE_None
	Physics=PHYS_None
	bBlockActors=False
	CullDistance=20000.0
}


