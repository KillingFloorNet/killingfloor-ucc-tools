//=============================================================================
// MutantHorzineSpecies
//=============================================================================
// Species type for mutated Horzine trooper players
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class MutantHorzineSpecies extends HorzineSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons2_Trip_T.hands.Mutated_Horzine_Hands_1st_P'
    DetachedArmClass = class'SeveredArmMutant'
    DetachedLegClass = class'SeveredLegMutant'
}
