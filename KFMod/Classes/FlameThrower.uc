//=============================================================================
// FlameChucker
//=============================================================================
class FlameThrower extends KFWeapon;

simulated function bool StartFire(int Mode)
{
	if( Mode == 1 )
		return super.StartFire(Mode);

	if( !super.StartFire(Mode) )  // returns false when mag is empty
	   return false;

	if( AmmoAmount(0) <= 0 )
	{
    	return false;
    }

	AnimStopLooping();

	if( !FireMode[Mode].IsInState('FireLoop') && (AmmoAmount(0) > 0) )
	{
		FireMode[Mode].StartFiring();
		return true;
	}
	else
	{
		return false;
	}

	return true;
}

simulated function AnimEnd(int channel)
{
	if(!FireMode[0].IsInState('FireLoop'))
	{
	  	Super.AnimEnd(channel);
	}
}

// Cool Nozzle Illumination (WARNING -  Artist at play) :P
simulated function WeaponTick(float dt)
{
  Super.WeaponTick(dt);

//  if(FireMode[0].bIsFiring)
//    Skins[4] = Shader 'KillingFloorWeapons.FlameThrower.FTFireShader';
//  else
//    Skins[4] = default.Skins[4];
}

function bool RecommendRangedAttack()
{
	return true;
}

function float SuggestAttackStyle()
{
	return -1.0;
}

//TODO: LONG ranged?
function bool RecommendLongRangedAttack()
{
	return true;
}


defaultproperties
{
	SkinRefs(0)="KF_Weapons_Trip_T.Supers.flamethrower_cmb"
	SkinRefs(2)="KillingFloorWeapons.Welder.FBFlameOrange"

    WeaponReloadAnim=Reload_Flamethrower

    MagCapacity=100
    ReloadRate=4.14

    ReloadAnim="Reload"
    ReloadAnimRate=1.0

    Weight=10.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.FlameBurstFire'
    FireModeClass(1)=Class'KFMod.NoFire'

    PutDownAnim="PutDown"

    SelectSound=none//Sound'KFPlayerSound.getweaponout'

    Description="A deadly experimental weapon designed by Horzine industries. It can fire streams of burning liquid which ignite on contact."

    Priority=145

    InventoryGroup=3
    GroupOffset=8
    PickupClass=Class'KFMod.FlameThrowerPickup'

    BobDamping=6.000000
    AttachmentClass=Class'KFMod.FlameThrowerAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="FlameThrower"
    MeshRef="KF_Weapons_Trip.Flamethrower_Trip"
    DrawScale=0.900000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    PutDownTime = 1.0
    PutDownAnimRate=1.0

    QuickPutDownTime=0.5

    PlayerViewOffset=(X=5.000000,Y=7.000000,Z=-8.000000)   // -6
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)

    bSteadyAim = true         // For consistent streams

    AIRating=0.7
    CurrentRating=0.7

    MinimumFireRange = 300

    ZoomTime=0.25//1.0
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-1000,Yaw=0,Roll=1500)
    bHasAimingMode=true
    IdleAimAnim=Idle

    DisplayFOV=70.000000
    StandardDisplayFOV=70.0
    PlayerIronSightFOV=75
    ZoomedDisplayFOV=70

	HudImageRef="KillingFloorHUD.WeaponSelect.FlameThrower_unselected"
	SelectedHudImageRef="KillingFloorHUD.WeaponSelect.FlameThrower"
	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_Flame_Thrower'

	bIsTier2Weapon=true
}
