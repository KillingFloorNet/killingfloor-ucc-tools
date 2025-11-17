//=============================================================================
// DismemebermentJet
//=============================================================================
// blood jet when a dismemberment happens
//=============================================================================
// Killing Floor Source
// Copyright (C) 2005 Tripwire Interactive LLC
// - David Hensley & John "Ramm-Jaeger" Gibson
//=============================================================================

class DismembermentJet extends Emitter;

defaultproperties
{
//	AutoDestroy=True
//    Style=STY_Alpha
    bDirectional=True
    bNoDelete=false
    //required because this is spawned on server during netplay.
    RemoteRole=ROLE_none
    //make sure initial rotation is replicated
    bNetInitialRotation=true
    LifeSpan = 30
}
