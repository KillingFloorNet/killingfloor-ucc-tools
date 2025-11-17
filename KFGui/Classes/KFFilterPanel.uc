//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KFFilterPanel extends GUIPanel;

var automated 	AltSectionBackground sb_Options;
var automated 	moEditBox eb_Name;
var automated 	moCheckBox ck_Full, ck_Dedicated, ck_Empty, ck_Passworded, ck_VACOnly, ck_Perks;
var automated	moCheckBox ck_Hidden, ck_Hidden2;
var automated 	moComboBox cb_Difficulty;

var automated 	GUIButton b_Ok, b_Cancel;

var int 			FilterIndex;
var	BrowserFilters 	FilterMaster;

//var UT2K4_FilterListPage FLP;

var bool bInitialized;

var localized string DifficultyOptions[6];

function InitComponent(GUIController MyC, GUIComponent MyO)
{
	Super.InitComponent(MyC, MyO);

	//FLP = UT2K4_FilterListPage(ParentPage);
	//FilterMaster = KFServerBrowser(Controller.TopPage()).FilterMaster;

	sb_Options.ManageComponent(ck_Dedicated);
	sb_Options.ManageComponent(ck_Perks);
	sb_Options.ManageComponent(cb_Difficulty);
	sb_Options.ManageComponent(ck_Full);
	sb_Options.ManageComponent(ck_Empty);
	sb_Options.ManageComponent(ck_Passworded);
	sb_Options.ManageComponent(ck_VACOnly);
	sb_Options.ManageComponent(ck_Hidden);
	sb_Options.ManageComponent(ck_Hidden2);

	cb_Difficulty.AddItem(DifficultyOptions[0]);
	cb_Difficulty.AddItem(DifficultyOptions[1]);
	cb_Difficulty.AddItem(DifficultyOptions[2]);
	cb_Difficulty.AddItem(DifficultyOptions[3]);
	cb_Difficulty.AddItem(DifficultyOptions[4]);
	cb_Difficulty.AddItem(DifficultyOptions[5]);

	StartUp();
}

function StartUp()
{
	local int i;
	local array<CustomFilter.AFilterRule> Rules;
	local MasterServerClient.QueryData 	FilterItem;
	local string IdontCareString;

	FilterIndex = 0;

	/*eb_Name.SetComponentValue(Param2);

	if (Param2~="Default")
		eb_Name.DisableMe();
	else
		eb_Name.EnableMe();
	*/
	//Get the custom filter

	IdontCareString = "blah";
	KFServerBrowser(OwnerPage()).FilterMaster.InitCustomFilters();

	if ( KFServerBrowser(OwnerPage()).FilterMaster.AllFilters.Length < 1 )
	{
		KFServerBrowser(OwnerPage()).FilterMaster.AddCustomFilter(IdontCareString);
	}

   	Rules =	KFServerBrowser(OwnerPage()).FilterMaster.GetFilterRules(FilterIndex);

	for ( i = 0; i < Rules.Length; i++)
	{
		FilterItem = Rules[i].FilterItem;

		log(FilterItem.Key$"="$FilterItem.Value);

		if ( FilterItem.Key~="currentplayers" && FilterItem.Value=="0" && FilterItem.QueryType==QT_GreaterThan )
			ck_Empty.Checked(true);

		if ( FilterItem.Key~="password" && FilterItem.Value=="false" && FilterItem.QueryType==QT_Equals )
			ck_Passworded.Checked(true);

		if ( FilterItem.Key~="freespace" && FilterItem.Value =="0" && FilterItem.QueryType==QT_GreaterThan )
			ck_Full.Checked(true);

		if ( FilterItem.Key~="dedicated" && FilterItem.Value=="true" && FilterItem.QueryType==QT_Equals)
			ck_Dedicated.Checked(true);

		if ( FilterItem.Key~="vacsecure" && FilterItem.Value=="true" && FilterItem.QueryType==QT_Equals)
			ck_VACOnly.Checked(true);

		if ( FilterItem.Key~="perks" && FilterItem.Value=="true" && FilterItem.QueryType==QT_Equals)
			ck_Perks.Checked(true);

		if ( FilterItem.Key~="difficulty" )
			cb_Difficulty.MyComboBox.SetIndex(int(FilterItem.Value));
	}

	AdjustDifficultyForPerk();
}

function AdjustDifficultyForPerk()
{
    local int HPL;

    HPL = class'KFServerBrowser'.static.CalcPlayerHighestPerkLevel( PlayerOwner() );
    if( HPL == 0 )
    {
        cb_Difficulty.MyComboBox.SetIndex(1); // beginner
	    InternalOnChange( cb_Difficulty );
    }
    else if( HPL == 1 )
    {
        cb_Difficulty.MyComboBox.SetIndex(2); // normal
	    InternalOnChange( cb_Difficulty );
    }
}

function bool CancelClick(GUIComponent Sender)
{
	//Controller.CloseMenu(true);
	return true;
}

function CustomFilter.AFilterRule BuildRule(string Key, string Value, MasterServerClient.EQueryType qType)
{
	local CustomFilter.AFilterRule NewRule;

	NewRule.FilterItem.Key   		= key;
	NewRule.FilterItem.Value 		= value;
	NewRule.FilterItem.QueryType	= qtype;
	NewRule.FilterType				= DT_Unique;
	NewRule.ItemName				= Key;

	return NewRule;
}

function InternalOnChange(GUIComponent Sender)
{
	local array<CustomFilter.AFilterRule> Rules;
	local int cnt;

	cnt = 0;

	// Build Query lists

	if ( ck_Empty.IsChecked() )
		Rules[Cnt++] = BuildRule("currentplayers","0",QT_GreaterThan);

	if ( ck_Full.IsChecked() )
		Rules[Cnt++] = BuildRule("freespace","0",QT_GreaterThan);

	if ( ck_Passworded.IsChecked() )
		Rules[Cnt++] = BuildRule("password","false",QT_Equals);

	if ( ck_Dedicated.IsChecked() )
		Rules[Cnt++] = BuildRule("dedicated","true", QT_Equals);

	if ( ck_VACOnly.IsChecked() )
		Rules[Cnt++] = BuildRule("vacsecure","true", QT_Equals);

	if ( ck_Perks.IsChecked() )
		Rules[Cnt++] = BuildRule("perks","true", QT_Equals);

	Rules[Cnt++] = BuildRule("difficulty", string(cb_Difficulty.GetIndex()), QT_Equals);

	KFServerBrowser(OwnerPage()).FilterMaster.PostEdit(FilterIndex,"blah",Rules);
	KFServerBrowser(OwnerPage()).FilterMaster.ActivateFilter(FilterIndex, true);
	KFServerBrowser(OwnerPage()).FilterMaster.RenameFilter(FilterIndex, "blah");
	KFServerBrowser(OwnerPage()).FilterMaster.SaveFilters();
	KFServerBrowser(OwnerPage()).RefreshClicked();
}

function bool ebPreDraw(canvas Canvas)
{
	// Reposition
//	eb_Name.WinTop = sb_Options.ActualTop() + 36;
	return true;
}

defaultproperties
{
    PropagateVisibility=False

	Begin Object class=moEditBox name=ebName
		WinWidth=0.654297
		WinHeight=0.030000
		WinLeft=0.184531
		WinTop=0.124114
		bStandardized=true
		Caption="Filter Name:"
		ComponentWidth=0.7
		TabOrder=0
		OnPreDraw=ebPreDraw
	End Object
	eb_Name=none

	Begin Object Class=AltSectionBackground Name=sbOptions
		ImageOffset(1)=0.0
		ImageOffset(3)=0.0
		WinWidth=1.0
		WinHeight=1.0
		WinLeft=0.0
		WinTop=0.0
//		Caption="Filters"
		LeftPadding=0.00
		RightPadding=0.00
       	TopPadding=0.07
		bFillClient=true
		BottomPadding=0.07
		NumColumns=3
	End Object
	sb_Options=sbOptions

	Begin Object class=moCheckBox name=ckFull
		WinWidth=0.45
		WinLeft=0.0
		WinTop=0.1
		bStandardized=true
		CaptionWidth=0.4
		Caption="No Full Servers"
		ComponentWidth=0.1
		TabOrder=1
		OnChange=InternalOnChange
		bSquare=true
		StandardHeight=0.025
	End Object
	ck_Full=ckFull

	Begin Object class=moCheckBox name=ckDedicated
		WinWidth=0.45
		WinLeft=0.0
		WinTop=0.2
		bStandardized=true
		Caption="Dedicated Only"
		ComponentWidth=0.1
		TabOrder=2
		OnChange=InternalOnChange
		StandardHeight=0.025
	End Object
	ck_Dedicated=ckDedicated

	Begin Object class=moComboBox name=cbDifficulty
//		WinWidth=0.45
//		WinLeft=0.55
//		WinTop=0.1
		bStandardized=true
		Caption="Difficulty:"
		ComponentWidth=0.55
		TabOrder=3
		bReadOnly=true
		OnChange=InternalOnChange
		StandardHeight=0.025
	End Object
	cb_Difficulty=cbDifficulty


	Begin Object class=moCheckBox name=ckEmpty
		WinWidth=0.45
		WinLeft=0.0
		WinTop=0.2
		bStandardized=true
		Caption="No Empty Servers"
		ComponentWidth=0.1
		TabOrder=4
		OnChange=InternalOnChange
		StandardHeight=0.025
	End Object
	ck_Empty=ckEmpty

	Begin Object class=moCheckBox name=ckPassworded
		WinWidth=0.45
		WinLeft=0.0
		WinTop=0.3
		bStandardized=true
		Caption="No Passworded Servers"
		ComponentWidth=0.1
		TabOrder=5
		OnChange=InternalOnChange
		StandardHeight=0.025
	End Object
	ck_Passworded=ckPassworded

	Begin Object class=moCheckBox name=ckVACOnly
		WinWidth=0.45
		WinLeft=0.0
		WinTop=0.4
		bStandardized=true
		Caption="Valve Anti-Cheat Protected Only"
		ComponentWidth=0.1
		TabOrder=6
		OnChange=InternalOnChange
		StandardHeight=0.025
	End Object
	ck_VACOnly=ckVACOnly

	Begin Object class=moCheckBox name=ckPerks
		WinWidth=0.45
		WinLeft=0.0
		WinTop=0.5
		bStandardized=true
		Caption="Perks Enabled"
		ComponentWidth=0.1
		TabOrder=7
		OnChange=InternalOnChange
		StandardHeight=0.025
	End Object
	ck_Perks=ckPerks

 	Begin Object class=moCheckBox name=ckHidden
		bStandardized=true
		Caption="Hidden"
		ComponentWidth=0.1
		TabOrder=8
		bVisible=false
	End Object
	ck_Hidden=ckHidden

	Begin Object class=moCheckBox name=ckHidden2
		WinWidth=0.45
		WinLeft=0.55
		WinTop=0.0
		bStandardized=true
		Caption="Hidden"
		ComponentWidth=0.1
		TabOrder=9
		bVisible=false
	End Object
	ck_Hidden2=ckHidden2

   	Begin Object Class=GUIButton name=bOK
		WinWidth=0.168750
		WinHeight=0.050000
		WinLeft=0.55
		WinTop=0.3
		Caption="OK"
		//OnClick=OKClick
	End Object
	b_OK=none

   	Begin Object Class=GUIButton name=bCancel
		WinWidth=0.168750
		WinHeight=0.050000
		WinLeft=0.742814
		WinTop=0.3
		Caption="Cancel"
		//OnClick=CancelClick
	End Object
	b_Cancel=none

//	WinWidth=0.90
//	WinHeight=0.57
//	WinLeft=0.01
//	WinTop=0.01
//	WindowName="Edit Filter Rules..."

	DifficultyOptions(0)="Any Difficulty"
	DifficultyOptions(1)="Beginner"
	DifficultyOptions(2)="Normal"
	DifficultyOptions(3)="Hard"
	DifficultyOptions(4)="Suicidal"
	DifficultyOptions(5)="Hell on Earth"
}
