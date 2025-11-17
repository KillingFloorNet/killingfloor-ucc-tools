//=============================================================================
// ChainsawAttachment
//=============================================================================
// Chainsaw third person attachment class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class ChainsawAttachment extends KFMeleeAttachment ;

var class<KFMeleeHitEffect> HitEffectClass; // The class to spawn for the hit effect for this melee weapon hitting the world (not pawns)

simulated event ThirdPersonEffects()
{
	local PlayerController PC;

	if ( (Level.NetMode == NM_DedicatedServer) || (Instigator == None) )
		return;

	// new Trace FX - Ramm
	if (FiringMode == 0)
	{
		if ( OldSpawnHitCount != SpawnHitCount )
		{
			OldSpawnHitCount = SpawnHitCount;
			GetHitInfo();
			PC = Level.GetLocalPlayerController();
			if ( ((Instigator != None) && (Instigator.Controller == PC)) || (VSize(PC.ViewTarget.Location - mHitLocation) < 4000) )
			{
				if( mHitActor!=None )
					Spawn(HitEffectClass,,, mHitLocation, Rotator(-mHitNormal));
				CheckForSplash();
				SpawnTracer();
			}
		}
	}

  	if ( FlashCount>0 )
	{
		if( KFPawn(Instigator)!=None )
		{
			if (FiringMode == 0)
			{
				KFPawn(Instigator).StartFiringX(false,true);
			}
			else
            {
                KFPawn(Instigator).StartFiringX(true,bRapidFire);
            }
		}
	}
	else
	{
		GotoState('');
		if( KFPawn(Instigator)!=None )
			KFPawn(Instigator).StopFiring();
	}
}

defaultproperties
{
	MeshRef="KF_Weapons3rd_Trip.Chainsaw_3rd"
    AmbientSoundRef="KF_ChainsawSnd.Chainsaw_Idle1"
    SoundRadius=300
    SoundVolume=230
    WeaponAmbientScale=2.0
    HitEffectClass=class'ChainsawHitEffect'

    MovementAnims(0)=JogF_Chainsaw
    MovementAnims(1)=JogB_Chainsaw
    MovementAnims(2)=JogL_Chainsaw
    MovementAnims(3)=JogR_Chainsaw
    CrouchAnims(0)=CHwalkF_Chainsaw
    CrouchAnims(1)=CHwalkB_Chainsaw
    CrouchAnims(2)=CHwalkL_Chainsaw
    CrouchAnims(3)=CHwalkR_Chainsaw
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

    TurnRightAnim=TurnR_Chainsaw
    TurnLeftAnim=TurnL_Chainsaw
    CrouchTurnRightAnim=CH_TurnR_Chainsaw
    CrouchTurnLeftAnim=CH_TurnL_Chainsaw
    IdleRestAnim=Idle_Chainsaw//Idle_Rest
    IdleCrouchAnim=CHIdle_Chainsaw
    IdleSwimAnim=Swim_Tread
    IdleWeaponAnim=Idle_Chainsaw//Idle_Rifle
    IdleHeavyAnim=Idle_Chainsaw//Idle_Biggun
    IdleRifleAnim=Idle_Chainsaw//Idle_Rifle
    IdleChatAnim=Idle_Chainsaw
    FireAnims(0)=Attack1_Chainsaw
    FireAnims(1)=Attack1_Chainsaw
    FireAnims(2)=Attack1_Chainsaw
    FireAnims(3)=Attack1_Chainsaw
    FireAltAnims(0)=Attack2_Chainsaw
    FireAltAnims(1)=Attack2_Chainsaw
    FireAltAnims(2)=Attack3_Chainsaw
    FireAltAnims(3)=Attack3_Chainsaw
    FireCrouchAnims(0)=CHAttack_Chainsaw
    FireCrouchAnims(1)=CHAttack_Chainsaw
    FireCrouchAnims(2)=CHAttack_Chainsaw
    FireCrouchAnims(3)=CHAttack_Chainsaw
    FireCrouchAltAnims(0)=CHAttack2_Chainsaw
    FireCrouchAltAnims(1)=CHAttack2_Chainsaw
    FireCrouchAltAnims(2)=CHAttack3_Chainsaw
    FireCrouchAltAnims(3)=CHAttack3_Chainsaw
    HitAnims(0)=HitF_Chainsaw
    HitAnims(1)=HitB_Chainsaw
    HitAnims(2)=HitL_Chainsaw
    HitAnims(3)=HitR_Chainsaw
    PostFireBlendStandAnim=Blend_Chainsaw
    PostFireBlendCrouchAnim=CHBlend_Chainsaw
}
