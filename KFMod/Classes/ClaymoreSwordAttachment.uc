//-----------------------------------------------------------
//
//-----------------------------------------------------------
class ClaymoreSwordAttachment extends KFMeleeAttachment;

DefaultProperties
{
	MeshRef="KF_Weapons3rd3_Trip.Claymore_3rd"

    MovementAnims(0)=JogF_Katana
    MovementAnims(1)=JogB_Katana
    MovementAnims(2)=JogL_Katana
    MovementAnims(3)=JogR_Katana
    CrouchAnims(0)=CHwalkF_Katana
    CrouchAnims(1)=CHwalkB_Katana
    CrouchAnims(2)=CHwalkL_Katana
    CrouchAnims(3)=CHwalkR_Katana
//    WalkAnims(0)=WalkF
//    WalkAnims(1)=WalkB
//    WalkAnims(2)=WalkL
//    WalkAnims(3)=WalkR
    AirStillAnim=JumpF_Mid
    AirAnims(0)=JumpF_Mid
    AirAnims(1)=JumpF_Mid
    AirAnims(2)=JumpL_Mid
    AirAnims(3)=JumpR_Mid
    TakeoffStillAnim=JumpF_Takeoff
    TakeoffAnims(0)=JumpF_Takeoff
    TakeoffAnims(1)=JumpF_Takeoff
    TakeoffAnims(2)=JumpL_Takeoff
    TakeoffAnims(3)=JumpR_Takeoff
    LandAnims(0)=JumpF_Land
    LandAnims(1)=JumpF_Land
    LandAnims(2)=JumpL_Land
    LandAnims(3)=JumpR_Land

    TurnRightAnim=TurnR_Katana
    TurnLeftAnim=TurnL_Katana
    CrouchTurnRightAnim=CH_TurnR_Katana
    CrouchTurnLeftAnim=CH_TurnL_Katana
    IdleRestAnim=Idle_Katana//Idle_Rest
    IdleCrouchAnim=CHIdle_Katana
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_Katana//Idle_Rifle
    IdleHeavyAnim=Idle_Katana//Idle_Biggun
    IdleRifleAnim=Idle_Katana//Idle_Rifle
    IdleChatAnim=Idle_Katana
    FireAnims(0)=FastAttack1_Claymore
    FireAnims(1)=FastAttack2_Claymore
    FireAnims(2)=FastAttack3_Claymore
    FireAnims(3)=FastAttack4_Claymore
    //FireAnims(4)=FastAttack5_Claymore
    //FireAnims(5)=FastAttack6_Claymore
    FireAltAnims(0)=HardAttack1_Claymore
    FireAltAnims(1)=HardAttack1_Claymore
    FireAltAnims(2)=HardAttack1_Claymore
    FireAltAnims(3)=HardAttack1_Claymore
    FireCrouchAnims(0)=CHFastAttack1_Claymore
    FireCrouchAnims(1)=CHFastAttack2_Claymore
    FireCrouchAnims(2)=CHFastAttack3_Claymore
    FireCrouchAnims(3)=CHFastAttack4_Claymore
    //FireCrouchAnims(4)=CHFastAttack5_Claymore
    //FireCrouchAnims(5)=CHFastAttack6_Claymore
    FireCrouchAltAnims(0)=CHHardAttack1_Claymore
    FireCrouchAltAnims(1)=CHHardAttack1_Claymore
    FireCrouchAltAnims(2)=CHHardAttack1_Claymore
    FireCrouchAltAnims(3)=CHHardAttack1_Claymore
    HitAnims(0)=HitF_Katana
    HitAnims(1)=HitB_Katana
    HitAnims(2)=HitL_Katana
    HitAnims(3)=HitR_Katana
    PostFireBlendStandAnim=Blend_Katana
    PostFireBlendCrouchAnim=CHBlend_Katana
}
