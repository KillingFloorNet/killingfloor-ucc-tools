/*
	--------------------------------------------------------------
	 KF_GnomeSmashable
	--------------------------------------------------------------

	His little gnome death cries will haunt you for years.

	Author :  Alex Quick

	--------------------------------------------------------------
*/

class KF_GnomeSmashable extends KFDECO_Smashable;

#exec OBJ LOAD FILE=HillbillyHorrorSND.uax
#exec OBJ LOAD FILE=HillbillyHorror_SM.usx

var(Sound)  Sound DeathSound;
var(Sound)  float DeathSoundVolume,DeathSoundRadius;

auto state Working
{
    function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType, optional int HitIndex)
    {
        local Controller InstigatorC;

        // - Gnomes should only take damage from human players ..
        if(InstigatedBy != none)
        {
            InstigatorC = InstigatedBy.Controller;
            if(InstigatorC != none && KFPlayerController(InstigatorC) != none)
            {
                Super.TakeDamage(Damage,InstigatedBy,HitLocation,Momentum,damageType,HitIndex);
            }
        }
    }
}

state Broken
{
    function BeginState()
    {
        Super.beginState();
        if(DeathSound != none)
        {
            PlaySound(DeathSound,,DeathSoundVolume,,DeathSoundRadius,SoundPitch,true);
        }

        AmbientSound = none;
    }
}

defaultproperties
{
    bNeedsSingleShot=true
    CollisionRadius = 12.f
    CollisionHeight = 25.f
    PrePivot=(X=0,Y=0,Z=25)

    EffectWhenDestroyed = class 'GnomeSoul'
    DrawType = DT_StaticMesh
    StaticMesh = StaticMesh'HillbillyHorror_SM.GardenGnome'

    AmbientSound=Sound'KF_BaseGorefast_xmas.Gorefast_IdleLoop'
    DeathSound = Sound'HillbillyHorrorSND.General.KF_GnomeHeaven'

    SoundRadius=10.000000
    DeathSoundRadius=100
    DeathSoundVolume=255

    bAlwaysRelevant = true
    bOnlyDirtyReplication = true
}
