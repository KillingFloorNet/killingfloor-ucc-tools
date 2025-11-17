class HelloWordEmmiter extends ProjectedDecal;

var texture Splats[3];

simulated function PostBeginPlay()
{
    ProjTexture = splats[Rand(3)];
    Super.PostBeginPlay();
}

defaultproperties
{
     Splats(0)=none//Texture'XEffects.BloodSplat1' KFTODO: Replace this
     Splats(1)=none//Texture'XEffects.BloodSplat2' KFTODO: Replace this
     Splats(2)=none//Texture'XEffects.BloodSplat3' KFTODO: Replace this
     ProjTexture=none//Texture'XEffects.BloodSplat1' KFTODO: Replace this
     FOV=6
     bClipStaticMesh=True
     CullDistance=7000.000000
     LifeSpan=10.000000
}
