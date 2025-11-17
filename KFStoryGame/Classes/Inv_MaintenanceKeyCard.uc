/*
	--------------------------------------------------------------
	Inv_MaintenanceKeyCard
	--------------------------------------------------------------
*/

class Inv_MaintenanceKeyCard extends KF_StoryInventoryItem;

defaultproperties
{
    bDropFromCameraLoc=true
    AttachmentClass = none;
    PickupClass = class 'Pickup_MaintenanceKeyCard'
    CarriedMaterial =  Texture 'KF_Swansong_Tex.Icons.Keycard_Icon_64'
    GroundMaterial =  Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'
}
