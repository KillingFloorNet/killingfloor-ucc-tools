//=============================================================================
// CivilianSpeciesPrisoner
//=============================================================================
// Species type for civilian players with prisoner outfits
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class CivilianSpeciesPrisoner extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons2_Trip_T.hands.Prisoner_Hands_1st_P'
    DetachedArmClass = class'SeveredArmPrisoner'
    DetachedLegClass = class'SeveredLegPrisoner'
}
