function OnPlayerSpawnEvent()
    events:on("OnPlayerSpawn", function(playerid)
        local player = GetPlayer(playerid)
        if not player then return end
        local PistolRound = server:IsPistolRound()

        if PistolRound == 0 then
            if HasDNS(player) then
                NextTick(function()
                    player:health():Set(config:Fetch("goldmember.Benefits.HP"))
                    player:armor():Set(config:Fetch("goldmember.Benefits.Armor"))
                end)
                player:money():Set(player:money():Get() + config:Fetch("goldmember.Benefits.Money"))

                local GiveDefuseKit = config:Fetch("goldmember.Benefits.DefuseKit")

                if GiveDefuseKit == 1 then
                    local team = player:team():Get()
                    if team == TEAM_CT then
                        player:weapons():GiveWeapons("item_defuser")
                    end
                end

                local GiveHealthShots = config:Fetch("goldmember.Benefits.HealthShot")

                for i = 1, GiveHealthShots do
                    player:weapons():GiveWeapons("weapon_healthshot")
                end

                local GiveGrenades = config:Fetch("goldmember.Benefits.GoldMemberGrenades.GiveGreandes")

                if GiveGrenades == 1 then
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

                local GiveScoreboardTag = config:Fetch("goldmember.Benefits.GoldMemberTag.GiveScoreboardTag")
            end
        end
    end)
end