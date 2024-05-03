#include <sourcemod>

#define TARGET_WORD "word"

int g_iWordCount = 0;

public Action:OnClientSay(int client, char[] szText) 
{
    if (StrContains(szText, TARGET_WORD, false, true) != -1) 
    {
        g_iWordCount++;
        PrintToChatAll("Word count: %d", g_iWordCount);
    }
    return Plugin_Continue;
}

public Plugin:myinfo() 
{
    return Plugin_Handled;
}

public void OnPluginStart() 
{
    RegisterPlugin("SimpleWordCounter", "1.0", "Author");
    HookEvent("player_say", OnClientSay);
}
