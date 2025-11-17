//=============================================================================
// 9mm Fire
//=============================================================================
class SingleFire extends KFFire;

var name FireAnim2;

function StartBerserk()
{
	DamageMin = default.DamageMin * 1.33;
	DamageMax = default.DamageMax * 1.33;
}

function StopBerserk()
{
	DamageMin = default.DamageMin;
	DamageMax = default.DamageMax;
}

function StartSuperBerserk()
{

}

defaultproperties
{
    DamageType=Class'KFMod.DamTypeDualies'
    DamageMin=25
    DamageMax=35
    Momentum=10000.000000
    bPawnRapidFireAnim=True
    bAttachSmokeEmitter=True
    TransientSoundVolume=1.8
    FireSound=Sound'KF_9MMSnd.9mm_Fire'
    StereoFireSoundRef="KF_9MMSnd.9mm_FireST"
    NoAmmoSound=Sound'KF_9MMSnd.9mm_DryFire'
    FireForce="AssaultRifleFire"
    FireRate=0.175//0.460000 changed by ramm
    RecoilRate=0.07
    maxVerticalRecoilAngle=300
    maxHorizontalRecoilAngle=50
    FireAnimRate=1.5 // Changed by ramm
    TweenTime=0.025
    AmmoClass=Class'KFMod.SingleAmmo'
    AmmoPerFire=1
    BotRefireRate=0.350000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stMP'
    aimerror=30.000000
    Spread=0.015000
    SpreadStyle=SS_Random
    bWaitForRelease=true
    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=3.0,Z=10.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.0
    ShakeRotMag=(X=75.0,Y=75.0,Z=250.0)
    ShakeRotRate=(X=10000.0,Y=10000.0,Z=10000.0)
    ShakeRotTime=3.0
    FireAimedAnim=Fire_Iron
    ShellEjectClass=class'ROEffects.KFShellEject9mm'
    ShellEjectBoneName=Shell_eject
    bRandomPitchFireSound=false
}
