 //=============================================================================
// SoldierSpeciesRobot
//=============================================================================
// Species type for soldier players with Commando Chicken outfit
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - Daniel Hollinger
//=============================================================================
 class SoldierSpeciesRobot extends SoldierSpecies;

defaultproperties
{
    SleeveTexture=Texture'KF_Weapons8_Trip_T.sleeves.Horzine_Droid_FirstPersonArms'
    DetachedArmClass = class'SeveredArmRobot'
    DetachedLegClass = class'SeveredLegRobot'
    MaleVoice="KFMod.KFVoicePackRobot"
   	MaleSoundGroup="KFmod.KFDARSoundGroup"
}
