//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DoorExplodeMetalStandard extends DoorExplode
	Abstract;


defaultproperties
{
	ShrapnelAreaHeight=150.000000
	ShrapnelAreaWidth=80.000000
	GibSpeed=100.000000
	NumPieces=1//8
	NumGibClasses=1
	SpreadFactor=0.700000
	DoorGibClasses(0)=Class'DoorGibMetalA'
	DoorGibClasses(1)=Class'DoorGibMetalB'
	DoorGibClasses(2)=Class'DoorGibMetalC'
	DoorGibClasses(3)=Class'DoorGibMetalD'
}
