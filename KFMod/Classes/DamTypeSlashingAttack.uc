//-----------------------------------------------------------
// Slashing Attacks
//-----------------------------------------------------------
class DamTypeSlashingAttack extends DamTypeZombieAttack;

defaultproperties
{
    PawnDamageEmitter=class'ROEffects.ROBloodPuff'
    LowDetailEmitter=ROEffects.ROBloodPuffSmall
    LowGoreDamageEmitter=ROEffects.ROBloodPuffNoGore

    HUDDamageTex=FinalBlend'KillingFloorHUD.SlashSplashNormalFB'
    HUDUberDamageTex=FinalBlend'KillingFloorHUD.SlashSplashUberFB'
}
