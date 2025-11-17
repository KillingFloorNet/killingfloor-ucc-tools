//=============================================================================
// BlowerThrowerAttachment
//=============================================================================
// Third person attachment class for the bloat bile thrower
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class BlowerThrowerAttachment extends KFWeaponAttachment;

// No dynamic light when firing this
simulated function WeaponLight(){}

defaultproperties
{
    mMuzFlashClass=Class'KFMod.BlowerThrowerMuzzleFlash3P'
    mShellCaseEmitterClass=none
    MeshRef="KF_Weapons3rd3_IJC.BlowerThrower_3rd"

    MovementAnims(0)=JogF_IJC_BlowerThrower
    MovementAnims(1)=JogB_IJC_BlowerThrower
    MovementAnims(2)=JogL_IJC_BlowerThrower
    MovementAnims(3)=JogR_IJC_BlowerThrower
    CrouchAnims(0)=CHwalkF_IJC_BlowerThrower
    CrouchAnims(1)=CHwalkB_IJC_BlowerThrower
    CrouchAnims(2)=CHwalkL_IJC_BlowerThrower
    CrouchAnims(3)=CHwalkR_IJC_BlowerThrower
    WalkAnims(0)=WalkF_IJC_BlowerThrower
    WalkAnims(1)=WalkB_IJC_BlowerThrower
    WalkAnims(2)=WalkL_IJC_BlowerThrower
    WalkAnims(3)=WalkR_IJC_BlowerThrower
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

    TurnRightAnim=TurnR_IJC_BlowerThrower
    TurnLeftAnim=TurnL_IJC_BlowerThrower
    CrouchTurnRightAnim=CH_TurnR_IJC_BlowerThrower
    CrouchTurnLeftAnim=CH_TurnL_IJC_BlowerThrower
    IdleRestAnim=Idle_IJC_BlowerThrower//Idle_Rest
    IdleCrouchAnim=CHIdle_IJC_BlowerThrower
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_IJC_BlowerThrower//Idle_Rifle
    IdleHeavyAnim=Idle_IJC_BlowerThrower//Idle_Biggun
    IdleRifleAnim=Idle_IJC_BlowerThrower//Idle_Rifle
    IdleChatAnim=Idle_IJC_BlowerThrower
    FireAnims(0)=Fire_IJC_BlowerThrower
    FireAnims(1)=Fire_IJC_BlowerThrower
    FireAnims(2)=Fire_IJC_BlowerThrower
    FireAnims(3)=Fire_IJC_BlowerThrower
    FireAltAnims(0)=Fire_IJC_BlowerThrower
    FireAltAnims(1)=Fire_IJC_BlowerThrower
    FireAltAnims(2)=Fire_IJC_BlowerThrower
    FireAltAnims(3)=Fire_IJC_BlowerThrower
    FireCrouchAnims(0)=CHFire_IJC_BlowerThrower
    FireCrouchAnims(1)=CHFire_IJC_BlowerThrower
    FireCrouchAnims(2)=CHFire_IJC_BlowerThrower
    FireCrouchAnims(3)=CHFire_IJC_BlowerThrower
    FireCrouchAltAnims(0)=CHFire_IJC_BlowerThrower
    FireCrouchAltAnims(1)=CHFire_IJC_BlowerThrower
    FireCrouchAltAnims(2)=CHFire_IJC_BlowerThrower
    FireCrouchAltAnims(3)=CHFire_IJC_BlowerThrower
    HitAnims(0)=HitF_IJC_BlowerThrower
    HitAnims(1)=HitB_IJC_BlowerThrower
    HitAnims(2)=HitL_IJC_BlowerThrower
    HitAnims(3)=HitR_IJC_BlowerThrower
    PostFireBlendStandAnim=Blend_IJC_BlowerThrower
    PostFireBlendCrouchAnim=CHBlend_IJC_BlowerThrower

    WeaponAmbientScale=2.0
}
