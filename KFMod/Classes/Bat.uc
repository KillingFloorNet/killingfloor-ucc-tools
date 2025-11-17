//=============================================================================
// Bat Inventory class
//=============================================================================
class Bat extends KFMeleeGun;

defaultproperties
{
    weaponRange=80.000000
    bSpeedMeUp=True

    BloodyMaterial=Shader'KillingFloorWeapons.Bat.BatBloodyShader'
    BloodSkinSwitchArray=0

    Skins(0)=Shader'KillingFloorWeapons.Bat.BatShineShader'
    Skins(1)=Combiner'KF_Weapons_Trip_T.hands.hands_1stP_military_cmb'
    Weight=3.000000
    FireModeClass(0)=Class'KFMod.BatFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    Description="This bit of broken pipe looks like it was pried from a gas-line."
    Priority=3
    //SmallViewOffset=(X=13.000000,Y=18.000000,Z=-10.000000)
    GroupOffset=2
    PickupClass=Class'KFMod.BatPickup'
    PlayerViewOffset=(X=0.000000,Y=0.000000,Z=0.000000)
    //PlayerViewPivot=(Pitch=400)
    BobDamping=8.000000
    AttachmentClass=Class'KFMod.BatAttachment'
    IconCoords=(Y1=407,X2=118,Y2=442)
    ItemName="Broken Pipe"
    Mesh=SkeletalMesh'KF_Weapons_Trip.Pipe_Trip'
    AmbientGlow=0
    AIRating=0.4
    CurrentRating=0.4

    ChopSlowRate = 0.35

    DisplayFOV=70.000000
    StandardDisplayFOV=70.0

    HudImage=texture'KillingFloorHUD.WeaponSelect.machette'
}
