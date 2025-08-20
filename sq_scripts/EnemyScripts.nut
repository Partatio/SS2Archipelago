class OnSlayVictory extends SqRootScript
{
    function OnSlain()#attached to many or shodan
    {
        if (!(Object.GetName(self) == "ManyBossBrain" && Property.Get(Networking.FirstPlayer(), "Modify1").find("Many")))#Always want shodan to do this, only want many to do this if it is enabled in settings
            {
            	local NewAPLocation = Object.Create("APLocation");
            	Property.SetSimple(NewAPLocation, "VoiceIdx", 2);
            	SendMessage(NewAPLocation, "FrobWorldEnd");
            }
    }
}

class EnemyWithLocation extends SqRootScript
{
    function OnSlain()
    {
        foreach(link in Link.GetAll("Contains", self))
        {
            local containeditem = sLink(link).dest;
                {
                if (Object.InheritsFrom(containeditem, "APLocation"))
                    {
                    Object.Teleport(containeditem, Object.Position(self), vector());
                    Property.SetSimple(containeditem, "HasRefs", TRUE);
                    Property.SetSimple(containeditem, "MapObjIcon", "locs");
                    Link.Destroy(link);
                    }
                }
        }
        Property.Remove(self, "MapObjIcon");
    }
}