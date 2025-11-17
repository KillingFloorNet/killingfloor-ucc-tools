class Pickup_TransmitterCord extends Pickup_TransmitterPart;

#exec OBJ LOAD FILE=FrightYard2_T.utx

defaultproperties
{
    InventoryType = class 'Inv_TransmitterCord'

    StaticMesh = StaticMesh 'FrightYard2_SM.FY_Transmitter_Cord'
    CarriedMaterial =  Texture 'FrightYard_T.Coil_Icon_64'
    GroundMaterial =   Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'
}
