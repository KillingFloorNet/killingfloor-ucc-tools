//=============================================================================
// FoundrySpecies
//=============================================================================
// Species type for foundry worker players
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class FoundrySpecies extends SPECIES_KFMaleHuman;

static function string GetRagSkelName(string MeshName)
{
	if(InStr(MeshName, "Gitty") >= 0)
		return Default.FemaleRagSkelName;
	if(InStr(MeshName, "Ophelia") >= 0)
		return Default.FemaleRagSkelName;

	return Super.GetRagSkelName(MeshName);
}

defaultproperties
{
	// KFTODO: Replace this
	//GibGroup="KFmod.KFGibGroup"
	MaleSoundGroup="KFmod.KFMaleSoundGroup"
	SpeciesName="Foundry"
	RaceNum=4
	MaleVoice="KFMod.KFVoicePack"
	FemaleVoice="KFMod.KFVoicePack"
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

    SleeveTexture=Texture'KF_Weapons2_Trip_T.hands.Foundry1_soldier_1stP'
    DetachedArmClass = class'SeveredArmFoundry'
    DetachedLegClass = class'SeveredLegFoundry'
}
