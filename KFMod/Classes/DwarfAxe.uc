//=============================================================================
// DwarfAxe
//=============================================================================
// An Axe from the game Dwarfs
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class DwarfAxe extends KFMeleeGun;

DefaultProperties
{
    SkinRefs(0)="Kf_Weapons9_Trip_T.Weapons.Dwarven_Axe_cmb"

    bKFNeverThrow=false
	weaponRange=80.000000
    BloodyMaterialRef="Kf_Weapons9_Trip_T.Dwarven_Axe_Bloody_cmb"
    BloodSkinSwitchArray=0
    bSpeedMeUp=True
    Weight=6.000000
    FireModeClass(0)=Class'KFMod.DwarfAxeFire'
    FireModeClass(1)=Class'KFMod.DwarfAxeFireB'
    SelectSoundRef="KF_DwarfAxeSnd.KF_WEP_DwarfAxe_Handling_Select"

    Priority=75
    SmallViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    GroupOffset=6
    PickupClass=Class'KFMod.DwarfAxePickup'
    PlayerViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    BobDamping=8.000000
    AttachmentClass=Class'KFMod.DwarfAxeAttachment'
    IconCoords=(X1=246,Y1=80,X2=332,Y2=106)
    ItemName="Dwarfs!? Axe"
    Description="Two-handed monster of an axe, liberated from some Dwarven stronghold. Even if it doesn't kill them, it'll certainly give them a headache!"

    MeshRef="KF_Wep_Dwarf_Axe.Dwarf_Axe_Trip"
    AmbientGlow=0

    AIRating=0.4
    CurrentRating=0.6

    DisplayFOV=75.000000
    StandardDisplayFOV=75.0

    HudImageRef="KillingFloor2HUD.WeaponSelect.Dwarven_Battle_Axe_unselected"
    SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Dwarven_Battle_Axe"
   	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Dwarven_Battle_Axe'

   	bIsTier2Weapon=true

    appID=210939
	UnlockedByAchievement=208
}
