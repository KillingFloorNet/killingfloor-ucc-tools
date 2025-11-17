class KFObjectiveMsg extends CriticalEventPlus
	abstract;

static function string GetString(
	 optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	if( KFSPLevelinfo(OptionalObject)==None || Switch<0 || KFSPLevelinfo(OptionalObject).MissionObjectives.Length<=Switch )
		Return "";
	Return KFSPLevelinfo(OptionalObject).MissionObjectives[Switch];
}

defaultproperties
{
	bIsUnique=True
	FontSize=2
	StackMode=SM_Down
	PosY=0.8
	DrawColor=(R=255,G=100,B=255)
	bIsConsoleMessage=True
	Lifetime=3
}
