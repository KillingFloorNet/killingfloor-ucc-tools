class KFTab_Profile extends UT2K4TabPanel;

//================================================================================
// 3D View
//================================================================================
var automated GUISectionBackground	i_BG3DView;
var automated GUIImage				i_Portrait;
var automated GUIButton				b_3DView;
var automated GUIButton				b_Pick;
var automated GUIButton				b_DropTarget;

var() editinline editconst noexport KFSpinnyWeap	SpinnyDude; // MUST be set to null when you leave the window
var() vector										SpinnyDudeOffset;
var() bool											bRenderDude;
var localized string								ShowPortraitCaption;
var localized string								Show3DViewCaption;

var() string				sChar, sCharD;
var() int					nFOV;
var() xUtil.PlayerRecord	PlayerRec;

//================================================================================
// Perks
//================================================================================
var automated GUISectionBackground	i_BGPerks;
var	automated KFPerkSelectListBox	lb_PerkSelect;

var automated GUISectionBackground	i_BGPerkEffects;
var automated GUIScrollTextBox		lb_PerkEffects;

var automated GUISectionBackground	i_BGPerkNextLevel;
var	automated KFPerkProgressListBox	lb_PerkProgress;

var KFSteamStatsAndAchievements KFStatsAndAchievements;

//================================================================================
// Bio
//================================================================================
var automated GUISectionBackground	i_BGBio;
var automated GUIScrollTextBox		lb_Scroll;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super.Initcomponent(MyController, MyOwner);

	// Spawn spinning character actor
	if ( SpinnyDude == None )
	{
		SpinnyDude = PlayerOwner().Spawn(class'KFGui.KFSpinnyWeap');
	}

	SpinnyDude.SetDrawType(DT_Mesh);
	SpinnyDude.SetDrawScale(0.9);
	SpinnyDude.SpinRate = 0;

	b_3DView.Caption = Show3DViewCaption;

	lb_PerkSelect.List.OnChange = OnPerkSelected;

	i_BGBio.Managecomponent(lb_Scroll);

	OnDeActivate = SaveSettings;
}

event Opened(GUIComponent Sender)
{
	local rotator R;

	Super.Opened(Sender);

	if ( SpinnyDude != None )
	{
		R.Yaw = 32768;
		R.Pitch = 0;
		SpinnyDude.SetRotation(R+PlayerOwner().Rotation);
		SpinnyDude.bHidden = false;
	}
}

function ShowPanel(bool bShow)
{
	if ( bShow )
	{
		if ( bInit )
		{
			bRenderDude = True;
			bInit = False;
		}

		if ( PlayerOwner() != none )
		{
			KFStatsAndAchievements = KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements);
			if ( KFStatsAndAchievements != none )
			{
				// Initialize the List
				lb_PerkSelect.List.InitList(KFStatsAndAchievements);
				lb_PerkProgress.List.InitList();
			}
		}
	}

	lb_PerkSelect.SetPosition(i_BGPerks.WinLeft + 6.0 / float(Controller.ResX),
						  	  i_BGPerks.WinTop + 38.0 / float(Controller.ResY),
							  i_BGPerks.WinWidth - 10.0 / float(Controller.ResX),
							  i_BGPerks.WinHeight - 35.0 / float(Controller.ResY),
							  true);


	SetVisibility(bShow);
}

function SetPlayerRec()
{
	local int i;
	local array<xUtil.PlayerRecord> PList;

	class'xUtil'.static.GetPlayerList(PList);

	// Filter out to only characters without the 's' menu setting
	for ( i = 0; i < PList.Length; i++ )
	{
		if ( sChar ~= Plist[i].DefaultName )
		{
			PlayerRec = PList[i];
			break;
		}
	}

	UpdateScroll();
	ShowSpinnyDude();
}

function ShowSpinnyDude()
{
	if ( bRenderDude )
	{
		UpdateSpinnyDude(); // Load current character
		b_3DView.Caption = ShowPortraitCaption; // Change button caption
		b_DropTarget.MouseCursorIndex = 5;
	}
	else
	{
		// Put text back into box
		i_Portrait.Image = PlayerRec.Portrait;
		b_3DView.Caption = Show3DViewCaption;
		SpinnyDude.LinkMesh(None);
		b_DropTarget.MouseCursorIndex = 0;
	}
}

function bool PickModel(GUIComponent Sender)
{
	if ( Controller.OpenMenu("KFGui.KFModelSelect", PlayerRec.DefaultName, Eval(Controller.CtrlPressed, PlayerRec.Race, "")) )
	{
		Controller.ActivePage.OnClose = ModelSelectClosed;
	}

	return true;
}

function ModelSelectClosed( optional bool bCancelled )
{
	local string str;

	if ( bCancelled )
		return;

	str = Controller.ActivePage.GetDataString();
	if ( str != "" )
	{
		sChar = str;
		SetPlayerRec();
	}
}

function bool OnSpinnyDudeCapturedMouseMove(float deltaX, float deltaY)
{
	local rotator r;
  	r = SpinnyDude.Rotation;
	r.Yaw -= (256 * DeltaX);
	SpinnyDude.SetRotation(r);
	return true;
}

function UpdateSpinnyDude()
{
	local Mesh PlayerMesh;
	local Material BodySkin, HeadSkin;
	local string BodySkinName, HeadSkinName;
	local bool bBrightSkin;

	i_Portrait.Image = PlayerRec.Portrait;
	PlayerMesh = Mesh(DynamicLoadObject(PlayerRec.MeshName, class'Mesh'));
	if ( PlayerMesh == none )
	{
		Log("Could not load mesh: "$PlayerRec.MeshName$" For player: "$PlayerRec.DefaultName);
		return;
	}

	// Get the body skin
	BodySkinName = PlayerRec.BodySkinName;
	bBrightSkin = class'DMMutator'.default.bBrightSkins && Left(BodySkinName,12) ~= "PlayerSkins.";

	// Get the head skin
	HeadSkinName = PlayerRec.FaceSkinName;

	BodySkin = Material(DynamicLoadObject(BodySkinName, class'Material'));
	if ( BodySkin == none )
	{
		Log("Could not load body material: "$PlayerRec.BodySkinName$" For player: "$PlayerRec.DefaultName);
		return;
	}

	HeadSkin = Material(DynamicLoadObject(HeadSkinName, class'Material'));
	if ( HeadSkin == none )
	{
		Log("Could not load head material: "$HeadSkinName$" For player: "$PlayerRec.DefaultName);
		return;
	}

	SpinnyDude.LinkMesh(PlayerMesh);
	SpinnyDude.Skins[0] = BodySkin;
	SpinnyDude.Skins[1] = HeadSkin;
	SpinnyDude.LoopAnim('Profile_idle');
}

function bool Toggle3DView(GUIComponent Sender)
{
	bRenderDude = !bRenderDude;
	ShowSpinnyDude();

	return true;
}

function bool InternalDraw(Canvas canvas)
{
	local vector CamPos, X, Y, Z;
	local rotator CamRot;
	local float oOrgX, oOrgY;
	local float oClipX, oClipY;

	if ( bRenderDude )
	{
		oOrgX = Canvas.OrgX;
		oOrgY = Canvas.OrgY;
		oClipX = Canvas.ClipX;
		oClipY = Canvas.ClipY;

		Canvas.OrgX = b_DropTarget.ActualLeft();
		Canvas.OrgY = b_DropTarget.ActualTop();
		Canvas.ClipX = b_DropTarget.ActualWidth();
		Canvas.ClipY = b_DropTarget.ActualHeight();

		canvas.GetCameraLocation(CamPos, CamRot);
		GetAxes(CamRot, X, Y, Z);

		SpinnyDude.SetLocation(CamPos + ((SpinnyDudeOffset.X + ((oClipX / oClipY) * 120.0)) * X) + (SpinnyDudeOffset.Y * Y) + (SpinnyDudeOffset.Z * Z));
		canvas.DrawActorClipped(SpinnyDude, false,  b_DropTarget.ActualLeft(), b_DropTarget.ActualTop(), b_DropTarget.ActualWidth(), b_DropTarget.ActualHeight(), true, nFov);

		Canvas.OrgX = oOrgX;
		Canvas.OrgY = oOrgY;
		Canvas.ClipX = oClipX;
		Canvas.ClipY = oClipY;
	}

	return bRenderDude;
}

function InternalOnLoadINI(GUIComponent Sender, string s)
{
	local PlayerController PC;

	PC = PlayerOwner();

	if ( Sender == i_Portrait )
	{
		sChar = PC.GetUrlOption("Character");
		sCharD = sChar;
		SetPlayerRec();
	}
}

function UpdateScroll()
{
	lb_Scroll.SetContent(Controller.LoadDecoText("KFGUI",PlayerRec.DefaultName));
}

function SaveSettings()
{
	local PlayerController PC;

	PC = PlayerOwner();

	if ( sChar != sCharD )
	{
		sCharD = sChar;
		PC.ConsoleCommand("ChangeCharacter"@sChar);

		if ( !PC.IsA('xPlayer') )
		{
			PC.UpdateURL("Character", sChar, True);
		}

		if ( PlayerRec.Sex ~= "Female" )
		{
			PC.UpdateURL("Sex", "F", True);
		}
		else
		{
			PC.UpdateURL("Sex", "M", True);
		}
	}

	class'KFPlayerController'.default.SelectedVeterancy = class'KFGameType'.default.LoadedSkills[lb_PerkSelect.GetIndex()];

	if ( KFPlayerController(PC) != none )
	{
		KFPlayerController(PC).SetSelectedVeterancy( class'KFGameType'.default.LoadedSkills[lb_PerkSelect.GetIndex()] );
		KFPlayerController(PC).SendSelectedVeterancyToServer();
		PC.SaveConfig();
	}
	else
	{
		class'KFPlayerController'.static.StaticSaveConfig();
	}
}

event Closed(GUIComponent Sender, bool bCancelled)
{
	KFStatsAndAchievements = none;

	Super.Closed(Sender, bCancelled);

	if ( SpinnyDude != None )
		SpinnyDude.bHidden = true;
}

function Free()
{
	Super.Free();

	if ( SpinnyDude != None )
		SpinnyDude.Destroy();

	SpinnyDude = None;
}

function OnPerkSelected(GUIComponent Sender)
{
	if ( KFStatsAndAchievements.bUsedCheats )
	{
		lb_PerkEffects.SetContent(class'LobbyMenu'.default.PerksDisabledString);
	}
	else
	{
		lb_PerkEffects.SetContent(class'KFGameType'.default.LoadedSkills[lb_PerkSelect.GetIndex()].default.LevelEffects[KFStatsAndAchievements.PerkHighestLevelAvailable(lb_PerkSelect.GetIndex())]);

		lb_PerkProgress.List.PerkChanged(KFStatsAndAchievements, lb_PerkSelect.GetIndex());
	}
}

defaultproperties
{
	SpinnyDudeOffset=(X=120.0,Y=0.00,Z=0.00)
	nFOV=15

	ShowPortraitCaption="Portrait"
	Show3DViewCaption="3D View"

	WinTop=0.15
	WinLeft=0
	WinWidth=1
	WinHeight=0.72

	Begin Object class=GUISectionBackground Name=BG3DView
		WinWidth=0.306758
		WinHeight=0.963631
		WinLeft=-0.001276
		WinTop=0.017969
		Caption="3D View"
	End Object
	i_BG3DView=BG3DView

	Begin Object class=GUIButton Name=Player3DView
		WinWidth=0.096281
		WinHeight=0.050000
		WinLeft=0.008073
		WinTop=0.901559
		Caption="3D View"
		Hint="Toggle between 3D view and portrait of character."
		OnClick=Toggle3DView
		TabOrder=1
	End Object
	b_3DView=Player3DView

	Begin Object class=GUIButton Name=bPickModel
		WinWidth=0.184930
		WinHeight=0.050000
		WinLeft=0.109674
		WinTop=0.901559
		Caption="Change Character"
		Hint="Select a new Character."
		OnClick=PickModel
		TabOrder=2
	End Object
	b_Pick=bPickModel

	Begin Object class=GUIImage Name=PlayerPortrait
		WinWidth=0.284623
		WinHeight=0.798132
		WinLeft=0.010624
		WinTop=0.094895
		Image=Texture'InterfaceArt_tex.Menu.changeme_texture' //Material'2K4Menus.Controls.thinpipe_b'
		ImageColor=(R=255,G=255,B=255,A=255)
		ImageRenderStyle=MSTY_Normal
		ImageStyle=ISTY_Scaled
		RenderWeight=0.3
		OnLoadINI=InternalOnLoadINI
		IniOption="@Internal"
		OnDraw=InternalDraw
	End Object
	i_Portrait=PlayerPortrait

	Begin Object class=GUIButton Name=DropTarget
		WinWidth=0.3055
		WinHeight=0.838132
		WinLeft=0.00001
		WinTop=0.074426
		Caption=""
		Hint=""
		bNeverFocus=true
		StyleName="NoBackground"
		bDropTarget=true
		bCaptureMouse=true
		OnCapturedMouseMove=OnSpinnyDudeCapturedMouseMove
		MouseCursorIndex=5
		bTabStop=false
	End Object
	b_DropTarget=DropTarget

	Begin Object class=GUISectionBackground Name=BGPerks
		WinWidth=0.338980
		WinHeight=0.714653
		WinLeft=0.313418
		WinTop=0.017969
		Caption="Select Perk"
		bFillClient=true
	End Object
	i_BGPerks=BGPerks

	Begin Object class=KFPerkSelectListBox Name=PerkSelectList
		WinWidth=0.318980
		WinHeight=0.654653
		WinLeft=0.323418
		WinTop=0.082969
	End Object
	lb_PerkSelect=PerkSelectList

	Begin Object class=GUISectionBackground Name=BGPerkEffects
		WinWidth=0.339980
		WinHeight=0.352235
		WinLeft=0.660121
		WinTop=0.017969
		Caption="Perk Effects"
		bFillClient=true
	End Object
	i_BGPerkEffects=BGPerkEffects

	Begin Object Class=GUIScrollTextBox Name=PerkEffectsScroll
		WinWidth=0.319980
		WinHeight=0.292235
		WinLeft=0.670121
		WinTop=0.077969
		CharDelay=0.0025
		EOLDelay=0.1
		TabOrder=9
		StyleName="NoBackground"
	End Object
	lb_PerkEffects=PerkEffectsScroll

	Begin Object class=GUISectionBackground Name=BGPerksNextLevel
		WinWidth=0.339980
		WinHeight=0.352235
		WinLeft=0.660121
		WinTop=0.379668
		Caption="Next Level Requirements"
		bFillClient=true
	End Object
	i_BGPerkNextLevel=BGPerksNextLevel

	Begin Object class=KFPerkProgressListBox Name=PerkProgressList
		WinWidth=0.319980
		WinHeight=0.292235
		WinLeft=0.670121
		WinTop=0.439668
	End Object
	lb_PerkProgress=PerkProgressList

	Begin Object class=GUISectionBackground Name=BGBiography
		WinWidth=0.686687
		WinHeight=0.237964
		WinLeft=0.313418
		WinTop=0.743131
		Caption="Biography"
		LeftPadding=0.02
		RightPadding=0.02
		TopPadding=0.02
		BottomPadding=0.02
		bFillClient=true
	End Object
	i_BGBio=BGBiography

	Begin Object Class=GUIScrollTextBox Name=PlayerScroll
		WinWidth=0.686915
		WinHeight=0.260351
		WinLeft=0.291288
		WinTop=0.321365
		CharDelay=0.0025
		EOLDelay=0.5
		TabOrder=9
		StyleName="NoBackground"
	End Object
	lb_Scroll=PlayerScroll
}
