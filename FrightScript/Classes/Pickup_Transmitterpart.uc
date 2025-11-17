class Pickup_Transmitterpart extends KF_StoryInventoryPickup;

defaultproperties
{
    bRenderIconThroughWalls = false
    bRender1PMesh = false

    CollisionRadius = 40
    CollisionHeight = 10

    bOrientOnSlope=false

    AIThreatModifier = 1.5
    MaxHeldCopies = 2

    MessageClass = class 'Msg_RemoteControlNotification'
    UV2Texture = FadeColor'PatchTex.Common.PickupOverlay'
}
