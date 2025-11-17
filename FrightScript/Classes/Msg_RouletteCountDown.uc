class Msg_RouletteCountDown extends TimerMessage;

var localized string CountDownPrefix;

static function string GetString(
    optional int Switch,
    optional PlayerReplicationInfo RelatedPRI_1,
    optional PlayerReplicationInfo RelatedPRI_2,
    optional Object OptionalObject
    )
{
    return default.CountDownPrefix@Switch$default.CountDownTrailer;
}

static function int GetFontSize(int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer)
{
    return 5;
}

defaultproperties
{
	DrawColor=(G=0)
    CountDownPrefix = "Wheel will spin in :"
    PosY=0.6
}
