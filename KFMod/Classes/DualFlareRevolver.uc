//=============================================================================
// FlareRevolver
//=============================================================================
// Dual Flare Revolve Pistols Inventory Class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2012 Tripwire Interactive LLC
// - IJC Weapon Development
//=============================================================================
class DualFlareRevolver extends Dualies;

function bool HandlePickupQuery( pickup Item )
{
	if ( Item.InventoryType==Class'FlareRevolver' )
	{
		if( LastHasGunMsgTime < Level.TimeSeconds && PlayerController(Instigator.Controller) != none )
		{
			LastHasGunMsgTime = Level.TimeSeconds + 0.5;
			PlayerController(Instigator.Controller).ReceiveLocalizedMessage(Class'KFMainMessages', 1);
		}

		return True;
	}

	return Super.HandlePickupQuery(Item);
}

function AttachToPawn(Pawn P)
{
	local name BoneName;

	Super.AttachToPawn(P);

	if(altThirdPersonActor == None)
	{
		altThirdPersonActor = Spawn(AttachmentClass,Owner);
		InventoryAttachment(altThirdPersonActor).InitFor(self);
	}
	else altThirdPersonActor.NetUpdateTime = Level.TimeSeconds - 1;
	BoneName = P.GetOffhandBoneFor(self);
	if(BoneName == '')
	{
		altThirdPersonActor.SetLocation(P.Location);
		altThirdPersonActor.SetBase(P);
	}
	else P.AttachToBone(altThirdPersonActor,BoneName);

	if(altThirdPersonActor != None)
		DualFlareRevolverAttachment(altThirdPersonActor).bIsOffHand = true;
	if(altThirdPersonActor != None && ThirdPersonActor != None)
	{
		DualFlareRevolverAttachment(altThirdPersonActor).brother = DualFlareRevolverAttachment(ThirdPersonActor);
		DualFlareRevolverAttachment(ThirdPersonActor).brother = DualFlareRevolverAttachment(altThirdPersonActor);
		altThirdPersonActor.LinkMesh(DualFlareRevolverAttachment(ThirdPersonActor).BrotherMesh);
	}
}

function GiveTo( pawn Other, optional Pickup Pickup )
{
	local Inventory I;
	local int OldAmmo;
	local bool bNoPickup;

	MagAmmoRemaining = 0;

	For( I = Other.Inventory; I != None; I =I.Inventory )
	{
		if ( FlareRevolver(I) != none )
		{
			if( WeaponPickup(Pickup)!= none )
			{
				WeaponPickup(Pickup).AmmoAmount[0] += Weapon(I).AmmoAmount(0);
			}
			else
			{
				OldAmmo = Weapon(I).AmmoAmount(0);
				bNoPickup = true;
			}

			MagAmmoRemaining = FlareRevolver(I).MagAmmoRemaining;

			I.Destroyed();
			I.Destroy();

			Break;
		}
	}

	if ( KFWeaponPickup(Pickup) != None && Pickup.bDropped )
	{
		MagAmmoRemaining = Clamp(MagAmmoRemaining + KFWeaponPickup(Pickup).MagAmmoRemaining, 0, MagCapacity);
	}
	else
	{
		MagAmmoRemaining = Clamp(MagAmmoRemaining + Class'FlareRevolver'.Default.MagCapacity, 0, MagCapacity);
	}

	Super(Weapon).GiveTo(Other, Pickup);

	if ( bNoPickup )
	{
		AddAmmo(OldAmmo, 0);
		Clamp(Ammo[0].AmmoAmount, 0, MaxAmmo(0));
	}
}

function DropFrom(vector StartLocation)
{
	local int m;
	local Pickup Pickup;
	local Inventory I;
	local int AmmoThrown, OtherAmmo;

	if( !bCanThrow )
		return;

	AmmoThrown = AmmoAmount(0);
	ClientWeaponThrown();

	for (m = 0; m < NUM_FIRE_MODES; m++)
	{
		if (FireMode[m].bIsFiring)
			StopFire(m);
	}

	if ( Instigator != None )
		DetachFromPawn(Instigator);

	if( Instigator.Health > 0 )
	{
		OtherAmmo = AmmoThrown / 2;
		AmmoThrown -= OtherAmmo;
		I = Spawn(Class'FlareRevolver');
		I.GiveTo(Instigator);
		Weapon(I).Ammo[0].AmmoAmount = OtherAmmo;
		FlareRevolver(I).MagAmmoRemaining = MagAmmoRemaining / 2;
		MagAmmoRemaining = Max(MagAmmoRemaining-FlareRevolver(I).MagAmmoRemaining,0);
	}

	Pickup = Spawn(Class'FlareRevolverPickup',,, StartLocation);

	if ( Pickup != None )
	{
		Pickup.InitDroppedPickupFor(self);
		Pickup.Velocity = Velocity;
		WeaponPickup(Pickup).AmmoAmount[0] = AmmoThrown;
		if( KFWeaponPickup(Pickup)!=None )
			KFWeaponPickup(Pickup).MagAmmoRemaining = MagAmmoRemaining;
		if (Instigator.Health > 0)
			WeaponPickup(Pickup).bThrown = true;
	}

    Destroyed();
	Destroy();
}

simulated function bool PutDown()
{
	if ( Instigator.PendingWeapon.class == class'FlareRevolver' )
	{
		bIsReloading = false;
	}

	return super.PutDown();
}

defaultproperties
{
    skins(0)=none
    SkinRefs(0)="KF_IJC_Halloween_Weapons.FlareGun.flaregun_cmb"
    SkinRefs(1)="KF_IJC_Halloween_Weapons.FlareGun.flaregun_flame_shader"

    SleeveNum=2

    WeaponReloadAnim=Reload_DualFlare

    altFlashBoneName="Tip_Left"
    altTPAnim="DualiesAttackLeft"
    altWeaponAttach="Bone_weapon2"
    IdleAimAnim=Idle_Iron

    MagCapacity=12
    ReloadRate=4.85
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000
    FlashBoneName="Tip_Right"
    Weight=4.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.DualFlareRevolverFire'
    FireModeClass(1)=Class'KFMod.NoFire'
    PutDownAnim="PutDown"
    SelectSound=none
    SelectSoundRef="KF_RevolverSnd.WEP_Revolver_Foley_Select"
    AIRating=0.450000
    CurrentRating=0.450000
    bShowChargingBar=True
    Description="A pair of Flare Revolvers. Two classic wild west revolvers modified to shoot fireballs!"
    //EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=120
    InventoryGroup=2
    GroupOffset=6
    PickupClass=Class'KFMod.DualFlareRevolverPickup'
    PlayerViewOffset=(X=20.000000,Y=0.000000,Z=-8.0000000)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.DualFlareRevolverAttachment'
    IconCoords=(X1=250,Y1=110,X2=330,Y2=145)
    ItemName="Dual Flare Revolvers"
    Mesh=none
    MeshRef="KF_IJC_Halloween_Weps3.DualFlareRevolver"
    DrawScale=1.0
    TransientSoundVolume=1.000000
    AmbientGlow=0

    bTorchEnabled=False

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=0,Yaw=0,Roll=0)
    bHasAimingMode=true

    DisplayFOV=60.000000
    StandardDisplayFOV=60.000000
    PlayerIronSightFOV=75
    ZoomedDisplayFOV=50.000000


    HudImage=none
    SelectedHudImage=none
    HudImageRef="KF_IJC_HUD.WeaponSelect.DualFlareGun_unselected"
    SelectedHudImageRef="KF_IJC_HUD.WeaponSelect.DualFlareGun"
    TraderInfoTexture=Texture'KF_IJC_HUD.Trader_Weapon_Icons.Trader_DualFlareGun'

    AppID=210934

    bIsTier2Weapon=true
}
