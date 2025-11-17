//=============================================================================
// MAC-10 Ammo.
//=============================================================================
class MAC10Ammo extends KFAmmunition;

#EXEC OBJ LOAD FILE=KillingFloorHUD.utx

defaultproperties
{
	 MaxAmmo=300
	 InitialAmount=120
	 AmmoPickupAmount=30
	 PickupClass=Class'KFMod.MAC10AmmoPickup'
	 IconMaterial=Texture'KillingFloorHUD.Generic.HUD'
	 IconCoords=(X1=336,Y1=82,X2=382,Y2=125)
	 ItemName="MAC-10 bullets"
}
