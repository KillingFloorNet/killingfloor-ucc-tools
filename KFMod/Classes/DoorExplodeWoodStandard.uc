//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DoorExplodeWoodStandard extends DoorExplode
	Abstract;

defaultproperties
{
     ShrapnelAreaHeight=150.000000
     ShrapnelAreaWidth=80.000000
     GibSpeed=150.000000
     DoorDustClass=Class'KFMod.KFDoorExplosionDustWood'
     SpreadFactor=0.700000
	DoorGibClasses(0)=Class'DoorGibWoodA'
	DoorGibClasses(1)=Class'DoorGibWoodB'
	DoorGibClasses(2)=Class'DoorGibWoodC'
	DoorGibClasses(3)=Class'DoorGibWoodD'
}
