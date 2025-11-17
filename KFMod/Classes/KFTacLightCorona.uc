class KFTacLightCorona extends Effects;


defaultproperties
{
    Texture=Material'KillingFloorWeapons.Dualies.FlashlightCorona3P'
    bUnlit=True
    DrawType=DT_Sprite
    Style=STY_Alpha
    bHidden=True
    DrawScale=0.3
    bHardAttach=True
    bCollideActors=False
    bCorona=False
    bBlockActors=False
    bDynamicLight=True
    LightType=LT_Steady
    LightBrightness=0
    LightHue=35
    LightSaturation=200
    LightRadius = 0
    Physics=PHYS_None
    RemoteRole = ROLE_SimulatedProxy
    bNetTemporary=false
}