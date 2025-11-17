//=============================================================================
// MsClamleySpecies
//=============================================================================
// Species type for the MsClamley character
//=============================================================================
// Killing Floor Source
// Copyright (C) 2013 Tripwire Interactive LLC
//=============================================================================
class MsClamleySpecies extends CivilianSpecies;

defaultproperties
{
    MaleVoice="KFMod.KFVoicePackFemale"
	FemaleVoice="KFMod.KFVoicePackFemale"

    SleeveTexture=Texture'KF_Soldier13_Trip_T.1stP.msclamley_1stP'
    DetachedArmClass=class'SeveredArmMsClamley'
    DetachedLegClass=class'SeveredLegMsClamley'
}
