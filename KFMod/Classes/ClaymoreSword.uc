//=============================================================================
// ClaymoreSword
//=============================================================================
// A medieval claymore long sword
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ClaymoreSword extends KFMeleeGun;

DefaultProperties
{
    SkinRefs(0)="KF_Weapons4_Trip_T.Weapons.Claymore_cmb"

    bKFNeverThrow=false
	weaponRange=100.000000
    BloodyMaterialRef="KF_Weapons4_Trip_T.Claymore_Bloody_cmb"
    BloodSkinSwitchArray=0
    bSpeedMeUp=True
    //WeaponIdleMovementAnim="IdleMoveSyringe"
    Weight=6.000000
    FireModeClass(0)=Class'KFMod.ClaymoreSwordFire'
    FireModeClass(1)=Class'KFMod.ClaymoreSwordFireB'
    SelectSoundRef="KF_ClaymoreSnd.WEP_Claymore_Foley_Select"
    Description="A medieval claymore sword."
    Priority=115
    SmallViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    GroupOffset=5
    PickupClass=Class'KFMod.ClaymoreSwordPickup'
    PlayerViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    BobDamping=8.000000
    AttachmentClass=Class'KFMod.ClaymoreSwordAttachment'
    IconCoords=(X1=246,Y1=80,X2=332,Y2=106)
    ItemName="Claymore Sword"
    MeshRef="KF_Wep_Claymore.Claymore_Trip"
    AmbientGlow=0

    AIRating=0.4
    CurrentRating=0.6

    DisplayFOV=75.000000
    StandardDisplayFOV=75.0

    HudImageRef="KillingFloor2HUD.WeaponSelect.Claymore_unselected"
    SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Claymore"
   	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Claymore'

   	bIsTier2Weapon=true
}
