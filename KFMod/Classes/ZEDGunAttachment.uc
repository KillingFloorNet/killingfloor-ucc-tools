//=============================================================================
// ZEDGunAttachment
//=============================================================================
// ZEDGun third person attachment class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ZEDGunAttachment extends KFWeaponAttachment;

var byte ZedGunCharge, OldZedGunCharge;
var() class<Emitter> ChargeEmitterClass;
var() Emitter ChargeEmitter;

replication
{
	// Things the server should send to the client.
	reliable if( bNetDirty && (!bNetOwner || bDemoRecording || bRepClientDemo) && (Role==ROLE_Authority) )
		ZedGunCharge;
}

simulated function PostNetReceive()
{
	if( ZedGunCharge!=OldZedGunCharge )
	{
		OldZedGunCharge = ZedGunCharge;
		UpdateZedGunCharge();
	}
}

simulated function UpdateZedGunCharge()
{
    local float ChargeScale;

    if( Level.NetMode == NM_DedicatedServer )
    {
        return;
    }

    if( ZedGunCharge == 0 )
    {
        DestroyChargeEffect();
    }
    else
    {
        InitChargeEffect();

        ChargeScale = float(ZedGunCharge)/255.0;

        ChargeEmitter.Emitters[0].SizeScale[1].RelativeSize = Lerp( ChargeScale, 1, 3 );
        ChargeEmitter.Emitters[1].StartVelocityRadialRange.Min = Lerp( ChargeScale, 10, 75 );
        ChargeEmitter.Emitters[1].StartVelocityRadialRange.Max = Lerp( ChargeScale, 10, 75 );
        ChargeEmitter.Emitters[1].SizeScale[0].RelativeSize = Lerp( ChargeScale, 1, 3 );
    }
}

simulated function Destroyed()
{
    DestroyChargeEffect();

	Super.Destroyed();
}

simulated function InitChargeEffect()
{
    // don't even spawn on server
    if ( Level.NetMode == NM_DedicatedServer)
		return;

    if ( (ChargeEmitterClass != None) && ((ChargeEmitter == None) || ChargeEmitter.bDeleteMe) )
    {
        ChargeEmitter = Spawn(ChargeEmitterClass);
        if ( ChargeEmitter != None )
    		AttachToBone(ChargeEmitter, 'tip');
    }
}

simulated function DestroyChargeEffect()
{
    if (ChargeEmitter != None)
        ChargeEmitter.Destroy();
}

defaultproperties
{
    mMuzFlashClass=Class'ROEffects.MuzzleFlash3rdZEDGunPrimary'
    MeshRef="KF_Weapons3rd6_Trip.ZED_3rd"
    ChargeEmitterClass=Class'ROEffects.ChargeUp3rdZEDGun'

    MovementAnims(0)=JogF_ZED
    MovementAnims(1)=JogB_ZED
    MovementAnims(2)=JogL_ZED
    MovementAnims(3)=JogR_ZED
    CrouchAnims(0)=CHwalkF_ZED
    CrouchAnims(1)=CHwalkB_ZED
    CrouchAnims(2)=CHwalkL_ZED
    CrouchAnims(3)=CHwalkR_ZED
    WalkAnims(0)=WalkF_ZED
    WalkAnims(1)=WalkB_ZED
    WalkAnims(2)=WalkL_ZED
    WalkAnims(3)=WalkR_ZED
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

    TurnRightAnim=TurnR_ZED
    TurnLeftAnim=TurnL_ZED
    CrouchTurnRightAnim=CH_TurnR_ZED
    CrouchTurnLeftAnim=CH_TurnL_ZED
    IdleRestAnim=Idle_ZED//Idle_Rest
    IdleCrouchAnim=CHIdle_ZED
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_ZED//Idle_Rifle
    IdleHeavyAnim=Idle_ZED//Idle_Biggun
    IdleRifleAnim=Idle_ZED//Idle_Rifle
    IdleChatAnim=Idle_ZED
    FireAnims(0)=Fire_ZED
    FireAnims(1)=Fire_ZED
    FireAnims(2)=Fire_ZED
    FireAnims(3)=Fire_ZED
    FireAltAnims(0)=Fire_ZED
    FireAltAnims(1)=Fire_ZED
    FireAltAnims(2)=Fire_ZED
    FireAltAnims(3)=Fire_ZED
    FireCrouchAnims(0)=CHFire_ZED
    FireCrouchAnims(1)=CHFire_ZED
    FireCrouchAnims(2)=CHFire_ZED
    FireCrouchAnims(3)=CHFire_ZED
    FireCrouchAltAnims(0)=CHFire_ZED
    FireCrouchAltAnims(1)=CHFire_ZED
    FireCrouchAltAnims(2)=CHFire_ZED
    FireCrouchAltAnims(3)=CHFire_ZED
    HitAnims(0)=HitF_ZED
    HitAnims(1)=HitB_ZED
    HitAnims(2)=HitL_ZED
    HitAnims(3)=HitR_ZED
    PostFireBlendStandAnim=Blend_ZED
    PostFireBlendCrouchAnim=CHBlend_ZED

    WeaponAmbientScale=2.0
}
