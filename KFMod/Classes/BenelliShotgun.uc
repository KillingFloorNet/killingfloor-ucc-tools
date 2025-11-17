//=============================================================================
// BenelliShotgun
//=============================================================================
// A Benelli M4 Shotgun
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class BenelliShotgun extends KFWeaponShotgun;

// Overridden to not take us out of ironsights when firing
simulated function WeaponTick(float dt)
{
	local float LastSeenSeconds,ReloadMulti;

    if( bForceLeaveIronsights )
    {
    	ZoomOut(true);

    	if( Role < ROLE_Authority)
			ServerZoomOut(false);

        bForceLeaveIronsights = false;
    }

    if( ForceZoomOutTime > 0 )
    {
        if( bAimingRifle )
        {
    	    if( Level.TimeSeconds - ForceZoomOutTime > 0 )
    	    {
                ForceZoomOutTime = 0;

            	ZoomOut(true);

            	if( Role < ROLE_Authority)
        			ServerZoomOut(false);
    		}
		}
		else
		{
            ForceZoomOutTime = 0;
		}
	}

	 if ( (Level.NetMode == NM_Client) || Instigator == None || KFFriendlyAI(Instigator.Controller) == none && Instigator.PlayerReplicationInfo == None)
		return;

	// Turn it off on death  / battery expenditure
	if (FlashLight != none)
	{
		// Keep the 1Pweapon client beam up to date.
		AdjustLightGraphic();
		if (FlashLight.bHasLight)
		{
			if (Instigator.Health <= 0 || KFHumanPawn(Instigator).TorchBatteryLife <= 0 || Instigator.PendingWeapon != none )
			{
				//Log("Killing Light...you're out of batteries, or switched / dropped weapons");
				KFHumanPawn(Instigator).bTorchOn = false;
				ServerSpawnLight();
			}
		}
	}

	UpdateMagCapacity(Instigator.PlayerReplicationInfo);

	if(!bIsReloading)
	{
		if(!Instigator.IsHumanControlled())
		{
			LastSeenSeconds = Level.TimeSeconds - Instigator.Controller.LastSeenTime;
			if(MagAmmoRemaining == 0 || ((LastSeenSeconds >= 5 || LastSeenSeconds > MagAmmoRemaining) && MagAmmoRemaining < MagCapacity))
				ReloadMeNow();
		}
	}
	else
	{
		if((Level.TimeSeconds - ReloadTimer) >= ReloadRate)
		{
			if(AmmoAmount(0) <= MagCapacity && !bHoldToReload)
			{
				MagAmmoRemaining = AmmoAmount(0);
				ActuallyFinishReloading();
			}
			else
			{
				if ( KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo) != none && KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo).ClientVeteranSkill != none )
				{
					ReloadMulti = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo).ClientVeteranSkill.Static.GetReloadSpeedModifier(KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo), self);
				}
				else
				{
					ReloadMulti = 1.0;
				}

				AddReloadedAmmo();

				if( bHoldToReload )
                {
                    NumLoadedThisReload++;
                }

				if(MagAmmoRemaining < MagCapacity && MagAmmoRemaining < AmmoAmount(0) && bHoldToReload)
					ReloadTimer = Level.TimeSeconds;
				if(MagAmmoRemaining >= MagCapacity || MagAmmoRemaining >= AmmoAmount(0) || !bHoldToReload || bDoSingleReload)
					ActuallyFinishReloading();
				else if( Level.NetMode!=NM_Client )
					Instigator.SetAnimAction(WeaponReloadAnim);
			}
		}
		else if(bIsReloading && !bReloadEffectDone && Level.TimeSeconds - ReloadTimer >= ReloadRate / 2)
		{
			bReloadEffectDone = true;
			ClientReloadEffects();
		}
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
		KFSteamStatsAndAchievements(PlayerController(Instigator.Controller).SteamStatsAndAchievements).OnBenelliReloaded();
	}
}

defaultproperties
{
	SkinRefs(0)="KF_Weapons4_Trip_T.Weapons.Benelli_M4_cmb"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.Aimpoint_sight_shdr"

    SleeveNum=2

    WeaponReloadAnim=Reload_Shotgun

    MagCapacity=6
    ReloadRate=0.9//0.80
    ReloadAnim="Reload"
    ReloadAnimRate=1.0
    IdleAimAnim=Idle_Iron
    Weight=8.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.BenelliFire'
    FireModeClass(1)=Class'KFMod.ShotGunLightFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_M4ShotgunSnd.WEP_Benelli_Foley_Select"
    bShowChargingBar=True
    Description="A military tactical shotgun with semi automatic fire capability. Holds up to 6 shells. "
    Priority=170
    InventoryGroup=3
    GroupOffset=9
    PickupClass=Class'KFMod.BenelliPickup'

    BobDamping=7.000000
    AttachmentClass=Class'KFMod.BenelliAttachment'
    IconCoords=(X1=169,Y1=172,X2=245,Y2=208)
    ItemName="Combat Shotgun"
    MeshRef="KF_Wep_Benelli.Benelli_Trip"
    TransientSoundVolume=1.000000
    PlayerViewOffset=(X=20.000000,Y=18.750000,Z=-7.500000)
    AmbientGlow=0
    AIRating=0.6
    CurrentRating=0.6

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    bTorchEnabled=true

    DisplayFOV=65.0
    StandardDisplayFOV=65.0
    PlayerIronSightFOV=70
    ZoomedDisplayFOV=40

	HudImageRef="KillingFloor2HUD.WeaponSelect.Beneli_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Beneli"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Beneli'
	FirstPersonFlashlightOffset=(X=-25.000000,Y=-18.000000,Z=8.000000)

	// Achievement Helpers
	bIsTier2Weapon=true
}
