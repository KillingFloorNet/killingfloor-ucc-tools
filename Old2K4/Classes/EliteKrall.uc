class EliteKrall extends Krall;

event PostBeginPlay()
{
	Super.PostBeginPlay();

	//MyAmmo.ProjectileClass = class'EliteKrallBolt';
}

defaultproperties
{
	Skins(0)=none//ekrall
	skins(1)=none//ekrall
	ScoringValue=3
}
