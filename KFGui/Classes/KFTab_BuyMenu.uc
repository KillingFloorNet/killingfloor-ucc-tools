//=============================================================================
// The actual trader menu
//=============================================================================
// Killing Floor Source
// Copyright (C) 2009 Tripwire Interactive LLC
// Christian "schneidzekk" Schneider
//=============================================================================
class KFTab_BuyMenu extends UT2K4TabPanel;

var automated   GUIImage                        InvBG;
var automated   GUIButton                       SaleButton;
var automated   GUIImage                        MagBG;
var automated   GUIImage                        FillBG;
var automated   GUILabel                        MagLabel;
var automated   GUILabel                        FillLabel;
var automated   KFBuyMenuInvListBox             InvSelect;

var automated   GUIImage                        MoneyBG;
var automated   GUILabel                        SelectedItemLabel;
var automated   GUIImage                        ItemBG;

var automated   GUIBuyWeaponInfoPanel           ItemInfo;

var automated   GUIImage                        SaleBG;
var automated   GUIButton                       PurchaseButton;
var automated   KFBuyMenuSaleListBox            SaleSelect;
var             int                             SaleSelectPrevIndex;

var automated   GUIButton                       AutoFillButton;
var automated   GUIButton                       ExitButton;

var automated   GUIImage                        InfoBG;
var automated   GUIScrollTextBox                InfoScrollText;

var automated   GUILabel                        MoneyLabel;
var automated   GUIImage                        BankNote;

var automated   GUILabel                        SaleValueLabel;
var automated   GUIImage                        SaleValueLabelBG;

var localized   string                          InfoText[5];
var localized   string                          AutoFillString;
var localized   string                          MoneyCaption;
var localized   string                          SaleValueCaption;
var localized   string                          RepairBodyArmorCaption;
var localized   string                          BuyBodyArmorCaption;

var             array<KFAmmunition>             MyAmmos;     // List of ammo we need for filling up all ammotypes
var             GUIBuyable                      TheBuyable;
var             GUIBuyable                      LastBuyable;

var             float                           AutoFillCost;
var             int                             UpdateCount;
var             class<Pickup>                   OldPickupClass;
var             bool                            bDidBuyableUpdate;

var             SoundGroup                      TraderSoundTooExpensive;
var             bool                            bClosed;

var automated   GUIImage                        AmmoExitBG;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
    Super.InitComponent(MyController, MyOwner);

    InvSelect.List.OnChange = InvChange;
    InvSelect.List.OnDblClick = InvDblClick;
    InvSelect.List.OnBuyClipClick = DoBuyClip;
    InvSelect.List.OnFillAmmoClick = DoFillOneAmmo;
    InvSelect.List.OnBuyVestClick = DoBuyKevlar;

    SaleSelect.List.OnChange = SaleChange;
    SaleSelect.List.OnDblClick = SaleDblClick;

    InfoScrollText.SetContent(InfoText[0]);

    UpdateBuySellButtons();
    UpdateAutoFillAmmo();
    SetTimer(0.05, true);

    bClosed = false;
}

event Opened( GUIComponent Sender )
{
    Super.Opened( Sender );
    UpdateBuySellButtons();
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    Super.Closed(Sender, bCancelled);

    bClosed = true;

    // Clear the arrays
    MyAmmos.Remove(0, MyAmmos.Length);
    TheBuyable = none;
    LastBuyable = none;
}

function ShowPanel(bool bShow)
{
    local int i, PistolIndex;

    super.ShowPanel(bShow);

    bClosed = false;

    for ( i = 0; i < InvSelect.List.MyBuyables.Length; i++ )
    {
        if ( InvSelect.List.MyBuyables[i].ItemWeaponClass == class'Single' ||
             InvSelect.List.MyBuyables[i].ItemWeaponClass == class'Dualies' )
        {
            PistolIndex = i;
            break;
        }
    }

    TheBuyable = InvSelect.List.MyBuyables[i];
    InvSelect.List.Index = i;

    if ( KFPlayerController(PlayerOwner()) != none )
    {
        KFPlayerController(PlayerOwner()).bDoTraderUpdate = true;
    }

    LastBuyable = TheBuyable;

    InvSelect.SetPosition(InvBG.WinLeft + 7.0 / float(Controller.ResX),
                          InvBG.WinTop + 55.0 / float(Controller.ResY),
                          InvBG.WinWidth - 15.0 / float(Controller.ResX),
                          InvBG.WinHeight - 45.0 / float(Controller.ResY),
                          true);

    SaleSelect.SetPosition(SaleBG.WinLeft + 7.0 / float(Controller.ResX),
                           SaleBG.WinTop + 55.0 / float(Controller.ResY),
                           SaleBG.WinWidth - 15.0 / float(Controller.ResX),
                           SaleBG.WinHeight - 63.0 / float(Controller.ResY),
                           true);
}

function Timer()
{
    MoneyLabel.Caption = MoneyCaption $ int(PlayerOwner().PlayerReplicationInfo.Score);
    UpdateCheck();
}

function UpdateCheck()
{
    if ( KFPlayerController(PlayerOwner()).bDoTraderUpdate )
    {
        UpdateCount = 0;
        SetTimer(0.1, true);
    }

    if ( UpdateCount < 10 )
    {
        UpdateAll();
        UpdateCount++;
    }
    else
    {
        SetTimer(0.05, true);
    }
}

function UpdateAll()
{
    KFPlayerController(PlayerOwner()).bDoTraderUpdate = false;

    InvSelect.List.UpdateMyBuyables();
    SaleSelect.List.UpdateForSaleBuyables();

    GetUpdatedBuyable();

    UpdatePanel();
}

function UpdateBuySellButtons()
{
    if ( InvSelect.List.Index < 0 || (!TheBuyable.bSaleList && !TheBuyable.bSellable))
    {
        SaleButton.DisableMe();
    }
    else
    {
        SaleButton.EnableMe();
    }

    if ( (SaleSelect.List.Index < 0 && (TheBuyable == none || !TheBuyable.bSaleList)) || (TheBuyable.bSaleList && TheBuyable.ItemCost > PlayerOwner().PlayerReplicationInfo.Score))
    {
        PurchaseButton.DisableMe();
    }
    else
    {
        PurchaseButton.EnableMe();
    }
}


function InvChange(GUIComponent Sender)
{
    SaleSelect.List.Index = -1;

    TheBuyable = InvSelect.GetSelectedBuyable();

    GUIBuyMenu(OwnerPage()).WeightBar.NewBoxes = 0;
    OnAnychange();
}

function bool InvDblClick(GUIComponent Sender)
{
    if ( InvSelect.List.MouseOverXIndex == 0 )
    {
        SaleSelect.List.Index = -1;

        if ( InvSelect.GetSelectedBuyable() != none )
        {
            TheBuyable = InvSelect.GetSelectedBuyable();
        }

        GUIBuyMenu(OwnerPage()).WeightBar.NewBoxes = 0;

        if ( TheBuyable.bSellable )
        {
            DoSell();
            TheBuyable = none;
        }
        else
        {
            return false;
        }

        OnAnychange();

        return true;
    }

    return false;
}

function SaleChange(GUIComponent Sender)
{
    if( SaleSelect.List.Index == SaleSelectPrevIndex )
    {
        return;
    }

    SaleSelectPrevIndex = SaleSelect.List.Index;

    InvSelect.List.Index = -1;

    TheBuyable = SaleSelect.GetSelectedBuyable();

    if( TheBuyable != none )
    {
        GUIBuyMenu(OwnerPage()).WeightBar.NewBoxes = TheBuyable.ItemWeight;
    }
    else
    {
        GUIBuyMenu(OwnerPage()).WeightBar.NewBoxes = 0;
    }

    OnAnychange();
}

function bool IsLocked(GUIBuyable buyable)
{
    local bool hasAchievement, hasAppID, canBuy;

    if( KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements) != none )
    {
        if( TheBuyable.ItemWeaponClass.Default.UnlockedByAchievement != -1 )
        {
            hasAchievement = KFSteamStatsAndAchievements(PlayerOwner().SteamStatsAndAchievements).Achievements[TheBuyable.ItemWeaponClass.Default.UnlockedByAchievement].bCompleted == 1;
        }
        if( TheBuyable.ItemWeaponClass.Default.AppID > 0 )
        {
            hasAppID = PlayerOwner().SteamStatsAndAchievements.PlayerOwnsWeaponDLC(TheBuyable.ItemWeaponClass.Default.AppID);
        }
    }

    if( TheBuyable.ItemWeaponClass.Default.AppID > 0 &&
        TheBuyable.ItemWeaponClass.Default.UnlockedByAchievement != -1 )
    {
        canBuy = hasAchievement || hasAppId;
    }
    else if( TheBuyable.ItemWeaponClass.Default.AppID > 0 )
    {
        canBuy = hasAppId;
    }
    else if( TheBuyable.ItemWeaponClass.Default.UnlockedByAchievement != -1 )
    {
        canBuy = hasAchievement;
    }
    else
    {
        canBuy = true;
    }

    return !canBuy;
}

function bool SaleDblClick(GUIComponent Sender)
{

    InvSelect.List.Index = -1;

    TheBuyable = SaleSelect.GetSelectedBuyable();

    GUIBuyMenu(OwnerPage()).WeightBar.NewBoxes = TheBuyable.ItemWeight;





    if ( TheBuyable.ItemWeight + KFHumanPawn(PlayerOwner().Pawn).CurrentWeight <= KFHumanPawn(PlayerOwner().Pawn).MaxCarryWeight &&
         TheBuyable.ItemCost <= PlayerOwner().PlayerReplicationInfo.Score && !IsLocked(TheBuyable))
    {
        DoBuy();
        TheBuyable = none;
    }

    OnAnychange();

    return false;
}

function OnAnychange()
{
    LastBuyable = TheBuyable;
    ItemInfo.Display(TheBuyable);
    SetInfoText();
    UpdatePanel();
    UpdateBuySellButtons();
}

function GetUpdatedBuyable(optional bool bSetInvIndex)
{
    local int i;

    if ( LastBuyable == none )
    {
        return;
    }

    InvSelect.List.UpdateMyBuyables();

    for ( i = 0; i < InvSelect.List.MyBuyables.Length; i++ )
    {
        if ( InvSelect.List.MyBuyables[i] != none && LastBuyable.ItemName == InvSelect.List.MyBuyables[i].ItemName )
        {
            TheBuyable = InvSelect.List.MyBuyables[i];
            break;
        }
    }

    if ( bSetInvIndex )
    {
        InvSelect.List.Index = i;
    }
}

function UpdateAutoFillAmmo()
{
    local Inventory CurInv;

    if ( PlayerOwner().Pawn.Inventory == none )
    {
        return;
    }

    InvSelect.List.UpdateMyBuyables();

    // Clear the MyAmmo array
    MyAmmos.Remove(0, MyAmmos.Length);

    if ( !bClosed )
    {
        // Let's build the list of the stuff we already have in our inevntory
        for ( CurInv = PlayerOwner().Pawn.Inventory; CurInv != none; CurInv = CurInv.Inventory )
        {
            if ( CurInv.IsA('KFAmmunition') )
            {
                // Store the weapon for later use (FillAllAmmoButton)
                MyAmmos.Insert(0, 1);
                MyAmmos[0] = KFAmmunition(CurInv);
            }
        }
    }

    AutoFillButton.Caption = AutoFillString @ "(£" @ int(InvSelect.List.AutoFillCost)$")";

    if ( int(InvSelect.List.AutoFillCost) < 1 )
    {
        AutoFillButton.DisableMe();
    }
    else
    {
        AutoFillButton.EnableMe();
    }
}

// Fills the ammo of all weapons in the inv to the max
function DoFillAllAmmo()
{
    local int j, CheapestAmmo;
    local bool bBuyMoreAmmo;

    CheapestAmmo = FindCheapestAmmo();

    if ( PlayerOwner().PlayerReplicationInfo.Score < CheapestAmmo )
    {
        PlayerOwner().Pawn.DemoPlaySound(TraderSoundTooExpensive, SLOT_Interface, 2.0);
        return;
    }

    bBuyMoreAmmo = true;
    while( bBuyMoreAmmo )
    {
        bBuyMoreAmmo = false;

        for ( j = 0; j < MyAmmos.Length; j++ )
        {
            // buy grenades AFTER all possible ammo is purchased
            if ( MyAmmos[j].IsA('FragAmmo') || MyAmmos[j].IsA('PipeBombAmmo') )
            {
                continue;
            }

            if ( PlayerOwner().PlayerReplicationInfo.Score >= FindAmmoCost(MyAmmos[j].Class) )
            {
                bBuyMoreAmmo = bBuyMoreAmmo || KFPawn(PlayerOwner().Pawn).ServerBuyAmmo(MyAmmos[j].Class, false);
            }
        }
    }

    // okay, now buy grenades and stuff
    for ( j = 0; j < MyAmmos.Length; j++ )
    {
        if ( !MyAmmos[j].IsA('FragAmmo') )
        {
            continue;
        }
        else if ( PlayerOwner().PlayerReplicationInfo.Score >= FindAmmoCost(MyAmmos[j].Class) )
        {
            KFPawn(PlayerOwner().Pawn).ServerBuyAmmo(MyAmmos[j].Class, false);
        }
        else
        {
            break;
        }
    }

    for ( j = 0; j < MyAmmos.Length; j++ )
    {
        if ( !MyAmmos[j].IsA('PipeBombAmmo') )
        {
            continue;
        }
        else if ( PlayerOwner().PlayerReplicationInfo.Score >= FindAmmoCost(MyAmmos[j].Class) )
        {
            KFPawn(PlayerOwner().Pawn).ServerBuyAmmo(MyAmmos[j].Class, false);
        }
        else
        {
            break;
        }
    }

    TheBuyable = none;

    SaleSelect.List.Index = -1;
    InvSelect.List.Index = -1;

    UpdatePanel();
}

function int FindCheapestAmmo()
{
    local Inventory CurInv;
    local int CurrentCheapest, CurrentCost;

    CurrentCheapest = 99999;

    for ( CurInv = PlayerOwner().Pawn.Inventory; CurInv != none; CurInv = CurInv.Inventory )
    {
        if ( CurInv.IsA('KFAmmunition') )
        {
            CurrentCost = FindAmmoCost(KFAmmunition(CurInv).Class);
        }
        else
        {
            continue;
        }

        if ( CurrentCost < CurrentCheapest )
        {
            CurrentCheapest = CurrentCost;
        }
    }

    return CurrentCheapest;
}

function int FindAmmoCost(Class<Ammunition> AClass)
{
    local Inventory CurInv;
    local Ammunition MyAmmo;
    local KFWeapon MyWeapon;

    for ( CurInv = PlayerOwner().Pawn.Inventory; CurInv != none; CurInv = CurInv.Inventory )
    {
        if ( CurInv.Class == AClass )
        {
            MyAmmo = Ammunition(CurInv);
        }
        else if ( MyWeapon == None && KFWeapon(CurInv) != None && (Weapon(CurInv).AmmoClass[0]==AClass || Weapon(CurInv).AmmoClass[1]==AClass) )
        {
            MyWeapon = KFWeapon(CurInv);
        }
    }

    return Class<KFWeaponPickup>(MyWeapon.PickupClass).Default.AmmoCost;
}


function SetInfoText()
{
    local string TempString;

    if ( TheBuyable == none && !bDidBuyableUpdate )
    {
        InfoScrollText.SetContent(InfoText[0]);
        bDidBuyableUpdate = true;

        return;
    }

    if ( TheBuyable != none && OldPickupClass != TheBuyable.ItemPickupClass )
    {
        // Unowned Weapon DLC
        if ( TheBuyable.ItemWeaponClass.Default.AppID > 0 && !PlayerOwner().SteamStatsAndAchievements.PlayerOwnsWeaponDLC(TheBuyable.ItemWeaponClass.Default.AppID) )
        {
            InfoScrollText.SetContent(Repl(InfoText[4], "%1", PlayerOwner().SteamStatsAndAchievements.GetWeaponDLCPackName(TheBuyable.ItemWeaponClass.Default.AppID)));
        }
        // Too expensive
        else if ( TheBuyable.ItemCost > PlayerOwner().PlayerReplicationInfo.Score && TheBuyable.bSaleList )
        {
            InfoScrollText.SetContent(InfoText[2]);
        }
        // Too heavy
        else if ( TheBuyable.ItemWeight + KFHumanPawn(PlayerOwner().Pawn).CurrentWeight > KFHumanPawn(PlayerOwner().Pawn).MaxCarryWeight && TheBuyable.bSaleList )
        {
            TempString = Repl(Infotext[1], "%1", int(TheBuyable.ItemWeight));
            TempString = Repl(TempString, "%2", int(KFHumanPawn(PlayerOwner().Pawn).MaxCarryWeight - KFHumanPawn(PlayerOwner().Pawn).CurrentWeight));
            InfoScrollText.SetContent(TempString);
        }
        // default
        else
        {
            InfoScrollText.SetContent(TheBuyable.ItemDescription);
        }

        bDidBuyableUpdate = false;
        OldPickupClass = TheBuyable.ItemPickupClass;
    }
}

function OptionsChange(GUIComponent Sender)
{
/*  local int SelectedAction;

    SelectedAction = OptionsSelect.GetIndex();

    // Is this Auto-Fill Ammo?
    if ( SelectedAction == 4 )
    {
        DoFillAllAmmo();
    }
    // Is this Exit Trader?
    else if ( SelectedAction == 5 )
    {
        GUIBuyMenu(OwnerPage()).CloseSale(false);
    }
    //Is this a purchase?
    else if ( TheBuyable.bSaleList )
    {
        if ( TheBuyable.ItemWeight + KFHumanPawn(PlayerOwner().Pawn).CurrentWeight <= KFHumanPawn(PlayerOwner().Pawn).MaxCarryWeight &&
             TheBuyable.ItemCost <= PlayerOwner().PlayerReplicationInfo.Score &&
             (TheBuyable.ItemWeaponClass.Default.AppID <= 0 || PlayerOwner().SteamStatsAndAchievements.PlayerOwnsWeaponDLC(TheBuyable.ItemWeaponClass.Default.AppID)))
        {
            // Is it a vest?
            if ( TheBuyable.bIsVest )
            {
                DoBuyKevlar();
            }
            // Fist aid kit?
            else if ( TheBuyable.bIsFirstAidKit )
            {
                DoBuyFirstAid();
            }
            // should be a "regular" weapon
            else
            {
                DoBuy();
            }

            TheBuyable = none;
        }
    }
    // We want to do something with an item already in our inventory
    else
    {
        if ( TheBuyable.bSellable )
        {
            if ( !TheBuyable.bMelee && int(TheBuyable.ItemAmmoCurrent) < int(TheBuyable.ItemAmmoMax) )
            {
                if ( SelectedAction == 0 )
                {
                    DoSell();
                    TheBuyable = none;
                }
                else if ( SelectedAction == 1 )
                {
                    DoBuyClip();
                }
                else
                {
                    DoFillOneAmmo();
                }
            }
            else
            {
                DoSell();
                TheBuyable = none;
            }
        }
        else if ( !TheBuyable.bMelee )
        {
            if ( SelectedAction == 1 )
            {
                DoBuyClip();
            }
            else
            {
                DoFillOneAmmo();
            }
        }
    }

    OptionsSelect.UpdateList(TheBuyable);*/
}

function bool IsInInventory(class<Pickup> Item)
{
    local Inventory CurInv;

    for ( CurInv = PlayerOwner().Pawn.Inventory; CurInv != none; CurInv = CurInv.Inventory )
    {
        if ( CurInv.default.PickupClass == Item )
        {
            return true;
        }
    }

    return false;
}

function DoFillOneAmmo(GUIBuyable Buyable)
{
    if ( KFPawn(PlayerOwner().Pawn) != none )
    {
        KFPawn(PlayerOwner().Pawn).ServerBuyAmmo(Buyable.ItemAmmoClass, false);
        GetUpdatedBuyable(true);
    }
}

function DoBuyClip(GUIBuyable Buyable)
{
    if ( KFPawn(PlayerOwner().Pawn) != none )
    {
        KFPawn(PlayerOwner().Pawn).ServerBuyAmmo(Buyable.ItemAmmoClass, true);
        GetUpdatedBuyable(true);
    }
}

function DoBuyGrenade(bool bSingle)
{
    if ( KFPawn(PlayerOwner().Pawn) != none )
    {
            KFPawn(PlayerOwner().Pawn).ServerBuyAmmo(class'FragAmmo', bSingle);
            GetUpdatedBuyable(true);
    }
}

function DoSell()
{
    local class<KFWeapon> ItemWeaponClass;

    if ( KFPawn(PlayerOwner().Pawn) != none )
    {
        ItemWeaponClass = TheBuyable.ItemWeaponClass;

        InvSelect.List.Index = -1;
        TheBuyable = none;
        LastBuyable = none;

        KFPawn(PlayerOwner().Pawn).ServerSellWeapon(ItemWeaponClass);

        UpdateBuySellButtons();
    }
}

function DoBuy()
{
    if ( KFPawn(PlayerOwner().Pawn) != none )
    {
        if ( class<Potato>(TheBuyable.ItemPickupClass) != none )
        {
            if ( PlayerOwner().SteamStatsAndAchievements.DoPotato() )
            {
                KFPawn(PlayerOwner().Pawn).ServerBuyPotato();
            }
        }

       else
       {
            KFPawn(PlayerOwner().Pawn).ServerBuyWeapon(TheBuyable.ItemWeaponClass, TheBuyable.ItemWeight);
       }

        MakeSomeBuyNoise();

        SaleSelect.List.SetIndex( -1 );
        SaleSelect.List.BuyableToDisplay = none;
        TheBuyable = none;
        LastBuyable = none;

        UpdateBuySellButtons();
    }
}

function DoBuyKevlar()
{
    if ( KFPawn(PlayerOwner().Pawn) != none )
    {
        KFPawn(PlayerOwner().Pawn).ServerBuyKevlar();
        MakeSomeBuyNoise(class'Vest');
    }
}

function DoBuyFirstAid()
{
    if ( KFPawn(PlayerOwner().Pawn) != none )
    {
        KFPawn(PlayerOwner().Pawn).ServerBuyFirstAid();
        MakeSomeBuyNoise();

        SaleSelect.List.Index = -1;
        TheBuyable = none;
        UpdateAll();
    }
}

function MakeSomeBuyNoise(optional class<Pickup> PickupClass)
{
    if ( PlayerOwner().Pawn != none )
    {
        if ( PickupClass == none )
        {
            PlayerOwner().Pawn.PlaySound(TheBuyable.ItemPickupClass.default.PickupSound,SLOT_Interface, 255.0, , 120);
        }
        else
        {
            PlayerOwner().Pawn.PlaySound(PickupClass.default.PickupSound,SLOT_Interface, 255.0,, 120);
        }
    }
}

function UpdatePanel()
{
    local float Price;

    Price = 0.0;

    if ( TheBuyable != none && !TheBuyable.bSaleList && TheBuyable.bSellable )
    {
        SaleValueLabel.Caption = SaleValueCaption $ TheBuyable.ItemSellValue;

        SaleValueLabel.bVisible = true;
        SaleValueLabelBG.bVisible = true;
    }
    else
    {
        SaleValueLabel.bVisible = false;
        SaleValueLabelBG.bVisible = false;
    }

    if ( TheBuyable == none || !TheBuyable.bSaleList )
    {
        GUIBuyMenu(OwnerPage()).WeightBar.NewBoxes = 0;
    }

    ItemInfo.Display(TheBuyable);
    UpdateAutoFillAmmo();
    SetInfoText();

    // Money update
    if ( PlayerOwner() != none )
    {
        MoneyLabel.Caption = MoneyCaption $ int(PlayerOwner().PlayerReplicationInfo.Score);
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    if ( Sender == PurchaseButton )
    {
        if ( TheBuyable != none )
        {
            DoBuy();
            TheBuyable = none;
        }
    }
    else if ( Sender == SaleButton )
    {
        if ( TheBuyable.bSellable )
        {
            DoSell();
            TheBuyable = none;
        }
    }
    else if ( Sender == AutoFillButton )
    {
        DoFillAllAmmo();
    }
    else if ( Sender == ExitButton )
    {
        GUIBuyMenu(OwnerPage()).CloseSale(false);
    }

    UpdateAll();

    return true;
}

defaultproperties
{
    PropagateVisibility=False

    WinWidth=.5
    WinHeight=.75
    WinTop=0.125
    WinLeft=0.25

    TraderSoundTooExpensive=Sound'KF_Trader.TooExpensive'

    InfoText(0)="Welcome to my shop! You can buy ammo or sell from your inventory on the left. Or you can buy new items from the right."
    InfoText(1)="Item is too heavy! It requires %1 free weight blocks, you only have %2 free. Sell some of your inventory!"
    InfoText(2)="Item is too expensive! Ask some blokes to spare some money or sell some of your inventory!"
    InfoText(3)="Select an item or option"

    MoneyCaption="£"
    AutoFillString="Auto Fill Ammo"
    SaleValueCaption="Sell Value: £"
    RepairBodyArmorCaption="Repair £"
    BuyBodyArmorCaption="Buy £"

    Begin Object class=GUIImage Name=Inv
        WinLeft=-0.00450
        WinTop=-0.003371
        WinWidth=0.336905
        WinHeight=0.752000
        Hint="The items in your inventory"
        Image=Texture'KF_InterfaceArt_tex.Menu.Thick_border_Transparent'
        ImageStyle=ISTY_Stretched
    End Object
    InvBG=Inv

    Begin Object class=KFBuyMenuInvListBox Name=InventoryBox
        WinTop=0.070841
        WinLeft=0.000108
        WinWidth=0.328204
        WinHeight=0.521856
    End Object
    InvSelect=InventoryBox

    Begin Object class=GUIButton Name=SaleB
        WinTop=0.004750
        WinLeft=0.000394
        WinWidth=0.162886
        WinHeight=35.0
        Hint="Sell selected weapon"
        Caption="Sell Weapon"
        RenderWeight=0.45
        OnClick=InternalOnClick
    End Object
    SaleButton=SaleB

    Begin Object class=GUIImage Name=MagB
        WinTop=0.011072
        WinLeft=0.205986
        WinWidth=0.054624
        WinHeight=25.00
        Image=Texture'KF_InterfaceArt_tex.Menu.Innerborder_transparent'
        ImageStyle=ISTY_Stretched
        Renderweight=0.50
    End Object
    MagBG=MagB

    Begin Object class=GUILabel Name=MagL
        WinTop=0.011072
        WinLeft=0.205986
        WinWidth=0.054624
        WinHeight=25.00
        Caption="1 Mag"
        TextAlign=TXTA_Center
        FontScale=FNS_Small
        TextFont="UT2SmallFont"
        Renderweight=0.51
        TextColor=(R=175,G=176,B=158,A=255)
    End Object
    MagLabel=MagL

    Begin Object class=GUIImage Name=FillB
        WinTop=0.011572
        WinLeft=0.266769
        WinWidth=0.054624
        WinHeight=25.00
        Image=Texture'KF_InterfaceArt_tex.Menu.Innerborder_transparent'
        ImageStyle=ISTY_Stretched
        Renderweight=0.50
    End Object
    FillBG=FillB

    Begin Object class=GUILabel Name=FillL
        WinTop=0.011572
        WinLeft=0.266769
        WinWidth=0.054624
        WinHeight=25.00
        Caption="Fill"
        TextAlign=TXTA_Center
        FontScale=FNS_Small
        TextFont="UT2SmallFont"
        Renderweight=0.51
        TextColor=(R=175,G=176,B=158,A=255)
    End Object
    FillLabel=FillL

    Begin Object class=GUIImage Name=Item
        WinTop=0.134311
        WinLeft=0.332571
        WinWidth=0.333947
        WinHeight=0.614680
        Hint="Your selected item"
        Image=Texture'KF_InterfaceArt_tex.Menu.Med_border_Transparent'
        ImageStyle=ISTY_Stretched
    End Object
    ItemBG=Item

    Begin Object class=GUIImage Name=MoneyBack
        WinTop=-0.003371
        WinLeft=0.332571
        WinWidth=0.333947
        WinHeight=0.137855
        Hint="Your Money"
        Image=Texture'KF_InterfaceArt_tex.Menu.Thin_border_Transparent'
        ImageStyle=ISTY_Stretched
    End Object
    MoneyBG=MoneyBack

    Begin Object class=GUILabel Name=SelectedItemL
        WinTop=0.141451
        WinLeft=0.332571
        WinWidth=0.333947
        WinHeight=20.00
        Caption="Selected Item Info"
        TextAlign=TXTA_Center
        FontScale=FNS_Small
        TextFont="UT2SmallFont"
        Renderweight=0.51
        TextColor=(R=175,G=176,B=158,A=255)
        End Object
    SelectedItemLabel=SelectedItemL

    Begin Object class=GUIBuyWeaponInfoPanel Name=ItemInf
        WinTop=0.193730
        WinLeft=0.332571
        WinWidth=0.333947
        WinHeight=0.489407
        Hint=""
    End Object
    ItemInfo=ItemInf

    Begin Object class=GUIImage Name=Sale
        WinTop=-0.003371
        WinLeft=0.667306
        WinWidth=0.335919
        WinHeight=0.752000
        Hint="These items are available in the shop"
        Image=Texture'KF_InterfaceArt_tex.Menu.Thick_border_Transparent'
        ImageStyle=ISTY_Stretched
    End Object
    SaleBG=Sale

    Begin Object class=KFBuyMenuSaleListBox Name=SaleBox
        WinTop=0.064312
        WinLeft=0.672632
        WinWidth=0.325857
        WinHeight=0.674039
    End Object
    SaleSelect=SaleBox

    Begin Object class=GUIButton Name=PurchaseB
        WinTop=0.004750
        WinLeft=0.729647
        WinWidth=0.220714
        WinHeight=35.0
        Hint="Buy selected weapon"
        Caption="Purchase Weapon"
        RenderWeight=0.45
        OnClick=InternalOnClick
    End Object
    PurchaseButton=PurchaseB

    Begin Object class=GUIImage Name=Info
        WinTop=0.746753
        WinLeft=-0.00450
        WinWidth=0.670457
        WinHeight=0.179353
        Hint="Trader Informations"
        Image=Texture'KF_InterfaceArt_tex.Menu.Thin_border'
        ImageStyle=ISTY_Stretched
    End Object
    InfoBG=Info

    Begin Object Class=GUIScrollTextBox Name=IScrollText
        WinTop=0.758244
        WinLeft=0.004946
        WinWidth=0.651687
        WinHeight=0.160580
        bScaleToParent=true
        bBoundToParent=true
        CharDelay=0.005
        EOLDelay=0.0075
        RepeatDelay=0
        bVisibleWhenEmpty=False
        FontScale=FNS_Medium
        StyleName="TraderNoBackground"
    End Object
    InfoScrollText=IScrollText

    Begin Object class=GUIImage Name=Cash
        WinTop=0.026828
        WinLeft=0.393095
        WinWidth=0.107313
        WinHeight=0.077172
        Image=Texture'PatchTex.Statics.BanknoteSkin'
        ImageStyle=ISTY_Scaled
    End Object
    BankNote=Cash

    Begin Object Class=GUILabel Name=Money
        WinTop=0.035524
        WinLeft=0.516045
        WinWidth=0.144797
        WinHeight=0.058675
        Caption="£123456"
        TextAlign=TXTA_Left
        FontScale=FNS_Large
        TextFont="UT2HeaderFont"
        TextColor=(R=175,G=176,B=158,A=255)
    End Object
    MoneyLabel=Money

    Begin Object Class=GUILabel Name=SaleValue
        WinTop=0.675470
        WinLeft=0.337502
        WinWidth=0.325313
        WinHeight=0.059661
        Caption=""
        TextAlign=TXTA_Center
        FontScale=FNS_Large
        TextFont="UT2LargeFont"
        TextColor=(R=175,G=176,B=158,A=255)
    End Object
    SaleValueLabel=SaleValue

    Begin Object class=GUIImage Name=SaleValueBG
        WinTop=0.678411
        WinLeft=0.370054
        WinWidth=0.256263
        WinHeight=0.053742
        Image=Texture'KF_InterfaceArt_tex.Menu.Innerborder_transparent'
        ImageStyle=ISTY_Stretched
    End Object
    SaleValueLabelBG=SaleValueBG

    Begin Object class=GUIImage Name=AmmoExit
        WinTop=0.746753
        WinLeft=0.666905
        WinWidth=0.335919
        WinHeight=0.252349
        Hint=""
        Image=Texture'KF_InterfaceArt_tex.Menu.Thin_border'
        ImageStyle=ISTY_Stretched
    End Object
    AmmoExitBG=AmmoExit

    Begin Object class=GUIButton Name=AutoFill
        WinTop=0.805073
        WinLeft=0.725646
        WinWidth=0.220714
        WinHeight=0.050852
        Hint="Fills Up All Weapons"
        Caption="Auto Fill Ammo"
        RenderWeight=0.45
        OnClick=InternalOnClick
    End Object
    AutoFillButton=AutoFill

    Begin Object class=GUIButton Name=Exit
        WinTop=0.887681
        WinLeft=0.725646
        WinWidth=0.220714
        WinHeight=0.050852
        Hint="Close The Trader Menu"
        Caption="Exit Trader Menu"
        RenderWeight=0.45
        OnClick=InternalOnClick
    End Object
    ExitButton=Exit
}

