class KFMainMessages extends CriticalEventPlus
	abstract;

var(Message) localized string ShopBootMsg, HasWeaponMsg, NoCarryMoreMsg, ShopItBase,CantCarryItemMsg,CantSelectWeaponMsg;

static function string GetString(
	 optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	switch (Switch)
	{
		case 0:
			return Default.ShopBootMsg;
		case 1:
			return Default.HasWeaponMsg;
		case 2:
			return Default.NoCarryMoreMsg;
		case 3:
			return Default.ShopItBase;
		case 4:
		    return Default.CantCarryItemMsg;
		case 5:
		    return "You cannot use the"@Weapon(OptionalObject).default.ItemName@"right now." ;
	}

	return "";
}

defaultproperties
{
	bIsUnique=true
	FontSize=2
	StackMode=SM_Down
	PosY=0.8
	DrawColor=(R=255,G=10,B=10)
	ShopBootMsg="You can't stay in this shop after closing"
	bIsConsoleMessage=false
	HasWeaponMsg="You already have this weapon"
	NoCarryMoreMsg="You can not carry this weapon"
	ShopItBase="Press '%Use%' to TRADE"
	CantCarryItemMsg="You cannot carry this item"
	CantSelectWeaponMsg="You cannot use that weapon right now"
}
