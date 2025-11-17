//-----------------------------------------------------------
//
//-----------------------------------------------------------
class Katana extends KFMeleeGun;

DefaultProperties
{
    SkinRefs(0)="KF_Weapons2_Trip_T.melee.Katana_cmb"

    bKFNeverThrow=false
	weaponRange=90.000000
    BloodyMaterialRef="KF_Weapons2_Trip_T.melee.Katana_Bloody_cmb"
    BloodSkinSwitchArray=0
    bSpeedMeUp=True
    //WeaponIdleMovementAnim="IdleMoveSyringe"
    Weight=3.000000
    FireModeClass(0)=Class'KFMod.KatanaFire'
    FireModeClass(1)=Class'KFMod.KatanaFireB'
    SelectSoundRef="KF_KatanaSnd.Katana_Select"
    Description="An incredibly sharp katana sword."
    Priority=110
    SmallViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    GroupOffset=4
    PickupClass=Class'KFMod.KatanaPickup'
    PlayerViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    BobDamping=8.000000
    AttachmentClass=Class'KFMod.KatanaAttachment'
    IconCoords=(X1=246,Y1=80,X2=332,Y2=106)
    ItemName="Katana"
    MeshRef="KF_Weapons2_Trip.Katana_Trip"
    AmbientGlow=0

    AIRating=0.4
    CurrentRating=0.6

    DisplayFOV=75.000000
    StandardDisplayFOV=75.0

    HudImageRef="KillingFloor2HUD.WeaponSelect.katana_unselected"
    SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Katana"
   	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Katana'

	// Achievement Helpers
	bIsTier2Weapon=true
}
