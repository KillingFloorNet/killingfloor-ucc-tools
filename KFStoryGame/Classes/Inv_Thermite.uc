/*
	--------------------------------------------------------------
	Inv_Thermite
	--------------------------------------------------------------
*/

class Inv_Thermite extends KF_StoryInventoryItem;

defaultproperties
{
    bDropFromCameraLoc=true
    AttachmentClass = none;
    PickupClass = class 'Pickup_Thermite'
    CarriedMaterial =  Texture 'KF_Swansong_Tex.Icons.Thermite_Icon_64'
    GroundMaterial =  Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'
}
