//=============================================================================
// BlowerThrower
//=============================================================================
// Weapon class for the bloat bile thrower
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class BlowerThrower extends KFWeapon;

simulated function bool StartFire(int Mode)
{
	if( Mode == 1 )
		return super.StartFire(Mode);

	if( !super.StartFire(Mode) )  // returns false when mag is empty
	   return false;

	if( AmmoAmount(0) <= 0 )
	{
    	return false;
    }

	AnimStopLooping();

	if( !FireMode[Mode].IsInState('FireLoop') && (AmmoAmount(0) > 0) )
	{
		FireMode[Mode].StartFiring();
		return true;
	}
	else
	{
		return false;
	}

	return true;
}

// Allow this weapon to auto reload on alt fire
simulated function AltFire(float F)
{
	if( MagAmmoRemaining < 1 && !bIsReloading &&
		 FireMode[1].NextFireTime <= Level.TimeSeconds )
	{
		// We're dry, ask the server to autoreload
		ServerRequestAutoReload();

		PlayOwnedSound(FireMode[1].NoAmmoSound,SLOT_None,2.0,,,,false);
	}

	super.AltFire(F);
}

simulated function AnimEnd(int channel)
{
	if(!FireMode[0].IsInState('FireLoop'))
	{
	  	Super.AnimEnd(channel);
	}
}

function bool RecommendRangedAttack()
{
	return true;
}

function float SuggestAttackStyle()
{
	return -1.0;
}

//TODO: LONG ranged?
function bool RecommendLongRangedAttack()
{
	return true;
}

simulated function bool ConsumeAmmo( int Mode, float Load, optional bool bAmountNeededIsMax )
{
	local Inventory Inv;
	local bool bOutOfAmmo;
	local KFWeapon KFWeap;

	if ( Super(Weapon).ConsumeAmmo(Mode, Load, bAmountNeededIsMax) )
	{
		if ( Load > 0 && (Mode == 0 || bReduceMagAmmoOnSecondaryFire) )
			MagAmmoRemaining -= Load;

		NetUpdateTime = Level.TimeSeconds - 1;

		if ( FireMode[Mode].AmmoPerFire > 0 && InventoryGroup > 0 && !bMeleeWeapon && bConsumesPhysicalAmmo &&
			 (Ammo[0] == none || FireMode[0] == none || FireMode[0].AmmoPerFire <= 0 || Ammo[0].AmmoAmount < FireMode[0].AmmoPerFire) &&
			 (Ammo[1] == none || FireMode[1] == none || FireMode[1].AmmoPerFire <= 0 || Ammo[1].AmmoAmount < FireMode[1].AmmoPerFire) )
		{
			bOutOfAmmo = true;

			for ( Inv = Instigator.Inventory; Inv != none; Inv = Inv.Inventory )
			{
				KFWeap = KFWeapon(Inv);

				if ( Inv.InventoryGroup > 0 && KFWeap != none && !KFWeap.bMeleeWeapon && KFWeap.bConsumesPhysicalAmmo &&
					 ((KFWeap.Ammo[0] != none && KFWeap.FireMode[0] != none && KFWeap.FireMode[0].AmmoPerFire > 0 &&KFWeap.Ammo[0].AmmoAmount >= KFWeap.FireMode[0].AmmoPerFire) ||
					 (KFWeap.Ammo[1] != none && KFWeap.FireMode[1] != none && KFWeap.FireMode[1].AmmoPerFire > 0 && KFWeap.Ammo[1].AmmoAmount >= KFWeap.FireMode[1].AmmoPerFire)) )
				{
					bOutOfAmmo = false;
					break;
				}
			}

			if ( bOutOfAmmo )
			{
				PlayerController(Instigator.Controller).Speech('AUTO', 3, "");
			}
		}

		return true;
	}
	return false;
}


defaultproperties
{
	SkinRefs(0)="KF_IJC_Halloween_Weapons2.BlowerThrower.BlowerThrower_cmb"
    SleeveNum=1
    WeaponReloadAnim=Reload_IJC_BlowerThrower

    MagCapacity=50
    ReloadRate=4.14

    ReloadAnim="Reload"
    ReloadAnimRate=1.0

    Weight=6.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.BlowerThrowerFire'
    FireModeClass(1)=Class'KFMod.BlowerThrowerAltFire'
    SelectSoundRef="KF_FY_BlowerThrowerSND.WEP_Bile_Foley_Select"

    PutDownAnim="PutDown"

    SelectSound=none//Sound'KFPlayerSound.getweaponout'

    Description="A leaf blower modified to launch deadly bloat bile. Spray it around and watch 'em burn!"

    Priority=103

    InventoryGroup=3
    GroupOffset=21
    PickupClass=Class'KFMod.BlowerThrowerPickup'

    BobDamping=6.000000
    AttachmentClass=Class'KFMod.BlowerThrowerAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="BlowerThrower"
    MeshRef="KF_IJC_Halloween_Weps_2.BlowerThrower"
    DrawScale=1.0
    TransientSoundVolume=1.250000
    AmbientGlow=0

    PutDownTime = 0.5
    PutDownAnimRate=1.3636

    QuickPutDownTime=0.25

    PlayerViewOffset=(X=15.000000,Y=20.000000,Z=-3.000000)
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)

    AIRating=0.7
    CurrentRating=0.7

    MinimumFireRange = 300

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-1000,Yaw=0,Roll=1500)
    bHasAimingMode=true
    IdleAimAnim=Idle

    DisplayFOV=70.000000
    StandardDisplayFOV=70.0
    PlayerIronSightFOV=75
    ZoomedDisplayFOV=60

	HudImageRef="KF_IJC_HUD.WeaponSelect.BlowerThrower_unselected"
	SelectedHudImageRef="KF_IJC_HUD.WeaponSelect.BlowerThrower"
	TraderInfoTexture=texture'KF_IJC_HUD.Trader_Weapon_Images.Trader_BlowerThrower'

	bIsTier2Weapon=true

	AppID=258751
}
