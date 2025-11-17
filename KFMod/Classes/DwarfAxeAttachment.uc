//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DwarfAxeAttachment extends KFMeleeAttachment;

DefaultProperties
{
	MeshRef="KF_Weapons3rd6_Trip.Dwarf_Axe"

    MovementAnims(0)=JogF_Axe
    MovementAnims(1)=JogB_Axe
    MovementAnims(2)=JogL_Axe
    MovementAnims(3)=JogR_Axe
    CrouchAnims(0)=CHwalkF_Axe
    CrouchAnims(1)=CHwalkB_Axe
    CrouchAnims(2)=CHwalkL_Axe
    CrouchAnims(3)=CHwalkR_Axe
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

    TurnRightAnim=TurnR_Axe
    TurnLeftAnim=TurnL_Axe
    CrouchTurnRightAnim=CH_TurnR_Axe
    CrouchTurnLeftAnim=CH_TurnL_Axe
    IdleRestAnim=Idle_Axe//Idle_Rest
    IdleCrouchAnim=CHIdle_Axe
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_Axe//Idle_Rifle
    IdleHeavyAnim=Idle_Axe//Idle_Biggun
    IdleRifleAnim=Idle_Axe//Idle_Rifle
    IdleChatAnim=Idle_Axe
    FireAnims(0)=Attack1_Axe
    FireAnims(1)=Attack2_Axe
    FireAnims(2)=Attack3_Axe
    FireAnims(3)=Attack3_Axe
    FireAltAnims(0)=Attack1_Axe
    FireAltAnims(1)=Attack2_Axe
    FireAltAnims(2)=Attack3_Axe
    FireAltAnims(3)=Attack3_Axe
    FireCrouchAnims(0)=CHAttack1_Axe
    FireCrouchAnims(1)=CHAttack2_Axe
    FireCrouchAnims(2)=CHAttack3_Axe
    FireCrouchAnims(3)=CHAttack3_Axe
    FireCrouchAltAnims(0)=CHAttack1_Axe
    FireCrouchAltAnims(1)=CHAttack2_Axe
    FireCrouchAltAnims(2)=CHAttack3_Axe
    FireCrouchAltAnims(3)=CHAttack3_Axe
    HitAnims(0)=HitF_Axe
    HitAnims(1)=HitB_Axe
    HitAnims(2)=HitL_Axe
    HitAnims(3)=HitR_Axe
    PostFireBlendStandAnim=Blend_Axe
    PostFireBlendCrouchAnim=CHBlend_Axe
}
