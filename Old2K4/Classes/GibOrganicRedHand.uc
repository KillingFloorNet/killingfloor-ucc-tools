class GibOrganicRedHand extends Gib;

defaultproperties
{
    DrawType=DT_StaticMesh
    DrawScale=1.3
    StaticMesh=none//StaticMesh'GibOrganicHand' KFTODO: replace this mesh
    Skins=none//(Texture'GibOrganicRed') KFTODO: replace this texture

    TrailClass=class'ROEffects.BloodTrail'

    CollisionHeight=4.0
    CollisionRadius=4.0
}
