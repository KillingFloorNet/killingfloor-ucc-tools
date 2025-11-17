//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KFLevelRules extends ReplicationInfo
    config
	placeable;

const       MAX_CATEGORY        = 5;
const       MAX_BUYITEMS        = 63;

struct EquipmentCategory
{
	var    byte    EquipmentCategoryID;
	var    string  EquipmentCategoryName;
};

var()       EquipmentCategory   EquipmentCategories[MAX_CATEGORY];
//var(Shop)   class<Pickup>       ItemForSale[MAX_BUYITEMS];
var         array< class<Pickup> >      ItemForSale;

var(Shop)   array< class<Pickup> >      MediItemForSale;
var(Shop)   array< class<Pickup> >      SuppItemForSale;
var(Shop)   array< class<Pickup> >      ShrpItemForSale;
var(Shop)   array< class<Pickup> >      CommItemForSale;
var(Shop)   array< class<Pickup> >      BersItemForSale;
var(Shop)   array< class<Pickup> >      FireItemForSale;
var(Shop)   array< class<Pickup> >      DemoItemForSale;
var(Shop)   array< class<Pickup> >      NeutItemForSale;

var globalconfig  array< class<Pickup> >      FaveItemForSale;

var() float WaveSpawnPeriod;

simulated function bool IsFavorited( class<Pickup> Item )
{
    local int i;

    for( i = 0; i < FaveItemForSale.Length; ++i )
    {
        if( Item == FaveItemForSale[i] )
        {
            return true;
        }
    }

    return false;
}

simulated function AddToFavorites( class<Pickup> Item )
{
    local class<KFWeaponPickup> WeaponPickupClass;

    WeaponPickupClass = class<KFWeaponPickup>( Item );
    if( WeaponPickupClass != none )
    {
        FaveItemForSale[ FaveItemForSale.Length ] = WeaponPickupClass;
        SaveFavorites();
    }
}

simulated function RemoveFromFavorites( class<Pickup> Item )
{
    local int i;

    for( i = 0; i < FaveItemForSale.Length; ++i )
    {
        if( Item == FaveItemForSale[i] )
        {
            FaveItemForSale.Remove(i, 1);
            break;
        }
    }

    SaveFavorites();
}

simulated function SaveFavorites()
{
    SaveConfig();
}

defaultproperties
{
	EquipmentCategories(0)=(EquipmentCategoryID=0,EquipmentCategoryName="Melee")
	EquipmentCategories(1)=(EquipmentCategoryID=1,EquipmentCategoryName="Secondary")
	EquipmentCategories(2)=(EquipmentCategoryID=2,EquipmentCategoryName="Primary")
	EquipmentCategories(3)=(EquipmentCategoryID=3,EquipmentCategoryName="Specials")
	EquipmentCategories(4)=(EquipmentCategoryID=4,EquipmentCategoryName="Equipment")

	MediItemForSale[0 ]=Class'KFMod.MP7MPickup'            //Medic
	MediItemForSale[1 ]=Class'KFMod.BlowerThrowerPickup'   //Medic
	MediItemForSale[2 ]=Class'KFMod.MP5MPickup'            //Medic
	MediItemForSale[3 ]=Class'KFMod.CamoMP5MPickup'        //Medic
	MediItemForSale[4 ]=Class'KFMod.M7A3MPickup'           //Medic
	MediItemForSale[5 ]=Class'KFMod.KrissMPickup'          //Medic
	MediItemForSale[6 ]=Class'KFMod.NeonKrissMPickup'      //Medic

	SuppItemForSale[0 ]=Class'KFMod.ShotgunPickup'		   //Support
	SuppItemForSale[1 ]=Class'KFMod.CamoShotgunPickup'     //Support
	SuppItemForSale[2 ]=Class'KFMod.BoomStickPickup'       //Support
	SuppItemForSale[3 ]=Class'KFMod.KSGPickup'			   //Support
	SuppItemForSale[4 ]=Class'KFMod.NeonKSGPickup'		   //Support
	SuppItemForSale[5 ]=Class'KFMod.NailGunPickup'         //Support
	SuppItemForSale[6 ]=Class'KFMod.SPShotGunPickup'       //Support
	SuppItemForSale[7 ]=Class'KFMod.BenelliPickup'	       //Support
	SuppItemForSale[8 ]=Class'KFMod.GoldenBenelliPickup'   //Support
	SuppItemForSale[9 ]=Class'KFMod.AA12Pickup'			   //Support
	SuppItemForSale[10]=Class'KFMod.GoldenAA12Pickup'      //Support

	ShrpItemForSale[0 ]=Class'KFMod.SinglePickup'		   //Sharpshooter
	ShrpItemForSale[1 ]=Class'KFMod.DualiesPickup'		   //Sharpshooter
	ShrpItemForSale[2 ]=Class'KFMod.WinchesterPickup'	   //Sharpshooter
	ShrpItemForSale[3 ]=Class'KFMod.Magnum44Pickup'		   //Sharpshooter
	ShrpItemForSale[4 ]=Class'KFMod.DeaglePickup'		   //Sharpshooter
	ShrpItemForSale[5 ]=Class'KFMod.GoldenDeaglePickup'    //Sharpshooter
	ShrpItemForSale[6 ]=Class'KFMod.MK23Pickup'			   //Sharpshooter
	ShrpItemForSale[7 ]=Class'KFMod.CrossbowPickup'		   //Sharpshooter
	ShrpItemForSale[8 ]=Class'KFMod.Dual44MagnumPickup'	   //Sharpshooter
	ShrpItemForSale[9 ]=Class'KFMod.DualMK23Pickup'	       //Sharpshooter
	ShrpItemForSale[10]=Class'KFMod.DualDeaglePickup'      //Sharpshooter
	ShrpItemForSale[11]=Class'KFMod.GoldenDualDeaglePickup'//Sharpshooter
	ShrpItemForSale[12]=Class'KFMod.SPSniperPickup'        //SharpShooter
	ShrpItemForSale[13]=Class'KFMod.M14EBRPickup'		   //Sharpshooter
	ShrpItemForSale[14]=Class'KFMod.M99Pickup'			   //Sharpshooter

	CommItemForSale[0 ]=Class'KFMod.BullpupPickup'		        //Commando
	CommItemForSale[1 ]=Class'KFMod.ThompsonPickup'	            //Commando
	CommItemForSale[2 ]=Class'KFMod.SPThompsonPickup'	        //Commando
	CommItemForSale[3 ]=Class'KFMod.ThompsonDrumPickup'         //Commando
	CommItemForSale[4 ]=Class'KFMod.AK47Pickup'			        //Commando
	CommItemForSale[5 ]=Class'KFMod.GoldenAK47Pickup'			//Commando
	CommItemForSale[6 ]=Class'KFMod.NeonAK47Pickup'			    //Commando
	CommItemForSale[7 ]=Class'KFMod.M4Pickup'			        //Commando
	CommItemForSale[8 ]=Class'KFMod.CamoM4Pickup'			    //Commando
	CommItemForSale[9 ]=Class'KFMod.MKb42Pickup'		        //Commando
	CommItemForSale[10]=Class'KFMod.SCARMK17Pickup'		        //Commando
	CommItemForSale[11]=Class'KFMod.NeonSCARMK17Pickup'		    //Commando
	CommItemForSale[12]=Class'KFMod.FNFAL_ACOG_Pickup'	        //Commando

	BersItemForSale[0 ]=Class'KFMod.KnifePickup'				//Berserker
	BersItemForSale[1 ]=Class'KFMod.MachetePickup'				//Berserker
	BersItemForSale[2 ]=Class'KFMod.AxePickup'					//Berserker
	BersItemForSale[3 ]=Class'KFMod.KatanaPickup'				//Berserker
	BersItemForSale[4 ]=Class'KFMod.GoldenKatanaPickup'		    //Berserker
	BersItemForSale[5 ]=Class'KFMod.ScythePickup'               //Berserker
	BersItemForSale[6 ]=Class'KFMod.ChainsawPickup'				//Berserker
	BersItemForSale[7 ]=Class'KFMod.GoldenChainsawPickup'		//Berserker
	BersItemForSale[8 ]=Class'KFMod.DwarfAxePickup'             //Berserker
	BersItemForSale[9 ]=Class'KFMod.ClaymoreSwordPickup'		//Berserker
	BersItemForSale[10]=Class'KFMod.CrossbuzzsawPickup'			//Berserker

	FireItemForSale[0 ]=Class'KFMod.MAC10Pickup'				//Firebug
    FireItemForSale[1 ]=Class'KFMod.FlareRevolverPickup'		//Firebug
	FireItemForSale[2 ]=Class'KFMod.FlameThrowerPickup'			//Firebug
	FireItemForSale[3 ]=Class'KFMod.GoldenFTPickup'			    //Firebug
	FireItemForSale[4 ]=Class'KFMod.DualFlareRevolverPickup'    //Firebug
   	FireItemForSale[5 ]=Class'KFMod.TrenchgunPickup'			//Firebug
   	FireItemForSale[6 ]=Class'KFMod.HuskGunPickup'				//Firebug

   	DemoItemForSale[0 ]=Class'KFMod.M79Pickup'					//Demolition
   	DemoItemForSale[1 ]=Class'KFMod.GoldenM79Pickup'		    //Demolition
	DemoItemForSale[2 ]=Class'KFMod.SPGrenadePickup'            //Demolition
	DemoItemForSale[3 ]=Class'KFMod.PipeBombPickup'				//Demolition
	DemoItemForSale[4 ]=Class'KFMod.SealSquealPickup'	        //Demolition
	DemoItemForSale[5 ]=Class'KFMod.SeekerSixPickup'	        //Demolition
	DemoItemForSale[6 ]=Class'KFMod.M4203Pickup'				//Demolition
	DemoItemForSale[7 ]=Class'KFMod.LAWPickup'					//Demolition
    DemoItemForSale[8 ]=Class'KFMod.M32Pickup'					//Demolition
	DemoItemForSale[9 ]=Class'KFMod.CamoM32Pickup'				//Demolition

	NeutItemForSale[0 ]=Class'KFMod.ZEDMKIIPickup'				//No Perk
    NeutItemForSale[1 ]=Class'KFMod.ZEDGunPickup'				//No Perk
	NeutItemForSale[2 ]=Class'KFMod.Potato'         			//No Perk

	WaveSpawnPeriod=2.000000
}






























































