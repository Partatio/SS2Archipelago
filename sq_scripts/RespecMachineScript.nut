class RespecMachineScript extends SqRootScript
{
    function OnFrobWorldEnd()
    {
        local p = Networking.FirstPlayer();

        Property.Set(p, "BaseStatsDesc", "STR", 1);
        Property.Set(p, "BaseStatsDesc", "END", 1);
        Property.Set(p, "BaseStatsDesc", "PSI", 1);
        Property.Set(p, "BaseStatsDesc", "AGI", 1);
        Property.Set(p, "BaseStatsDesc", "CYB", 1);

        Property.Set(p, "BaseTechDesc", "Hack", 0);
        Property.Set(p, "BaseTechDesc", "Repair", 0);
        Property.Set(p, "BaseTechDesc", "Modify", 0);
        Property.Set(p, "BaseTechDesc", "Maintain", 0);
        Property.Set(p, "BaseTechDesc", "Research", 0);

        Property.Set(p, "BaseWeaponDesc", "Conventional", 0);
        Property.Set(p, "BaseWeaponDesc", "Energy", 0);
        Property.Set(p, "BaseWeaponDesc", "Heavy", 0);
        Property.Set(p, "BaseWeaponDesc", "Annelid", 0);

        local cybmodholder = Object.FindClosestObjectNamed(p, "FakeCookie");
        local playercybmodcount = Property.Get(cybmodholder, "StackCount");
        local refund = Property.Get(p, "SoftLevel") - playercybmodcount;
        ShockGame.AddExp(p, refund, true);

        Property.SetSimple(p, "PsiPowerDesc", 0);
        Property.SetSimple(p, "PsiPowerDesc2", 0);

        ShockGame.RecalcStats(p);
    }
}