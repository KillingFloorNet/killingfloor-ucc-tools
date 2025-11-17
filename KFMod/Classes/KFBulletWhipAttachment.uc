//=============================================================================
// KFBulletWhipAttachment
//=============================================================================
// An additional collision cylinder for detecting precision hit traces or
// projectiles as well as detecting bullets passing by which allows for the
// creation of bullet whip sound effects.
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive
// Author - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFBulletWhipAttachment extends ROBulletWhipAttachment;

defaultproperties
{
	DrawType=DT_None
	// Debug draw
	//DrawType=DT_Sprite
	//Texture=S_Actor
	DrawScale=+00001.000000
	//DrawScale=+00000.0100000
	DrawScale3D=(X=1,Y=1,Z=1)

	CollisionHeight=80.0
	CollisionRadius=60.0
	RemoteRole=ROLE_None
}
