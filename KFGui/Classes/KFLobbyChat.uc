// Custom Chatbox for the Lobby GUI : Alex

class KFLobbyChat extends FloatingWindow;

var automated GUISectionBackground sB_Main;
var automated moEditBox eb_Send;
var automated GUIScrollTextBox lb_Chat;
var bool bVoiceRepeat;

var() editinline array<byte> CloseKey;
var() editinlinenotify color TextColor[3];

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	local int i;
	local PlayerController PC;
	local ExtendedConsole MyConsole;

	Super(PopupPageBase).InitComponent( MyController, MyOwner );

	PC = PlayerOwner();
	TextColor[0] = class'SayMessagePlus'.default.RedTeamColor;
	TextColor[1] = class'SayMessagePlus'.default.BlueTeamColor;
	TextColor[2] = class'SayMessagePlus'.default.DrawColor;

	eb_Send.MyEditBox.OnKeyEvent = InternalOnKeyEvent;
	lb_Chat.MyScrollText.bNeverFocus=true;

	MyConsole = ExtendedConsole(PC.Player.Console);
	if (MyConsole==None)
		return;

	MyConsole.OnChat = HandleChat;
	for (i=0;i<MyConsole.ChatMessages.Length;i++)
	{
		if ( !MyConsole.bTeamChatOnly || PC.PlayerReplicationInfo == None || PC.PlayerReplicationInfo.Team == None
		 || MyConsole.ChatMessages[i].Team == PC.PlayerReplicationInfo.Team.TeamIndex )
			HandleChat(MyConsole.ChatMessages[i].Message, MyConsole.ChatMessages[i].Team);
	}
}

event Opened(GUIComponent Sender)
{
	local int i;
	local string KeyName;
	local array<string> KeyNames;
	local PlayerController PC;

	Super.Opened(Sender);
	PC = PlayerOwner();

	CloseKey.Remove(0, CloseKey.Length);
	KeyName = PC.ConsoleCommand("BINDINGTOKEY InGameChat");
	Split(KeyName, ",", KeyNames);
	for ( i = 0; i < KeyNames.Length; i++ )
		CloseKey[CloseKey.Length] = byte(PC.ConsoleCommand("KEYNUMBER"@KeyNames[i]));

	// Advance the cursor position to the end of the text
	lb_Chat.MyScrollText.End();

	FocusFirst(None);
}

function HandleChat(string Msg, int TeamIndex)
{
	local int i;
	local string str;

	i = InStr( Msg, ":" );
	if ( TeamIndex < 2 && i != -1 )
	{
		str = MakeColorCode(TextColor[TeamIndex]) $ Left(Msg, i) $
			  MakeColorCode(TextColor[2]) $ ":" $ Mid(Msg, i+1);
	}
	else str = MakeColorCode(TextColor[2]) $ Msg;
	lb_chat.AddText( str );
}

function bool InternalOnKeyEvent(out byte Key, out byte State, float delta)
{
	local string cmd;
	local int i;
	local bool bVoiceChatKey;
	local array<string> BindKeyNames, LocalizedBindKeyNames;
	local string TempString;
	
	Controller.GetAssignedKeys( "VoiceTalk", BindKeyNames, LocalizedBindKeyNames );
	
	for ( i = 0; i < BindKeyNames.Length; i++ ) 
	{
		if ( Mid( GetEnum(enum'EInputKey', Key), 3 ) ~= BindKeyNames[i] )
		{
			bVoiceChatKey = true;		
			break;
		}	
	}
	
	if ( bVoiceChatKey )
	{
		if ( bVoiceRepeat )
		{
			TempString = left(eb_send.MyEditBox.TextStr, len(eb_send.MyEditBox.TextStr) - 1);
		}
		
		if ( State == 1 )
		{
			if ( PlayerOwner() != none )
			{
				PlayerOwner().bVoiceTalk = 1;
				
				if ( bVoiceRepeat )
				{
					eb_send.MyEditBox.TextStr = TempString;
					eb_send.MyEditBox.CaretPos = len(eb_send.MyEditBox.TextStr);
				}
						
				bVoiceRepeat = true;
				
				return True;
			}	
		}
		else if ( State == 2 )
		{
	        if ( PlayerOwner() != none )
			{
				PlayerOwner().bVoiceTalk = 1;
								
				return True;
			}
			
			bVoiceRepeat = false;	
		}
		else
		{
			if ( PlayerOwner() != none )
			{
				PlayerOwner().bVoiceTalk = 0;
			}
			
			bVoiceRepeat = false;		
		}
	}
	
	if ( state == 1 )
	{
		for ( i = 0; i < CloseKey.Length; i++ )
		{
			if ( Key == CloseKey[i] )
			{
				Controller.CloseMenu(false);
				return True;
			}
		}
	}

	if ( state == 3 )
	{
		if ( Key == 0x0D )
		{
			cmd = eb_Send.GetText();
			
			if ( cmd == "" )
			{
				return True;
			}

			if ( Left(cmd, 1) == "/" )
			{
				cmd = Mid(cmd, 1);
			}
			else if ( Left(cmd, 1) == "." )
			{
				cmd = "teamsay" @ Mid( cmd, 1 );
			}
			else
			{
				cmd = "say" @ cmd;
			}

			PlayerOwner().ConsoleCommand(cmd);
			eb_Send.SetText("");
			
			return true;
		}
	}

	return eb_Send.MyEditBox.InternalOnKeyEvent(key,state,delta);
}

function InternalOnCreateComponent( GUIComponent NewComp, GUIComponent Sender )
{
	if ( NewComp != eb_Send )
		NewComp.bNeverFocus = True;

	Super.InternalOnCreateComponent(NewComp,Sender);
}

defaultproperties
{
	Begin Object Class=moEditBox Name=ebSend
		 CaptionWidth=0.100000
		 Caption="Say: "
		 OnCreateComponent=ebSend.InternalOnCreateComponent
		 Hint="Prefix a message with a dot (.) to send a team message or a slash (/) to send a command."
		 WinWidth=0.92
 		 WinHeight=0.060000
  		 WinLeft=0.044128
		 WinTop=0.973152
		 TabOrder=0
		 bBoundToParent=True
		 bScaleToParent=True
  		 ToolTip=none
	 End Object
	 eb_Send=moEditBox'KFGui.KFLobbyChat.ebSend'
	
 	 Begin Object Class=AltSectionBackground Name=sbMain
		 bFillClient=True
		 LeftPadding=0.000000
		 RightPadding=0.000000
		 StyleName="none"
		 WinHeight=0.000000
		 bBoundToParent=True
		 bScaleToParent=True
		 bNeverFocus=True
		 OnPreDraw=sbMain.InternalPreDraw
   		 ToolTip=none
	 End Object

	 sb_Main=none//AltSectionBackground'KFGui.KFLobbyChat.sbMain'

	 Begin Object Class=GUIScrollTextBox Name=lbChat
		 bNoTeletype=True
		 CharDelay=0.002500
		 EOLDelay=0.000000
		 Separator="þ"
		 OnCreateComponent=lbChat.InternalOnCreateComponent
		 FontScale=FNS_Small
		 WinTop=0
		 WinHeight=0
		 Winwidth=0
		 bBoundToParent=True
		 bScaleToParent=True
		 bNeverFocus=True
		 StyleName="none"
   		 ToolTip=none
	 End Object
	 lb_Chat=GUIScrollTextBox'KFGui.KFLobbyChat.lbChat'

   
	 Begin Object Class=GUIHeader Name=TitleBar
		 bUseTextHeight=True
		 //StyleName="NoBackground"
		 WinWidth=0.000000
		 WinHeight=0.000000
		 RenderWeight=0.0100000
		 bBoundToParent=True
		 bScaleToParent=True
		 bVisible=False
		 bAcceptsInput=false
		 bNeverFocus=False
		 ScalingType=SCALE_X
   		 ToolTip=none
	 End Object
	 t_WindowTitle=TitleBar

 
	 ToolTip=none
	 WindowName=""
	 bMoveAllowed=False
	 DefaultLeft=0.025000
	 DefaultTop=0.460000
	 DefaultWidth=0.400000
	 DefaultHeight=0.0500000
	 WinTop=0.430000
	 WinLeft=0.025000
	 WinWidth=0.400000
	 WinHeight=0.0500000
	 
	 bRenderWorld=true
	 bRequire640x480=false
	 bAllowedAsLast=true

	 bResizeWidthAllowed=False
	 bResizeHeightAllowed=false
	 bPersistent=True
	 
	 i_FrameBG = none
}
