//=============================================================================
// KFPawn Enemy version
//=============================================================================
class KFHumanPawnEnemyB extends KFHumanPawnEnemy;

defaultproperties
{
     bCanDodgeDoubleJump=False
     MaxMultiJump=0
     bCanCrouch=False
     bCanDoubleJump=False
     bCanWallDodge=False
     GroundSpeed=0.000000
     WaterSpeed=200.000000
     AirSpeed=200.000000
     JumpZ=300.000000
     MaxFallSpeed=600.000000
     Health=100
     Mesh=SkeletalMesh'KF_Soldier_Trip.British_Soldier1'//SkeletalMesh'KFSoldiers.Soldier'
     Skins(0)=Combiner'KF_Soldier_Trip_T.Uniforms.brit_soldier_I_cmb'//FinalBlend'KFCharacters.GasMaskFinal'
}
