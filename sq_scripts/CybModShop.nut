class CybModShop extends SqRootScript
{
    function OnFrobWorldEnd()
    {
        local cybmodshoplist = split(Property.Get(Networking.FirstPlayer(), "LockMsg"), ",");
        if (cybmodshoplist.len() == 0)
            {
            ShockGame.AddText("All locations already purchased.", Networking.FirstPlayer());
            return;
            }
        local price = cybmodshoplist[1].tointeger();
        local cybmodholder = Object.FindClosestObjectNamed(Networking.FirstPlayer(), "FakeCookie")
        local playercybmodcount = Property.Get(cybmodholder, "StackCount");
        if (playercybmodcount >= price)
            {
            local amountbought = 0
            local totalprice = 0
            while (playercybmodcount >= price)
                {
                Debug.Command("dump_cmds", "pylocid" + cybmodshoplist[0] + ".txt");#send out location
                playercybmodcount -= price;
                totalprice += price;
                amountbought += 1;
                cybmodshoplist.remove(0);#remove id and price of just purchased location
                cybmodshoplist.remove(0);
                price = cybmodshoplist[1].tointeger();
                }
            Property.SetSimple(cybmodholder, "StackCount", playercybmodcount);#reduce player cyber modules
            local newcybmodshoplist = "";
            foreach(element in cybmodshoplist)#recreate stored shop string then restore it
                newcybmodshoplist = newcybmodshoplist + element + ",";
            Property.SetSimple(Networking.FirstPlayer(), "LockMsg", newcybmodshoplist);
            ShockGame.AddText("Bought " + amountbought + " location(s) for " + totalprice + " Cyber Modules.", Networking.FirstPlayer());
            }
        else
            ShockGame.AddText("You do not have enough Cyber Modules to buy locations, they cost 6 each.", Networking.FirstPlayer());
    }
}