E2Lib.RegisterExtension("weaponcore", false)

__e2setcost(1)

--Hooks

local WeaponSwitchAlert = {}
local runByWeaponSwitch = 0
local lastWeaponSwitchPly = nil
local oldWeapon = nil
local newWeapon = nil

hook.Add("PlayerSwitchWeapon","Exp2WeaponSwitch", function(ply, oldWeaponh, newWeaponh)
    lastWeaponSwitchPly = ply
    oldWeapon = oldWeaponh
    newWeapon = newWeaponh
    runByWeaponSwitch = 1
    for e,_ in pairs(WeaponSwitchAlert) do
        if IsValid(e) then
            e:Execute()
        else
            WeaponSwitchAlert[e] = nil
        end
    end
    runByWeaponSwitch = 0
end)

e2function void runOnWeaponSwitch(number activate)
    if activate ~= 0 then
        WeaponSwitchAlert[self.entity] = true
    else
        WeaponSwitchAlert[self.entity] = nil
    end
end

e2function entity lastWeaponSwitchPly()
    return lastWeaponSwitchPly
end

e2function entity oldWeapon()
    return oldWeapon
end

e2function entity newWeapon()
    return newWeapon
end

e2function number weaponSwitchClk()
    return runByWeaponSwitch
end

--Weapon functions-

--allowsAutoSwitchFrom
--allowsAutoSwitchTo
--callOnClient
--clip1 --Exists
--clip2 --Exists
--defaultReload
--getActivity

e2function string entity:getHoldType()
    if not this or not this:IsWeapon() then return end
    return this:GetHoldType()
end

e2function number entity:getMaxClip1()
    if not this or not this:IsWeapon() then return end
    return this:GetMaxClip1()
end

e2function number entity:getMaxClip2()
    if not this or not this:IsWeapon() then return end
    return this:GetMaxClip2()
end

e2function number entity:getNextPrimaryFire()
    if not this or not this:IsWeapon() then return end
    return this:GetNextPrimaryFire()
end

e2function number entity:getNextSecondaryFire()
    if not this or not this:IsWeapon() then return end
    return this:GetNextSecondaryFire()
end

e2function number entity:getPrimaryAmmoType()
    if not this or not this:IsWeapon() then return end
    return this:GetPrimaryAmmoType()
end

e2function number entity:getSlot()
    if not this or not this:IsWeapon() then return end
    return this:GetSlot()
end

e2function number entity:getSlotPos()
    if not this or not this:IsWeapon() then return end
    return this:GetSlotPos()
end

e2function string entity:getWeaponViewModel()
    if not this or not this:IsWeapon() then return end
    return this:GetWeaponViewModel()
end

e2function string entity:getWeaponWorldModel()
    if not this or not this:IsWeapon() then return end
    return this:GetWeaponWorldModel()
end

e2function number entity:getWeight()
    if not this or not this:IsWeapon() then return end
    return this:GetWeight()
end

e2function number entity:hasAmmo()
    if not this or not this:IsWeapon() then return end
    if this:HasAmmo() then return 1 else return 0 end
end

e2function number entity:isScripted()
    if not this or not this:IsWeapon() then return end
    if this:IsScripted() then return 1 else return 0 end
end

e2function number entity:isWeaponVisible()
    if not this or not this:IsWeapon() then return end
    if this:IsWeaponVisible() then return 1 else return 0 end
end

e2function number entity:lastShootTime()
    if not this or not this:IsWeapon() then return end
    return this:LastShootTime()
end

--sendWeaponAnim

e2function void entity:setClip1(number ammo)
    if not this or not this:IsWeapon() then return end
    this:SetClip1(ammo)
end

e2function void entity:setClip2(number ammo)
    if not this or not this:IsWeapon() then return end
    this:SetClip2(ammo)
end

e2function void entity:setHoldType(string name)
    if not this or not this:IsWeapon() then return end
    if not this:IsScripted() then return end
    this:SetHoldType(name)
end

--setLastShootTime --Doesn't exist in this version

e2function void entity:setNextPrimaryFire(number time)
    if not this or not this:IsWeapon() then return end
    this:SetNextPrimaryFire(time)
end

e2function void entity:setNextSecondaryFire(number time)
    if not this or not this:IsWeapon() then return end
    this:SetNextSecondaryFire(time)
end

--Self made functions

e2function void entity:givePrimaryAmmo(number amount)
    if not this or not this:IsPlayer() then return end
    if not this:GetActiveWeapon() then return end
    this:GiveAmmo(amount, this:GetActiveWeapon():GetPrimaryAmmoType())
end