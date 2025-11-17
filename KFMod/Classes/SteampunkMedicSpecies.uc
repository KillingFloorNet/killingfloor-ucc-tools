//=============================================================================
// SteampunkMedicSpecies
//=============================================================================
// Species type for civilian players with Medic sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SteampunkMedicSpecies extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons3_Trip_T.hands.First_Person_Sleeves_Medic_Steampunk_D'
    DetachedArmClass = class'SeveredArmSteampunkMedic'
    DetachedLegClass = class'SeveredLegSteampunkMedic'
}
