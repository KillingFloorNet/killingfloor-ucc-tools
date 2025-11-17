//=============================================================================
// SPGrenadeLauncher
//=============================================================================
// Steam Punk bomb thrower class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SPGrenadeLauncher extends M79GrenadeLauncher;

defaultproperties
{
    //WeaponReloadAnim=Reload_Crossbow

    //bSniping = true
    IdleAimAnim=Idle_Iron

    SkinRefs(1)="KF_IJC_Summer_Weapons.Grenade.Grenade_cmb"
    SleeveNum=0

    Weight=4.000000
    MagCapacity=1
    ReloadRate=0.010000
    FireModeClass(0)=Class'KFMod.SPGrenadeFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_SP_OrcaSnd.KFO_Orca_Select"
    SelectForce="SwitchToAssaultRifle"
    AIRating=0.650000
    CurrentRating=0.650000
    Description="The Orca Bomb Propeller tosses little delayed explosive bombs. Good for those bank shots!"
    Priority=164
    InventoryGroup=3
    GroupOffset=17
    PickupClass=Class'KFMod.SPGrenadePickup'
    PlayerViewOffset=(X=18.000000,Y=22.000000,Z=-7.000000)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.SPGrenadeAttachment'
    IconCoords=(X1=253,Y1=146,X2=333,Y2=181)
    ItemName="The Orca Bomb Propeller"
    LightType=LT_None
    LightBrightness=0.000000
    LightRadius=0.000000
    MeshRef="KF_IJC_Summer_Weps1.Grenade"
    DrawScale=1.000000
    AmbientGlow=0

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ForceZoomOutOnFireTime=0.4

    DisplayFOV=65.000000
    StandardDisplayFOV=65.0
    PlayerIronSightFOV=70
    ZoomedDisplayFOV=45

	HudImageRef="KF_IJC_HUD.WeaponSelect.Grenade_unselected"
	SelectedHudImageRef="KF_IJC_HUD.WeaponSelect.Grenade"
	TraderInfoTexture=texture'KF_IJC_HUD.Trader_Weapon_Icons.Trader_Grenade'

	bIsTier2Weapon=true
	AppID=210943
}
