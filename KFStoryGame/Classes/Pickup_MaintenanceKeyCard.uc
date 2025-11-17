/*
	--------------------------------------------------------------
	Pickup_MaintenanceKeyCard
	--------------------------------------------------------------
*/

class Pickup_MaintenanceKeyCard extends KF_StoryInventoryPickup
placeable;

defaultproperties
{
    DrawScale=1.0

    bRenderIconThroughWalls = false
    bRender1PMesh = false

    CollisionRadius = 25
    CollisionHeight = 25

    bOrientOnSlope=true
    MaxHeldCopies = 1

    UV2Texture = FadeColor'PatchTex.Common.PickupOverlay'
    CarriedMaterial =  Texture 'KF_Swansong_Tex.Icons.Keycard_Icon_64'
    GroundMaterial =  Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'

    InventoryType = class 'Inv_MaintenanceKeyCard'
    MessageClass = class 'Msg_MaintenanceKeyCardNotification'

    StaticMesh=StaticMesh'KF_Swansong_SM.Metro.SM_Keycard'

    PrePivot=(X=0.f,Y=0.Z,Z=25.f)

}
