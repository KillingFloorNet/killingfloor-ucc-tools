
//=============================================================================
class KFHorzineSoldier extends KFHumanPawnEnemy;


defaultproperties
{
	WeaponType=Class'Bullpup'

     GroundSpeed=270.000000
     WaterSpeed=250.000000
     AirSpeed=250.000000
     JumpZ=300.000000
     MaxFallSpeed=6000.000000
     BaseEyeHeight=44.0
     EyeHeight=44.0
     HealthMax=125.000000
     Health=125

     Mesh=SkeletalMesh'KF_Soldier_Trip.British_Soldier1'//SkeletalMesh'KFSoldiers.Soldier'

     Skins(0)=Combiner'KF_Soldier_Trip_T.Uniforms.brit_soldier_I_cmb'//Texture'KFPatch2.Horzine'
     //Skins(1)=Texture'KFPatch2.JimBadge'
     //Skins(2)=Shader'KFPatch2.HorzineGMShader'

     bMuffledHearing= false
     bLOSHearing = true
     Alertness = 1
     HearingThreshold = 2500
}
