//=============================================================================
// SPSniperRifle
//=============================================================================
// Steam Punk sniper rifle class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SPSniperRifle extends KFWeapon
	config(user);

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
         	KFSteamStats.OnReloadSPSorM14();
		}
	}
}

defaultproperties
{
	SkinRefs(1)="KF_IJC_Summer_Weapons.SniperRifle.Sniper_cmb"
	SkinRefs(2)="KF_IJC_Summer_Weapons.SniperRifle.sniperrifle_scope_shader"
	SleeveNum=0

	WeaponReloadAnim=Reload_spSinper
	IdleAimAnim=Idle_Iron

	CustomCrosshair=11
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross5"
	MagCapacity=10
	ReloadRate=2.866
	ReloadAnim="Reload"
	ReloadAnimRate=1.000000

	Weight=6.000000
	bModeZeroCanDryFire=True
	FireModeClass(0)=Class'KFMod.SPSniperFire'
	FireModeClass(1)=Class'KFMod.NoFire'
	PutDownAnim="PutDown"
	SelectSoundRef="KF_SP_LongmusketSnd.KFO_Sniper_Select"
	SelectForce="SwitchToAssaultRifle"
	bShowChargingBar=True
	Description="A finely crafted long rifle from the Victorian era fitted with telescopic aiming optics."
	EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
	Priority=155
	InventoryGroup=3
	GroupOffset=18
	PickupClass=Class'KFMod.SPSniperPickup'
	PlayerViewOffset=(X=25.000000,Y=17.000000,Z=-8.000000)
	//PlayerViewPivot=(Pitch=400)
	BobDamping=6.000000
	AttachmentClass=Class'KFMod.SPSniperAttachment'
	IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
	ItemName="S.P. Musket"
	MeshRef="KF_IJC_Summer_Weps1.SniperRifle"
	DrawScale=1.00000
	TransientSoundVolume=1.250000
	AmbientGlow=0

	AIRating=0.55
	CurrentRating=0.55

	DisplayFOV=55.000000
	StandardDisplayFOV=55.0
	PlayerIronSightFOV=60
	ZoomTime=0.25
	FastZoomOutTime=0.2
	ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
	bHasAimingMode=true
	ZoomedDisplayFOV=25

	HudImageRef="KF_IJC_HUD.WeaponSelect.Sniper_unselected"
	SelectedHudImageRef="KF_IJC_HUD.WeaponSelect.Sniper"
	TraderInfoTexture=texture'KF_IJC_HUD.Trader_Weapon_Icons.Trader_Sniper'


	// Achievement Helpers
	bIsTier2Weapon=true
	AppID=210943
}
