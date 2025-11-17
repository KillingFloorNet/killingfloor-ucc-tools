//=============================================================================
// SCAR MK17 Inventory class
//=============================================================================
class SCARMK17AssaultRifle extends KFWeapon
	config(user);

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
	local Color   clr;
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

defaultproperties
{
	SkinRefs(0)="KF_Weapons2_Trip_T.Rifle.Scar_cmb"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.Aimpoint_sight_shdr"
    SleeveNum=2

    WeaponReloadAnim=Reload_SCAR
    IdleAimAnim=Idle_Iron

    CustomCrosshair=11
    CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross5"
    MagCapacity=20
    ReloadRate=2.966
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=5.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.SCARMK17Fire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_SCARSnd.SCAR_Select"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    Description="An advanced tactical assault rifle. Fires in semi or full auto with great power and accuracy."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=175
    InventoryGroup=4
    GroupOffset=4
    PickupClass=Class'KFMod.SCARMK17Pickup'
    PlayerViewOffset=(X=25.000000,Y=20.000000,Z=-6.000000)//(X=18.000000,Y=22.000000,Z=-6.000000)
    //PlayerViewPivot=(Pitch=400)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.SCARMK17Attachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="SCARMK17"
    MeshRef="KF_Weapons2_Trip.SCAR_Trip"
    DrawScale=1.00000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    AIRating=0.55
    CurrentRating=0.55

    DisplayFOV=55.000000
    StandardDisplayFOV=55.0//60.0
    PlayerIronSightFOV=65
    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ZoomedDisplayFOV=20

	HudImageRef="KillingFloor2HUD.WeaponSelect.Scar_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Scar"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_Scar'

	// Achievement Helpers
	bIsTier3Weapon=true
}
