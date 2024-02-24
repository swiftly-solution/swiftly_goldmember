function ReloadConfigCommand()
    commands:Register("gm_reload", function(playerid, args, argsCount, silent)
        local IsAdmin = exports["swiftly_admins"]:CallExport("HasFlags", playerid, "z")
    
        if playerid == -1 then
            config:Reload("goldmember")
            print("The config has been reloaded.")
        else
            local player = GetPlayer(playerid)
            if not player then return end
    
            if IsAdmin == 1 then
                config:Reload("goldmember")
                player:SendMsg(MessageType.Chat, config:Fetch("goldmember.Messages.ReloadConfig"))
            end
    
            if IsAdmin == 0 then
                player:SendMsg(MessageType.Chat, config:Fetch("goldmember.Messages.NoPremissions"))
            end
        end
    end)
end