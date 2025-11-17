//=============================================================================
// SteampunkSupportSpecies
//=============================================================================
// Species type for civilian players with Support sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SteampunkSupportSpecies extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons5_Trip_T.First_Sleeves.Steampunk_Support_Specialist_First_Person_Sleeves'
    DetachedArmClass = class'SeveredArmSteampunkSupport'
    DetachedLegClass = class'SeveredLegSteampunkSupport'
}
