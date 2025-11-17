class GibOrganicRedForearm extends Gib;

defaultproperties
{
    DrawType=DT_StaticMesh
    DrawScale=1.3
    StaticMesh=none//StaticMesh'GibOrganicForearm' KFTODO: replace this mesh
    Skins=none//(Texture'GibOrganicRed') KFTODO: replace this texture

    TrailClass=class'ROEffects.BloodTrail'

    CollisionHeight=6.0
    CollisionRadius=6.0
}
