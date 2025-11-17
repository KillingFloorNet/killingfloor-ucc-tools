class Pickup_GasCan extends KF_StoryInventoryPickup;

defaultproperties
{
    bRenderIconThroughWalls = true
    bRender1PMesh = false

    CollisionRadius = 40
    CollisionHeight = 10

    bOrientOnSlope=false

    AIThreatModifier = 1.5
    MaxHeldCopies = 2

    MessageClass = class 'Msg_GasCanNotification'
    UV2Texture = FadeColor'PatchTex.Common.PickupOverlay'

    InventoryType = class 'Inv_GasCan'

    StaticMesh = StaticMesh 'FrightYard_SM.GasolineCan.SM_GasolineCan'
    CarriedMaterial =  Texture 'FrightYard_T.Gas_Icon_64'
    GroundMaterial =   Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'
}
