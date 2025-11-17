class KFMaplistEditor extends MaplistEditor;

// Query the CacheManager for the maps that correspond to this gametype, then fill the 'available' list
function ReloadAvailable()
{
    local int i, j;
    local array<string> CustomLinkSetups;

    if ( MapHandler.GetAvailableMaps(GameIndex, Maps) )
    {
        li_Avail.bNotify = False;
        li_Avail.Clear();

        for ( i = 0; i < Maps.Length; i++ )
        {
            if ( class'CacheManager'.static.IsDefaultContent(Maps[i].MapName) )
            {
                if ( bOnlyShowCustom )
                    continue;
            }
            else if ( bOnlyShowOfficial )
                continue;
            
            if ( Maps[i].MapName == "KF-Intro" || Maps[i].MapName == "KF-Menu" )
            {
             	continue;
            }

            // KF Hack . OMG HiJacked!
            if ( Maps[i].Options.Length > 0 )
            {
                // Add the "auto link setup" item
                li_Avail.AddItem( AutoSelectText @ LinkText, Maps[i].MapName $ "?LinkSetup=Random", Maps[i].MapName );

                // Now add all custom link setups
                for ( j = 0; j < Maps[i].Options.Length; j++ )
                    li_Avail.AddItem(Maps[i].Options[j].Value @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ Maps[i].Options[j].Value, Maps[i].MapName );
            }
			else li_Avail.AddItem( Maps[i].MapName, Maps[i].MapName );

            if ( CurrentGameType.MapPrefix == "ONS" )
            {
                CustomLinkSetups = GetPerObjectNames( Maps[i].MapName, "ONSPowerLinkCustomSetup" );
                for ( j = 0; j < CustomLinkSetups.Length; j++ )
                    li_Avail.AddItem( CustomLinkSetups[j] @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ CustomLinkSetups[j], Maps[i].MapName );

                if ( OrigONSMap(Maps[i].MapName) && Controller.bECEEdition )
                {
                    li_Avail.AddItem( Maps[i].MapName$BonusVehicles, Maps[i].MapName$"?BonusVehicles=true" );

                    // Now add all custom link setups
                    for ( j = 0; j < Maps[i].Options.Length; j++ )
                        li_Avail.AddItem(Maps[i].Options[j].Value @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ Maps[i].Options[j].Value$"?BonusVehicles=true" , Maps[i].MapName$BonusVehicles );

                    CustomLinkSetups = GetPerObjectNames( Maps[i].MapName, "ONSPowerLinkCustomSetup" );
                    for ( j = 0; j < CustomLinkSetups.Length; j++ )
                        li_Avail.AddItem( CustomLinkSetups[j] @ LinkText, Maps[i].MapName $ "?LinkSetup=" $ CustomLinkSetups[j]$"?BonusVehicles=true", Maps[i].MapName$BonusVehicles );
                }
            }
        }
    }

    if ( li_Avail.bSorted )
        li_Avail.Sort();

    li_Avail.bNotify = True;
}

defaultproperties
{
	
	Begin Object Class=GUIButton Name=RemoveButton
		Caption="Remove"
		Hint="Remove the selected maps from your map list"
		WinWidth=0.223407
		WinHeight=0.056312
		WinLeft=0.511243
		WinTop=0.918035
		OnClick=ModifyMapList
		OnClickSound=CS_Down
		TabOrder=10
		AutoSizePadding=(HorzPerc=0.5,VertPerc=0.0)
		bScaleToParent=true
		bRepeatClick=True
	End Object
	b_Remove=RemoveButton

	Begin Object Class=GUIButton Name=RemoveAllButton
		Caption="Remove All"
		Hint="Remove all maps from your map list"
		WinWidth=0.223407
		WinHeight=0.056312
		WinLeft=0.753268
		WinTop=0.918035
		OnClick=ModifyMapList
		OnClickSound=CS_Down
		TabOrder=11
		bScaleToParent=true
	End Object
	b_RemoveAll=RemoveAllButton
	
	Begin Object class=AltSectionBackground name=MapListSectionBackground
   		WinTop=0.055162
        WinLeft=0.034523
        WinWidth=0.941820
        WinHeight=0.194434
	End Object
	sb_MapList=MapListSectionBackground

}
