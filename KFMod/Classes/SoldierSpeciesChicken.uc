//=============================================================================
// SoldierSpeciesChicken
//=============================================================================
// Species type for soldier players with Commando Chicken outfit
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class SoldierSpeciesChicken extends SoldierSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons3_Trip_T.hands.Commando_Chicken_First_Person_Arms_D'
    DetachedArmClass = class'SeveredArmChicken'
    DetachedLegClass = class'SeveredLegChicken'
}
