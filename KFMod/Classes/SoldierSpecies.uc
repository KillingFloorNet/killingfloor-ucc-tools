//=============================================================================
// PoliceSpecies
//=============================================================================
// Species type for soldier players
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SoldierSpecies extends SPECIES_KFMaleHuman;

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
	SpeciesName="Soldier"
	RaceNum=4
	MaleVoice="KFMod.KFVoicePackTwo"
	FemaleVoice="KFMod.KFVoicePackTwo"
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

    SleeveTexture=Texture'KF_Weapons_Trip_T.hands.hands_1stP_military_diff'
    DetachedArmClass = class'SeveredArmSoldier'
    DetachedLegClass = class'SeveredLegSoldier'
}
