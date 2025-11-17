class LaserDot extends DynamicProjector;

simulated function ToggleDot()
{
     if( ProjTexture== default.ProjTexture )
     {
        ProjTexture = Texture'kf_fx_trip_t.Misc.Laser_Dot_Green';
     }
     else
     {
        ProjTexture = Texture'kf_fx_trip_t.Misc.Laser_Dot_Red';
     }
}

simulated function SetValid(bool bNewValid)
{
     if( bNewValid )
     {
        ProjTexture = Texture'kf_fx_trip_t.Misc.Laser_Dot_Green';
     }
     else
     {
        ProjTexture = Texture'kf_fx_trip_t.Misc.Laser_Dot_Red';
     }
}

defaultproperties
{
	 ProjTexture=Texture'kf_fx_trip_t.Misc.Laser_Dot_Red'//Laser_Dot_Green
	 MaterialBlendingOp=PB_Add//PB_Modulate
	 FrameBufferBlendingOp=PB_Add
	 FOV=5//75//50 // 5
	 MaxTraceDistance=100
	 bClipBSP=True
	 bProjectOnUnlit=True
	 bGradient=True
	 bProjectBSP=True
	 bProjectOnAlpha=True
	 bProjectOnBackfaces = false
	 bProjectOnParallelBSP=True
	 bLightChanged=True
	 RemoteRole=ROLE_SimulatedProxy
	 DrawScale=0.25//0.1
	 bNotOnDedServer=False
	 bProjectActor=True
	 bNoProjectOnOwner=true
	bHidden=False
	DrawType=DT_None
	bSkipActorPropertyReplication=True
	//bUnlit=True
//	ProjectorPullbackDist=25
}
