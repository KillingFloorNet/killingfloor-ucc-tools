//=============================================================================
// ParamedicSpecies
//=============================================================================
// Species type for paramedic players
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ParamedicSpecies extends HazmatSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons2_Trip_T.hands.Paramedic_Hands_1st_P'
    DetachedArmClass = class'SeveredArmParamedic'
    DetachedLegClass = class'SeveredLegParamedic'
}
