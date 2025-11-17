class CrossbowAmmo extends KFAmmunition;

#EXEC OBJ LOAD FILE=KillingFloorHUD.utx

defaultproperties
{
     MaxAmmo=36 // Reduced in Balance Round 1
     InitialAmount=12 // Reduced in Balance Round 1
     AmmoPickupAmount=6 // Reduced in Balance Round 1
     PickupClass=Class'KFMod.CrossbowAmmoPickup'
     IconMaterial=Texture'KillingFloorHUD.Generic.HUD'
     IconCoords=(X1=4,Y1=350,X2=110,Y2=395)
     ItemName="An arrow"
}
