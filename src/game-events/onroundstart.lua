function OnRoundStartEvent()
    events:on("OnRoundStart", function(timelimit, fraglimit, objective)
        for playerid = 0, playermanager:GetPlayerCount() -1, 1 do
            local player = GetPlayer(playerid)
            if not player then goto OnRoundStartcontinue end
            
            if HasDNS(player) then
                serverDNS = config:Fetch("goldmember.ServerDNS")
                player:SendMsg(MessageType.Chat, string.format(config:Fetch("goldmember.Messages.HasGoldMember"), serverDNS))
            else
                player:SendMsg(MessageType.Chat, config:Fetch("goldmember.Messages.NoGoldMember"))
            end
            ::OnRoundStartcontinue::
        end
    end)
end
