//=============================================================================
// ZEDMKIIFire
//=============================================================================
// Secondary fire class for the Zed Gun Mark II Weapon
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ZEDMKIIAltFire extends KFShotgunFire;

// Overridden to prevent firing from working for this mode if you don't have enough ammo
simulated function bool AllowFire()
{
	if(KFWeapon(Weapon).bIsReloading)
		return false;
	if(KFPawn(Instigator).SecondaryItem!=none)
		return false;
	if(KFPawn(Instigator).bThrowingNade)
		return false;

	if(KFWeapon(Weapon).MagAmmoRemaining < AmmoPerFire)
	{
    	if( Level.TimeSeconds - LastClickTime>FireRate )
    	{
    		LastClickTime = Level.TimeSeconds;
    	}

		if( AIController(Instigator.Controller)!=None )
			KFWeapon(Weapon).ReloadMeNow();
		return false;
	}

	return super(WeaponFire).AllowFire();
}

// Overridden to force just 1 projectile, while using more ammo per shot
function DoFireEffect()
{
    local Vector StartProj, StartTrace, X,Y,Z;
    local Rotator R, Aim;
    local Vector HitLocation, HitNormal;
    local Actor Other;
    local int p;
    local int SpawnCount;
    local float theta;

    Instigator.MakeNoise(1.0);
    Weapon.GetViewAxes(X,Y,Z);

    StartTrace = Instigator.Location + Instigator.EyePosition();// + X*Instigator.CollisionRadius;
    StartProj = StartTrace + X*ProjSpawnOffset.X;
    if ( !Weapon.WeaponCentered() && !KFWeap.bAimingRifle )
	    StartProj = StartProj + Weapon.Hand * Y*ProjSpawnOffset.Y + Z*ProjSpawnOffset.Z;

    // check if projectile would spawn through a wall and adjust start location accordingly
    Other = Weapon.Trace(HitLocation, HitNormal, StartProj, StartTrace, false);

// Collision attachment debugging
 /*   if( Other.IsA('ROCollisionAttachment'))
    {
    	log(self$"'s trace hit "$Other.Base$" Collision attachment");
    }*/

    if (Other != None)
    {
        StartProj = HitLocation;
    }

    Aim = AdjustAim(StartProj, AimError);

    SpawnCount = ProjPerFire;

    switch (SpreadStyle)
    {
    case SS_Random:
        X = Vector(Aim);
        for (p = 0; p < SpawnCount; p++)
        {
            R.Yaw = Spread * (FRand()-0.5);
            R.Pitch = Spread * (FRand()-0.5);
            R.Roll = Spread * (FRand()-0.5);
            SpawnProjectile(StartProj, Rotator(X >> R));
        }
        break;
    case SS_Line:
        for (p = 0; p < SpawnCount; p++)
        {
            theta = Spread*PI/32768*(p - float(SpawnCount-1)/2.0);
            X.X = Cos(theta);
            X.Y = Sin(theta);
            X.Z = 0.0;
            SpawnProjectile(StartProj, Rotator(X >> Aim));
        }
        break;
    default:
        SpawnProjectile(StartProj, Aim);
    }

	if (Instigator != none )
	{
        if( Instigator.Physics != PHYS_Falling  )
        {
            Instigator.AddVelocity(KickMomentum >> Instigator.GetViewRotation());
		}
		// Really boost the momentum for low grav
        else if( Instigator.Physics == PHYS_Falling
            && Instigator.PhysicsVolume.Gravity.Z > class'PhysicsVolume'.default.Gravity.Z)
        {
            Instigator.AddVelocity((KickMomentum * LowGravKickMomentumScale) >> Instigator.GetViewRotation());
        }
	}
}

defaultproperties
{
    ProjPerFire=1
    AmmoPerFire=15
    TransientSoundVolume=2.000000
    TransientSoundRadius=500.000000
    FireSoundRef="KF_FY_ZEDV2SND.WEP_ZEDV2_Secondary_Fire_M"
    StereoFireSoundRef="KF_FY_ZEDV2SND.WEP_ZEDV2_Secondary_Fire_S"
    NoAmmoSoundRef="KF_ZEDGunSnd.KF_WEP_ZED_Dryfire"
    FireRate=0.75
    FireAnimRate=1.0
    TweenTime=0.025000
    AmmoClass=Class'KFMod.ZEDMKIIAmmo'
    ProjectileClass=Class'KFMod.ZEDMKIISecondaryProjectile'
    ProjSpawnOffset=(X=50,Y=18,Z=-14.5)
    BotRefireRate=0.250000
    FlashEmitterClass=Class'KFMod.ZEDMKIIPrimaryMuzzleFlash1P'
    aimerror=42.000000
    Spread=0.017500
    RecoilRate=0.1
    maxVerticalRecoilAngle=1500
    maxHorizontalRecoilAngle=400
    FireAnim=Alt_Fire
    FireAimedAnim=Alt_Fire_Iron
    bWaitForRelease=true
    bModeExclusive=false

	//** View shake **//
    ShakeOffsetMag=(X=6.0,Y=2.0,Z=10.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.0
    ShakeRotMag=(X=50.0,Y=50.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=12500.0)
    ShakeRotTime=3.0
    bRandomPitchFireSound=True
    RandomPitchAdjustAmt=0.05

    FireForce="AssaultRifleFire"
}

