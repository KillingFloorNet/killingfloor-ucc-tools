//=============================================================================
// Dual 50 Cal Inventory class
//=============================================================================
class DualDeagle extends Dualies;

function bool HandlePickupQuery( pickup Item )
{
	if ( Item.InventoryType==Class'Deagle' || Item.InventoryType==Class'GoldenDeagle' )
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
		DualDeagleAttachment(altThirdPersonActor).bIsOffHand = true;
	if(altThirdPersonActor != None && ThirdPersonActor != None)
	{
		DualDeagleAttachment(altThirdPersonActor).brother = DualDeagleAttachment(ThirdPersonActor);
		DualDeagleAttachment(ThirdPersonActor).brother = DualDeagleAttachment(altThirdPersonActor);
		altThirdPersonActor.LinkMesh(DualDeagleAttachment(ThirdPersonActor).BrotherMesh);
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
		if ( Deagle(I) != none )
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

			MagAmmoRemaining = Deagle(I).MagAmmoRemaining;

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
		MagAmmoRemaining = Clamp(MagAmmoRemaining + Class'Deagle'.Default.MagCapacity, 0, MagCapacity);
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
		I = Spawn(Class'Deagle');
		I.GiveTo(Instigator);
		Weapon(I).Ammo[0].AmmoAmount = OtherAmmo;
		Deagle(I).MagAmmoRemaining = MagAmmoRemaining / 2;
		MagAmmoRemaining = Max(MagAmmoRemaining-Deagle(I).MagAmmoRemaining,0);
	}

	Pickup = Spawn(Class'DeaglePickup',,, StartLocation);

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
	if ( Instigator.PendingWeapon.class == class'Deagle' )
	{
		bIsReloading = false;
	}

	return super.PutDown();
}


defaultproperties
{
	skins(0)=Combiner'KF_Weapons_Trip_T.Pistols.deagle_cmb'

    WeaponReloadAnim=Reload_Dual9mm

    altFlashBoneName="Tip01"
    altTPAnim="DualiesAttackLeft"
    altWeaponAttach="Bone_weapon2"
    IdleAimAnim=Idle_Iron
    MagCapacity=16
    ReloadRate=3.500000
    bSpeedMeUp=False
    ReloadAnim="Reload"
    ReloadAnimRate=1.000000
    FlashBoneName="Tip"
    Weight=4.000000
    bModeZeroCanDryFire=True
    FireModeClass(0)=Class'KFMod.DualDeagleFire'
    FireModeClass(1)=Class'KFMod.NoFire' //NoFire
    PutDownAnim="PutDown"
    SelectSound=Sound'KF_HandcannonSnd.50AE_Select'
//    AimInSound=Sound'KF_HandcannonSnd.50AE_Aim'
//    AimOutSound=Sound'KF_HandcannonSnd.50AE_Aim'
    AIRating=0.45
    CurrentRating=0.45
    bShowChargingBar=True
    Description="Dual .50 calibre action express handgun. Dual 50's is double the fun."
    EffectOffset=(X=100.000000,Y=25.000000,Z=-10.000000)
    Priority=125
    InventoryGroup=2
    GroupOffset=4
    PickupClass=Class'KFMod.DualDeaglePickup'
    PlayerViewOffset=(X=25.000000,Y=0.000000,Z=-7.000000)
    BobDamping=6.000000
    AttachmentClass=Class'KFMod.DualDeagleAttachment'
    IconCoords=(X1=250,Y1=110,X2=330,Y2=145)
    ItemName="Dual Handcannons"
    Mesh=SkeletalMesh'KF_Weapons_Trip.Dual50_Trip'
    DrawScale=1.0
    TransientSoundVolume=1.000000
    AmbientGlow=0

    bTorchEnabled = false

    ZoomTime=0.25
    FastZoomOutTime=0.2
    ZoomInRotation=(Pitch=0,Yaw=0,Roll=0)
    bHasAimingMode=true

    DisplayFOV=60.000000
    StandardDisplayFOV=60.0
    PlayerIronSightFOV=75
    ZoomedDisplayFOV=50

	HudImage=texture'KillingFloorHUD.WeaponSelect.dual_handcannon_unselected'
	SelectedHudImage=texture'KillingFloorHUD.WeaponSelect.dual_handcannon'
	TraderInfoTexture=texture'KillingFloorHUD.Trader_Weapon_Images.Trader_Dual_Handcannons'

	bIsTier2Weapon=true
}
