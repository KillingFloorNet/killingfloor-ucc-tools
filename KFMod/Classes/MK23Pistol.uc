//=============================================================================
// MK23Pistol
//=============================================================================
// MK23 Pistol Inventory Class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and IJC
//=============================================================================
class MK23Pistol extends KFWeapon;

function bool HandlePickupQuery( pickup Item )
{
	if ( Item.InventoryType == Class )
	{
		if ( KFPlayerController(Instigator.Controller) != none )
		{
			KFPlayerController(Instigator.Controller).PendingAmmo = WeaponPickup(Item).AmmoAmount[0];
		}

		return false; // Allow to "pickup" so this weapon can be replaced with dual MK23.
	}

	return Super.HandlePickupQuery(Item);
}

function float GetAIRating()
{
	local Bot B;


	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return AIRating;

	return (AIRating + 0.0003 * FClamp(1500 - VSize(B.Enemy.Location - Instigator.Location),0,1000));
}

function byte BestMode()
{
    return 0;
}

simulated function bool PutDown()
{
	if ( Instigator.PendingWeapon.class == class'DualMK23Pistol' )
	{
		bIsReloading = false;
	}

	return super(KFWeapon).PutDown();
}

simulated function ActuallyFinishReloading()
{
    if ( PlayerController(Instigator.Controller) != none && KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements) != none )
    {
		KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements).OnMK23Reloaded();
	}

	super.ActuallyFinishReloading();
}

defaultproperties
{
	skins(0)=none
    SkinRefs(0)="KF_Weapons5_Trip_T.Weapons.MK23_SHDR"

    WeaponReloadAnim=Reload_Single9mm
    IdleAimAnim=Idle_Iron

    MagCapacity=12
    ReloadRate=2.6
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000
    Weight=2.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.MK23Fire'
    FireModeClass(1)=Class'KFMod.NoFire' //NoFire
    PutDownAnim="PutDown"
    SelectSoundRef="KF_MK23Snd.MK23_Select"
    bShowChargingBar=True
    Description="Match grade 45 caliber pistol. Good balance between power, ammo count and rate of fire."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=65
    InventoryGroup=2
    GroupOffset=7
    PickupClass=Class'KFMod.MK23Pickup'
    PlayerViewOffset=(X=10.000000,Y=18.750000,Z=-7.00000)
    BobDamping=4.500000
    AttachmentClass=class'KFMod.MK23Attachment'
    IconCoords=(X1=250,Y1=110,X2=330,Y2=145)
    ItemName="MK23"
    bUseDynamicLights=True
    MeshRef="KF_Wep_MK23.MK23"
    DrawScale=1.000000
    TransientSoundVolume=1.000000
    AmbientGlow=0
    SleeveNum=1

    AIRating=0.45
    CurrentRating=0.45
    bHasAimingMode=true

    DisplayFOV=60.000000
    StandardDisplayFOV=60.0
    PlayerIronSightFOV=75
    ZoomedDisplayFOV=50

	HudImageRef="KillingFloor2HUD.WeaponSelect.MK23_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.MK23"
	TraderInfoTexture=Texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_MK23'

	bIsTier2Weapon=true
}
