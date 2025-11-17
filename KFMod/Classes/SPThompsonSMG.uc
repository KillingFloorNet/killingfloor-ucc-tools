//=============================================================================
// SPThompsonSMG
//=============================================================================
// A Steampunk Thompson Sub Machine Gun
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - IJC Weapon Development and John "Ramm-Jaeger" Gibson
//=============================================================================
class SPThompsonSMG extends ThompsonSMG
	config(user);

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
    SkinRefs(1)="KF_IJC_Summer_Weapons.Steampunk_Thompson.Steampunk_Thompson_cmb"
    SleeveNum=0

    WeaponReloadAnim=Reload_IJC_spThompson_Drum
    IdleAimAnim=Idle_Iron

    MagCapacity=40
    ReloadRate=3.8
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=5.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.SPThompsonFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_SP_ThompsonSnd.KFO_SP_Thompson_Select"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=123
    InventoryGroup=3
    GroupOffset=19
    PickupClass=Class'KFMod.SPThompsonPickup'
    PlayerViewOffset=(X=10.000000,Y=16.000000,Z=-7.000000)
    BobDamping=4.000000
    AttachmentClass=Class'KFMod.SPThompsonAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    Description="Thy weapon is before you. May it's drum beat a sound of terrible fear into your enemies."
    ItemName="Dr. T's Lead Delivery System"
    MeshRef="KF_IJC_Summer_Weps1.Steampunk_Thompson"
    DrawScale=1.00000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    AIRating=0.550000
    CurrentRating=0.550000

    DisplayFOV=55.000000
    StandardDisplayFOV=55.000000
    PlayerIronSightFOV=65.000000
    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=True
    ZoomedDisplayFOV=40.000000

    HudImageRef="KF_IJC_HUD.WeaponSelect.SteamPunk_Tommygun_Unselected"
    SelectedHudImageRef="KF_IJC_HUD.WeaponSelect.SteamPunk_Tommygun_Selected"
    TraderInfoTexture=Texture'KF_IJC_HUD.Trader_Weapon_Icons.Trader_SteamPunk_Tommygun'

    AppID=210943
    bIsTier2Weapon=true
}
