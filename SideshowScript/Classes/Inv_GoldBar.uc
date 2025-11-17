/*
	--------------------------------------------------------------
	Inv_GoldBar
	--------------------------------------------------------------

    Carryable Gold bar item for an Escort the VIP style objective
    in the 2013 Summer Sideshow map

	Author :  Alex Quick

	--------------------------------------------------------------
*/

class Inv_GoldBar extends KF_StoryInventoryItem;

DefaultProperties
{
    bRender1PMesh = false

    bUseForcedGroundSpeed = true
 	ForcedGroundSpeed =120.0      // always go this speed when carrying gold bars!

    AttachmentClass = none;    // gold bars have no visible attachment when carried!
    PickupClass = Class 'Pickup_GoldBar'

    CarriedMaterial =  Texture 'Pier_T.Icons.Goldbar_Icon_64'
    GroundMaterial =  Texture 'Pier_T.Icons.Goldbar_Icon_64'
}
