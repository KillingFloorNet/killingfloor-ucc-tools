class KFHitEffectReduced extends KFHitEffect;

simulated function SpawnEffects()
{
	local Material SurfaceMat;
	local int HitSurface;
	local Vector HitLocation, HitNormal,TDir;
	local rotator EffectDir;
	local Actor Other;

	if( Instigator==None )
		Return;
	TDir = Normal(Location-Instigator.Location);
	Other = Instigator.Trace(HitLocation, HitNormal, Location+TDir*32, Location-TDir*16,true,,SurfaceMat);

	if( Other==none || BlockingVolume(Other)!=None )
		return;

	EffectDir = rotator(HitNormal);

	if(Vehicle(Other) != None && Other.SurfaceType == 0)
		HitSurface = 3;
	else if(Other != None && Other!=Level && Other.SurfaceType != 0)
		HitSurface = Other.SurfaceType;
	else if(SurfaceMat != None)
		HitSurface = SurfaceMat.SurfaceType;
	else return;

	if( Other.IsA('KFMonster') || Other.IsA('ExtendedZCollision') )
		HitSurface = 6;

	if(fRand() >= 0.65)
	{
            if(PhysicsVolume.bWaterVolume)
    			Spawn(class'WaterSplashEmitter');
      	else Spawn(HitEffectClasses[HitSurface],,,, EffectDir);
		if(Other != None && Other.bWorldGeometry && DecalClasses[HitSurface] != None)
    			Spawn(DecalClasses[HitSurface]);
	}
}

defaultproperties
{
     HitEffectClasses(0)=Class'KFMod.DirtHitEmitter'
     HitEffectClasses(1)=Class'KFMod.RockHitEmitter'
     HitEffectClasses(2)=Class'KFMod.DirtHitEmitter'
     HitEffectClasses(3)=Class'KFMod.MetalHitEmitter'
     HitEffectClasses(4)=Class'KFMod.WoodHitEmitter'
     HitEffectClasses(5)=Class'KFMod.PlantHitEmitter'
     HitEffectClasses(6)=Class'KFMod.FleshHitEmitter'
     HitEffectClasses(7)=Class'KFMod.SnowHitEmitter'
     HitEffectClasses(8)=Class'KFMod.SnowHitEmitter'
     HitEffectClasses(9)=Class'KFMod.WaterHitEmitter'
     HitEffectClasses(10)=Class'KFMod.GlassHitEmitter'
     DecalClasses(0)=Class'KFMod.DefaultBulletDecal'
     DecalClasses(1)=Class'KFMod.DefaultBulletDecal'
     DecalClasses(2)=Class'KFMod.SnowBulletDecal'
     DecalClasses(3)=Class'KFMod.MetalBulletDecal'
     DecalClasses(4)=Class'KFMod.WoodBulletDecal'
     DecalClasses(7)=Class'KFMod.GlassBulletDecal'
     DecalClasses(8)=Class'KFMod.SnowBulletDecal'
     DecalClasses(10)=Class'KFMod.GlassBulletDecal'
}
