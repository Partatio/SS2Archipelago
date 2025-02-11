class OnSlayVictory extends SqRootScript
{
    function OnSlain()
    {
        Debug.Command("dump_cmds", "pylocid2.txt");#victory id
    }
}