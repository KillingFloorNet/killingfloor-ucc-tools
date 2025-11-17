class KFBloodSplatter extends Projector
	Placeable;

var() bool bLevelArt;

/*
function PreBeginPlay();

simulated function PostBeginPlay()
{
	local vector RX, RY, RZ;
	local Rotator R;

	
        if (bLevelArt)
        {
	 LifeSpan = 9999;
         return;
        }


        if( Level.NetMode==NM_DedicatedServer )
	{
		Destroy();
		Return;
	}

        ProjTexture = splats[Rand(3)];
	if( RandomOrient )
	{
		R.Roll = Rand(65535);
		GetAxes(R,RX,RY,RZ);
		RX = RX >> Rotation;
		RY = RY >> Rotation;
		RZ = RZ >> Rotation;
		R = OrthoRotation(RX,RY,RZ);
		SetRotation(R);
	}
	AttachProjector(FadeInTime);
	if( !bLevelArt )
		AbandonProjector(LifeSpan);
	else AbandonProjector();
	Destroy();
}

*/
defaultproperties
{
	bLevelArt=false
	bLevelStatic = true
//	LifeSpan=25.000000
//	bNoDelete=False
//	RemoteRole=ROLE_None
        bProjectActor = false
        
        FOV=6
       bClipStaticMesh=True
       CullDistance=+7000.0
       bClipBSP = true


}
