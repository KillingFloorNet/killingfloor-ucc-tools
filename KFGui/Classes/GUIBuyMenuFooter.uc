class GUIBuyMenuFooter extends ButtonFooter;

var	localized string	CashString;
var	localized string	WeightString;

var automated GUIButton b_Cancel;
var automated GUIButton spacer1,spacer2;
var automated GUILabel l_score, l_weight;

function PositionButtons (Canvas C)
{
	/*
	local int i;
	local GUIButton b;
	local float x;

    for ( i = 0; i < Controls.Length; i++ )
	{
		b = GUIButton(Controls[i]);
		if ( b != None)
		{
			if ( x == 0 )
				x = ButtonLeft;
			else x += GetSpacer();
			b.WinLeft = b.RelativeLeft( x, True );
			x += b.ActualWidth();
		}
	}
	*/
}

function SetPlayerStats(int score, float weight)
{
	if( l_score!=None )
		l_score.Caption = CashString$":" @ score;
	if( l_weight!=None )
		l_weight.Caption = WeightString$":" @ int(weight) $ "/" $ int(KFHumanPawn(PlayerOwner().Pawn).MaxCarryWeight);
}

function SetBuyMode(string buyCaption,bool buyEnabled,bool fillVisible,bool fillEnabled)
{
/*	local bool AutoAmmoEnabled;
	AutoAmmoEnabled = GUIBuyMenu(PageOwner).CanAutoAmmo();
	b_buy.Caption = buyCaption;
	if(buyEnabled && b_buy.MenuState == MSAT_Disabled)
	{
		b_buy.MenuState = MSAT_Blurry;              //    GUIBuyMenu(PageOwner).ItemsBox.List.Elements[GUIBuyMenu(PageOwner).ItemsBox.List.Index]                                   //
             //   GUIBuyMenu(PageOwner).ItemsBox.List.MenuState = MSAT_Blurry;
        }
        else if(!buyEnabled)
	{
        	b_buy.MenuState = MSAT_Disabled;
             //   GUIBuyMenu(PageOwner).ItemsBox.List.MenuState = MSAT_Disabled;
        }

	if(fillEnabled && b_fill.MenuState == MSAT_Disabled)
		b_fill.MenuState = MSAT_Blurry;
	else if(!fillEnabled)
		b_fill.MenuState = MSAT_Disabled;
	b_fill.bVisible = fillVisible;

	if(AutoAmmoEnabled && b_AutoAll.MenuState == MSAT_Disabled)
		b_AutoAll.MenuState = MSAT_Blurry;
	else if(!AutoAmmoEnabled)
	   b_AutoAll.MenuState = MSAT_Disabled;
*/
}

function bool ButtonsSized(Canvas C)
{
/*	local int i;
	local GUIButton b;
	local bool bResult;
	local string str;
	local float T, AH, AT;

	if ( !bPositioned )
		return false;

	bResult = true;
	str = GetLongestCaption(C);

	AH = ActualHeight();
	AT = ActualTop();

	for (i = 0; i < Controls.Length; i++ )
	{
		b = GUIButton(Controls[i]);
		if ( b != None )
		{
			if ( bAutoSize && bFixedWidth )
			{
			    if(b.Caption == "")
			        b.SizingCaption = Left(str,Len(str)/2);
				else
					b.SizingCaption = str;
			}
			else b.SizingCaption = "";

			bResult = bResult && b.bPositioned;
			if ( bFullHeight )
				b.WinHeight = b.RelativeHeight(AH,true);
			else b.WinHeight = b.RelativeHeight(ActualHeight(ButtonHeight),true);

			switch ( Justification )
			{
			case TXTA_Left:
				T = ClientBounds[1];
				break;

			case TXTA_Center:
				T = (AT + AH / 2) - (b.ActualHeight() / 2);
				break;

			case TXTA_Right:
				T = ClientBounds[3] - b.ActualHeight();
				break;
			}

			b.WinTop = b.RelativeTop(T, True );
		}
	}

	return bResult;
*/
	return true;
}

function float GetButtonLeft()
{
/*	local int i;
	local GUIButton b;
	local float TotalWidth, AW, AL;
	local float FooterMargin;

	AL = ActualLeft();
	AW = ActualWidth();
	FooterMargin = GetMargin();

	for (i = 0; i < Controls.Length; i++ )
	{
		b = GUIButton(Controls[i]);
		if ( b != None )
		{
			if ( TotalWidth > 0 )
				TotalWidth += GetSpacer();

			TotalWidth += b.ActualWidth();
		}
	}

	if ( Alignment == TXTA_Center )
		return (AL + AW) / 2 - FooterMargin / 2 - TotalWidth / 2;

	if ( Alignment == TXTA_Right )
		return (AL + AW - FooterMargin / 2) - TotalWidth;

	return AL + (FooterMargin / 2);
*/
    return 0.0;
}

// Finds the longest caption of all the buttons
function string GetLongestCaption(Canvas C)
{
/*
	local int i;
	local float XL, YL, LongestW;
	local string str;
	local GUIButton b;

	if ( C == None )
		return "";

	for ( i = 0; i < Controls.Length; i++ )
	{
		b = GUIButton(Controls[i]);
		if ( b != None )
		{
			if ( b.Style != None )
				b.Style.TextSize(C, b.MenuState, b.Caption, XL, YL, b.FontScale);
			else C.StrLen( b.Caption, XL, YL );

			if ( LongestW == 0 || XL > LongestW )
			{
				str = b.Caption;
				LongestW = XL;
			}
		}
	}

	return str;
*/
	return "";
}

function bool OnFooterClick(GUIComponent Sender)
{
    if(Sender == b_Cancel)
	{
//		GUIBuyMenu(PageOwner).CloseSale(false);
	}
	return false;
}

defaultproperties
{
	CashString="Cash"
	WeightString="Weight"

/*	Begin Object Class=GUIButton Name=Purchase
         Caption="Buy"
         StyleName="FooterButton"
         Hint="Buy currently selected weapon"
        		WinWidth=0.112219
		WinHeight=0.057242
		WinLeft=0.236407
		WinTop=-0.001953


         RenderWeight=2.000000
         TabOrder=3
         bBoundToParent=True
         OnClick=GUIBuyMenuFooter.OnFooterClick
         OnKeyEvent=Purchase.InternalOnKeyEvent
     End Object
     b_Buy=GUIButton'KFGui.GUIBuyMenuFooter.Purchase'
*/
    Begin Object Class=GUIButton Name=Cancel
        Caption="Done"
        StyleName="FooterButton"
        Hint="Exit Trader Menu"
        WinWidth=0.056777
		WinHeight=0.053711
		WinLeft=0.942383
		WinTop=0.940755
        RenderWeight=2.000000
        TabOrder=5
        bVisible=true
        OnClick=GUIBuyMenuFooter.OnFooterClick
        OnKeyEvent=Cancel.InternalOnKeyEvent
    End Object
    b_Cancel=GUIButton'KFGui.GUIBuyMenuFooter.Cancel'
/*
     Begin Object Class=GUIButton Name=Complete
         Caption="Complete"
         StyleName="FooterButton"
         Hint="Purchase weapons and save changes."
         		WinWidth=0.092022
		WinHeight=0.051756
		WinLeft=0.787105
		WinTop=0.015971

         RenderWeight=2.000000
         TabOrder=6
         bBoundToParent=True
         OnClick=GUIBuyMenuFooter.OnFooterClick
         OnKeyEvent=Complete.InternalOnKeyEvent
     End Object
     b_Complete=GUIButton'KFGui.GUIBuyMenuFooter.Complete'

     Begin Object Class=GUIButton Name=AutoAmmo
         Caption="AutoAmmo"
         StyleName="FooterButton"
         Hint="Fill ammo for all weapons."
        		WinWidth=0.112219
		WinHeight=0.058023
		WinLeft=0.006149
		WinTop=-0.014645

         RenderWeight=2.000000
         TabOrder=0
         bBoundToParent=True
         OnClick=GUIBuyMenuFooter.OnFooterClick
         OnKeyEvent=AutoAmmo.InternalOnKeyEvent
     End Object
     b_AutoAll=GUIButton'KFGui.GUIBuyMenuFooter.AutoAmmo'

     Begin Object Class=GUIButton Name=Fill
         Caption="Fill Up"
         StyleName="FooterButton"
         Hint="Fill up on currently selected ammo."
         WinTop=0.966146
         WinLeft=0.250000
         WinWidth=0.120000
         RenderWeight=2.000000
         TabOrder=2
         bBoundToParent=True
         bVisible=False
         OnClick=GUIBuyMenuFooter.OnFooterClick
         OnKeyEvent=Fill.InternalOnKeyEvent
     End Object
     b_Fill=GUIButton'KFGui.GUIBuyMenuFooter.Fill'

     Begin Object Class=GUIButton Name=sp
         StyleName="Footerbutton"
         WinTop=0.966146
         WinLeft=0.220000
         WinWidth=0.120000
         RenderWeight=2.000000
         TabOrder=1
         bBoundToParent=True
         bVisible=False
         OnKeyEvent=sp.InternalOnKeyEvent
     End Object
     spacer1=GUIButton'KFGui.GUIBuyMenuFooter.sp'

     Begin Object Class=GUIButton Name=sp2
         StyleName="Footerbutton"
         WinTop=0.966146
         WinLeft=0.330000
         WinWidth=0.120000
         RenderWeight=2.000000
         TabOrder=4
         bBoundToParent=True
         bVisible=False
         OnKeyEvent=sp2.InternalOnKeyEvent
     End Object
     spacer2=GUIButton'KFGui.GUIBuyMenuFooter.sp2'

     Begin Object Class=GUILabel Name=PlayerScore
         Caption="Cash: 0"
         StyleName="FooterButton"
         WinTop=0.966146
         WinLeft=0.010000
         WinHeight=0.033203
     End Object
    // l_score=GUILabel'KFGui.GUIBuyMenuFooter.PlayerScore'
*/
     Begin Object Class=GUILabel Name=playerweight
         Caption="Weight: 0.0"
         StyleName="FooterButton"
         WinTop=0.950120
         WinLeft=0.460000
         WinHeight=0.040000
         WinWidth=0.200000
         bVisible=true
     End Object
     l_weight=GUILabel'KFGui.GUIBuyMenuFooter.playerweight'

    //WinWidth=0.299826
    //WinHeight=0.058023
    //WinLeft=0.70000
    //WinTop=0.943197
    //StyleName = "EditBox"
 //   WinTop=0.941977
 //   WinLeft=0.908755
 //   WinWidth=0.091250
 //   WinHeight=0.058023
    WinTop=0.941977
    WinLeft=1.940006
    WinWidth=0.057500
    WinHeight=0.058023
    RenderWeight=0.300000
    bVisible=false
    TabOrder=8
}

