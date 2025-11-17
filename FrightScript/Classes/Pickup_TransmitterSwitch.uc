class Pickup_TransmitterSwitch extends Pickup_TransmitterPart;

#exec OBJ LOAD FILE=FrightYard2_T.utx

defaultproperties
{
    InventoryType = class 'Inv_TransmitterSwitch'

    StaticMesh = StaticMesh 'FrightYard2_SM.FY_Transmitter_Collapsed'
    CarriedMaterial =  Texture 'FrightYard_T.Transmitter_Icon_64'
    GroundMaterial =   Colormodifier 'FrightYard_T.RemotePickupGroundIco_cm'
}
