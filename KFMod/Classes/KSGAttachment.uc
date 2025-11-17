//=============================================================================
// KSGAttachment
//=============================================================================
// KSG shotgun attachment class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and IJC
//=============================================================================
class KSGAttachment extends KFWeaponAttachment;

defaultproperties
{
    mMuzFlashClass=Class'ROEffects.MuzzleFlash3rdKar'
    mShellCaseEmitterClass=Class'KFMod.KFShotgunShellSpewer'
    MeshRef="KF_Weapons3rd4_Trip.KSG_3rd"

    MovementAnims(0)=JogF_MP5
    MovementAnims(1)=JogB_MP5
    MovementAnims(2)=JogL_MP5
    MovementAnims(3)=JogR_MP5
    CrouchAnims(0)=CHwalkF_MP5
    CrouchAnims(1)=CHwalkB_MP5
    CrouchAnims(2)=CHwalkL_MP5
    CrouchAnims(3)=CHwalkR_MP5
    WalkAnims(0)=WalkF_MP5
    WalkAnims(1)=WalkB_MP5
    WalkAnims(2)=WalkL_MP5
    WalkAnims(3)=WalkR_MP5
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

    TurnRightAnim=TurnR_MP5
    TurnLeftAnim=TurnL_MP5
    CrouchTurnRightAnim=CH_TurnR_MP5
    CrouchTurnLeftAnim=CH_TurnL_MP5
    IdleRestAnim=Idle_MP5//Idle_Rest
    IdleCrouchAnim=CHIdle_MP5
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_MP5//Idle_Rifle
    IdleHeavyAnim=Idle_MP5//Idle_Biggun
    IdleRifleAnim=Idle_MP5//Idle_Rifle
    IdleChatAnim=Idle_MP5
    FireAnims(0)=Fire_KSG
    FireAnims(1)=Fire_KSG
    FireAnims(2)=Fire_KSG
    FireAnims(3)=Fire_KSG
    FireAltAnims(0)=Fire_KSG
    FireAltAnims(1)=Fire_KSG
    FireAltAnims(2)=Fire_KSG
    FireAltAnims(3)=Fire_KSG
    FireCrouchAnims(0)=CHFire_KSG
    FireCrouchAnims(1)=CHFire_KSG
    FireCrouchAnims(2)=CHFire_KSG
    FireCrouchAnims(3)=CHFire_KSG
    FireCrouchAltAnims(0)=CHFire_KSG
    FireCrouchAltAnims(1)=CHFire_KSG
    FireCrouchAltAnims(2)=CHFire_KSG
    FireCrouchAltAnims(3)=CHFire_KSG
    HitAnims(0)=HitF_MP5
    HitAnims(1)=HitB_MP5
    HitAnims(2)=HitL_MP5
    HitAnims(3)=HitR_MP5
    PostFireBlendStandAnim=Blend_MP5
    PostFireBlendCrouchAnim=CHBlend_MP5
}
