class APLocationFuncs extends SqRootScript
{
    function OnFrobWorldEnd()
    {
        if (Link.AnyExist(linkkind("~Contains"), self)) #if that was the last loc frobbed from a container, remove its map icon
            {
            local containlink = Link.GetOne(linkkind("~Contains"), self);
            local container = LinkDest(containlink);
            Link.Destroy(containlink);
            local containsaplocation = false
            foreach (l in Link.GetAll(linkkind("Contains"), container))
                {
                if (Object.InheritsFrom(LinkDest(l), "APLocation"))
                    containsaplocation = true
                }
            if (!containsaplocation)
                Property.Remove(container, "MapObjIcon");
            }
    	local locid = Property.Get(self, "VoiceIdx");
    	SendMessage(Networking.FirstPlayer(), "OpenIdFile", locid);
    	if ((locid < 1481 || (1627 < locid && locid < 1800)) && locid != 2) #dont want to play noise if shop or victory
            Sound.PlaySchemaAtLocation(self, "hitspark", Object.Position(self));
        Object.Destroy(self);

    }

    function OnCollectedItemsUpdate()
    {
        if (split(message().data, ",").find(Property.Get(self, "VoiceIdx").tostring()))
            {
            if (Link.AnyExist(linkkind("~Contains"), self))
                {
                local containlink = Link.GetOne(linkkind("~Contains"), self);
                local container = LinkDest(containlink);
                Link.Destroy(containlink);
                local containsaplocation = false
                foreach (l in Link.GetAll(linkkind("Contains"), container))
                    {
                    if (Object.InheritsFrom(LinkDest(l), "APLocation"))
                        containsaplocation = true
                    }
                if (!containsaplocation)
                    Property.Remove(container, "MapObjIcon");
                }
            Object.Destroy(self);
            }
    }
}

class ItemUnrestrict extends SqRootScript
{
    function OnFrobWorldEnd()
    {
        SendMessage(Networking.FirstPlayer(), "ItemsUnrestricted");
    }
}