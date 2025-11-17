class KFMaleSoundGroup extends xPawnSoundGroup;

var() sound         BreathingSound;
var() Sound         LandSounds[20]; // Indexed by ESurfaceTypes (sorry about the literal).
var() Sound         JumpSounds[20]; // Indexed by ESurfaceTypes (sorry about the literal).

static function Sound GetSound(ESoundType SoundType, optional int SurfaceID)
{
    if( SoundType == EST_Land )
	{
		return default.LandSounds[SurfaceID];
	}
	else if( SoundType == EST_Jump )
	{
	  	return default.JumpSounds[SurfaceID];
	}
	else
	{
        return default.Sounds[int(SoundType)];
    }
}


static function Sound GetNearDeathSound()
{
	return default.BreathingSound;
}

defaultproperties
{
    BreathingSound=Sound'KFPlayerSound.Malebreath'
    Sounds(0)=Sound'KF_PlayerGlobalSnd.Player_LandDirt'//Sound'PlayerSounds.Final.Land'
    Sounds(1)=none//Sound'PlayerSounds.Final.Land'
    Sounds(2)=none//SoundGroup'PlayerSounds.Final.HitUnderWaterMercMale' KFTODO: Replace this
    Sounds(3)=none//Sound'KFPlayerSound.JumpVoice'
    Sounds(4)=none//SoundGroup'PlayerSounds.Final.LandGruntMercMale' KFTODO: Replace this
    Sounds(5)=none//SoundGroup'PlayerSounds.Final.GaspMercMale' KFTODO: Replace this
    Sounds(6)=none//SoundGroup'PlayerSounds.Final.DrownMercMale' KFTODO: Replace this
    Sounds(7)=none//SoundGroup'PlayerSounds.Final.BreathAgainMercMale' KFTODO: Replace this
    Sounds(8)=none//Sound'PlayerSounds.JumpSounds.MaleDodge' KFTODO: Replace this
    Sounds(9)=none//Sound'KFPlayerSound.JumpVoice'

    LandSounds(0)=Sound'KF_PlayerGlobalSnd.Player_LandDefault'//Sound'Inf_Player.LandDirt' // default
    LandSounds(1)=Sound'KF_PlayerGlobalSnd.Player_LandConc'//Sound'Inf_Player.LandAsphalt' // Rock
    LandSounds(2)=Sound'KF_PlayerGlobalSnd.Player_LandDirt'//Sound'Inf_Player.LandDirt'   // Dirt
    LandSounds(3)=Sound'KF_PlayerGlobalSnd.Player_LandMetal'//Sound'Inf_Player.LandMetal' // Metal
    LandSounds(4)=Sound'KF_PlayerGlobalSnd.Player_LandWood'//Sound'Inf_Player.LandWood' // Wood
    LandSounds(5)=Sound'KF_PlayerGlobalSnd.Player_LandGrass'//Sound'Inf_Player.LandGrass' // Plant
    LandSounds(6)=Sound'KF_PlayerGlobalSnd.Player_LandDefault'//Sound'Inf_Player.LandDirt' // Flesh
    LandSounds(7)=Sound'KF_PlayerGlobalSnd.Player_LandDirt'//Sound'Inf_Player.LandSnowRough' // Ice
    LandSounds(8)=Sound'KF_PlayerGlobalSnd.Player_LandDirt'//Sound'Inf_Player.LandSnowHard'
    LandSounds(9)=Sound'KF_PlayerGlobalSnd.Player_LandWater'//Sound'Inf_Player.LandWaterShallow'
    LandSounds(10)=Sound'KF_PlayerGlobalSnd.Player_LandDirt'//Sound'Inf_Player.LandDirt' // Glass- Replaceme
    LandSounds(11)=Sound'KF_PlayerGlobalSnd.Player_LandDirt'//Sound'Inf_Player.LandDirt' // Gravel
    LandSounds(12)=Sound'KF_PlayerGlobalSnd.Player_LandConc'//Sound'Inf_Player.LandAsphalt' // Concrete
    LandSounds(13)=Sound'KF_PlayerGlobalSnd.Player_LandWood'//Sound'Inf_Player.LandWood' // HollowWood
    LandSounds(14)=Sound'KF_PlayerGlobalSnd.Player_LandDirt'//Sound'Inf_Player.LandMud' // Mud
    LandSounds(15)=Sound'KF_PlayerGlobalSnd.Player_LandMetal'//Sound'Inf_Player.LandMetal' // MetalArmor
    LandSounds(16)=Sound'KF_PlayerGlobalSnd.Player_LandConc'//Sound'Inf_Player.LandAsphalt' // Paper
    LandSounds(17)=Sound'KF_PlayerGlobalSnd.Player_LandDefault'//Sound'Inf_Player.LandDirt' // Cloth
    LandSounds(18)=Sound'KF_PlayerGlobalSnd.Player_LandDefault'//Sound'Inf_Player.LandDirt' // Rubber
    LandSounds(19)=Sound'KF_PlayerGlobalSnd.Player_LandDefault'//Sound'Inf_Player.LandDirt' // Crap

	JumpSounds(0)=Sound'Inf_Player.JumpDirt'
	JumpSounds(1)=Sound'Inf_Player.JumpAsphalt' // Rock
	JumpSounds(2)=Sound'Inf_Player.JumpDirt'
	JumpSounds(3)=Sound'Inf_Player.JumpMetal' // Metal
	JumpSounds(4)=Sound'Inf_Player.JumpWood' // Wood
	JumpSounds(5)=Sound'Inf_Player.JumpGrass' // Plant
	JumpSounds(6)=Sound'Inf_Player.JumpDirt' // Flesh
	JumpSounds(7)=Sound'Inf_Player.JumpSnowRough' // Ice
	JumpSounds(8)=Sound'Inf_Player.JumpSnowHard'
	JumpSounds(9)=Sound'Inf_Player.JumpWaterShallow'
	JumpSounds(10)=Sound'Inf_Player.JumpDirt' // Glass- Replaceme
	JumpSounds(11)=Sound'Inf_Player.JumpDirt' // Gravel
	JumpSounds(12)=Sound'Inf_Player.JumpAsphalt' // Concrete
	JumpSounds(13)=Sound'Inf_Player.JumpWood' // HollowWood
	JumpSounds(14)=Sound'Inf_Player.JumpMud' // Mud
	JumpSounds(15)=Sound'Inf_Player.JumpMetal' // MetalArmor
	JumpSounds(16)=Sound'Inf_Player.JumpAsphalt' // Paper
	JumpSounds(17)=Sound'Inf_Player.JumpDirt' // Cloth
	JumpSounds(18)=Sound'Inf_Player.JumpDirt' // Rubber
	JumpSounds(19)=Sound'Inf_Player.JumpDirt' // Crap

    // KFTODO: maybe replace these?
    DeathSounds(0)=Sound'Inf_Player.Generic'
    DeathSounds(1)=Sound'Inf_Player.Headshot'
    DeathSounds(2)=Sound'Inf_Player.UpperBodyShot'
    DeathSounds(3)=Sound'Inf_Player.LowerBodyShot'
    DeathSounds(4)=Sound'Inf_Player.LimbShot'
    PainSounds(0)=Sound'Inf_Player.Wounding'//Sound'KFPlayerSound.hpain3'
    PainSounds(1)=Sound'Inf_Player.Wounding'//Sound'KFPlayerSound.hpain2'
    PainSounds(2)=Sound'Inf_Player.Wounding'//Sound'KFPlayerSound.hpain1'
    PainSounds(3)=Sound'Inf_Player.Wounding'//Sound'KFPlayerSound.hpain3'
    PainSounds(4)=Sound'Inf_Player.Wounding'//Sound'KFPlayerSound.hpain2'
    PainSounds(5)=Sound'Inf_Player.Wounding'//Sound'KFPlayerSound.hpain1'
}
