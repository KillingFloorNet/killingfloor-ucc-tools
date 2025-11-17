//=============================================================================
// A GUIImage with an Index
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================
class KFIndexedGUIImage extends GUIImage;

var	int Index;

DefaultProperties
{
	Index=0
	bAcceptsInput=true
	bCaptureMouse=True
	bNeverFocus=false
	bMouseOverSound=true
	OnClickSound=CS_Click

	ToolTip=GUIButtonToolTip
}
