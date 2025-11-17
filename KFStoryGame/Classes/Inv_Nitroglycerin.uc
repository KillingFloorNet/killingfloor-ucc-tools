/*
	--------------------------------------------------------------
	Inv_Nitroglycerin
	--------------------------------------------------------------
*/

class Inv_Nitroglycerin extends KF_StoryInventoryItem;

defaultproperties
{
    bDropFromCameraLoc=true
    AttachmentClass = none;
    CarriedMaterial =  Texture 'KF_Swansong_Tex.Icons.Nitroglycerin_Icon_64'
    GroundMaterial =  Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'

    bUseForcedGroundSpeed = true
 	ForcedGroundSpeed =120.0

    PickupClass = class 'Pickup_Nitroglycerin'
}
