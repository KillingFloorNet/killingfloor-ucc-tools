//=============================================================================
// SPShotgunBullet
//=============================================================================
// Steampunk Shotgun Bullet
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SPShotgunBullet extends ShotgunBullet;

defaultproperties
{
     DamageAtten=5.000000
     MaxPenetrations=2
     PenDamageReduction=0.750000
     HeadShotDamageMult=1.500000
     Speed=3500.000000
     MaxSpeed=2000.000000
     bSwitchToZeroCollision=True
     Damage=20.000000
     DamageRadius=0.000000
     MomentumTransfer=60000.000000
     MyDamageType=Class'KFMod.DamTypeSPShotgun'
     ExplosionDecal=Class'KFMod.ShotgunDecal'
     DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'kf_generic_sm.Shotgun_Pellet'
     CullDistance=3000.000000
     LifeSpan=3.000000
     DrawScale=1.5
     Style=STY_Alpha
     ImpactEffect=class'ROBulletHitEffect'
}
