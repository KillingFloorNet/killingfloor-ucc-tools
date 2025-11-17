class TacLightShineAttachment extends InventoryAttachment;


defaultproperties
{
	DrawType=DT_Mesh
	bAcceptsProjectors=False
	bUseLightingFromBase=False
	bUnlit = true
	AttachmentBone=LightBone
	Mesh = SkeletalMesh 'KFWeaponModels.TacShine'
	bUseDynamicLights=false
	MaxLights = 0
	DrawScale = 0.15
}
