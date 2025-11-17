class GoldenAA12Ammo extends KFAmmunition;

#EXEC OBJ LOAD FILE=KillingFloorHUD.utx

defaultproperties
{
     MaxAmmo=80
     InitialAmount=60
     AmmoPickupAmount=20
     IconMaterial=Texture'KillingFloorHUD.Generic.HUD'
     IconCoords=(X1=451,Y1=445,X2=510,Y2=500)
     PickupClass=Class'KFMod.GoldenAA12AmmoPickup'
}
