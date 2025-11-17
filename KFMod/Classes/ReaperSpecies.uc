//=============================================================================
// SteampunkBerserkerSpecies
//=============================================================================
// Species type for civilian players with Berserker sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ReaperSpecies extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons8_Trip_T.sleeves.Reaper_FirstPersonArms'
    DetachedArmClass = class'SeveredArmReaper'
    DetachedLegClass = none
}
