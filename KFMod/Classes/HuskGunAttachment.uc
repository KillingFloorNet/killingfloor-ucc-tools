//=============================================================================
// HuskGunAttachment
//=============================================================================
// Husk Gun third person attachment class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class HuskGunAttachment extends KFWeaponAttachment;

var byte HuskGunCharge, OldHuskGunCharge;
var() class<Emitter> ChargeEmitterClass;
var() Emitter ChargeEmitter;

replication
{
	// Things the server should send to the client.
	reliable if( bNetDirty && (!bNetOwner || bDemoRecording || bRepClientDemo) && (Role==ROLE_Authority) )
		HuskGunCharge;
}

simulated function PostNetReceive()
{
	if( HuskGunCharge!=OldHuskGunCharge )
	{
		OldHuskGunCharge = HuskGunCharge;
		UpdateHuskGunCharge();
	}
}

simulated function UpdateHuskGunCharge()
{
    local float ChargeScale;

    if( Level.NetMode == NM_DedicatedServer )
    {
        return;
    }

    if( HuskGunCharge == 0 )
    {
        DestroyChargeEffect();
    }
    else
    {
        InitChargeEffect();

        ChargeScale = float(HuskGunCharge)/255.0;

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
    mMuzFlashClass=Class'ROEffects.MuzzleFlash3rdNadeL'
    MeshRef="KF_Weapons3rd3_Trip.HuskGun_3rd"
    ChargeEmitterClass=Class'ROEffects.ChargeUp3rdHusk'

    MovementAnims(0)=JogF_HuskGun
    MovementAnims(1)=JogB_HuskGun
    MovementAnims(2)=JogL_HuskGun
    MovementAnims(3)=JogR_HuskGun
    CrouchAnims(0)=CHwalkF_HuskGun
    CrouchAnims(1)=CHwalkB_HuskGun
    CrouchAnims(2)=CHwalkL_HuskGun
    CrouchAnims(3)=CHwalkR_HuskGun
    WalkAnims(0)=WalkF_HuskGun
    WalkAnims(1)=WalkB_HuskGun
    WalkAnims(2)=WalkL_HuskGun
    WalkAnims(3)=WalkR_HuskGun
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

    TurnRightAnim=TurnR_HuskGun
    TurnLeftAnim=TurnL_HuskGun
    CrouchTurnRightAnim=CH_TurnR_HuskGun
    CrouchTurnLeftAnim=CH_TurnL_HuskGun
    IdleRestAnim=Idle_HuskGun//Idle_Rest
    IdleCrouchAnim=CHIdle_HuskGun
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_HuskGun//Idle_Rifle
    IdleHeavyAnim=Idle_HuskGun//Idle_Biggun
    IdleRifleAnim=Idle_HuskGun//Idle_Rifle
    IdleChatAnim=Idle_HuskGun
    FireAnims(0)=Fire_HuskGun
    FireAnims(1)=Fire_HuskGun
    FireAnims(2)=Fire_HuskGun
    FireAnims(3)=Fire_HuskGun
    FireAltAnims(0)=Fire_HuskGun
    FireAltAnims(1)=Fire_HuskGun
    FireAltAnims(2)=Fire_HuskGun
    FireAltAnims(3)=Fire_HuskGun
    FireCrouchAnims(0)=CHFire_HuskGun
    FireCrouchAnims(1)=CHFire_HuskGun
    FireCrouchAnims(2)=CHFire_HuskGun
    FireCrouchAnims(3)=CHFire_HuskGun
    FireCrouchAltAnims(0)=CHFire_HuskGun
    FireCrouchAltAnims(1)=CHFire_HuskGun
    FireCrouchAltAnims(2)=CHFire_HuskGun
    FireCrouchAltAnims(3)=CHFire_HuskGun
    HitAnims(0)=HitF_HuskGun
    HitAnims(1)=HitB_HuskGun
    HitAnims(2)=HitL_HuskGun
    HitAnims(3)=HitR_HuskGun
    PostFireBlendStandAnim=Blend_HuskGun
    PostFireBlendCrouchAnim=CHBlend_HuskGun

    WeaponAmbientScale=2.0
}
