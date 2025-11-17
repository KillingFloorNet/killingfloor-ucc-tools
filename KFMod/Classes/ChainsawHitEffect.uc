//=============================================================================
// ChainsawHitEffect
//=============================================================================
// Hit effect class for chainsaw hits
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 John "Ramm-Jaeger" Gibson
//=============================================================================

class ChainsawHitEffect extends KFMeleeHitEffect;

//=============================================================================
// defaultproperties
//=============================================================================
defaultproperties
{
	HitEffects(0)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitRockEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Default')        // Default (Dirt?)
	HitEffects(1)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitRockEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')     // Rock
	HitEffects(2)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitDirtEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')        // Dirt
	HitEffects(3)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitMetalEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Metal')      // Metal
	HitEffects(4)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitWoodEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Wood')        // Wood
	HitEffects(5)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitGrassEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')      // Plant
	HitEffects(6)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitFleshEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Flesh')        // Flesh (dead animals)
	HitEffects(7)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitIceEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Conc')        // Ice
	HitEffects(8)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitSnowEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')        // Snow
	HitEffects(9)=(HitEffect=class'ROBulletHitWaterEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Default')                                    // Water
	HitEffects(10)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBreakingGlass',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Default')            // Glass
	HitEffects(11)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitGravelEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')     // Gravel
	HitEffects(12)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitConcreteEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Conc')    // Concrete
	HitEffects(13)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitWoodEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Wood')       // HollowWood
	HitEffects(14)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitMudEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')        // Mud
	HitEffects(15)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitMetalArmorEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Metal')     // MetalArmor
	HitEffects(16)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitPaperEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')       // Paper
	HitEffects(17)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitClothEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')       // Cloth
	HitEffects(18)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitRubberEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')       // Rubber
	HitEffects(19)=(HitDecal=class'KnifeHitDirt',HitEffect=class'ROBulletHitMudEffect',HitSound=sound'KF_ChainsawSnd.Chainsaw_Impact_Dirt')        // Poop
}
