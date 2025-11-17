class LaserAttachmentFirstPerson extends InventoryAttachment;


defaultproperties
{
	DrawType=DT_Mesh
	bAcceptsProjectors=False
	bUseLightingFromBase=False
	bUnlit = true
	AttachmentBone=LightBone
	Mesh = SkeletalMesh 'KFWeaponModels.firstP_laser'
	bUseDynamicLights=false
	MaxLights = 0
	DrawScale = 1.0
}
