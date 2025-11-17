//=============================================================================
// Winchester Inventory class
//=============================================================================
class Winchester extends KFWeaponShotgun;

// KFTODO - Slomo compensation R&D, finish later if I have time - Ramm
//exec function ToggleComp()
//{
//    WinchesterFire(FireMode[0]).bDoSlomoCompensation = !WinchesterFire(FireMode[0]).bDoSlomoCompensation;
//}

//I'll just copy and paste the damn things if you want them
//so badly.
// AI Interface
function float GetAIRating()
{
	local Bot B;
	local float EnemyDist;
	local vector EnemyDir;

	B = Bot(Instigator.Controller);
	if ( B == None )
		return AIRating;

	if ( (B.Target != None) && (Pawn(B.Target) == None) && (VSize(B.Target.Location - Instigator.Location) < 1250) )
		return 0.9;

	if ( B.Enemy == None )
	{
		if ( (B.Target != None) && VSize(B.Target.Location - B.Pawn.Location) > 3500 )
			return 0.2;
		return AIRating;
	}

	EnemyDir = B.Enemy.Location - Instigator.Location;
	EnemyDist = VSize(EnemyDir);
	if ( EnemyDist > 750 )
	{
		if ( EnemyDist > 2000 )
		{
			if ( EnemyDist > 3500 )
				return 0.2;
			return (AIRating - 0.3);
		}
		if ( EnemyDir.Z < -0.5 * EnemyDist )
			return (AIRating - 0.3);
	}
	else if ( (B.Enemy.Weapon != None) && B.Enemy.Weapon.bMeleeWeapon )
		return (AIRating + 0.35);
	else if ( EnemyDist < 400 )
		return (AIRating + 0.2);
	return FMax(AIRating + 0.2 - (EnemyDist - 400) * 0.0008, 0.2);
}

function float SuggestAttackStyle()
{
	if ( (AIController(Instigator.Controller) != None)
		&& (AIController(Instigator.Controller).Skill < 3) )
		return 0.4;
    return 0.8;
}

simulated function SetZoomBlendColor(Canvas c)
{
	local Byte    val;
	local Color   clr;
	local Color   fog;

	clr.R = 255;
	clr.G = 255;
	clr.B = 255;
	clr.A = 255;

	if( Instigator.Region.Zone.bDistanceFog )
	{
		fog = Instigator.Region.Zone.DistanceFogColor;
		val = 0;
		val = Max( val, fog.R);
		val = Max( val, fog.G);
		val = Max( val, fog.B);

		if( val > 128 )
		{
			val -= 128;
			clr.R -= val;
			clr.G -= val;
			clr.B -= val;
		}
	}
	c.DrawColor = clr;
}

// Overridden to take out some UT stuff
simulated event RenderOverlays( Canvas Canvas )
{
    super.RenderOverlays( Canvas );
    if ( bAimingRifle )
    {
	   SetZoomBlendColor(Canvas);
	}
}

// Copied from KFWeaponShotgun to support Achievements
simulated function AddReloadedAmmo()
{
    if(AmmoAmount(0) > 0)
        ++MagAmmoRemaining;

    // Don't do this on a "Hold to reload" weapon, as it can update too quick actually and cause issues maybe - Ramm
    if( !bHoldToReload )
    {
        ClientForceKFAmmoUpdate(MagAmmoRemaining,AmmoAmount(0));
    }

    if ( PlayerController(Instigator.Controller) != none && KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements) != none )
    {
		KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements).OnLARReloaded();
	}
}

defaultproperties
{
    Skins(0)=Combiner'KF_Weapons_Trip_T.Rifles.winchester_cmb'
    Skins(1)=Combiner'KF_Weapons_Trip_T.Rifles.winchester_cmb'

    WeaponReloadAnim=Reload_Winchester

    bSniping = true

    IdleAimAnim=AimIdle
    MagCapacity=10
    ReloadRate=0.66666666667//0.900000
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000
    Weight=6.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.WinchesterFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSound=Sound'KF_RifleSnd.Rifle_Select'
//    AimInSound=Sound'KF_RifleSnd.Rifle_Aim'
//    AimOutSound=Sound'KF_RifleSnd.Rifle_Aim'
    bShowChargingBar=True
    OldCenteredOffsetY=0.000000
    OldPlayerViewOffset=(X=-8.000000,Y=5.000000,Z=-6.000000)
    OldSmallViewOffset=(X=4.000000,Y=11.000000,Z=-12.000000)
    OldPlayerViewPivot=(Pitch=800)
    OldCenteredRoll=3000
    Description="A rugged and reliable single-shot rifle.  "
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=85
    SmallViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    CenteredOffsetY=-5.000000
    CenteredRoll=3000
    CenteredYaw=-1500
    InventoryGroup=3
    GroupOffset=3
    PickupClass=Class'KFMod.WinchesterPickup'
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.WinchesterAttachment'
    ItemName="Lever Action Rifle"
    bUseDynamicLights=True
    Mesh=SkeletalMesh'KF_Weapons_Trip.Winchester_Trip'
    DrawScale=0.900000
    TransientSoundVolume=50.000000

    AIRating=0.56
    CurrentRating=0.56

    ZoomTime=0.25
    FastZoomOutTime=0.2
    PlayerViewOffset=(X=8.0,Y=14,Z=-8.0)
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true

    DisplayFOV=70.000000
    StandardDisplayFOV=70.0
    PlayerIronSightFOV=70
    ZoomedDisplayFOV=50

	HudImage=texture'KillingFloorHUD.WeaponSelect.Winchester_unselected'
	SelectedHudImage=texture'KillingFloorHUD.WeaponSelect.Winchester'
	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_Winchester'
    SleeveNum=2
}
