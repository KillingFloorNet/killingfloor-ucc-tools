class KFSpinnyWeap extends SpinnyWeap;

//var rotator InitialRotOffset;

simulated event PostBeginPlay()
{
  // SetRotation(InitialRotOffset);
  log(Rotation);
}


   /*
function Tick(float Delta)
{
    local rotator NewRot;

    NewRot = Rotation;
    NewRot.Yaw += Delta * SpinRate/Level.TimeDilation;
    SetRotation(NewRot);

    CurrentTime += Delta/Level.TimeDilation;

    // If desired, play some random animations
    if(bPlayRandomAnims && CurrentTime >= NextAnimTime)
    {
        PlayNextAnim();
    }
}
*/

defaultproperties
{
  //InitialRotOffset=(pitch=-47451,roll=15760,yaw=0)
  SpinRate = 0
  bUnlit=true
  AnimNames(0)=IdleRestAnim
}
