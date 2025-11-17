class BatAttachment extends KFMeleeAttachment ;

defaultproperties
{
	Mesh=SkeletalMesh'KF_Weapons3rd_Trip.Pipe_3rd'

    MovementAnims(0)=JogF_Pipe
    MovementAnims(1)=JogB_Pipe
    MovementAnims(2)=JogL_Pipe
    MovementAnims(3)=JogR_Pipe
    CrouchAnims(0)=CHwalkF_Pipe
    CrouchAnims(1)=CHwalkB_Pipe
    CrouchAnims(2)=CHwalkL_Pipe
    CrouchAnims(3)=CHwalkR_Pipe
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

    TurnRightAnim=TurnR_Pipe
    TurnLeftAnim=TurnL_Pipe
    CrouchTurnRightAnim=CH_TurnR_Pipe
    CrouchTurnLeftAnim=CH_TurnL_Pipe
    IdleRestAnim=Idle_Pipe//Idle_Rest
    IdleCrouchAnim=CHIdle_Pipe
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_Pipe//Idle_Rifle
    IdleHeavyAnim=Idle_Pipe//Idle_Biggun
    IdleRifleAnim=Idle_Pipe//Idle_Rifle
    IdleChatAnim=Idle_Pipe
    FireAnims(0)=Attack1_Pipe
    FireAnims(1)=Attack2_Pipe
    FireAnims(2)=Attack3_Pipe
    FireAnims(3)=Attack4_Pipe
    FireAltAnims(0)=Attack1_Pipe
    FireAltAnims(1)=Attack2_Pipe
    FireAltAnims(2)=Attack3_Pipe
    FireAltAnims(3)=Attack4_Pipe
}
