//=============================================================================
// KrissMAttachment
//=============================================================================
// Kriss medic gun third person attachment class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class KrissMAttachment extends KFWeaponAttachment;

defaultproperties
{
    mMuzFlashClass=Class'ROEffects.MuzzleFlash3rdMP'
    mTracerClass=Class'KFMod.KFNewTracer'
    mShellCaseEmitterClass=Class'KFMod.KFShellSpewer'
    bRapidFire=True
    bAltRapidFire=True
    SplashEffect=Class'BulletSplashEmitter'
    CullDistance=5000.000000
    MeshRef="KF_Weapons3rd6_Trip.Kriss_3rd"
    ShellEjectBoneName=ShellPort

    MovementAnims(0)=JogF_Kriss
    MovementAnims(1)=JogB_Kriss
    MovementAnims(2)=JogL_Kriss
    MovementAnims(3)=JogR_Kriss
    CrouchAnims(0)=CHwalkF_Kriss
    CrouchAnims(1)=CHwalkB_Kriss
    CrouchAnims(2)=CHwalkL_Kriss
    CrouchAnims(3)=CHwalkR_Kriss
    WalkAnims(0)=WalkF_Kriss
    WalkAnims(1)=WalkB_Kriss
    WalkAnims(2)=WalkL_Kriss
    WalkAnims(3)=WalkR_Kriss
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

    TurnRightAnim=TurnR_Kriss
    TurnLeftAnim=TurnL_Kriss
    CrouchTurnRightAnim=CH_TurnR_Kriss
    CrouchTurnLeftAnim=CH_TurnL_Kriss
    IdleRestAnim=Idle_Kriss//Idle_Rest
    IdleCrouchAnim=CHIdle_Kriss
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_Kriss//Idle_Rifle
    IdleHeavyAnim=Idle_Kriss//Idle_Biggun
    IdleRifleAnim=Idle_Kriss//Idle_Rifle
    IdleChatAnim=Idle_Kriss
    FireAnims(0)=Fire_Kriss
    FireAnims(1)=Fire_Kriss
    FireAnims(2)=Fire_Kriss
    FireAnims(3)=Fire_Kriss
    FireAltAnims(0)=Fire_Kriss
    FireAltAnims(1)=Fire_Kriss
    FireAltAnims(2)=Fire_Kriss
    FireAltAnims(3)=Fire_Kriss
    FireCrouchAnims(0)=CHFire_Kriss
    FireCrouchAnims(1)=CHFire_Kriss
    FireCrouchAnims(2)=CHFire_Kriss
    FireCrouchAnims(3)=CHFire_Kriss
    FireCrouchAltAnims(0)=CHFire_Kriss
    FireCrouchAltAnims(1)=CHFire_Kriss
    FireCrouchAltAnims(2)=CHFire_Kriss
    FireCrouchAltAnims(3)=CHFire_Kriss
    HitAnims(0)=HitF_Kriss
    HitAnims(1)=HitB_Kriss
    HitAnims(2)=HitL_Kriss
    HitAnims(3)=HitR_Kriss
    PostFireBlendStandAnim=Blend_Kriss
    PostFireBlendCrouchAnim=CHBlend_Kriss

    WeaponAmbientScale=2.0
}
