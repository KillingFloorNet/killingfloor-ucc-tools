/*
	--------------------------------------------------------------
	KF_Roulette_Ball
	--------------------------------------------------------------

	Bounce Bounce.

	Author :  Alex Quick

	--------------------------------------------------------------
*/

class KF_Roulette_Ball extends Actor
placeable;

/* Animation to play while this ball is rolling */
var name    RollAnim;

function StartRolling()
{
    bFixedRotationDir = true;
    bRotateToDesired = false;

    if(RollAnim != '')
    {
        PlayAnim(RollAnim,1.f,0.1f);
    }
}

function StopRolling()
{
    bFixedRotationDir = false;
    bRotateToDesired = true;
}

defaultproperties
{
    bNoDelete = true
    RotationRate=(Pitch=0,Yaw=19000,Roll=0)
    bStatic = false
    Physics = PHYS_Rotating
    DrawType = DT_Mesh
    DrawScale = 0.75
    PrePivot=(X=-0,Y=0,Z=-5)

    Mesh = SkeletalMesh 'Pier_anim.RTL_Ball'
    Skins(0)=Texture'Engine.DecoPaint'
    RollAnim = "Ball_Roll"
}
