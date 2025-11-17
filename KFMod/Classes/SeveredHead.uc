//=============================================================================
// SeveredHead
//=============================================================================
// Detached head gib class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class SeveredHead extends SeveredAppendage;

defaultproperties
{
    DrawType=DT_StaticMesh
    DrawScale=1.0
    StaticMesh=StaticMesh'EffectsSM.Ger_Tunic_Arm'
    //Skins=(Texture'GibOrganicRed')

    CollisionHeight=4.0
    CollisionRadius=6.0

    HitSound=sound'KF_EnemyGlobalSnd.Gibs_Small'
}
