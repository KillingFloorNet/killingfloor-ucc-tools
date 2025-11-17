//=============================================================================
// Nailgun
//=============================================================================
// NailGun Inventory Class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Dan Hollinger
//=============================================================================

class NailGun extends KFWeapon;

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

simulated function bool CanZoomNow()
{
	return (!FireMode[0].bIsFiring);
}

defaultproperties
{
    SkinRefs(0)="KF_Weapons8_Trip_T.Weapons.Vlad_9000_cmb"
    SleeveNum=1

    WeaponReloadAnim=Reload_Vlad9000
    IdleAimAnim=Idle_Iron

    MagCapacity=6
    ReloadRate=2.6
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=8.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.NailGunFire'
    FireModeClass(1)=Class'KFMod.NailGunALTFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_NailShotgun.KF_NailShotgun_Pickup"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    Description="The Black and Wrecker Vlad 9000 nail gun. Designed for putting barns together. Or nailing Zeds to them."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=150
    InventoryGroup=3
    GroupOffset=15
    PickupClass=Class'KFMod.NailGunPickup'
    PlayerViewOffset=(X=25.000000,Y=20.000000,Z=-10.000000)
    BobDamping=4.5000000
    AttachmentClass=Class'KFMod.NailGunAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="Vlad the Impaler"
    MeshRef="KF_Wep_Vlad9000.Vlad9000"
    DrawScale=1.00000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    bTorchEnabled = true

    AIRating=0.55
    CurrentRating=0.55

    DisplayFOV=65.000000
    StandardDisplayFOV=65.0//60.0
    PlayerIronSightFOV=70
    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ZoomedDisplayFOV=40

	HudImageRef="KillingFloor2HUD.WeaponSelect.Vlad9000_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Vlad9000"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Vlad9000'


   	FirstPersonFlashlightOffset=(X=-20.000000,Y=-22.000000,Z=8.000000)//(X=0.000000,Y=-16.000000,Z=4.000000)
	// Achievement Helpers
	bIsTier2Weapon=true
}
