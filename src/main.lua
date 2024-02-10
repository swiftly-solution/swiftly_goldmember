function HasDNS(player)
    local playerName = player:GetName()
    local serverDNS = config:Fetch("goldmember.ServerDNS")

    local hasDNS = string.find(playerName, serverDNS, 1, true) ~= nil
    return hasDNS
end

events:on("OnPluginStart", function()
    GoldTagCommand()
    GenerateMenu()
    ReloadConfigCommand()
    OnPlayerSpawnEvent()
    OnRoundStartEvent()
end)

function GetPluginAuthor()
    return "Swiftly Solution"
end
function GetPluginVersion()
    return "v1.0.0"
end
function GetPluginName()
    return "Swiftly Gold Member"
end
function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_goldmember"
end