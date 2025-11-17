class GibOrganicRedUpperArm extends Gib;

defaultproperties
{
    DrawType=DT_StaticMesh
    DrawScale=0.13
    StaticMesh=none//StaticMesh'GibOrganicUpperArm' KFTODO: replace this mesh
    Skins=none//(Texture'GibOrganicRed') KFTODO: replace this texture

    TrailClass=class'ROEffects.BloodTrail'

    CollisionHeight=6.0
    CollisionRadius=6.0
}
