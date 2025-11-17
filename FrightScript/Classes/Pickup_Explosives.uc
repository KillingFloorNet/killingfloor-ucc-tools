class Pickup_Explosives extends KF_StoryInventoryPickup;

defaultproperties
{
    bRenderIconThroughWalls = true
    bRender1PMesh = false

    CollisionRadius = 40
    CollisionHeight = 10

    bOrientOnSlope=false

    AIThreatModifier = 1.5
    MaxHeldCopies = 1

    MessageClass = class 'Msg_ExplosivePickupNotification'
    UV2Texture = FadeColor'PatchTex.Common.PickupOverlay'
    InventoryType = class 'Inv_Explosives'

    CarriedMaterial =  Texture 'FrightYard_T.TNT_Icon_64'
    GroundMaterial =   Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'

    StaticMesh = StaticMesh'FrightYard_SM.Dynamite.SM_Dynamite_Open'
}
