class APLocationFuncs extends SqRootScript
{
    function OnFrobWorldEnd()
    {
        Debug.Command("dump_cmds", "pylocid" + Property.Get(self, "VoiceIdx") + ".txt");
        Sound.PlaySchemaAmbient(Networking.FirstPlayer(), "hitspark");
        Object.Destroy(self);
    }

    function OnCollectedItemsUpdate()
    {
        if (split(message().data, ",").find(" " + Property.Get(self, "VoiceIdx").tostring()))
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