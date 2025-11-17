//=============================================================================
// CivilianSpeciesPunk
//=============================================================================
// Species type for civilian players with punk outfits
//=============================================================================
// Killing Floor Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class CivilianSpeciesPunk extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons2_Trip_T.hands.Punk_Hands_1st_P'
    DetachedArmClass = class'SeveredArmPunk'
    DetachedLegClass = class'SeveredLegPunk'
}
