//-----------------------------------------------------------
//
//-----------------------------------------------------------
class LobbyMenu_Story extends LobbyMenu;

DefaultProperties
{
    /* clear this stuff out ,'cuz its not really useful in Obj/Story mode  ...
    Slotting in dummy objects so I dont have to overide InternalOnPreDraw
    (if I set the vars to none it would spam the log to hell) */

	Begin Object Class=GUIImage Name=DummyBG
	End Object
	WaveBG=DummyBG

	Begin Object Class=GUILabel Name=DummyWaveText
	End Object
	WaveLabel=DummyWaveText

	Begin Object Class=LobbyFooter_Story Name=StoryLobbyFooter
		RenderWeight=0.300000
		TabOrder=8
		bBoundToParent=False
		bScaleToParent=False
		OnPreDraw=BuyFooter.InternalOnPreDraw
		ToolTip=none
	End Object
	t_Footer=LobbyFooter_Story'KFStoryUI.LobbyMenu_Story.StoryLobbyFooter'
}
