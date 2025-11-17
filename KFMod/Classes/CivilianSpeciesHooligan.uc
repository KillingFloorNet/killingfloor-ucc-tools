//=============================================================================
// CivilianSpeciesHooligan
//=============================================================================
// Species type for civilian players with soccer hooligan sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class CivilianSpeciesHooligan extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons3_Trip_T.hands.Hooligan_Hands_1st_P'
    DetachedArmClass = class'SeveredArmHooligan'
    DetachedLegClass = class'SeveredLegHooligan'
}
