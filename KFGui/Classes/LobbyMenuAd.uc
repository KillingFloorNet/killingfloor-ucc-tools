class LobbyMenuAd extends AdAsset;

var Movie MenuMovie;

event OnStateChanged()
{
}

function DestroyMovie()
{
	if(MenuMovie !=none)
	{
		MenuMovie.Close();
		MenuMovie = None;
	}
}

event OnFinished()
{
}

DefaultProperties
{
	ZoneName = "mp_lobby";
	InventoryName = "movie_ad_1"
}
