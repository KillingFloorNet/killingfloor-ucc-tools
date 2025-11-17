//=============================================================================
// SoldierSpeciesParatrooper
//=============================================================================
// Species type for soldier players with paratrooper outfits
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SoldierSpeciesParatrooper extends SoldierSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons2_Trip_T.hands.BritishPara_Hands_1st_P'
    DetachedArmClass = class'SeveredArmBritishPara'
    DetachedLegClass = class'SeveredLegBritishPara'
}
