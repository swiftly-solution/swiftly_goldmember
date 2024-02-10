function OnPlayerSpawnEvent()
    events:on("OnPlayerSpawn", function(playerid)
        local player = GetPlayer(playerid)
        if not player then return end

        if HasDNS(player) then
            player:health():Set(config:Fetch("goldmember.Benefits.HP"))
            player:money():Set(player:money():Get() + config:Fetch("goldmember.Benefits.Money"))
            player:armor():Set(config:Fetch("goldmember.Benefits.Armor"))

            local givedefusekit = config:Fetch("goldmember.Benefits.DefuseKit")

            if givedefusekit == 1 then
                local team = player:team():Get()
                if team == TEAM_CT then
                    player:weapons():GiveWeapons("item_defuser")
                end
            end

            local givegrenades = config:Fetch("goldmember.Benefits.GoldMemberGrenades.GiveGreandes")

            if givegrenades == 1 then
                local hegrenades = config:Fetch("goldmember.Benefits.GoldMemberGrenades.Grenades.HighExplosive")
                local smokegrenade = config:Fetch("goldmember.Benefits.GoldMemberGrenades.Grenades.Smoke")
                local flashbang = config:Fetch("goldmember.Benefits.GoldMemberGrenades.Grenades.Flashbang")
                local molotovincendiary = config:Fetch("goldmember.Benefits.GoldMemberGrenades.Grenades.Molotov_Incendiary")
                local decoy = config:Fetch("goldmember.Benefits.GoldMemberGrenades.Grenades.Decoy")

                if hegrenades == 1 then
                    player:weapons():GiveWeapons("weapon_hegrenade")
                end
                if smokegrenade == 1 then
                    player:weapons():GiveWeapons("weapon_smokegrenade")
                end
                for i = 1, flashbang do
                    player:weapons():GiveWeapons("weapon_flashbang")
                end
                if molotovincendiary == 1 then
                    local team = player:team():Get()
                    if team == TEAM_CT then
                        player:weapons():GiveWeapons("weapon_incgrenade")
                    elseif team == TEAM_T then
                        player:weapons():GiveWeapons("weapon_molotov")
                    end
                end
                if decoy == 1 then
                    player:weapons():GiveWeapons("weapon_decoy")
                end
            end

            local givescoreboardtag = config:Fetch("goldmember.Benefits.GoldMemberTag.GiveScoreboardTag")
        end
    end)
end