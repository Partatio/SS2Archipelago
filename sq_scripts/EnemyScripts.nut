class OnSlayVictory extends SqRootScript
{
    function OnSlain()#attached to many or shodan
    {
        Debug.Command("dump_cmds", "pylocid2.txt");#victory id
    }
}

class EggScript extends SqRootScript
{
    function OnTimer()
    {
        if (message().name == "CreateTripwire")
        {
            local podtrip = Object.Create("Floor Egg Tripwire");
            Property.SetSimple(podtrip, "Scale", vector(3, 3, 2));
            Link.Create("SwitchLink", podtrip, self);
            Object.Teleport(podtrip, Object.Position(self), vector(0, 0, 0));
        }
    }
}

class UnlootableEnemy extends SqRootScript
{
    function OnSlain()
    {
        foreach(link in Link.GetAll("Contains", self))
        {
            local containedloc = sLink(link).dest;
            Object.Teleport(containedloc, Object.Position(self), vector());
            Property.SetSimple(containedloc, "HasRefs", TRUE);
            Link.Destroy(link);
        }
    }
}