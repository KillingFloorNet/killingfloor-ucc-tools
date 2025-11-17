class KFIAMultiColumnRulesPanel extends IAMultiColumnRulesPanel;

var GUIController localController;

var automated GUISectionBackground sb_background;

delegate OnDifficultyChanged(int index, int tag);

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
    localController = MyController;

    Super.InitComponent(MyController, MyOwner);

    RemoveComponent(b_Symbols);

    //sb_background.ManageComponent(ch_Advanced);
    //ch_Advanced.Checked(true);
    sb_background.ManageComponent(lb_Rules);
    //ch_Advanced.SetVisibility(false);
}

function UpdateSymbolButton()
{
	b_Symbols=None;
}

function InternalOnChange(GUIComponent Sender)
{
    local moComboBox combo;

    if (GUIMultiOptionList(Sender) != None)
	{
		if (Controller.bCurMenuInitialized)
		{
		    combo = moComboBox(GUIMultiOptionList(Sender).Get());
		    if (combo != none)
		        OnDifficultyChanged(combo.getIndex(), combo.tag);
		}
    }

    Super.InternalOnChange(Sender);
}

function LoadRules()
{
    local int i;

    // Now settings in PlayInfo have been sorted by Group
    // We can now simply check if this setting's group is different from the last,
    // and if so, create a header for it.
    for (i = 0; i < InfoRules.Length; i++)
    {
        if ( InfoRules[i].DisplayName == "Monsters Config" )
        {
            continue;
        }

        if ( i == 0 || InfoRules[i].Grouping != InfoRules[i - 1].Grouping )
        {
            AddGroupHeader(i,li_Rules.Elements.Length == 0);
        }

        // Now add the setting to the GUIMultiOptionList
        AddRule(InfoRules[i], i);
    }
    super(UT2K4PlayInfoPanel).LoadRules();

    if ( GamePI != None )
    {
    	i = GamePI.FindIndex("BotMode");
    	if ( i != -1 )
    		UpdateBotSetting(i);
    }

	//UpdateAdvancedCheckbox();
	UpdateSymbolButton();
}

DefaultProperties
{

     /*Begin Object Class=GUIImage Name=Bk1
         ImageStyle=ISTY_Stretched
         WinTop=0.014733
         WinLeft=0.000505
         WinWidth=0.996997
         WinHeight=0.907930
     End Object*/
     i_bk=none //GUIImage'ROInterface.ROIAMultiColumnRulesPanel.Bk1'

     Begin Object Class=ROGUIProportionalContainer Name=myBackgroundGroup
         bNoCaption=true
         WinTop=0
         WinLeft=0
         WinWidth=1
         WinHeight=1
     End Object
     sb_background=myBackgroundGroup

     Begin Object Class=moCheckBox Name=AdvancedButton
        OnChange=InternalOnChange
        Caption="View Advanced Options"
        Hint="Toggles whether advanced properties are displayed"
		WinWidth=0.35
		WinHeight=0.040000
		WinLeft=0.00
		WinTop=0.948334
        TabOrder=1
        RenderWeight=1.0
        bSquare=True
        bBoundToParent=True
        bScaleToParent=True
        bAutoSizeCaption=True
        bVisible=false
    End Object
 //   ch_Advanced=AdvancedButton
}
