//=============================================================================
// M32 MGL Semi automatic grenade launcher Inventory class
//=============================================================================
class M32GrenadeLauncher extends KFWeaponShotgun;

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
    WeaponReloadAnim=Reload_M32_MGL

    IdleAimAnim=Idle_Iron

	SkinRefs(0)="KF_Weapons2_Trip_T.Special.M32_cmb"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.Aimpoint_sight_shdr"
    SleeveNum=2

    Weight=7.000000
    MagCapacity=6
    ReloadRate=1.634//1.667
    ReloadAnim="Reload"
    ReloadAnimRate=1.0
    FireModeClass(0)=Class'KFMod.M32Fire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_M79Snd.M79_Select"
//    AimInSound=Sound'KF_M79Snd.M79_Aim'
//    AimOutSound=Sound'KF_M79Snd.M79_Aim'
    SelectForce="SwitchToAssaultRifle"
    bModeZeroCanDryFire=True
    AIRating=0.650000
    CurrentRating=0.650000
    Description="An advanced semi automatic grenade launcher. Launches high explosive grenades."
    Priority=210
    InventoryGroup=4
    GroupOffset=6
    PickupClass=Class'KFMod.M32Pickup'
    PlayerViewOffset=(X=18.000000,Y=20.000000,Z=-6.000000)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.M32Attachment'
    IconCoords=(X1=253,Y1=146,X2=333,Y2=181)
    ItemName="M32 Grenade Launcher"
    LightType=LT_None
    LightBrightness=0.000000
    LightRadius=0.000000
    MeshRef="KF_Weapons2_Trip.M32_MGL_Trip"
    DrawScale=1.000000
    AmbientGlow=0

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true

    DisplayFOV=65.000000
    StandardDisplayFOV=65.0
    PlayerIronSightFOV=70
    ZoomedDisplayFOV=40

	HudImageRef="KillingFloor2HUD.WeaponSelect.M32_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.M32"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_M32'

	// Achievement Helpers
	bIsTier3Weapon=true
}
