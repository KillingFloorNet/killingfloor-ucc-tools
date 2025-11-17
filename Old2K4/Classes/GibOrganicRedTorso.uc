class GibOrganicRedTorso extends Gib;

defaultproperties
{
    DrawType=DT_StaticMesh
    DrawScale=0.4
    StaticMesh=none//StaticMesh'GibOrganicTorso' KFTODO: replace this mesh
    Skins=none//(Texture'GibOrganicRed') KFTODO: replace this texture

    TrailClass=class'ROEffects.BloodTrail'

    CollisionHeight=10.0
    CollisionRadius=10.0
}
