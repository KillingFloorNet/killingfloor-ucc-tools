//=============================================================================
// Axe Inventory class
//=============================================================================
class Axe extends KFMeleeGun;

defaultproperties
{
    Skins(0)=Combiner'KF_Weapons_Trip_T.melee.axe_cmb'

    weaponRange=80.000000

    BloodyMaterial=Combiner'KF_Weapons_Trip_T.melee.axe_bloody_cmb'
    bSpeedMeUp=True

    Weight=5.000000
    FireModeClass(0)=Class'KFMod.AxeFire'
    FireModeClass(1)=Class'KFMod.AxeFireB'
    Description="A common two-handed fireman's axe."
    Priority=55
    GroupOffset=3
    PickupClass=Class'KFMod.AxePickup'
    BobDamping=8.000000
    AttachmentClass=Class'KFMod.AxeAttachment'
    IconCoords=(X1=169,Y1=39,X2=241,Y2=77)
    ItemName="Axe"
    Mesh=SkeletalMesh'KF_Weapons_Trip.Axe_Trip'
    AmbientGlow=0

    AIRating=0.3
    CurrentRating=0.5

    ChopSlowRate = 0.2

    BloodSkinSwitchArray=0

    DisplayFOV=75.000000
    StandardDisplayFOV=75.0

    HudImage=Texture'KillingFloorHUD.WeaponSelect.Axe_unselected'
    SelectedHudImage=Texture'KillingFloorHUD.WeaponSelect.Axe'
    SelectSound=Sound'KF_AxeSnd.Axe_Select'
   	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_Axe'

	bIsTier2Weapon=true
}
