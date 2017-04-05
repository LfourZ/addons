E2Lib.RegisterExtension("playercore", false)

__e2setcost(1)

local PlayerDeathAlert = {}
local runByPlayerDeath = 0
local lastKilled = nil
local lastDeathInflictor = nil
local lastDeathAttacker = nil

hook.Add("PlayerDeath","Exp2PlayerDeath", function(ply, inflictor, attacker)
    lastKilled = ply
    lastDeathInflictor = inflictor
    lastDeathAttacker = attacker
    runByPlayerDeath = 1
    for e,_ in pairs(PlayerDeathAlert) do
        if IsValid(e) then
            e:Execute()
        else
            PlayerDeathAlert[e] = nil
        end
    end
    runByVehicleEnter = 0
end)

e2function void runOnPlayerDeath(number activate)
    if activate ~= 0 then
        PlayerDeathAlert[self.entity] = true
    else
        PlayerDeathAlert[self.entity] = nil
    end
end

e2function entity lastKilledPlayer()
    return lastKilled
end

e2function entity lastDeathInflictor()
    return lastDeathInflictor
end

e2function entity lastDeathAttacker()
    return lastDeathAttacker
end

e2function number playerDeathClk()
    return runByPlayerDeath
end
