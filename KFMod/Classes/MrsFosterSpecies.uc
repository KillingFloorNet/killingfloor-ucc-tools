//=============================================================================
// SteampunkBerserkerSpecies
//=============================================================================
// Species type for civilian players with Berserker sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class MrsFosterSpecies extends CivilianSpecies;

defaultproperties
{
	// KFTODO: Replace this
	//GibGroup="KFmod.KFGibGroup"
	MaleSoundGroup="KFmod.KFMaleSoundGroup"
	SpeciesName="Civilian"
	RaceNum=4
	MaleVoice="KFMod.KFVoicePackFemale"
	FemaleVoice="KFMod.KFVoicePackFemale"
	FemaleSoundGroup="XGame.xMercFemaleSoundGroup"
	AirControl=+1.0
	GroundSpeed=+1.0
	WaterSpeed=+1.0
	JumpZ=+1.0
	ReceivedDamageScaling=+1.0
	DamageScaling=+1.0
	AccelRate=+1.0
	WalkingPct=+1.0
	CrouchedPct=+1.0
	DodgeSpeedFactor=+1.0
	DodgeSpeedZ=+1.0

    SleeveTexture=Texture'MrsFoster_DLC_1stP.MrsFoster_1stP'
    DetachedArmClass = class'SeveredArmMrsFoster'
    DetachedLegClass = class'SeveredLegMrsFoster'
}

