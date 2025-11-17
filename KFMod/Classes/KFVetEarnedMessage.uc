class KFVetEarnedMessage extends CriticalEventPlus
	abstract;
	
var(Message) localized string EarnedString;

//
// Messages common to GameInfo derivatives.
//
static function string GetString(
    optional int Switch,
    optional PlayerReplicationInfo RelatedPRI_1, 
    optional PlayerReplicationInfo RelatedPRI_2,
    optional Object OptionalObject
    )
{
	local string S;

	if( Class<KFVeterancyTypes>(OptionalObject)==None )
		return "";
	S = Default.EarnedString;
	ReplaceText(S,"%v",Class<KFVeterancyTypes>(OptionalObject).Default.VeterancyName);
	Return S;
}

defaultproperties
{
	bIsUnique=True
	FontSize=3
	PosY=0.2
	DrawColor=(R=255,G=50,B=50)
	EarnedString="You have qualified for %v !"
	bIsConsoleMessage=True
}
