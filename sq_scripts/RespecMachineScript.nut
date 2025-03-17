class RespecMachineScript extends SqRootScript
{
    StatTable = {
        "1": 0,
        "2": 5,
        "3": 19,
        "4": 45,
        "5": 98,
        "6": 187
    }

    TechTable = {
        "0": 0,
        "1": 17,
        "2": 25,
        "3": 39,
        "4": 60,
        "5": 104,
        "6": 193
    }

    WeaponTable = {
        "": 0,
        "1": 21,
        "2": 31,
        "3": 45,
        "4": 71,
        "5": 135,
        "6": 224
    }

    function PsiPowRefund(PsiEnum, psipow, amount)
    {
        if (abs(PsiEnum & pow(2, psipower - 1).tointeger()) > 0)
            return amount
        else
            return 0;
    }


    function OnFrobWorldEnd()
    {
        local p = Networking.FirstPlayer();
        local refund = 0;
        local CurPsiPowers = Property.Get(p, "PsiPowerDesc")

        refund += StatTable.rawget(Property.Get(p, "BaseStatsDesc", "STR").tostring());
        Property.Set(p, "BaseStatsDesc", "STR", 1)
        refund += StatTable.rawget(Property.Get(p, "BaseStatsDesc", "END").tostring());
        Property.Set(p, "BaseStatsDesc", "END", 1)
        refund += StatTable.rawget(Property.Get(p, "BaseStatsDesc", "PSI").tostring());
        Property.Set(p, "BaseStatsDesc", "PSI", 1)
        refund += StatTable.rawget(Property.Get(p, "BaseStatsDesc", "AGI").tostring());
        Property.Set(p, "BaseStatsDesc", "AGI", 1)
        refund += StatTable.rawget(Property.Get(p, "BaseStatsDesc", "CYB").tostring());
        Property.Set(p, "BaseStatsDesc", "CYB", 1)

        refund += TechTable.rawget(Property.Get(p, "BaseTechDesc", "Hack").tostring());
        Property.Set(p, "BaseTechDesc", "Hack", 0)
        refund += TechTable.rawget(Property.Get(p, "BaseTechDesc", "Repair").tostring());
        Property.Set(p, "BaseTechDesc", "Repair", 0)
        refund += TechTable.rawget(Property.Get(p, "BaseTechDesc", "Modify").tostring());
        Property.Set(p, "BaseTechDesc", "Modify", 0)
        refund += TechTable.rawget(Property.Get(p, "BaseTechDesc", "Maintain").tostring());
        Property.Set(p, "BaseTechDesc", "Maintain", 0)
        refund += TechTable.rawget(Property.Get(p, "BaseTechDesc", "Research").tostring());
        Property.Set(p, "BaseTechDesc", "Research", 0)

        refund += WeaponTable.rawget(Property.Get(p, "BaseWeaponDesc", "Conventional").tostring());
        Property.Set(p, "BaseWeaponDesc", "Conventional", 0)
        refund += WeaponTable.rawget(Property.Get(p, "BaseWeaponDesc", "Energy").tostring());
        Property.Set(p, "BaseWeaponDesc", "Energy", 0)
        refund += WeaponTable.rawget(Property.Get(p, "BaseWeaponDesc", "Heavy").tostring());
        Property.Set(p, "BaseWeaponDesc", "Heavy", 0)
        refund += WeaponTable.rawget(Property.Get(p, "BaseWeaponDesc", "Annelid").tostring());
        Property.Set(p, "BaseWeaponDesc", "Annelid", 0)

        refund += PsiPowRefund(CurPsiPowers, 1, 17)
        for (local i = 2; i < 9; i++)
            refund += PsiPowRefund(CurPsiPowers, i, 5)
        refund += PsiPowRefund(CurPsiPowers, 9, 35)
        for (local i = 10; i < 17; i++)
            refund += PsiPowRefund(CurPsiPowers, i, 8)
        refund += PsiPowRefund(CurPsiPowers, 17, 53)
        for (local i = 18; i < 25; i++)
            refund += PsiPowRefund(CurPsiPowers, i, 14)
        refund += PsiPowRefund(CurPsiPowers, 25, 89)
        for (local i = 26; i < 33; i++)
            refund += PsiPowRefund(CurPsiPowers, i, 21)

        CurPsiPowers = Property.Get(p, "PsiPowerDesc2")
        refund += PsiPowRefund(CurPsiPowers, 1, 134)
        for (local i = 2; i < 9; i++)
            refund += PsiPowRefund(CurPsiPowers, i, 35)

        Property.SetSimple(p, "PsiPowerDesc", 0)
        Property.SetSimple(p, "PsiPowerDesc2", 0)

        ShockGame.RecalcStats(p)
    }
}