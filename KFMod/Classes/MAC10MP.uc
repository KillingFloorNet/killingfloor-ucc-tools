//-----------------------------------------------------------
// Mac-10 Inventory class
//-----------------------------------------------------------
class MAC10MP extends KFWeapon;

#exec OBJ LOAD FILE=KillingFloorHUD.utx
#exec OBJ LOAD FILE=Inf_Weapons_Foley.uax

// Use alt fire to switch fire modes
simulated function AltFire(float F)
{
	if(ReadyToFire(0))
	{
		DoToggle();
	}
}

function bool RecommendRangedAttack()
{
	return true;
}

//TODO: LONG ranged?
function bool RecommendLongRangedAttack()
{
	return true;
}

function float SuggestAttackStyle()
{
	return -1.0;
}

exec function SwitchModes()
{
	DoToggle();
}

function float GetAIRating()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return AIRating;

	return AIRating;
}

function byte BestMode()
{
	return 0;
}

simulated function SetZoomBlendColor(Canvas c)
{
	local Byte    val;
	local color   clr;
	local Color   fog;

	clr.R = 255;
	clr.G = 255;
	clr.B = 255;
	clr.A = 255;

	if( Instigator.Region.Zone.bDistanceFog )
	{
		fog = Instigator.Region.Zone.DistanceFogColor;
		val = 0;
		val = Max( val, fog.R);
		val = Max( val, fog.G);
		val = Max( val, fog.B);
		if( val > 128 )
		{
			val -= 128;
			clr.R -= val;
			clr.G -= val;
			clr.B -= val;
		}
	}
	c.DrawColor = clr;
}

simulated function bool StartFire(int Mode)
{
	if( KFHighROFFire(FireMode[Mode]) == none || FireMode[Mode].bWaitForRelease )
		return super.StartFire(Mode);

	if( !super.StartFire(Mode) )  // returns false when mag is empty
	   return false;

	if( AmmoAmount(0) <= 0 )
	{
    	return false;
    }

	AnimStopLooping();

	if( !FireMode[Mode].IsInState('FireLoop') && (AmmoAmount(0) > 0) )
	{
		FireMode[Mode].StartFiring();
		return true;
	}
	else
	{
		return false;
	}

	return true;
}

simulated function AnimEnd(int channel)
{
    local name anim;
    local float frame, rate;

	if(!FireMode[0].IsInState('FireLoop'))
	{
        GetAnimParams(0, anim, frame, rate);

        if (ClientState == WS_ReadyToFire)
        {
             if ((FireMode[0] == None || !FireMode[0].bIsFiring) && (FireMode[1] == None || !FireMode[1].bIsFiring))
            {
                PlayIdle();
            }
        }
	}
}

simulated event OnZoomOutFinished()
{
	local name anim;
	local float frame, rate;

	GetAnimParams(0, anim, frame, rate);

	if (ClientState == WS_ReadyToFire)
	{
		// Play the regular idle anim when we're finished zooming out
		if (anim == IdleAimAnim)
		{
            PlayIdle();
		}
		// Switch looping fire anims if we switched to/from zoomed
		else if( FireMode[0].IsInState('FireLoop') && anim == 'Fire_Iron_Loop')
		{
            LoopAnim('Fire_Loop', FireMode[0].FireLoopAnimRate, FireMode[0].TweenTime);
		}
	}
}

/**
 * Called by the native code when the interpolation of the first person weapon to the zoomed position finishes
 */
simulated event OnZoomInFinished()
{
	local name anim;
	local float frame, rate;

	GetAnimParams(0, anim, frame, rate);

	if (ClientState == WS_ReadyToFire)
	{
		// Play the iron idle anim when we're finished zooming in
		if (anim == IdleAnim)
		{
		   PlayIdle();
		}
		// Switch looping fire anims if we switched to/from zoomed
		else if( FireMode[0].IsInState('FireLoop') && anim == 'Fire_Loop' )
		{
            LoopAnim('Fire_Iron_Loop', FireMode[0].FireLoopAnimRate, FireMode[0].TweenTime);
		}
	}
}

defaultproperties
{
	SkinRefs(0)="KF_Weapons2_Trip_T.Special.MAC10_cmb"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.MAC10_SIL_cmb"
	SleeveNum=2

	WeaponReloadAnim="Reload_Mac10"
	IdleAimAnim=Idle_Iron

	CustomCrosshair=11
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross5"
	MagCapacity=30
	ReloadRate=3.0
	ReloadAnim="Reload"
	ReloadAnimRate=1.000000
	FlashBoneName="tipS"

	Weight=4.000000
	bModeZeroCanDryFire=True
	FireModeClass(0)=Class'KFMod.MAC10Fire'
	FireModeClass(1)=Class'KFMod.NoFire'
	PutDownAnim="PutDown"
	SelectSoundRef="KF_MAC10MPSnd.MAC10_Select"
	SelectForce="SwitchToAssaultRifle"
	bShowChargingBar=True
	Description="A highly compact machine pistol. Can be fired in semi or full auto."
	EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
	Priority=75
	InventoryGroup=3
	GroupOffset=6
	PickupClass=Class'KFMod.MAC10Pickup'
	PlayerViewOffset=(X=25.000000,Y=20.000000,Z=-6.000000)
	//PlayerViewPivot=(Pitch=400)
	BobDamping=6.000000
	AttachmentClass=Class'KFMod.MAC10Attachment'
	IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
	ItemName="MAC10"
	MeshRef="KF_Weapons2_Trip.Mac10_Trip"
	DrawScale=1.00000
	TransientSoundVolume=1.250000
	AmbientGlow=0

	AIRating=0.55
	CurrentRating=0.55

	DisplayFOV=55.000000
	StandardDisplayFOV=60.0
	PlayerIronSightFOV=65
	ZoomTime=0.25
	FastZoomOutTime=0.2
	ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
	bHasAimingMode=true
	ZoomedDisplayFOV=32

	HudImageRef="KillingFloor2HUD.WeaponSelect.Mac_10_Unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Mac_10"
	TraderInfoTexture=Texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Mac_10'

	bIsTier2Weapon=true
}
