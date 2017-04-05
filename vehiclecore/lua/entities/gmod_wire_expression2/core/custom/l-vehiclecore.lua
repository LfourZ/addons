E2Lib.RegisterExtension("vehiclecore", false)

local vcoreRestrict = CreateConVar("wire_e2_vehiclecore_restrict", "1", FCVAR_SERVER_CAN_EXECUTE, "If enabled, functions that change vehicle stats will only work on entities that you own.")

__e2setcost(1)

local VehicleEnterAlert = {}
local runByVehicleEnter = 0
local lastEnteredVehicle = nil
local lastEnteredVehiclePly = nil
local lastEnteredVehicleRole = nil

hook.Add("PlayerEnteredVehicle","Exp2VehicleEnter", function(ply, veh, role)
    lastEnteredVehicle = veh
    lastEnteredVehiclePly = ply
    lastEnteredVehicleRole = role
    runByVehicleEnter = 1
    for e,_ in pairs(VehicleEnterAlert) do
        if IsValid(e) then
            e:Execute()
        else
            VehicleEnterAlert[e] = nil
        end
    end
    runByVehicleEnter = 0
end)

e2function void runOnVehicleEnter(number activate)
    if activate ~= 0 then
        VehicleEnterAlert[self.entity] = true
    else
        VehicleEnterAlert[self.entity] = nil
    end
end

e2function entity lastEnteredVehicle()
    return lastEnteredVehicle
end

e2function entity lastEnteredVehiclePly()
    return lastEnteredVehiclePly
end

e2function number lastEnteredVehicleRole()
    return lastEnteredVehicleRole
end

e2function number vehicleEnterClk()
    return runByVehicleEnter
end

local VehicleLeaveAlert = {}
local runByVehicleLeave = 0
local lastLeftVehicle = nil
local lastLeftVehiclePly = nil

hook.Add("PlayerLeaveVehicle","Exp2VehicleLeave", function(ply, veh)
    lastLeftVehicle = veh
    lastLeftVehiclePly = ply
    runByVehicleLeave = 1
    for e,_ in pairs(VehicleLeaveAlert) do
        if IsValid(e) then
            e:Execute()
        else
            VehicleLeaveAlert[e] = nil
        end
    end
    runByVehicleLeave = 0
end)

e2function void runOnVehicleLeave(number activate)
    if activate ~= 0 then
        VehicleLeaveAlert[self.entity] = true
    else
        VehicleLeaveAlert[self.entity] = nil
    end
end

e2function entity lastLeftVehicle()
    return lastLeftVehicle
end

e2function entity lastLeftVehiclePly()
    return lastLeftVehiclePly
end

e2function number vehicleLeaveClk()
    return runByVehicleLeave
end

--Start normal functions

e2function number entity:boostTimeLeft()
	if not this or not this:IsVehicle() then return end
	return this:BoostTimeLeft()
end

e2function void entity:enableEngine(number enable)
	if not this or not this:IsVehicle() then return end
	this:EnableEngine(enable == 1)
end

e2function number entity:getCameraDistance()
	if not this or not this:IsVehicle() then return end
	return this:GetCameraDistance()
end

e2function entity entity:getDriver()
	if not this or not this:IsVehicle() then return end
	return this:GetDriver()
end

e2function number entity:getHLSpeed()
	if not this or not this:IsVehicle() then return end
	return this:GetHLSpeed()
end

e2function number entity:getMaxSpeed()
	if not this or not this:IsVehicle() then return end
	return this:GetMaxSpeed()
end

--[[e2function table entity:getOperatingParams() --I couldn't get the table to work, will return
	if not this or not this:IsVehicle() then return end
	return this:GetOperatingParams()
end]]--

e2function entity entity:getPassenger(number passenger)
	if not this or not this:IsVehicle() then return end
	return this:GetPassenger(passenger)
end

e2function vector entity:getPassengerSeatPointVec(number role)
	if not this or not this:IsVehicle() then return end
	local v, a = this:GetPassengerSeatPoint(role)
	return v
end

e2function angle entity:getPassengerSeatPointAng(number role)
	if not this or not this:IsVehicle() then return end
	local v, a = this:GetPassengerSeatPoint(role)
	return a
end

e2function number entity:getRPM()
	if not this or not this:IsVehicle() then return end
	return this:GetRPM()
end

e2function number entity:getSpeed()
	if not this or not this:IsVehicle() then return end
	return this:GetSpeed()
end

e2function number entity:getSteering()
	if not this or not this:IsVehicle() then return end
	return this:GetSteering()
end

e2function number entity:getSteeringDegrees()
	if not this or not this:IsVehicle() then return end
	return this:GetSteeringDegrees()
end

e2function number entity:getThirdPersonMode()
	if not this or not this:IsVehicle() then return end
	local _bool = this:GetThirdPersonMode()
	if _bool == true then return 1 elseif _bool == false then return 0 else return end
end

e2function number entity:getThrottle()
	if not this or not this:IsVehicle() then return end
	return this:GetThrottle()
end

e2function string entity:getVehicleClass()
	if not this or not this:IsVehicle() then return end
	return this:GetVehicleClass()
end

--[[e2function table entity:getVehicleParams() --Assumed to be the same as getOperatingParams()
	if not this or not this:IsVehicle() then return end
	return this:GetVehicleParams()
end]]--

e2function vector entity:getVehicleViewPositionVec(number role)
	if not this or not this:IsVehicle() then return end
	local v, a, n = this:GetVehicleViewPosition(role)
	if this:GetPassenger(role) == NULL then
		v, a, n = Vector(0,0,0), Angle(0,0,0), 0
	end
	return v
end

e2function angle entity:getVehicleViewPositionAng(number role)
	if not this or not this:IsVehicle() then return end
	local v, a, n = this:GetVehicleViewPosition(role)
	if this:GetPassenger(role) == NULL then
		v, a, n = Vector(0,0,0), Angle(0,0,0), 0
	end
	return a
end

e2function number entity:getVehicleViewPositionFov(number role)
	if not this or not this:IsVehicle() then return end
	local v, a, n = this:GetVehicleViewPosition(role)
	if this:GetPassenger(role) == NULL then
		v, a, n = Vector(0,0,0), Angle(0,0,0), 0
	end
	return n
end

e2function entity entity:getWheel(number wheel)
	if not this or not this:IsVehicle() then return end
	return this:GetWheel(wheel)
end

e2function number entity:getWheelBaseHeight(number wheel)
	if not this or not this:IsVehicle() then return end
	return this:GetWheelBaseHeight(wheel)
end

e2function number entity:getWheelTotalHeight(number wheel)
	if not this or not this:IsVehicle() then return end
	return this:GetWheelTotalHeight(wheel)
end

e2function number entity:hasBoost()
	if not this or not this:IsVehicle() then return end
	local _bool = this:HasBoost()
	if _bool == true then return 1 elseif _bool == false then return 0 else return end
end

e2function number entity:hasBrakePedal()
	if not this or not this:IsVehicle() then return end
	local _bool = this:HasBrakePedal()
	if _bool == true then return 1 elseif _bool == false then return 0 else return end
end

e2function number entity:isBoosting()
	if not this or not this:IsVehicle() then return end
	local _bool = this:IsBoosting()
	if _bool == true then return 1 elseif _bool == false then return 0 else return end
end

e2function number entity:isEngineEnabled()
	if not this or not this:IsVehicle() then return end
	local _bool = this:IsEngineEnabled()
	if _bool == true then return 1 elseif _bool == false then return 0 else return end
end

e2function number entity:isEngineStarted()
	if not this or not this:IsVehicle() then return end
	local _bool = this:IsEngineStarted()
	if _bool == true then return 1 elseif _bool == false then return 0 else return end
end

e2function number entity:isValidVehicle()
	if not this or not this:IsVehicle() then return end
	local _bool = this:IsValidVehicle()
	if _bool == true then return 1 elseif _bool == false then return 0 else return end
end

e2function number entity:isVehicleBodyInWater()
	if not this or not this:IsVehicle() then return end
	local _bool = this:IsVehicleBodyInWater()
	if _bool == true then return 1 elseif _bool == false then return 0 else return end
end

e2function void entity:releaseHandbrake()
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:ReleaseHandbrake()
end

e2function void entity:setBoost(number boost)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetBoost(boost)
end

e2function void entity:setCameraDistance(number distance)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetCameraDistance(distance)
end

e2function void entity:setHandbrake(number handbrake)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetHandbrake(handbrake == 1)
end

e2function void entity:setHasBrakePedal(number brakePedal)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetHasBrakePedal(brakePedal == 1)
end

e2function void entity:setMaxReverseThrottle(number maxRevThrottle)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetMaxReverseThrottle(maxRevThrottle)
end

e2function void entity:setMaxThrottle(number maxThrottle)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetMaxThrottle(maxThrottle)
end

--[[e2function void entity:setSpringLength(number wheel, length) --Seems to crash the game regardless of values
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	length = math.Clamp(length, 1, 10)
	this:SetSpringLength(wheel, length)
end]]--

e2function void entity:setSteering(number steering)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetSteering(steering, 0)
end

e2function void entity:setSteeringDegrees(number steeringDegrees)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetSteeringDegrees(steeringDegrees)
end

e2function void entity:setThirdPersonMode(number enable)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetThirdPersonMode(enable == 1)
end

e2function void entity:setThrottle(number throttle)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetThrottle(throttle)
end

--[[e2function void entity:setVehicleClass(string class) --This shouldn't be enabled, unless you need it
	if not this or not this:IsVehicle() then return end
	this:setVehicleClass(class)
end]]--

--[[e2function void entity:setVehicleEntryAnim(number bOn) --Doesn't seem to work, simply makes jeeps and jalopys not work
	if not this or not this:IsVehicle() then return end
	this:SetVehicleEntryAnim(bOn == 1)
end]]--

--[[e2function void entity:setVehicleParams(table params) --Disabled due to the Get() counterpart not working
	if not this or not this:IsVehicle() then return end
	this:SetVehicleParams(params)
end]]--

e2function void entity:setWheelFriction(number wheel, number friction)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:SetWheelFriction(wheel, friction)
end

e2function void entity:startEngine(number start)
	if not this or not this:IsVehicle() then return end
	if not isOwner(self, this) and vcoreRestrict:GetBool() then return end
	this:StartEngine(start == 1)
end

--Start non-standart functions

e2function void entity:exitVehicle()
	if not this or not this:IsPlayer() then return end
	if vcoreRestrict:GetBool() then return end
	this:ExitVehicle()
end

e2function void entity:enterVehicle(entity vehicle)
	if not this or not this:IsPlayer() then return end
	if not vehicle or not vehicle:IsVehicle() then return end
	if not isOwner(self, vehicle) and vcoreRestrict:GetBool() then return end
	this:EnterVehicle(vehicle)
end
