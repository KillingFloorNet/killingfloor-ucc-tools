//=============================================================================
// M4203AssaultRifle
//=============================================================================
// An M4 Assault Rifle with M203 Grenade launcher
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class M4203AssaultRifle extends M4AssaultRifle
	config(user);

// Don't use alt fire to toggle
simulated function AltFire(float F){}
// Don't switch fire mode
exec function SwitchModes(){}

simulated function bool CanZoomNow()
{
    return ( !FireMode[1].bIsFiring &&
           ((FireMode[1].NextFireTime - FireMode[1].FireRate * 0.2) < Level.TimeSeconds + FireMode[1].PreFireTime));
}

function bool AllowReload()
{
	if( (FireMode[1].NextFireTime - FireMode[1].FireRate * 0.1) > Level.TimeSeconds + FireMode[1].PreFireTime )
	{
		return false;
	}

	return super.AllowReload();
}

simulated function bool ReadyToFire(int Mode)
{
    // Don't allow firing while reloading the shell
	if( (FireMode[1].NextFireTime - FireMode[1].FireRate * 0.06) > Level.TimeSeconds + FireMode[1].PreFireTime )
	{
		return false;
	}

    return super.ReadyToFire(Mode);
}

defaultproperties
{
	SkinRefs(1)=""
	SleeveNum=1

    WeaponReloadAnim=Reload_M4203
    IdleAimAnim=Idle_Iron
    ForceZoomOutOnAltFireTime=0.4

    Weight=6.000000
    FireModeClass(0)=Class'KFMod.M4203BulletFire'
    FireModeClass(1)=Class'KFMod.M203Fire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_M4RifleSnd.WEP_M4_Foley_Select"
    SelectForce="SwitchToAssaultRifle"
    Description="An assault rifle with an attached grenade launcher."
    Priority=190
    InventoryGroup=4
    GroupOffset=8
    PickupClass=Class'KFMod.M4203Pickup'
    AttachmentClass=Class'KFMod.M4203Attachment'
    ItemName="M4 203"
    MeshRef="KF_Wep_M4M203.M4M203_Trip"
    bReduceMagAmmoOnSecondaryFire=false

	HudImageRef="KillingFloor2HUD.WeaponSelect.M4_203_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.M4_203"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_M4_203'
	bHasSecondaryAmmo=true

	bIsTier3Weapon=true
}
