//=============================================================================
// AA12 Automatic Shotgun Inventory class
//=============================================================================
class AA12AutoShotgun extends KFWeapon;

// Use alt fire to switch fire modes
simulated function AltFire(float F)
{
    if(ReadyToFire(0))
    {
        DoToggle();
    }
}

exec function SwitchModes()
{
	DoToggle();
}

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

defaultproperties
{
	SkinRefs(0)="KF_Weapons2_Trip_T.Special.AA12_cmb"
    SleeveNum=1

    WeaponReloadAnim=Reload_AA12
    IdleAimAnim=Idle_Iron

    MagCapacity=20
    ReloadRate=3.133
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=10.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.AA12Fire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_AA12Snd.AA12_Select"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    Description="An advanced automatic shotgun. Fires steel ball shot in semi or full auto."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=200
    InventoryGroup=4
    GroupOffset=10
    PickupClass=Class'KFMod.AA12Pickup'
    PlayerViewOffset=(X=25.000000,Y=20.000000,Z=-2.000000)
    //PlayerViewPivot=(Pitch=400)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.AA12Attachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="AA12"
    MeshRef="KF_Weapons2_Trip.AA12_Trip"
    DrawScale=1.00000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    AIRating=0.55
    CurrentRating=0.55

    DisplayFOV=65.000000
    StandardDisplayFOV=65.0//60.0
    PlayerIronSightFOV=80
    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ZoomedDisplayFOV=45

	HudImageRef="KillingFloor2HUD.WeaponSelect.AA12_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.AA12"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_AA12'

	// Achievement Helpers
	bIsTier3Weapon=true
}
