//=============================================================================
// CivilianSpeciesBallHero
//=============================================================================
// Species type for civilian players with adventurer sleeves
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class CivilianSpeciesBallHero extends CivilianSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons2_Trip_T.hands.BallHero_Hands_1st_P'
    DetachedArmClass = class'SeveredArmBallHero'
    DetachedLegClass = class'SeveredLegBallHero'
}
