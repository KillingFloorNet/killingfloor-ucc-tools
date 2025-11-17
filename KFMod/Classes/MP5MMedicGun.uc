//=============================================================================
// MP5MMedicGun
//=============================================================================
// A modified MP5 SMG and Medic Gun
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class MP5MMedicGun extends MP7MMedicGun;

simulated event OnZoomOutFinished()
{
	local name anim;
	local float frame, rate;

	GetAnimParams(0, anim, frame, rate);

	if (ClientState == WS_ReadyToFire)
	{
		// Play the regular idle anim when we're finished zooming out
		if (anim == IdleAimAnim)
		{
            PlayIdle();
		}
		// Switch looping fire anims if we switched to/from zoomed
		else if( FireMode[0].IsInState('FireLoop') && anim == 'Fire_Iron_Loop')
		{
            LoopAnim('Fire_Loop', FireMode[0].FireLoopAnimRate, FireMode[0].TweenTime);
		}
	}
}

/**
 * Called by the native code when the interpolation of the first person weapon to the zoomed position finishes
 */
simulated event OnZoomInFinished()
{
	local name anim;
	local float frame, rate;

	GetAnimParams(0, anim, frame, rate);

	if (ClientState == WS_ReadyToFire)
	{
		// Play the iron idle anim when we're finished zooming in
		if (anim == IdleAnim)
		{
		   PlayIdle();
		}
		// Switch looping fire anims if we switched to/from zoomed
		else if( FireMode[0].IsInState('FireLoop') && anim == 'Fire_Loop' )
		{
            LoopAnim('Fire_Iron_Loop', FireMode[0].FireLoopAnimRate, FireMode[0].TweenTime);
		}
	}
}

defaultproperties
{
	SkinRefs(0)="KF_Weapons4_Trip_T.Weapons.MP5_cmb"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.Aimpoint_sight_shdr"
    SleeveNum=2

    HealAmmoCharge=650
	AmmoRegenRate=0.200000
	HealBoostAmount=30

    WeaponReloadAnim=Reload_MP5
    IdleAimAnim=Idle_Iron

    MagCapacity=32
    ReloadRate=3.8
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=3.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.MP5MFire'
    FireModeClass(1)=Class'KFMod.MP5MAltFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_MP5Snd.WEP_MP5_Foley_Select"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    Description="MP5 sub machine gun. Modified to fire healing darts. Better damage and healing than MP7M with a larger mag."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=80
    InventoryGroup=3
    GroupOffset=4
    PickupClass=Class'KFMod.MP5MPickup'
    PlayerViewOffset=(X=25.000000,Y=20.000000,Z=-6.000000)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.MP5MAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="MP5M Medic Gun"
    MeshRef="KF_Wep_MP5.MP5_Trip"
    DrawScale=1.00000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    AIRating=0.55
    CurrentRating=0.55

    DisplayFOV=55.000000
    StandardDisplayFOV=55.0//60.0
    PlayerIronSightFOV=65
    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ZoomedDisplayFOV=45

	HudImageRef="KillingFloor2HUD.WeaponSelect.Mp5Medic_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Mp5Medic"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Mp5Medic'

	bIsTier2Weapon=true
}
