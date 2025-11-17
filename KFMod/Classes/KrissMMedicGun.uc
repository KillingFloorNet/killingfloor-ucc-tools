//=============================================================================
// KrissMMedicGun
//=============================================================================
// A modified Kriss SuperV SMG and Medic Gun
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class KrissMMedicGun extends MP7MMedicGun;

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
	SkinRefs(0)="Kf_Weapons9_Trip_T.Weapons.Medic_Kriss_cmb"
    SleeveNum=1

    HealAmmoCharge=700
	AmmoRegenRate=0.200000
	HealBoostAmount=40

    WeaponReloadAnim=Reload_Kriss
    IdleAimAnim=Idle_Iron

    MagCapacity=25
    ReloadRate=3.33
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=3.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.KrissMFire'
    FireModeClass(1)=Class'KFMod.KrissMAltFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_KrissSND.KF_WEP_KRISS_Handling_Select"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True

    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=120
    InventoryGroup=3
    GroupOffset=17
    PickupClass=Class'KFMod.KrissMPickup'
    PlayerViewOffset=(X=25.000000,Y=20.000000,Z=-6.000000)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.KrissMAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)

    Description="The 'Zekk has a very high rate of fire and is equipped with the attachment for the Horzine medical darts. "
    ItemName="Schneidzekk Medic Gun"

    MeshRef="KF_Wep_Kriss.Kriss_Trip"
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

	HudImageRef="KillingFloor2HUD.WeaponSelect.KRISS_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.KRISS"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_KRISS'

	bIsTier3Weapon=true
}
