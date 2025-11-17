// Halliday's yaycht.  It goes boom.

// Author: Alex Quick

class HallidaysYacht extends Decoration
placeable;

#exec OBJ LOAD FILE=Yahct_Anim.ukx

var () name ExplosionAnim;

var () sound ExplosionSound;
// The volume of the explosion sound.
var() float ExplosionSoundVolume;
// The radius of the shoot sound.
var() float ExplosionSoundRadius;

// The volume of the explosion sound.
var() float SecondaryExplosionSoundVolume;
// The radius of the shoot sound.
var() float SecondaryExplosionSoundRadius;

// When the explosion happened.
var float ExplosionTime;
// Secondary Explosion Sound Interval.
var() float ExtraExplosionSoundInterval;
var bool bDidSecondaryExplosionSound, bDidExtraSecondaryExplosionSound;
// Extra explosion sounds
var () sound SecondaryExplosionSound, ExtraSecondaryExplosionSound;

var bool bExploded, bClientExploded;

replication
{
    reliable if(Role == Role_Authority && bNetDirty)
        bExploded;
}

function Trigger( actor Other, pawn EventInstigator )
{
    if(!bExploded)
    {
        bExploded = true;
        ExplosionTime=Level.TimeSeconds;
        if(Role == Role_Authority)
        {
            PlaySound(ExplosionSound, SLOT_Misc, ExplosionSoundVolume,,ExplosionSoundRadius,,false);

            if(KFGameType(Level.Game) != none)
            {
                KFGameType(Level.Game).DramaticEvent(1.f,3.f);  // MICHEAL BAY, BITCHES!
            }
        }

        PlayExplosionAnim();
        NetUpdateFrequency = 0.1 ;
    }

}

function Tick(Float DeltaTime)
{
    if(Role == Role_Authority && bExploded &&
        (Level.TimeSeconds - ExplosionTime > ExtraExplosionSoundInterval) )
    {
        if( !bDidSecondaryExplosionSound )
        {
            bDidSecondaryExplosionSound=true;
            ExplosionTime=Level.TimeSeconds;
            PlaySound(SecondaryExplosionSound, SLOT_Misc, SecondaryExplosionSoundVolume,,SecondaryExplosionSoundRadius,,false);
        }
        else if( !bDidExtraSecondaryExplosionSound )
        {
            bDidExtraSecondaryExplosionSound=true;
            PlaySound(ExtraSecondaryExplosionSound, SLOT_Misc, SecondaryExplosionSoundVolume,,SecondaryExplosionSoundRadius,,false);
        }
    }
}

simulated function PostNetReceive()
{
    if(bExploded && !bClientExploded)
    {
        bClientExploded = true;
        PlayExplosionAnim();
    }
}


simulated function PlayExplosionAnim()
{
    PlayAnim(ExplosionAnim,1.f,0.f,0);
}

defaultproperties
{
    ExplosionAnim = "Explode"

    DrawType = DT_Mesh
    mesh = SkeletalMesh'Yahct_Anim.Yahct_SK'

    ExplosionSoundVolume=2.0
    ExplosionSoundRadius=7500
    SecondaryExplosionSoundVolume=0.5
    SecondaryExplosionSoundRadius=2500

    bNetNotify = true
	bStatic=False
	bStasis=False
	RemoteRole=ROLE_SimulatedProxy
	bNoDelete=True
	bSkipActorPropertyReplication=True
	bAlwaysRelevant=True
}
