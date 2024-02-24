function OnRoundStartEvent()
    events:on("OnRoundStart", function(timelimit, fraglimit, objective)
        local PistolRound = server:IsPistolRound()

        for playerid = 0, playermanager:GetPlayerCap() - 1, 1 do
            local player = GetPlayer(playerid)
            if player then
                if PistolRound ~= 0 and HasDNS(player) then
                    player:SendMsg(MessageType.Chat, config:Fetch("goldmember.Messages.DisabledGoldMember"))
                elseif not HasDNS(player) then
                    local ServerDNS = config:Fetch("goldmember.ServerDNS")
                    player:SendMsg(MessageType.Chat, string.format(config:Fetch("goldmember.Messages.NoGoldMember"), ServerDNS))
                else
                    player:SendMsg(MessageType.Chat, config:Fetch("goldmember.Messages.HasGoldMember"))
                end
            end
        end
    end)
end