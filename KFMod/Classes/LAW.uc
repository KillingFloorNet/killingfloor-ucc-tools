class LAW extends KFWeaponShotgun;

// Killing Floor's Light Anti Tank Weapon.
// This is probably about as badass as things get....

simulated event WeaponTick(float dt)
{
	if(AmmoAmount(0) == 0)
		MagAmmoRemaining = 0;
	super.Weapontick(dt);
}

/**
 * Handles all the functionality for zooming in including
 * setting the parameters for the weapon, pawn, and playercontroller
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 */
simulated function ZoomIn(bool bAnimateTransition)
{
    if( Level.TimeSeconds < FireMode[0].NextFireTime )
    {
        return;
    }

    super.ZoomIn(bAnimateTransition);

    if( bAnimateTransition )
    {
        if( bZoomOutInterrupted )
        {
            PlayAnim('Raise',1.0,0.1);
        }
        else
        {
            PlayAnim('Raise',1.0,0.1);
        }
    }
}


/**
 * Handles all the functionality for zooming out including
 * setting the parameters for the weapon, pawn, and playercontroller
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 */
simulated function ZoomOut(bool bAnimateTransition)
{
    super.ZoomOut(false);

    if( bAnimateTransition )
    {
        TweenAnim(IdleAnim,FastZoomOutTime);
    }
}

// Overridden to reset achievement
simulated function bool StartFire(int Mode)
{
    if ( super.StartFire(Mode) )
    {
        if ( Instigator != none && PlayerController(Instigator.Controller) != none &&
			  KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements) != none )
		{
			KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements).OneShotLawOrHarpoon();
		}

        return true;
    }

    return false;
}

defaultproperties
{
    SkinRefs(0)="KF_Weapons_Trip_T.Supers.law_cmb"
    SkinRefs(1)="KF_Weapons_Trip_T.Supers.law_reddot_shdr"
    SkinRefs(2)="KF_Weapons_Trip_T.Supers.rocket_cmb"

    WeaponReloadAnim=Reload_LAW

    MagCapacity=1
    ReloadRate=3.000000
    Weight=13.000000 // Reduced in Balance Round 2
    FireModeClass(0)=Class'KFMod.LAWFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    //PutDownTime=1.000000
    //  BringUpTime=1.000000
    SelectSoundRef="KF_LAWSnd.LAW_Select"
    SelectForce="SwitchToRocketLauncher"
    Description="The Light Anti Tank Weapon is, as its name suggests, a military grade heavy weapons platform designed to disable or outright destroy armored vehicles."
    EffectOffset=(X=50.000000,Y=1.000000,Z=10.000000)
    Priority=195
    HudColor=(G=0)
    InventoryGroup=4
    GroupOffset=9
    PickupClass=Class'KFMod.LAWPickup'
    PlayerViewOffset=(X=30.0,Y=30.0,Z=0.000000)
    BobDamping=7.000000
    AttachmentClass=Class'KFMod.LAWAttachment'
    IconCoords=(X1=429,Y1=212,X2=508,Y2=251)
    ItemName="L.A.W"
    MeshRef="KF_Weapons_Trip.LAW_Trip"
    DrawScale=1.000000
    AmbientGlow=2

    AIRating=1.5
    CurrentRating=1.5

    MinimumFireRange = 300
    bSniping=False

    ZoomTime=0.26//1.0
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    IdleAimAnim=AimIdle
    ForceZoomOutOnFireTime=0.1

    DisplayFOV=75.000000
    StandardDisplayFOV=75.0
    PlayerIronSightFOV=90
    ZoomedDisplayFOV=65

	HudImageRef="KillingFloorHUD.WeaponSelect.LAW_unselected"
	SelectedHudImageRef="KillingFloorHUD.WeaponSelect.LAW"
    SleeveNum=3
	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_LAW'

	// Achievement Helpers
	bIsTier3Weapon=true
}
