class APLocationFuncs extends SqRootScript
{
    function OnFrobWorldEnd()
    {
        if (Link.AnyExist(linkkind("~Contains"), self)) #if that was the last loc frobbed from a container, remove its map icon
            {
            local containlink = Link.GetOne(linkkind("~Contains"), self);
            local container = LinkDest(containlink);
            Link.Destroy(containlink);
            if (!Link.AnyExist(linkkind("Contains"), container))
                Property.Remove(container, "MapObjIcon");
            }
    	local locid = Property.Get(self, "VoiceIdx");
    	SendMessage(Networking.FirstPlayer(), "OpenIdFile", locid);
    	if ((locid < 1481 || locid > 1627) && locid != 2) #dont want to play noise if shop or victory
            Sound.PlaySchemaAtLocation(self, "hitspark", Object.Position(self));
        Object.Destroy(self);

    }

    function OnCollectedItemsUpdate()
    {
        if (split(message().data, ",").find(Property.Get(self, "VoiceIdx").tostring()))
            Object.Destroy(self);
    }
}

class ItemUnrestrict extends SqRootScript
{
    function OnFrobWorldEnd()
    {
        SendMessage(Networking.FirstPlayer(), "ItemsUnrestricted");
    }
}