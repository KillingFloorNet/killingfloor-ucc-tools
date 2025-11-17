class ProjectilePickupMessage extends LocalMessage;

var() localized string PickupMessages[2];

static function string GetString (optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	if ( (Switch >= 0) && (Switch <= 1) )
		return Default.PickupMessages[Switch];
}

defaultproperties
{
    PickupMessages(0)="You picked up a crossbow arrow."
    PickupMessages(1)="You picked up a saw blade."
    bFadeMessage=True
    bIsUnique=True

    DrawColor=(R=255,G=255,B=255,A=255)
    FontSize=0

    PosY=0.9
}
