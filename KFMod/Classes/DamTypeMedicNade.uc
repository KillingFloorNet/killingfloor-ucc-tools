//=============================================================================
// DamTypeMedicNade
//=============================================================================
// Damage class for being poisoned by the MedicNade
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class DamTypeMedicNade extends KFWeaponDamageType;

defaultproperties
{
	DeathString="%k poisoned %o (MedicNade)."
    FemaleSuicide="%o poisoned herself."
    MaleSuicide="%o poisoned himself."
	bLocationalHit=false
    bIsPowerWeapon=false
    bCheckForHeadShots=false
}
