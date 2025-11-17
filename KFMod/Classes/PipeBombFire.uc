//=============================================================================
// Pipe Bomb Fire
//=============================================================================
class PipeBombFire extends KFShotgunFire;

#exec OBJ LOAD FILE=KF_AxeSnd.uax

var()   float   ProjectileSpawnDelay;

function InitEffects()
{
}

/* Convenient place to perform changes to a newly spawned projectile */
function PostSpawnProjectile(Projectile P)
{
    Super.PostSpawnProjectile(P);

    if( PipeBombProjectile(p) != none && Instigator != none )
    {
        PipeBombProjectile(p).PlacedTeam = Instigator.PlayerReplicationInfo.Team.TeamIndex;
    }
}

function Timer()
{
    Weapon.ConsumeAmmo(ThisModeNum, Load);
    DoFireEffect();
    Weapon.PlaySound(Sound'KF_AxeSnd.Axe_Fire',SLOT_Interact,TransientSoundVolume,,TransientSoundRadius,,false);

    if( Weapon.ammoAmount(0) <= 0 && Instigator != none && Instigator.Controller != none )
    {
        Weapon.Destroy();
        Instigator.Controller.ClientSwitchToBestWeapon();
    }
}

event ModeDoFire()
{
    if (!AllowFire())
        return;

    if (MaxHoldTime > 0.0)
        HoldTime = FMin(HoldTime, MaxHoldTime);

    // server
    if (Weapon.Role == ROLE_Authority)
    {
        // Consume ammo, etc later
        SetTimer(ProjectileSpawnDelay, False);

		HoldTime = 0;	// if bot decides to stop firing, HoldTime must be reset first
        if ( (Instigator == None) || (Instigator.Controller == None) )
			return;

        if ( AIController(Instigator.Controller) != None )
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);

        Instigator.DeactivateSpawnProtection();
    }

    // client
    if (Instigator.IsLocallyControlled())
    {
        //ShakeView();
        PlayFiring();
        FlashMuzzleFlash();
        StartMuzzleSmoke();
    }
    else // server
    {
        ServerPlayFiring();
    }

    Weapon.IncrementFlashCount(ThisModeNum);

    // set the next firing time. must be careful here so client and server do not get out of sync
    if (bFireOnRelease)
    {
        if (bIsFiring)
            NextFireTime += MaxHoldTime + FireRate;
        else
            NextFireTime = Level.TimeSeconds + FireRate;
    }
    else
    {
        NextFireTime += FireRate;
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }

    Load = AmmoPerFire;
    HoldTime = 0;

    if (Instigator.PendingWeapon != Weapon && Instigator.PendingWeapon != None)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
}


function PlayFireEnd(){}

simulated function bool AllowFire()
{
	if(KFWeapon(Weapon).bIsReloading)
		return false;
	if(KFPawn(Instigator).SecondaryItem!=none)
		return false;
	if(KFPawn(Instigator).bThrowingNade)
		return false;

	if(KFWeapon(Weapon).MagAmmoRemaining < 1)
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


defaultproperties
{
    ProjectileSpawnDelay=1.1
    ProjSpawnOffset=(X=10,Y=0,Z=-10)
    KickMomentum=(X=0.000000,Z=0.000000)
    ProjPerFire=1
    bAttachSmokeEmitter=false
    TransientSoundVolume=2.0
    TransientSoundRadius=500.000000
    FireSound=none//Sound'KF_AxeSnd.Axe_Fire'
    NoAmmoSound=none
    FireRate=1.75//1.27
    FireAnimRate=1.0
    AmmoClass=Class'KFMod.PipeBombAmmo'
    ProjectileClass=Class'KFMod.PipeBombProjectile'
    BotRefireRate=0.250000
    FlashEmitterClass=none
    aimerror=1.000000
    Spread=15.0
    maxVerticalRecoilAngle=0//1000
    maxHorizontalRecoilAngle=0//500
    FireAnim=Toss

    bWaitForRelease=true
    bRandomPitchFireSound=false
}
