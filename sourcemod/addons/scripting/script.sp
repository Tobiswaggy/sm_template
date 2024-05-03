#include <sourcemod>

#define TARGET_WORD "Word"

int g_iWordCount = 0;

public Action OnClientSay(int client, const char[] text) 
{
    if (StrContains(text, TARGET_WORD, false, true) != -1) 
    {
        g_iWordCount++;
        PrintToChat(client, "Word count: %d", g_iWordCount);
    }
    return Plugin_Continue;
}

public Action Cmd_WordCount(int client, int args) 
{
    PrintToChat(client, "Word count: %d", g_iWordCount);
    return Plugin_Handled;
}

public void OnPluginStart() 
{
    HookEvent("player_say", Event_OnClientSay);
    RegisterCommand("wordcount", "Check how many times 'Word' has been said", ADMIN_CHAT, Cmd_WordCount);
}
