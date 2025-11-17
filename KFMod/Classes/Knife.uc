//=============================================================================
// Knife Inventory class
//=============================================================================
class Knife extends KFMeleeGun;

defaultproperties
{
    Skins(0)=Combiner'KF_Weapons_Trip_T.melee.knife_cmb'

    weaponRange=65.000000
    BloodyMaterial=Combiner'KF_Weapons_Trip_T.melee.knife_bloody_cmb'
    BloodSkinSwitchArray=0
    bSpeedMeUp=True
    //WeaponIdleMovementAnim="IdleMoveSyringe"
    Weight=0.000000
    bKFNeverThrow=True
    FireModeClass(0)=Class'KFMod.KnifeFire'
    FireModeClass(1)=Class'KFMod.KnifeFireB'
    SelectSound=Sound'KF_KnifeSnd.Knife_Select'
    Description="Military Combat Knife"
    Priority=45
    SmallViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    GroupOffset=1
    PickupClass=Class'KFMod.KnifePickup'
    PlayerViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    BobDamping=8.000000
    AttachmentClass=Class'KFMod.KnifeAttachment'
    IconCoords=(X1=246,Y1=80,X2=332,Y2=106)
    ItemName="Knife"
    Mesh=SkeletalMesh'KF_Weapons_Trip.Knife_Trip'
    AmbientGlow=0

    AIRating=0.2
    CurrentRating=0.2

    DisplayFOV=75.000000
    StandardDisplayFOV=75.0

    HudImage=texture'KillingFloorHUD.WeaponSelect.knife_unselected'
    SelectedHudImage=texture'KillingFloorHUD.WeaponSelect.knife'
   	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_Knife'
}
