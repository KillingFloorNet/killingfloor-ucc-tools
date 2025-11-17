//=============================================================================
// MAC Fire
//=============================================================================
class MAC10Fire extends KFHighROFFire;

// Overwritten to switch damage types for the firebug
function DoTrace(Vector Start, Rotator Dir)
{
	local Vector X,Y,Z, End, HitLocation, HitNormal, ArcEnd;
	local Actor Other;
	local KFWeaponAttachment WeapAttach;
	local array<int> HitPoints;
	local KFPawn HitPawn;

	MaxRange();

	Weapon.GetViewAxes(X, Y, Z);

	DamageType = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo).ClientVeteranSkill.static.GetMAC10DamageType(KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo));

	if ( Weapon.WeaponCentered() )
	{
		ArcEnd = (Instigator.Location + Weapon.EffectOffset.X * X + 1.5 * Weapon.EffectOffset.Z * Z);
	}
	else
	{
		ArcEnd = (Instigator.Location + Instigator.CalcDrawOffset(Weapon) + Weapon.EffectOffset.X * X + Weapon.Hand * Weapon.EffectOffset.Y * Y +
		Weapon.EffectOffset.Z * Z);
	}

	X = Vector(Dir);
	End = Start + TraceRange * X;
	Other = Instigator.HitPointTrace(HitLocation, HitNormal, End, HitPoints, Start,, 1);

	if ( Other != None && Other != Instigator && Other.Base != Instigator )
	{
		WeapAttach = KFWeaponAttachment(Weapon.ThirdPersonActor);

		if ( !Other.bWorldGeometry )
		{
			// Update hit effect except for pawns
			if ( !Other.IsA('Pawn') && !Other.IsA('HitScanBlockingVolume') &&
			     !Other.IsA('ExtendedZCollision') )
			{
				if( WeapAttach!=None )
				{
			        WeapAttach.UpdateHit(Other, HitLocation, HitNormal);
			    }
			}

			HitPawn = KFPawn(Other);

			if ( HitPawn != none )
			{
				if ( !HitPawn.bDeleteMe )
				{
					HitPawn.ProcessLocationalDamage(DamageMax, Instigator, HitLocation, Momentum * X, DamageType, HitPoints);
				}
			}
			else
			{
				Other.TakeDamage(DamageMax, Instigator, HitLocation, Momentum * X, DamageType);
			}
		}
		else
		{
			HitLocation = HitLocation + 2.0 * HitNormal;

			if ( WeapAttach != None )
			{
				WeapAttach.UpdateHit(Other,HitLocation,HitNormal);
			}
		}
	}
	else
	{
		HitLocation = End;
		HitNormal = Normal(Start - End);
	}
}

defaultproperties
{
    FireAimedAnim=Fire_Iron
    FireLoopAnim=Fire_Loop
    FireLoopAimedAnim=Fire_Iron_Loop
    FireEndAnim=Fire_End
    FireEndAimedAnim=Fire_Iron_End

    FireSoundRef="KF_MAC10MPSnd.MAC10_Silenced_Fire"
    StereoFireSoundRef="KF_MAC10MPSnd.MAC10_Silenced_FireST"
    AmbientFireSoundRef="KF_MAC10MPSnd.MAC10_Fire_Loop"
    FireEndSoundRef="KF_MAC10MPSnd.MAC10_Fire_Loop_End_M"
    FireEndStereoSoundRef="KF_MAC10MPSnd.MAC10_Fire_Loop_End_S"

    AmbientFireSoundRadius=500
    AmbientFireVolume=255
    FireSound=none
	NoAmmoSoundRef="KF_AK47Snd.AK47_DryFire"
	DamageType=Class'KFMod.DamTypeMAC10MP'
	DamageMin=25
	DamageMax=35
	Momentum=6500.000000
	bPawnRapidFireAnim=True
	TransientSoundVolume=1.8
	FireForce="AssaultRifleFire"
	FireRate=0.052//0.085//0.077
	RecoilRate=0.050
	maxVerticalRecoilAngle=150
	maxHorizontalRecoilAngle=100
	TweenTime=0.025
	bAccuracyBonusForSemiAuto=true
	RecoilVelocityScale=1.5

	AmmoClass=Class'KFMod.MAC10Ammo'
	AmmoPerFire=1
	BotRefireRate=0.990000
	FlashEmitterClass=Class'ROEffects.MuzzleFlash1stSTG'
	aimerror=35.000000
	Spread=0.013//0.0085
	SpreadStyle=SS_Random

	//** View shake **//
	ShakeOffsetMag=(X=4.5,Y=2.8,Z=5.5)
	ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
	ShakeOffsetTime=1.25
	ShakeRotMag=(X=35.0,Y=35.0,Z=200.0)
	ShakeRotRate=(X=8000.0,Y=8000.0,Z=8000.0)
	ShakeRotTime=3.0

	ShellEjectClass=class'ROEffects.KFShellEjectMac'
	ShellEjectBoneName=Mac11_Ejector
	bRandomPitchFireSound=false
}
