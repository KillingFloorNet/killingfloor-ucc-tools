//=============================================================================
// M79 Grenade launcher Inventory class
//=============================================================================
class M79GrenadeLauncher extends KFWeapon;

//=============================================================================
// Functions
//=============================================================================

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

//TODO: LONG ranged?
function bool RecommendLongRangedAttack()
{
	return true;
}

function float SuggestAttackStyle()
{
	return -1.0;
}

defaultproperties
{
    //WeaponReloadAnim=Reload_Crossbow

    //bSniping = true
    IdleAimAnim=Idle_Iron

    SkinRefs(0)="KF_Weapons2_Trip_T.Special.M79_cmb"
    SleeveNum=1

    Weight=4.000000
    MagCapacity=1
    ReloadRate=0.010000
    FireModeClass(0)=Class'KFMod.M79Fire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_M79Snd.M79_Select"
//    AimInSound=Sound'KF_M79Snd.M79_Aim'
//    AimOutSound=Sound'KF_M79Snd.M79_Aim'
    SelectForce="SwitchToAssaultRifle"
    AIRating=0.650000
    CurrentRating=0.650000
    Description="A classic Vietnam era grenade launcher. Launches single high explosive grenades."
    Priority=162
    InventoryGroup=3
    GroupOffset=11
    PickupClass=Class'KFMod.M79Pickup'
    PlayerViewOffset=(X=18.000000,Y=20.000000,Z=-6.000000)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.M79Attachment'
    IconCoords=(X1=253,Y1=146,X2=333,Y2=181)
    ItemName="M79 Grenade Launcher"
    LightType=LT_None
    LightBrightness=0.000000
    LightRadius=0.000000
    MeshRef="KF_Weapons2_Trip.M79_Trip"
    DrawScale=1.000000
    AmbientGlow=0

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ForceZoomOutOnFireTime=0.4

    DisplayFOV=65.000000
    StandardDisplayFOV=65.0
    PlayerIronSightFOV=70
    ZoomedDisplayFOV=45

	HudImageRef="KillingFloor2HUD.WeaponSelect.M79_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.M79"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_M79'

	bIsTier2Weapon=true
}
