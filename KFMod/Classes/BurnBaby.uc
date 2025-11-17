             // The fire that gets spawned when a Fuel puddle is shot. This damages pawns and then dissipates.
class BurnBaby extends Emitter;

var () float BurnInterval; // Interval between burn damage.
var Actor Parent;  // Parent Actor
var () int FlameDamage; // How much dmg the touchee takes.

static function PreInitialize( int Damage, float Interval )
{
	// You can preserve the original default values in other default variables if you want, and restore them in prebeginplay. If you want.
	default.BurnInterval = Interval;
	default.FlameDamage = Damage;
}

simulated function PostBeginPlay()
{
	SetTimer(BurnInterval,True);
}

function Timer()
{
	local Material SurfaceMat;
	local int HitSurface;
	local Vector HitLocation, HitNormal;
	local rotator EffectDir;
	local Actor Other;

	Other = Trace(HitLocation, HitNormal, Location + vector(Rotation) * 32, Location - vector(Rotation) * 16, true,, SurfaceMat);

	EffectDir = rotator(MirrorVectorByNormal(vector(Rotation), HitNormal));

	if(Vehicle(Other) != None && Other.SurfaceType == 0)
		HitSurface = 3;
	else if(Other != None && !Other.IsA('LevelInfo') && Other.SurfaceType != 0)
		HitSurface = Other.SurfaceType;
	else if(SurfaceMat != None)
		HitSurface = SurfaceMat.SurfaceType;

	if (SurfaceMat != none && Parent == none)
	{
		if (KFHumanPawn(Instigator) != none)
			Kill();
	}
	if( Parent==none || Parent.DrawScale<=0.25 )
		Kill();
}


defaultproperties
{
    Begin Object Class=SpriteEmitter Name=SpriteEmitter0
        FadeOut=True
        FadeIn=True
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        UseRandomSubdivision=True
        Acceleration=(Z=100.000000)
        ColorScale(1)=(RelativeTime=0.300000,Color=(B=255,G=255,R=255))
        ColorScale(2)=(RelativeTime=0.667857,Color=(B=89,G=172,R=247,A=255))
        ColorScale(3)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128,A=255))
        ColorScale(4)=(RelativeTime=1.000000)
        ColorScale(5)=(RelativeTime=1.000000)
        FadeOutStartTime=0.520000
        FadeInEndTime=0.140000
        MaxParticles=8
        Name="SpriteEmitter0"
        StartLocationShape=PTLS_Sphere
        SpinsPerSecondRange=(X=(Max=0.075000))
        StartSpinRange=(X=(Min=-0.500000,Max=0.500000))
        SizeScale(0)=(RelativeTime=1.000000,RelativeSize=0.500000)
        StartSizeRange=(X=(Min=40.000000,Max=60.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
        ScaleSizeByVelocityMultiplier=(X=0.000000,Y=0.000000,Z=0.000000)
        ScaleSizeByVelocityMax=0.000000
        Texture=Texture'KillingFloorTextures.LondonCommon.fire3'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=30.000000
        LifetimeRange=(Min=1.000000,Max=1.000000)
        StartVelocityRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=25.000000,Max=75.000000))
    End Object
    Emitters(0)=SpriteEmitter'SpriteEmitter0'

    bNoDelete = false

    SoundVolume = 255
    SoundRadius = 100
    bFullVolume = false
    AmbientSound = Sound'Amb_Destruction.Kessel_Fire_Small_Vehicle'//Sound'GeneralAmbience.firefx12' KFTODO: Replace this

    LightRadius = 4
    LightType = LT_Pulse

    LightBrightness = 300
    LightHue = 30
    LightSaturation = 100
    bDynamicLight = true

    FlameDamage = 10
    BurnInterval = 1

    LifeSpan=6
}
