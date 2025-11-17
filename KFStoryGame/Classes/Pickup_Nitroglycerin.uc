/*
	--------------------------------------------------------------
	Pickup_Nitroglycerin
	--------------------------------------------------------------
*/

class Pickup_Nitroglycerin extends KF_StoryInventoryPickup;

defaultproperties
{
    Drawscale=0.25

    StaticMesh = StaticMesh'KF_Swansong_SM.LAB.SM_Nitroglycerin_Bottle'

    bRenderIconThroughWalls = false
    bRender1PMesh = false

    CollisionRadius = 25
    CollisionHeight = 25

    bOrientOnSlope=false
    MaxHeldCopies = 1

    CarriedMaterial =  Texture 'KF_Swansong_Tex.Icons.Nitroglycerin_Icon_64'
    GroundMaterial =   Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'

    InventoryType = class 'Inv_Nitroglycerin'
    MessageClass = class 'Msg_NitroglycerinNotification'

    PrePivot=(X=0.f,Y=0.f,Z=100)
}
