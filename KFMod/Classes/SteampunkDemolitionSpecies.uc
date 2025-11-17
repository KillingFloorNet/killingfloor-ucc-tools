//=============================================================================
// SteampunkDemolitionSpecies
//=============================================================================
// Species type for civilian players with Demolition sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SteampunkDemolitionSpecies extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons5_Trip_T.First_Sleeves.Steampunk_Demolition_First_Person_Sleeves'
    DetachedArmClass = class'SeveredArmSteampunkDemolition'
    DetachedLegClass = class'SeveredLegSteampunkDemolition'
}
