/*
	--------------------------------------------------------------
	KFLevelRules_Story
	--------------------------------------------------------------

	Extended LevelRules info for use in 'Story' style missions .
	Can modify player starting equipment, health, cash , etc.
	Also stores a list of Objectives the player must complete to
	be victorious.

	Author :  Alex Quick

	--------------------------------------------------------------
*/

class KFLevelRules_Story extends KFLevelRules
hidecategories(Sound,Events)
dependson(KFStoryGameInfo) ;

#exec OBJ LOAD FILE=KFStoryGame_Tex.utx

/* should the first objective in the StoryObjectives array activate as soon as the match begins ? */
var(Rules_Objectives)       bool                         bAutoStartObjectives;

/* Amount of dosh to start players out with in story mode */
var(Rules_Cash)			    int							 StartingCashSum;

/* A modifier for the amount of cash players receive from killing zombies.  ie. at 0.f they will not receive anything */
var(Rules_Cash)			    float						 CashReward_ZEDKills_Modifier;

/* A modifier for the amount of cash players lose when they die */
var(Rules_Cash)			    float						 CashPenalty_Death_Modifier;

/* absolute maximum number of zombies we can have in this story map at one time */
var(Rules_Monsters)			int						     MaxEnemiesAtOnce;

/* should the game kill off ZEDs which haven't been seen by players for a while?  */
var(Rules_Monsters)         bool                         bAutoKillStragglers;

/* Auto Kill threshold if bAutoKilLStragglers is true */
var(Rules_Monsters)         int                          MaxStragglers;

/* Struct for controlling attributes which affect enemy spawning base on game difficulty and player count */
struct SMonsterSpawnScaling
{
    var () KFStoryGameInfo.SDifficultyWrapper            EnemySpawnRate;

    var () KFStoryGameInfo.SDifficultyWrapper            NumberOfEnemies;
};

var(Rules_Monsters)         SMonsterSpawnScaling         Spawn_Difficulty_Scaling;

/* should bots be allowed to spawn ? */
var(Rules_Bots)				bool						 bAllowBots;

/* Textures to display on the HUD when the match is over */
var(Rules_HUD) 				Material 					 VictoryMaterial,DefeatMaterial;

/* If a team is restarted after dying during a story mission these are the actor types we need to reset*/
var(Rules_CheckPoints)	    array<class>		         CheckpointResetClasses ;

/* If true the weapon / item pickups in the map will be randomly spawned based on difficulty - like in a normal KF match */
var(Rules_Equipment)        bool                         bRandomizeWeaponPickups;

// Amount of starting HP for all players
var(Rules_Equipment)        int                          PlayerStartHealth;

// Amount of starting armor for all players.
var(Rules_Equipment)        int                          PlayerStartArmor;

// Defines starting equipment for players
var(Rules_Equipment)        array< Class<Inventory> >    RequiredPlayerEquipment;

/* if true, allow high level players to spawn with their 'default' gear */
var(Rules_Equipment)		bool						 bAllowPerkStartingWeaps;

// Enable / Disable Cash display on HUD .
var(Rules_HUD)              bool                         bShowCash;

var(Rules_HUD)              name                         HUDStyle;


function ModifyPlayer( Pawn Other )
{
	if( PlayerStartHealth>0 )
		Other.Health = PlayerStartHealth;
	if( PlayerStartArmor>0 )
		Other.ShieldStrength = PlayerStartArmor;
}

function AddGameInv( Pawn Other )
{
	local int i;
	local Inventory Inv;

	For( i=0; i<RequiredPlayerEquipment.Length; i++ )
	{
		if( RequiredPlayerEquipment[i]==None )
			Continue;
		if( Other.FindInventoryType(RequiredPlayerEquipment[i])==None )
		{
			Inv = Spawn(RequiredPlayerEquipment[i]);
			if( Inv != None )
			{
				Inv.GiveTo(Other);
				if ( Inv != None )
					Inv.PickupFunction(Other);
			}
		}
	}
}

defaultproperties
{
     CashReward_ZEDKills_Modifier=1.000000
     CashPenalty_Death_Modifier=1.000000
     bAllowPerkStartingWeaps=True
     MaxEnemiesAtOnce=32
     MaxStragglers=5
     bAutoKillStragglers = true
     bShowCash = true
     StartingCashSum = 250

     VictoryMaterial=Combiner'KFMapEndTextures.VictoryCombiner'
     DefeatMaterial=Combiner'KFMapEndTextures.DefeatCombiner'

     CheckpointResetClasses(0)=Class'ZombieVolume'
     CheckpointResetClasses(1)=Class'Gameplay.ScriptedSequence'
     CheckpointResetClasses(2)=Class'Engine.Pickup'
     CheckpointResetClasses(3)=Class'Engine.Pawn'
     CheckpointResetClasses(4)=Class'Engine.Triggers'
     CheckpointResetClasses(5)=Class'Gameplay.TriggerLight'
     CheckpointResetClasses(6)=Class'Engine.BlockingVolume'
     CheckPointResetClasses(7)=Class'Engine.Decoration'
     CheckPointResetClasses(8)=Class'KF_StoryWaveDesigner'
     CheckPointResetClasses(9)=Class'StaticMeshActor_Hideable'
     CheckPointResetClasses(10)=Class'KF_StoryWaveDesigner'

     RequiredPlayerEquipment(0)=Class'KFMod.Single'
     RequiredPlayerEquipment(1)=Class'KFMod.Syringe'
     RequiredPlayerEquipment(2)=Class'KFMod.Welder'
     RequiredPlayerEquipment(3)=Class'KFMod.Frag'
     RequiredPlayerEquipment(4)=Class'KFMod.knife'

     Texture=Texture'KFStoryGame_Tex.Editor.KFRules_Ico'

     bAutoStartObjectives = true
     bRandomizeWeaponPickups = true

    /* Difficulty Magic Numbers go here! */
    Spawn_Difficulty_Scaling=(EnemySpawnRate=(Scale_GameDifficulty=(Scale_Beginner=1.0,Scale_Hard=1.17,Scale_Suicidal=1.17,Scale_HellOnEarth=1.17),Scale_PlayerCount=(Scale_1P=1,Scale_2P=1,Scale_3P=1.0,Scale_4P=1.17,Scale_5P=1.53,Scale_6P=3.3)),NumberOfEnemies=(Scale_GameDifficulty=(Scale_Beginner=0.7,Scale_Hard=1.3,Scale_Suicidal=1.5,Scale_HellOnEarth=1.7),Scale_PlayerCount=(Scale_1P=1,Scale_2P=2,Scale_3P=2.75,Scale_4P=3.5,Scale_5P=4,Scale_6P=4.5)))
}
