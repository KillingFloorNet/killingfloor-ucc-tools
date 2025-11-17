//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DamTypeZombieAttack extends KFWeaponDamageType
abstract;

var () material HUDDamageTex;
var () material HUDUberDamageTex;

var float HUDTime;

defaultproperties
{
     HUDDamageTex=Texture'KillingFloorHUD.BluntSplashNormal' //BluntNormalShader
     HUDUberDamageTex=Shader'KillingFloorHUD.BluntShaderuber'
     HUDTime=0.900000
}
