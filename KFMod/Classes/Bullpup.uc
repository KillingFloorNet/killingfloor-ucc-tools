//=============================================================================
// L85 Inventory class
//=============================================================================
class Bullpup extends KFWeapon
	config(user);

#exec OBJ LOAD FILE=KillingFloorWeapons.utx
#exec OBJ LOAD FILE=KillingFloorHUD.utx
#exec OBJ LOAD FILE=Inf_Weapons_Foley.uax

// Use alt fire to switch fire modes
simulated function AltFire(float F)
{
    if(ReadyToFire(0))
    {
        DoToggle();
    }
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

exec function SwitchModes()
{
	DoToggle();
}

function float GetAIRating()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return AIRating;

	return AIRating;
}

function byte BestMode()
{
	return 0;
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

simulated function AddReloadedAmmo()
{
	super.AddReloadedAmmo();

	ResetReloadAchievement();
}

function ResetReloadAchievement()
{
	local PlayerController PC;
	local KFSteamStatsAndAchievements KFSteamStats;

	PC = PlayerController( Instigator.Controller );

	if ( PC != none )
	{
		KFSteamStats = KFSteamStatsAndAchievements(PC.SteamStatsAndAchievements);

		if ( KFSteamStats != none )
		{
         	KFSteamStats.OnReloadSPTorBullpup();
		}
	}
}

defaultproperties
{
	skins(0)=Combiner'KF_Weapons_Trip_T.Rifles.bullpup_cmb'
	skins(1)=Shader'KF_Weapons_Trip_T.Rifles.reflex_sight_A_unlit'
    SleeveNum=2

    WeaponReloadAnim=Reload_BullPup
    IdleAimAnim=Idle_Iron

    CustomCrosshair=11
    CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross5"
    MagCapacity=40
    ReloadRate=1.966667
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=6.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.BullpupFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSound=Sound'KF_BullpupSnd.Bullpup_Select'
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    Description="A military grade automatic rifle. Can be fired in semi-auto or full auto firemodes and comes equipped with a scope for increased accuracy."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=70
    InventoryGroup=3
    GroupOffset=1
    PickupClass=Class'KFMod.BullpupPickup'
    PlayerViewOffset=(X=20.000000,Y=21.500000,Z=-9.000000)
    //PlayerViewPivot=(Pitch=400)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.BullpupAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="Bullpup"
    Mesh=SkeletalMesh'KF_Weapons_Trip.Bullpup_Trip'
    DrawScale=1.00000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    AIRating=0.55
    CurrentRating=0.55

    DisplayFOV=70.000000
    StandardDisplayFOV=70.0
    PlayerIronSightFOV=65
    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ZoomedDisplayFOV=40

	HudImage=texture'KillingFloorHUD.WeaponSelect.Bullpup_unselected'
	SelectedHudImage=texture'KillingFloorHUD.WeaponSelect.Bullpup'
	TraderInfoTexture=texture'KillingFloorHud.Trader_Weapon_Images.Trader_Bullpup'
}
