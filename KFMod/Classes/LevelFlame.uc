// The level designer's version of the Fuel Flame
class LevelFlame extends Emitter;

var () float BurnInterval; // Interval between burn damage.
var () int FlameDamage; // How much dmg the touchee takes.

function PostBeginPlay()
{
	if( Level.NetMode!=NM_Client )
		SetTimer(BurnInterval,True);
}
function Timer()
{
	local int i;

	For( i=0; i<Touching.Length; i++ )
	{
		if( Pawn(Touching[i])!=None )
			Touching[i].TakeDamage(FlameDamage,None,Touching[i].Location,vect(0,0,0),class 'Burned');
	}
}


defaultproperties
{
	Begin Object Class=SpriteEmitter Name=SpriteEmitter10
		SecondsBeforeInactive = 30
		UseColorScale=True
		SpinParticles=True
		UseSizeScale=True
		UseRegularSizeScale=False
		UniformSize=True
		UseRandomSubdivision=True
		Acceleration=(Z=100.000000)
		ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
		ColorScale(2)=(RelativeTime=0.750000,Color=(B=96,G=160,R=255))
		ColorScale(3)=(RelativeTime=1.000000)
		ColorMultiplierRange=(Z=(Min=0.670000,Max=2.000000))
		MaxParticles=15
		Name="SpriteEmitter10"
		StartLocationShape=PTLS_Sphere
		SphereRadiusRange=(Max=5.000000)
		SpinsPerSecondRange=(X=(Max=0.070000))
		StartSpinRange=(X=(Max=1.000000))
		SizeScale(0)=(RelativeTime=1.000000,RelativeSize=0.500000)
		StartSizeRange=(X=(Min=56.000000,Max=45.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
		ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
		ScaleSizeByVelocityMax=0.000000
		Texture=Texture'KillingFloorTextures.LondonCommon.fire3'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.750000,Max=1.250000)
		StartVelocityRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=25.000000,Max=75.000000))
	End Object
	Emitters(0) = SpriteEmitter'SpriteEmitter10'

	bUseCylinderCollision = true
	CollisionHeight = 30
	CollisionRadius = 60
	bCollideActors = true
	SoundVolume = 255
	bFullVolume = true
	AmbientSound = none//Sound'GeneralAmbience.firefx12' KFTODO: Replace this
	LightRadius=4
	LightType=LT_Flicker
	LightBrightness=300
	LightHue=30
	LightSaturation=100
	bDynamicLight=true
	FlameDamage=10
	BurnInterval=1
}
