/*
	--------------------------------------------------------------
	Pickup_Thermite
	--------------------------------------------------------------
*/

class Pickup_Thermite extends KF_StoryInventoryPickup;

defaultproperties
{
    DrawScale = 0.6

    StaticMesh = StaticMesh'KF_Swansong_SM.Metro.SM_Thermite'

    bRenderIconThroughWalls = false
    bRender1PMesh = false

    CollisionRadius = 40
    CollisionHeight = 10

    bOrientOnSlope=false
    MaxHeldCopies = 1
    PrePivot=(X=0,Y=0,Z=18)

    UV2Texture = FadeColor'PatchTex.Common.PickupOverlay'
    CarriedMaterial =  Texture 'KF_Swansong_Tex.Icons.Thermite_Icon_64'
    GroundMaterial =  Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'

    InventoryType = class 'Inv_Thermite'
    MessageClass = class 'Msg_ThermiteNotification'
}
