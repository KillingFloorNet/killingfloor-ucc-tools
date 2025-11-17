class Msg_CashReward extends LocalMessage;

static function string GetString(
    optional int Switch,
    optional PlayerReplicationInfo RelatedPRI_1,
    optional PlayerReplicationInfo RelatedPRI_2,
    optional Object OptionalObject
    )
{
    if(Switch > 0)
    {
        return "+ £"@Switch ;
    }
    else
    {
        return "- £"@Switch ;
    }
}

defaultproperties
{
    bIsConsoleMessage=false
    DrawColor=(B=100,G=255,R=100,A=255)
    Lifetime=5
    FontSize=2
    bBeep=False
    bFadeMessage=True
    bIsUnique=False
	StackMode=SM_Up

    PosX = 0.92
    PosY = 0.82
}

