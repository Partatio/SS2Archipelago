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