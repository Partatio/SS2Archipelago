class CybModShop extends SqRootScript
{
    function OnFrobWorldEnd()
    {
        local p = Networking.FirstPlayer();
        local cybmodshoparray = split(Property.Get(p, "LockMsg"), ",");
        if (cybmodshoparray.len() == 0)
            {
            ShockGame.AddText("All locations already purchased.", p);
            return;
            }
        local cybmodholder = Object.FindClosestObjectNamed(p, "FakeCookie");
        local playercybmodcount = Property.Get(cybmodholder, "StackCount");
        local price = 6;
        if (playercybmodcount >= price)
            {
            local amountbought = 0
            local totalprice = 0
            while (playercybmodcount >= price && cybmodshoparray.len() > 0)
                {
                local NewAPLocation = Object.Create("APLocation");
                Property.SetSimple(NewAPLocation, "VoiceIdx", cybmodshoparray[0]);
                SendMessage(NewAPLocation, "FrobWorldEnd");
                playercybmodcount -= price;
                totalprice += price;
                amountbought += 1;
                cybmodshoparray.remove(0)
                }
            Property.SetSimple(cybmodholder, "StackCount", playercybmodcount);#reduce player cyber modules
            local newcybmodshoplist = "";
            foreach(id in cybmodshoparray)
                newcybmodshoplist += id + ",";
            Property.SetSimple(self, "LockMsg", cybmodshoparray);
            Sound.PlaySchemaAmbient(p, "hitspark");
            ShockGame.AddText("Bought " + amountbought + " location(s) for " + totalprice + " Cyber Modules.", p);
            }
        else
            ShockGame.AddText("You do not have enough Cyber Modules to buy locations, they cost 6 each.", p);
    }
}