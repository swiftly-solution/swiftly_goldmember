function ReloadConfigCommand()
    commands:Register("gm_reload", function(playerid, args, argsCount, silent)
        if playerid == -1 then
            config:Reload("goldmember")
            print("The config has been reloaded.")
        else
            local player = GetPlayer(playerid)
            if not player then return end

            config:Reload("goldmember")
            player:SendMsg(MessageType.Chat, "hau mau pau")
        end

        GenerateMenu()
    end)
end