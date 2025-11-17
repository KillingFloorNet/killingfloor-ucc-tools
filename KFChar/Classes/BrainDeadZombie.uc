// for debugging
class BrainDeadZombie extends ZombieClot;

event PostBeginPlay()
{
	Super.PostBeginPlay();

    SetMovementPhysics();
}

defaultproperties
{
    //SoundRadius=10
    ControllerClass=none
}


