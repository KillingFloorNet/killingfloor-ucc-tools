//=============================================================================
// ThompsonDrumSMG
//=============================================================================
// A ThompsonDrum Sub Machine Gun
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - IJC Weapon Development and John "Ramm-Jaeger" Gibson
//=============================================================================
class ThompsonDrumSMG extends ThompsonSMG
	config(user);

defaultproperties
{
    SkinRefs(1)="KF_IJC_Summer_Weapons.Thompson_Drum.thompson_drum_cmb"
    SleeveNum=0

    WeaponReloadAnim=Reload_IJC_spThompson_Drum
    IdleAimAnim=Idle_Iron

    MagCapacity=50
    ReloadRate=3.8
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=5.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.ThompsonDrumFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_IJC_HalloweenSnd.Thompson_Handling_Bolt_Back"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=124
    InventoryGroup=3
    GroupOffset=20
    PickupClass=Class'KFMod.ThompsonDrumPickup'
    PlayerViewOffset=(X=10.000000,Y=16.000000,Z=-7.000000)
    BobDamping=4.000000
    AttachmentClass=Class'kfmod.ThompsonDrumAttachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    Description="This Tommy gun with a drum magazine was used heavily during the WWII pacific battles as seen in Rising Storm."
    ItemName="Rising Storm Tommy Gun"
    MeshRef="KF_IJC_Summer_Weps1.ThompsonDrum"
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

    HudImageRef="KF_IJC_HUD.WeaponSelect.Thompson_Drum_unselected"
    SelectedHudImageRef="KF_IJC_HUD.WeaponSelect.Thompson_Drum"
    TraderInfoTexture=Texture'KF_IJC_HUD.Trader_Weapon_Icons.Trader_Thompson_Drum'

    AppID=210942
    bIsTier2Weapon=true
}
