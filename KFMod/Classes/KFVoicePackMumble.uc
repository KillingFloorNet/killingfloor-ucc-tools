//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KFVoicePackMumble extends KFVoicePack;

defaultproperties
{
	SupportSound(0)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Reloading_SG'
	SupportSound(1)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Hole_Up_SG'
	SupportSound(2)=Sound'KF_MumbleVoice.SUPPORT.KFH_Mumble_Need_Money_SG'
	SupportSound(3)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_DropCash_SG'

	AcknowledgmentSound(0)=Sound'KF_MumbleVoice.Acknowledgments.KFH_Mumble_Yes_SG'
	AcknowledgmentSound(1)=Sound'KF_MumbleVoice.Acknowledgments.KFH_Mumble_No_SG'
	AcknowledgmentSound(2)=Sound'KF_MumbleVoice.Acknowledgments.KFH_Mumble_Thanks_SG'
	AcknowledgmentSound(3)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Auto_Healing_SG'

	AlertSound(0)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Alert_Lookout_SG'
	AlertSound(1)=Sound'KF_MumbleVoice.SUPPORT.KFH_Mumble_Need_Money_SG'
	AlertSound(2)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Wait_SG'
	AlertSound(3)=Sound'KF_MumbleVoice.Acknowledgments.KFH_Mumble_Yes_SG'
	AlertSound(4)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Hole_Up_SG'
	AlertSound(5)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Follow_SG'

	DirectionSound(0)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Auto_Healing_SG'
	DirectionSound(1)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_DropCash_SG'
	DirectionSound(2)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Alert_Lookout_SG'
	DirectionSound(3)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Hole_Up_SG'
	DirectionSound(4)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Wait_SG'

	InsultSound(0)=Sound'KF_MumbleVoice.INSULT.KFH_Mumble_Specimen_Insult_SG'
	InsultSound(1)=Sound'KF_MumbleVoice.INSULT.KFH_Mumble_Player_Insult_SG'

    AutomaticSound(0)=Sound'KF_MumbleVoice.Acknowledgments.KFH_Mumble_Yes_SG'				// Welding
	AutomaticSound(1)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Wait_SG' 						// Unwelding
	AutomaticSound(2)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Reloading_SG'  	// Reloading
	AutomaticSound(3)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Out_of_Ammo_SG'    // Out of ammo
	AutomaticSound(4)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_DropCash_SG'       // Throw Cash
	AutomaticSound(5)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Auto_Healing_SG'   // Healing
	AutomaticSound(6)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Auto_Dying_SG'     // Dying
	AutomaticSound(7)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Auto_Dying_SG' 	// Bloat Puke
	AutomaticSound(8)=Sound'KF_MumbleVoice.INSULT.KFH_Mumble_Specimen_Insult_SG'			// Patriarch Invis
	AutomaticSound(9)=Sound'KF_MumbleVoice.INSULT.KFH_Mumble_Player_Insult_SG' 				// Patriarch Gun
	AutomaticSound(10)=Sound'KF_MumbleVoice.Acknowledgments.KFH_Mumble_Thanks_SG'			// Patriarch Rockets
	AutomaticSound(11)=Sound'KF_MumbleVoice.SUPPORT.KFH_Mumble_Need_Money_SG'  				// Grabbed by clot
	AutomaticSound(12)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Alert_Lookout_SG'  			// Spotted Fleshpound
	AutomaticSound(13)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Hole_Up_SG' 					// Spotted Gorefast
	AutomaticSound(14)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Wait_SG'   					// Spotted Scrake
	AutomaticSound(15)=Sound'KF_MumbleVoice.Acknowledgments.KFH_Mumble_Yes_SG' 				// Spotted Siren
	AutomaticSound(16)=Sound'KF_MumbleVoice.INSULT.KFH_Mumble_Specimen_Insult_SG'  			// SirenAfterScream
	AutomaticSound(17)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Follow_SG' 					// StalkerUncloaks
	AutomaticSound(18)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Auto_Dying_SG'    // Spotted Crawler
	AutomaticSound(19)=Sound'KF_MumbleVoice.Acknowledgments.KFH_Mumble_Thanks_SG'  			// KilledStalkerMelee
	AutomaticSound(20)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Follow_SG'    				// EnemyBurnedToDeath
	AutomaticSound(21)=Sound'KF_MumbleVoice.INSULT.KFH_Mumble_Player_Insult_SG'      		// SwitchToDBShotgun
	AutomaticSound(22)=Sound'KF_MumbleVoice.Alerts.KFH_Mumble_Follow_SG'  					// SwitchToDualHandcannon
	AutomaticSound(23)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Auto_Dying_SG'	// SwitchToLAW
	AutomaticSound(24)=Sound'KF_MumbleVoice.Automatic_Commands.KFH_Mumble_Auto_Dying_SG'	// SwitchToAxe
}
