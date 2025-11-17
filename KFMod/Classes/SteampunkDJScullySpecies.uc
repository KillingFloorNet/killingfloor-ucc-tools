//=============================================================================
// SteampunkDJScullySpecies
//=============================================================================
// Species type for civilian players with DJ Scully sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SteampunkDJScullySpecies extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons5_Trip_T.First_Sleeves.Steampunk_DJ_Scully_First_Person_Sleeves'
    DetachedArmClass = class'SeveredArmSteampunkDJScully'
    DetachedLegClass = class'SeveredLegSteampunkDJScully'
}
