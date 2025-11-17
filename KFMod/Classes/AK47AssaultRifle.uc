//=============================================================================
// AK47 Inventory class
//=============================================================================
class AK47AssaultRifle extends KFWeapon
	config(user);

#exec OBJ LOAD FILE=KillingFloorWeapons.utx
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
	SkinRefs(0)="KF_Weapons2_Trip_T.Rifles.AK47_cmb"
    SleeveNum=1

    WeaponReloadAnim=Reload_AK47
    IdleAimAnim=Idle_Iron

    CustomCrosshair=11
    CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross5"
    MagCapacity=30
    ReloadRate=3.0
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000

    Weight=6.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.AK47Fire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSoundRef="KF_AK47Snd.AK47_Select"
    SelectForce="SwitchToAssaultRifle"
    bShowChargingBar=True
    Description="A classic Russian assault rifle. Can be fired in semi or full auto with nice knock down power but not great accuracy."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=95
    InventoryGroup=3
    GroupOffset=7
    PickupClass=Class'KFMod.AK47Pickup'
    PlayerViewOffset=(X=18.000000,Y=22.000000,Z=-6.000000)
    //PlayerViewPivot=(Pitch=400)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.AK47Attachment'
    IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
    ItemName="AK47"
    MeshRef="KF_Weapons2_Trip.AK47_Trip"
    DrawScale=1.00000
    TransientSoundVolume=1.250000
    AmbientGlow=0

    AIRating=0.55
    CurrentRating=0.55

    DisplayFOV=60.000000
    StandardDisplayFOV=60.0
    PlayerIronSightFOV=65
    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
    bHasAimingMode=true
    ZoomedDisplayFOV=32

	HudImageRef="KillingFloor2HUD.WeaponSelect.Ak_47_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.Ak_47"
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_AK_47'

	bIsTier2Weapon=true
}
