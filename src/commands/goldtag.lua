function GoldTagCommand()
    commands:Register("goldtag", function(playerid, args, argsCount, silent)
        if playerid == -1 then return end
        local player = GetPlayer(playerid)
        if not player then return end

        if HasDNS(player) then
            player:ShowMenu("goldtag_menu")
        end
    end)

    commands:Register("gm_settag", function(playerid, args, argc, silent)
        if playerid == -1 or argc == 0 then return end
        local player = GetPlayer(playerid)
        if not player then return end

        local tag = args[1]
        local togivetag = config:Fetch("goldmember.Benefits.GoldMemberTag.Tags["..tag.."]")

        player:SendMsg(MessageType.Chat, string.format(config:Fetch("goldmember.Benefits.GoldMemberTag.Message"), togivetag))
        player:clantag():Set(togivetag)
    end)
end

function GenerateMenu()
    menus:Unregister("goldtag_menu")
    local optionstbl = {}
    for i=0,config:FetchArraySize("goldmember.Benefits.GoldMemberTag.Tags")-1,1 do 
        table.insert(optionstbl, { config:Fetch("goldmember.Benefits.GoldMemberTag.Tags["..i.."]"), "sw_gm_settag "..i })
    end
    menus:Register("goldtag_menu", "Select a TAG", "344CEB", optionstbl)
end