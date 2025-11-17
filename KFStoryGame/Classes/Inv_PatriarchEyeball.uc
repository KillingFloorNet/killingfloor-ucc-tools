/*
	--------------------------------------------------------------
	Inv_PatriarchEyeBall
	--------------------------------------------------------------
*/

class Inv_PatriarchEyeball extends KF_StoryInventoryItem;

defaultproperties
{
    bDropFromCameraLoc=true
    AttachmentClass = none;
    PickupClass = class 'Pickup_PatriarchEyeBall'
    CarriedMaterial =  Texture 'KF_Swansong_Tex.Icons.Eyeball_Icon_64'
    GroundMaterial =  Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'
}
