//=============================================================================
// Zombie ShotgunBullet
//=============================================================================
class ZombieShotgunBullet extends ShotgunBullet;

defaultproperties
{
     DamageAtten=5.000000
     MaxPenetrations=2
     PenDamageReduction=0.500000
     HeadShotDamageMult=1.500000
     Speed=3500.000000
     MaxSpeed=4000.000000
     bSwitchToZeroCollision=True
     Damage=12.000000
     DamageRadius=0.000000
     MomentumTransfer=50000.000000
     MyDamageType=Class'KFMod.DamTypeShotgun'
     ExplosionDecal=Class'KFMod.ShotgunDecal'
     DrawType=DT_StaticMesh
     StaticMesh=none//StaticMesh'WeaponStaticMesh.FlakChunk'  KFTODO: Replace this
     CullDistance=3000.000000
     LifeSpan=3.000000
     DrawScale=9.000000
     Style=STY_Alpha
}
