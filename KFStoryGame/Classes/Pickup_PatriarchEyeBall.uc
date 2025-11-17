/*
	--------------------------------------------------------------
	Pickup_PatriarchEyeBall
	--------------------------------------------------------------
*/

class Pickup_PatriarchEyeBall extends KF_StoryInventoryPickup;

defaultproperties
{
    DrawScale=2.f

    bRenderIconThroughWalls = false
    bRender1PMesh = false

    CollisionRadius = 25
    CollisionHeight = 25

    bOrientOnSlope=true
    MaxHeldCopies = 1

    UV2Texture = FadeColor'PatchTex.Common.PickupOverlay'
    CarriedMaterial =  Texture 'KF_Swansong_Tex.Icons.Eyeball_Icon_64'
    GroundMaterial =  Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'

    InventoryType = class 'Inv_PatriarchEyeBall'
    MessageClass = class 'Msg_EyeBallNotification'

    StaticMesh=StaticMesh 'kf_gore_trip_sm.gibbs.eyeball'
    Skins(0)=Texture 'kf_fx_trip_t.Gore.eyeball_diff'

    PrePivot=(X=0,Y=0,Z=11.5)

    DroppedSound=Sound'KFPawnDamageSound.MeleeDamageSounds.bathitflesh2'
}
