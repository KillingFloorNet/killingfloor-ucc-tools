//=============================================================================
// CivilianSpeciesChav
//=============================================================================
// Species type for civilian players with Chav sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class CivilianSpeciesChav extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons3_Trip_T.hands.Chav_Hands_1st_P'
    DetachedArmClass = class'SeveredArmChav'
    DetachedLegClass = class'SeveredLegChav'
}
