//=============================================================================
// SteampunkBerserkerSpecies
//=============================================================================
// Species type for civilian players with Berserker sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SteampunkBerserkerSpecies extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons3_Trip_T.hands.First_Person_Sleeves_Beserke_Dr'
    DetachedArmClass = class'SeveredArmSteampunkBerserker'
    DetachedLegClass = class'SeveredLegSteampunkBerserker'
}
