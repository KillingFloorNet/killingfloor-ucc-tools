class Crossbuzzsaw extends KFWeapon;

var float Range;
var float LastRangingTime;

var bool bInPose;
var ()      float       RotateRate;
var         float       RegenTimer;     // Tracks regeneration
var rotator Gearrot1;
var rotator Gearrot2;
var rotator Bladerot;

var() sound ZoomSound;
var bool bArrowRemoved;

simulated function WeaponTick(float dt)
{
    super.WeaponTick(dt);

	if ( Level.NetMode!=NM_DedicatedServer && RegenTimer<Level.TimeSeconds )
	{
        RegenTimer = Level.TimeSeconds + 0.008;
        Gearrot1.Yaw += RotateRate;
        SetBoneRotation('Gear1',Gearrot1,1.0);
        Gearrot2.Yaw -= RotateRate;
        SetBoneRotation('Gear2',Gearrot2,1.0);

        if( FireMode[0].NextFireTime <= Level.TimeSeconds )
        {
            Bladerot.Yaw -= RotateRate;
            SetBoneRotation('Blade',Bladerot,1.0);
        }
 	}

//    if( ForceZoomOutTime > 0 )
//    {
//        if( bAimingRifle )
//        {
//    	    if( Level.TimeSeconds - ForceZoomOutTime > 0 )
//    	    {
//                ForceZoomOutTime = 0;
//
//            	ZoomOut(false);
//
//            	if( Role < ROLE_Authority)
//        			ServerZoomOut(false);
//    		}
//		}
//		else
//		{
//            ForceZoomOutTime = 0;
//		}
//	}
}

// Force the weapon out of iron sights shortly after firing so reloading looks right
simulated function bool StartFire(int Mode)
{
    if ( super.StartFire(Mode) )
    {
        //ForceZoomOutTime = Level.TimeSeconds + 0.4;

        if ( Instigator != none && PlayerController(Instigator.Controller) != none &&
			  KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements) != none )
		{
			KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements).OneShotBuzzOrM99();
		}

        return true;
    }

    return false;
}

function float GetAIRating()
{
	local AIController B;

	B = AIController(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return AIRating;

	return (AIRating + 0.0003 * FClamp(1500 - VSize(B.Enemy.Location - Instigator.Location),0,1000));
}

function byte BestMode()
{
	return 0;
}

function bool RecommendRangedAttack()
{
	return true;
}

function float SuggestAttackStyle()
{
	return -1.0;
}

simulated function bool CanZoomNow()
{
	return (!FireMode[0].bIsFiring);
}


defaultproperties
{
    SkinRefs(0)="KF_IJC_Halloween_Weapons.Cheetah.cheetah_cmb"
    SkinRefs(1)="KF_IJC_Halloween_Weapons.Cheetah.cheetah_sight_shader"
    SleeveNum=2

    WeaponReloadAnim=Reload_Cheetah

    bSniping = true
    bInPose = true
    IdleAimAnim=Idle_Iron
    RotateRate=5000
    MagCapacity=1
    Weight=7.000000
    ReloadRate=0.010000
    FireModeClass(0)=Class'KFMod.CrossbuzzsawFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_XbowSnd.Xbow_Select"
    //AimInSound=Sound'KF_XbowSnd.Xbow_Aim'
    //AimOutSound=Sound'KF_XbowSnd.Xbow_Aim'
    SelectForce="SwitchToAssaultRifle"
    AIRating=0.650000
    CurrentRating=0.650000
    Description="The Buzzsaw Bow is no ordinary crossbow. Why shoot little bolts when you can send a circular sawblade spinning instead?"
    Priority=175
    CustomCrosshair=11
    CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross5"
    InventoryGroup=4
    GroupOffset=15
    PickupClass=Class'KFMod.CrossbuzzsawPickup'
    PlayerViewOffset=(X=20.000000,Y=18.000000,Z=-8.000000)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.CrossbuzzsawAttachment'
    IconCoords=(X1=253,Y1=146,X2=333,Y2=181)
    ItemName="Buzzsaw Bow"
    LightType=LT_None
    LightBrightness=0.000000
    LightRadius=0.000000
    MeshRef="KF_IJC_Halloween_Weps3.Cheetah"
    DrawScale=1.000000
    AmbientGlow=0

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ForceZoomOutOnFireTime=0.4

    DisplayFOV=65.000000
    StandardDisplayFOV=65.0
    PlayerIronSightFOV=65
    ZoomedDisplayFOV=45

	HudImageRef="KF_IJC_HUD.WeaponSelect.Cheetah_unselected"
	SelectedHudImageRef="KF_IJC_HUD.WeaponSelect.Cheetah"
	TraderInfoTexture=texture'KF_IJC_HUD.Trader_Weapon_Images.Trader_Cheetah'

    AppID=210934
    bIsTier3Weapon=true
}
