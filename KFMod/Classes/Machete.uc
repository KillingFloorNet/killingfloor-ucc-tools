//=============================================================================
// Machete Inventory class
//=============================================================================
class Machete extends KFMeleeGun;

defaultproperties
{
    Skins(0)=Combiner'KF_Weapons_Trip_T.melee.Machete_cmb'
    Skins(1)=Combiner'KF_Weapons_Trip_T.hands.hands_1stP_military_cmb'

    weaponRange=80.000000
    bSpeedMeUp=True

    BloodyMaterial=Combiner'KF_Weapons_Trip_T.melee.machete_bloody_cmb'
    BloodSkinSwitchArray=0

    Weight=1.000000 // Reduced in Balance Round 2
    FireModeClass(0)=Class'KFMod.MacheteFire'
    FireModeClass(1)=Class'KFMod.MacheteFireB'
    Description="A machete - commonly used for hacking through brush, or the limbs of ZEDs."
    Priority=50
    //SmallViewOffset=(X=13.000000,Y=18.000000,Z=-10.000000)
    GroupOffset=2
    PickupClass=Class'KFMod.MachetePickup'
    PlayerViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    //PlayerViewPivot=(Pitch=400)
    BobDamping=8.000000
    AttachmentClass=Class'KFMod.MacheteAttachment'
    IconCoords=(Y1=407,X2=118,Y2=442)
    ItemName="Machete"
    Mesh=SkeletalMesh'KF_Weapons_Trip.Machete_Trip'
    AmbientGlow=0
    AIRating=0.4
    CurrentRating=0.4
    SelectSound=Sound'KF_MacheteSnd.Machete_Select'

    ChopSlowRate = 0.35

    DisplayFOV=70.000000
    StandardDisplayFOV=70.0

    HudImage=texture'KillingFloorHUD.WeaponSelect.machette_unselected'
    SelectedHudImage=texture'KillingFloorHUD.WeaponSelect.machette'
   	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_Machete'
}
