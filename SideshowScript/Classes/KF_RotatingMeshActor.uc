/*
	--------------------------------------------------------------
	KF_RotatingMeshActor
	--------------------------------------------------------------

    A simple actor used in the 2013 Summer SideShow map.

    it spins around.

	Author :  Alex Quick

	--------------------------------------------------------------
*/

class KF_RotatingMeshActor extends Actor
placeable;

defaultproperties
{
	bEdShouldSnap=True
	bStaticLighting=True
	bShadowCast=True
	bCollideActors=True
	bBlockActors=False
	bBlockKarma=False
    CollisionHeight=+000001.000000
	CollisionRadius=+000001.000000
	bAcceptsProjectors=True
    bUseDynamicLights=true

    bStatic = false
    bNoDelete = true

    bFixedRotationDir = true
    Physics = PHYS_Rotating

    DrawType = DT_StaticMesh
    StaticMesh = StaticMesh 'OfficeStatics.AirConditioner'
    RemoteRole = ROLE_None

    RotationRate=(Pitch=0,Yaw=5000,Roll=)
}
