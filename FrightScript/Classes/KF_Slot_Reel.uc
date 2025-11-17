/*
	--------------------------------------------------------------
	KF_Slot_Reel
	--------------------------------------------------------------

	Reel Actor used in conjunction with KF_Slot_Machines.
    It spins around.

	Author :  Alex Quick

	--------------------------------------------------------------
*/

class KF_Slot_Reel extends Actor
placeable;

defaultproperties
{
    RotationRate=(Pitch=0,Yaw=0,Roll=190000)
    bUnlit = true
    bStatic = false
    Physics = PHYS_Rotating
    DrawType = DT_StaticMesh
    StaticMesh = StaticMesh 'FrightYard2_SM.FY_SlotReel'
    NetUpdateFrequency = 1
}
