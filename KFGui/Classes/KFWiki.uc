class KFWiki extends Settings_Tabs;

var ()array<String> WikiObjectDescription,WikiObjectName,WikiObjectClassName;

var rotator ItemRotOffset;

var automated KFGUISectionBackground i_BG, i_BG2, i_BG3;
var automated GUIImage i_Shadow, i_Bk;
var automated GUIListBox    lb_items;
var automated GUIScrollTextBox  lb_Desc,lb_statBox,lb_Healthbox;

var KFSpinnyWeap          SpinnyWeap; // MUST be set to null when you leave the window
var() vector                SpinnyWeapOffset;
var rotator SpinnyWeaponRot;

var editconst noexport float SavedPitch;

var float fScale;

var localized string HiddenText, LoadingText;

var config bool bDebugPriority, bDebugScale, bDebugWeapon;

var () rotator infoDrawRotation;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.InitComponent(MyController, MyOwner);

	lb_items.List.bMultiSelect=False;
	i_BG2.ManageComponent(lb_items);
	if ( bDebugWeapon )
		OnKeyEvent = CoolOnKeyEvent;
}

function IntializeWeaponList()
{
    local UT2K4GenericMessageBox Page;

    // Display the "loading" page
    if ( Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", "", LoadingText) )
    {
        Page = UT2K4GenericMessageBox(Controller.ActivePage);
        Page.RemoveComponent(Page.b_Ok);
        Page.RemoveComponent(Page.l_Text);
        Page.l_Text2.FontScale = FNS_Large;
        Page.l_Text2.WinHeight = 1.0;
        Page.l_Text2.WinTop = 0.0;
        Page.l_Text2.bBoundToParent = True;
        Page.l_Text2.bScaleToParent = True;
        Page.l_Text2.VertAlign = TXTA_Center;
        Page.l_Text2.TextAlign = TXTA_Center;
        Page.bRenderWorld = False;
        Page.OnRendered = ReallyInitializeWeaponList;
    }
}

function ReallyInitializeWeaponList( Canvas C )
{
    local int i;
    local rotator AdjustedRot;

    if ( Controller.ActivePage.Tag != 55 )
    {
        Controller.ActivePage.Tag = 55;
        return;
    }


    // Disable the combo list's OnChange()
    lb_items.List.bNotify = False;

    lb_items.List.Clear();

   // lb_items.List.Add("ENEMIES",,,true);

     lb_items.List.Add("ENEMIES",,,true);
    for(i=0; i<WikiObjectName.length; i++)
    {
        lb_items.List.Add(WikiObjectName[i], DynamicLoadObject(WikiObjectClassName[i],class'class'), WikiObjectDescription[i]);
      if (i==8)
       lb_items.List.Add("WEAPONRY",,,true);
      if (i==22)
       lb_items.List.Add("EQUIPMENT",,,true);

    }



    // Spawn spinny weapon actor
    if ( SpinnyWeap == None )
        SpinnyWeap = PlayerOwner().spawn(class'KFGUI.KFSpinnyWeap');

    AdjustedRot = PlayerOwner().Rotation;
    AdjustedRot.pitch = -AdjustedRot.pitch;
    AdjustedRot.yaw = -AdjustedRot.yaw;

    SpinnyWeap.SetRotation(AdjustedRot);

    SpinnyWeaponRot = SpinnyWeap.Rotation;

    SpinnyWeap.SetStaticMesh(None);

    // Start with first item on list selected
    lb_items.List.SetIndex(0);
    WeaponListInitialized();

    lb_items.List.bNotify = True;

    if ( Controller.ActivePage != PageOwner )
        Controller.CloseMenu(true);

    FocusFirst(none);
}



function ResetClicked()
{
    local int i;
    local bool bTemp;

   Super.ResetClicked();


    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = False;

    for (i = 0; i < Controls.Length; i++)
        Controls[i].LoadINI();

   // lb_items.List.SortList();
    Controller.bCurMenuInitialized = bTemp;

    WeaponListInitialized();
}



function ShowPanel(bool bShow)
{
	local rotator R;

	Super.ShowPanel(bShow);
	if (bShow)
	{
		if ( bInit )
		{
			IntializeWeaponList();
			bInit = False;
		}
		if ( SpinnyWeap != None )
			R = PlayerOwner().Rotation;
	}
}

function InternalOnChange(GUIComponent Sender)
{
	Super.InternalOnChange(Sender);
	if(Sender == lb_items)
		UpdateCurrentItem(); // Selected a different weapon
}

function WeaponListInitialized()
{
    UpdateCurrentItem();
}


function InternalDraw(Canvas canvas)
{
    local vector CamPos, X, Y, Z, WX, WY, WZ;
    local rotator CamRot;

    canvas.GetCameraLocation(CamPos, CamRot);
    GetAxes(CamRot, X, Y, Z);

    if(SpinnyWeap.DrawType == DT_Mesh)
    {
        GetAxes(SpinnyWeap.Rotation, WX, WY, WZ);
        SpinnyWeap.SetLocation(CamPos + (SpinnyWeapOffset.X * X) + (SpinnyWeapOffset.Y * Y) + (SpinnyWeapOffset.Z * Z) + (30 * WX));
    }
    else
    {
        SpinnyWeap.SetLocation(CamPos + (SpinnyWeapOffset.X * X) + (SpinnyWeapOffset.Y * Y) + (SpinnyWeapOffset.Z * Z));
    }

   // SpinnyWeap.SetRotation(Dummy);
    canvas.DrawActorClipped(SpinnyWeap, false, i_BG.ClientBounds[0], i_BG.ClientBounds[1], i_BG.ClientBounds[2] - i_BG.ClientBounds[0], (i_BG.ClientBounds[3] - i_BG.ClientBounds[1]), true, 65.0);    //2


}

function bool RaceCapturedMouseMove(float deltaX, float deltaY)
{
    local rotator r;
    r = SpinnyWeap.Rotation;
    r.Yaw -= (150 * DeltaX);
    r.Pitch -= (0.5* r.Yaw);
    SpinnyWeap.SetRotation(r);
    return true;
}



function UpdateCurrentItem()
{
    local class<KFMonster> CurrentEnemy;
    local class<KFWeapon> CurrentWeapon;
    local class<KFWeaponPickup> CurrentWeaponPickup;
    local Rotator AdjustedRot;


    if(SpinnyWeap == None)
        return;


    i_BG.Caption = lb_items.List.Get();
    lb_Desc.SetContent( lb_items.List.GetExtra() );


// Weapons
if(lb_items.List.index < 9)
{

    CurrentEnemy = class<KFMonster>(DynamicLoadObject(WikiObjectClassName[lb_items.List.Index], class'Class'));
    //log(CurrentEnemy);
    //log(CurrentEnemy.default.HealthMax);

    SpinnyWeap.LinkMesh(CurrentEnemy.default.Mesh);
    SpinnyWeap.SetDrawType(CurrentEnemy.default.DrawType);
    SpinnyWeap.SetDrawScale(CurrentEnemy.default.DrawScale * 1.5);
    SpinnyWeap.SetDrawScale3D(CurrentEnemy.default.DrawScale3D);

    SpinnyWeap.SetRotation(SpinnyWeaponRot);

    lb_StatBox.SetContent(" Damage Potential - "$CurrentEnemy.default.MeleeDamage);
    lb_Healthbox.SetContent(" Hitpoints - "$CurrentEnemy.default.HealthMax);


    if (CurrentEnemy == class 'KFChar.ZombieBloat')//
      SpinnyWeap.PlayAnim('ZombieBarf',1.0);
    else
    if (CurrentEnemy == class 'KFChar.ZombieSiren')
      SpinnyWeap.PlayAnim('Siren_Scream',1.0);
    else
     SpinnyWeap.PlayAnim(CurrentEnemy.default.MeleeAnims[rand(3)],1.0);


    // SpinnyWeap.LoopAnim(CurrentEnemy.default.IdleRestAnim);

  //  SpinnyWeap.SetStaticMesh

}
else
 if (lb_items.List.index > 9)
 {
    CurrentWeapon = class<KFWeapon>(DynamicLoadObject(WikiObjectClassName[lb_items.List.Index - 1], class'Class'));
    //CurrentWeaponFire = class<KFFire>(DynamicLoadObject(string(CurrentWeapon.GetFireMode(0), class'Class'));
    CurrentWeaponPickup = class<KFWeaponPickup>(DynamicLoadObject(string(CurrentWeapon.default.PickupClass), class'Class'));

    //lb_StatBox.SetContent(" Damage Potential - "$CurrentWeaponFire.default.DamageMin$"-"$(CurrentWeaponFire.default.DamageMin + CurrentWeaponFire.default.DamageMax));
    lb_Healthbox.SetContent("");

    SpinnyWeap.LinkMesh(none);
    SpinnyWeap.SetDrawType(CurrentWeaponPickup.default.DrawType);
    SpinnyWeap.SetDrawScale(CurrentWeaponPickup.default.DrawScale * 2.5);
    SpinnyWeap.SetDrawScale3D(CurrentWeaponPickup.default.DrawScale3D);
    SpinnyWeap.SetStaticMesh(CurrentWeaponPickup.default.StaticMesh);

    AdjustedRot = SpinnyWeap.Rotation;
    if (AdjustedRot.yaw == SpinnyWeaponRot.yaw)
     AdjustedRot.Yaw = -SpinnyWeaponRot.Yaw;
    SpinnyWeap.SetRotation(AdjustedRot);
 }
}



event Opened(GUIComponent Sender)
{

    Super.Opened(Sender);


    if ( SpinnyWeap != None )
    {
       SpinnyWeap.bHidden = false;
    }



}

event Closed(GUIComponent Sender, bool bCancelled)
{
    Super.Closed(Sender, bCancelled);

    if ( SpinnyWeap != None )
        SpinnyWeap.bHidden = true;
}

event Free()
{
    if ( SpinnyWeap != None )
    {
        SpinnyWeap.Destroy();
        SpinnyWeap = None;
    }

    Super.Free();
}

function bool CoolOnKeyEvent(out byte Key, out byte State, float delta)
{
    local Interactions.EInputKey iKey;
    local vector V;

    iKey = EInputKey(Key);
    V = SpinnyWeap.DrawScale3D;

    if ( state == 1 )
    {
        switch (iKey)
        {
        case IK_E:
            SpinnyWeapOffset.X = SpinnyWeapOffset.X - 1;
            LogSpinnyWeap();
            return true;
        case IK_C:
            SpinnyWeapOffset.X = SpinnyWeapOffset.X + 1;
            LogSpinnyWeap();
            return true;
        case IK_W:
            SpinnyWeapOffset.Z = SpinnyWeapOffset.Z + 1;
            LogSpinnyWeap();
            return true;
        case IK_A:
            SpinnyWeapOffset.Y = SpinnyWeapOffset.Y - 1;
            LogSpinnyWeap();
            return true;
        case IK_S:
            SpinnyWeapOffset.Z = SpinnyWeapOffset.Z - 1;
            LogSpinnyWeap();
            return true;
        case IK_D:
            SpinnyWeapOffset.Y = SpinnyWeapOffset.Y + 1;
            LogSpinnyWeap();
            return true;
        case IK_NumPad8:
            V.Z = V.Z + 1;
            SpinnyWeap.SetDrawScale3D( V );
            LogWeapScale();
            return True;
        case IK_NumPad4:
            V.Y = V.Y - 1;
            SpinnyWeap.SetDrawScale3D(V);
            LogWeapScale();
            return True;
        case IK_NumPad6:
            V.Y = V.Y + 1;
            SpinnyWeap.SetDrawScale3D(V);
            LogWeapScale();
            return True;
        case IK_NumPad2:
            V.Z = V.Z - 1;
            SpinnyWeap.SetDrawScale3D(V);
            LogWeapScale();
            return True;
        case IK_NumPad7:
            V.X = V.X - 1;
            SpinnyWeap.SetDrawScale3D(V);
            LogWeapScale();
            return True;
        case IK_NumPad9:
            V.X = V.X + 1;
            SpinnyWeap.SetDrawScale3D(V);
            LogWeapScale();
            return True;
        }
    }


    return false;

}

function LogSpinnyWeap()
{
    log("Weapon Position X:"$SpinnyWeapOffset.X@"Y:"$SpinnyWeapOffset.Y@"Z:"$SpinnyWeapOffset.Z);
}

function LogWeapScale()
{
    log("DrawScale3D X:"$SpinnyWeap.DrawScale3D.X@"Y:"$SpinnyWeap.DrawScale3D.Y@"Z:"$SpinnyWeap.DrawScale3D.Z);
}

defaultproperties
{
    OnRendered=InternalDraw

    // Item Display BG

    Begin Object class=KFGUISectionBackground Name=WeaponBK
        WinWidth=0.594473
	WinHeight=0.978337
	WinLeft=0.001253
	WinTop=0.007663

        Caption="Weapon"

        AltCaptionAlign = TXTA_Left
        AltCaptionOffset(3) = 120
        AltCaptionOffset(0) = -500
        FontScale = FNS_Large
        bAltCaption = true

        bCaptureMouse=true
        OnCapturedMouseMove=RaceCapturedMouseMove

        HeaderBase = none

    End Object
    i_BG=WeaponBK

    // The Selection List BG
    Begin Object class=KFGUISectionBackground Name=WeaponPriorityBK
        WinWidth=0.380157
	WinHeight=0.968776
	WinLeft=0.615537
	WinTop=0.013973
        Caption="Information"
        TopPadding=0
        BottomPadding=0
        RightPadding=0
        LeftPadding=0
        bFillClient=true
        FontScale = FNS_Medium

    End Object
    i_BG2=WeaponPriorityBK


    Begin Object Class=GUIScrollTextBox Name=WeaponDescription
        WinWidth=0.206476
	WinHeight=0.586749
	WinLeft=0.014425
	WinTop=0.137477
                   CharDelay=0.0015
        EOLDelay=0.25
        bNeverFocus=true
        bAcceptsInput=false
        bVisibleWhenEmpty=True
        RenderWeight=0.51
        TabOrder=0
        FontScale=FNS_Small
        StyleName="NoBackground"
    End Object
    lb_Desc=WeaponDescription

    Begin Object Class=GUIScrollTextBox Name=ItemStatsBox
        WinWidth=0.413595
	WinHeight=0.029286
	WinLeft=0.000830
	WinTop=0.957376
        CharDelay=0.0015
        EOLDelay=0.25
        bNeverFocus=true
        bAcceptsInput=false
        bVisibleWhenEmpty=True
        bNoTeleType = true
        RenderWeight=0.51
        TabOrder=0
        FontScale=FNS_Small
        //MyScrollText.Style.Font = "UT2MidGameFont"
        StyleName="MidGameButton"//"NoBackground"
    End Object
    lb_StatBox=ItemStatsBox

     Begin Object Class=GUIScrollTextBox Name=HealthBox
        WinWidth=0.413595
	WinHeight=0.029286
	WinLeft=0.000830
	WinTop=0.925
        CharDelay=0.0015
        EOLDelay=0.25
        bNeverFocus=true
        bAcceptsInput=false
        bNoTeleType = true
        bVisibleWhenEmpty=True
        RenderWeight=0.51
        TabOrder=0
        FontScale=FNS_Small
        //MyScrollText.Style.Font = "UT2MidGameFont"
        StyleName="MidGameButton"//"NoBackground"
    End Object
    lb_Healthbox=HealthBox

    Begin Object Class=GUIListBox Name=WeaponPrefWeapList
        WinWidth=0.338338
        WinHeight=0.221055
        WinLeft=0.068546
        WinTop=0.733868
        bVisibleWhenEmpty=true
        Hint="Select order for weapons"
        OnChange=InternalOnChange
        RenderWeight=0.51
        StyleName="NoBackground"
        TabOrder=1
    End Object
    lb_items=WeaponPrefWeapList


    WinTop=0.15
    WinLeft=0
    WinWidth=1
    WinHeight=0.74
    bAcceptsInput=false

    SpinnyWeapOffset=(X=200,Y=1.50,Z=-10.00)


    PanelCaption="Weapons"
    HiddenText="Hidden"
    LoadingText="...Loading D.R.F Database..."


    // Clot
    WikiObjectName(1) = "Clot"
    WikiObjectClassName(1) = "KFChar.ZombieClot"
    WikiObjectDescription(1) = "When Horzine started its second wave of human cloning and genetic engineering programs, the intention was to create a fully grown male that would respond to imperatives and could recognize Horzine staff as its masters. Orders were to be given to these subjects through a neural implant which released controlled doses of serotonin upon successful completion of a mandate. The subjects quickly showed signs of abberant behaviour, however, including aggressive self mutilation. The first batch of clones was spawned from the DNA of Horzine CEO Kevin Clamely's deceased son. The failure of these specimens put a brief hold on the project while new avenues were pursued."

     // Stalker
    WikiObjectName(2) = "Stalker"
    WikiObjectClassName(2) = "KFChar.ZombieStalker"
    WikiObjectDescription(2) = "A scary girl..!"

      // Bloat
    WikiObjectName(3) = "Bloat"
    WikiObjectClassName(3) = "KFChar.ZombieBloat"
    WikiObjectDescription(3) = "Fatty Fat"

      // Crawler
    WikiObjectName(4) = "Crawler"
    WikiObjectClassName(4) = "KFChar.ZombieCrawler"
    WikiObjectDescription(4) = "A fast moving, leaping critter.  Dangerous in mobs."

      // Gorefast
    WikiObjectName(5) = "Gorefast"
    WikiObjectClassName(5) = "KFChar.ZombieGorefast"
    WikiObjectDescription(5) = "Run!!"

       // Scrake
    WikiObjectName(6) = "Scrake"
    WikiObjectClassName(6) = "KFChar.ZombieScrake"
    WikiObjectDescription(6) = "BUZZZZZ"


       // Siren
    WikiObjectName(7) = "Siren"
    WikiObjectClassName(7) = "KFChar.ZombieSiren"
    WikiObjectDescription(7) = "Siiiing"

      // Fleshpound
    WikiObjectName(8) = "Fleshpound"
    WikiObjectClassName(8) = "KFChar.ZombieFleshpound"
    WikiObjectDescription(8) = "CRUSH!"


    ////////////////////////////////////////////
    //               WEAPONS                  //
    ////////////////////////////////////////////

     // Knife
    WikiObjectName(9) = "Combat Knife"
    WikiObjectClassName(9) = "KFMod.Knife"
    WikiObjectDescription(9) = "A combat knife. sharp."

     // Broken Pipe
    WikiObjectName(10) = "Machete"
    WikiObjectClassName(10) = "KFMod.Machete"
    WikiObjectDescription(10) = "a machete"

     // Fire Axe
    WikiObjectName(11) = "Fire Axe"
    WikiObjectClassName(11) = "KFMod.Axe"
    WikiObjectDescription(11) = "an axe!"

    // 9MM
    WikiObjectName(12) = "9mm tactical"
    WikiObjectClassName(12) = "KFMod.Single"
    WikiObjectDescription(12) = "a fallback weapon"

    // Dual 9mms
    WikiObjectName(13) = "Dual 9mms"
    WikiObjectClassName(13) = "KFMod.Dualies"
    WikiObjectDescription(13) = "two of the above."

    // Handcannon
    WikiObjectName(14) = "Handcannon"
    WikiObjectClassName(14) = "KFMod.Deagle"
    WikiObjectDescription(14) = "a bigass pistol"

     // Bullpup
    WikiObjectName(15) = "Bullpup"
    WikiObjectClassName(15) = "KFMod.Bullpup"
    WikiObjectDescription(15) = "an automatic rifle"

     // Winchester
    WikiObjectName(16) = "Lever Action Rifle"
    WikiObjectClassName(16) = "KFMod.Winchester"
    WikiObjectDescription(16) = "an old school rifle"

     // Shotgun
    WikiObjectName(17) = "Combat Shotgun"
    WikiObjectClassName(17) = "KFMod.Shotgun"
    WikiObjectDescription(17) = "a boomstick"

     // Hunting Shotgun
    WikiObjectName(18) = "Hunting Shotgun"
    WikiObjectClassName(18) = "KFMod.Boomstick"
    WikiObjectDescription(18) = "a bigger boomstick"

    // Crossbow
    WikiObjectName(19) = "Crossbow"
    WikiObjectClassName(19) = "KFMod.Crossbow"
    WikiObjectDescription(19) = "a ranged hunting weapon"

    // Flamethrower
    WikiObjectName(20) = "Flamethrower"
    WikiObjectClassName(20) = "KFMod.Flamethrower"
    WikiObjectDescription(20) = "flaaaame on"

    // LAW
    WikiObjectName(21) = "L.A.W"
    WikiObjectClassName(21) = "KFMod.LAW"
    WikiObjectDescription(21) = "Light anti tank weapons"

    // Grenade
    WikiObjectName(22) = "Fragmentation Grenade"
    WikiObjectClassName(22) = "KFMod.Frag"
    WikiObjectDescription(22) = "It blows up"

    // Syringe
    WikiObjectName(23) = "Medical Syringe"
    WikiObjectClassName(23) = "KFMod.Syringe"
    WikiObjectDescription(23) = "It heals!"

    // Welder
    WikiObjectName(24) = "Welding Tool"
    WikiObjectClassName(24) = "KFMod.Welder"
    WikiObjectDescription(24) = "it welds!"

     // Vest
    WikiObjectName(25) = "Kevlar Vest"
    WikiObjectClassName(25) = "KFMod.Vest"
    WikiObjectDescription(25) = "it protects!"

    // FirstAidKit
    WikiObjectName(26) = "First Aid Kit"
    WikiObjectClassName(26) = "KFMod.FirstAidKit"
    WikiObjectDescription(26) = "it heals lots!!"


















}
