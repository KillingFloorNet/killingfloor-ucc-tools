class PipeBombAttachment extends KFWeaponAttachment;

// No muzzle flash for this!!!
simulated function WeaponLight(){}
simulated function DoFlashEmitter(){}

defaultproperties
{
    mMuzFlashClass=none//Class'ROEffects.MuzzleFlash3rdKar'
    mShellCaseEmitterClass=none//Class'KFMod.KFShotgunShellSpewer'
    MeshRef="KF_Weapons3rd2_Trip.pipebomb_3rd"

    MovementAnims(0)=JogF_PipeBomb
    MovementAnims(1)=JogB_PipeBomb
    MovementAnims(2)=JogL_PipeBomb
    MovementAnims(3)=JogR_PipeBomb
    CrouchAnims(0)=CHwalkF_PipeBomb
    CrouchAnims(1)=CHwalkB_PipeBomb
    CrouchAnims(2)=CHwalkL_PipeBomb
    CrouchAnims(3)=CHwalkR_PipeBomb
    WalkAnims(0)=WalkF_PipeBomb
    WalkAnims(1)=WalkB_PipeBomb
    WalkAnims(2)=WalkL_PipeBomb
    WalkAnims(3)=WalkR_PipeBomb
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

    TurnRightAnim=TurnR_PipeBomb
    TurnLeftAnim=TurnL_PipeBomb
    CrouchTurnRightAnim=CH_TurnR_PipeBomb
    CrouchTurnLeftAnim=CH_TurnL_PipeBomb
    IdleRestAnim=Idle_PipeBomb//Idle_Rest
    IdleCrouchAnim=CHIdle_PipeBomb
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_PipeBomb//Idle_Rifle
    IdleHeavyAnim=Idle_PipeBomb//Idle_Biggun
    IdleRifleAnim=Idle_PipeBomb//Idle_Rifle
    IdleChatAnim=Idle_PipeBomb
    FireAnims(0)=Fire_PipeBomb
    FireAnims(1)=Fire_PipeBomb
    FireAnims(2)=Fire_PipeBomb
    FireAnims(3)=Fire_PipeBomb
    FireAltAnims(0)=Fire_PipeBomb
    FireAltAnims(1)=Fire_PipeBomb
    FireAltAnims(2)=Fire_PipeBomb
    FireAltAnims(3)=Fire_PipeBomb
    FireCrouchAnims(0)=CHFire_PipeBomb
    FireCrouchAnims(1)=CHFire_PipeBomb
    FireCrouchAnims(2)=CHFire_PipeBomb
    FireCrouchAnims(3)=CHFire_PipeBomb
    FireCrouchAltAnims(0)=CHFire_PipeBomb
    FireCrouchAltAnims(1)=CHFire_PipeBomb
    FireCrouchAltAnims(2)=CHFire_PipeBomb
    FireCrouchAltAnims(3)=CHFire_PipeBomb
    HitAnims(0)=HitF_PipeBomb
    HitAnims(1)=HitB_PipeBomb
    HitAnims(2)=HitL_PipeBomb
    HitAnims(3)=HitR_PipeBomb
    PostFireBlendStandAnim=Blend_PipeBomb
    PostFireBlendCrouchAnim=CHBlend_PipeBomb
}
