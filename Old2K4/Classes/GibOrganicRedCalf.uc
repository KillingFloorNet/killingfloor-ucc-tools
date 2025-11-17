class GibOrganicRedCalf extends Gib;

defaultproperties
{
    DrawType=DT_StaticMesh
    DrawScale=0.2
    StaticMesh=none//StaticMesh'GibOrganicCalf' KFTODO: replace this mesh
    Skins=none//(Texture'GibOrganicRed') KFTODO: replace this texture

    TrailClass=class'ROEffects.BloodTrail'

    CollisionHeight=6.0
    CollisionRadius=6.0
}
