local world = require("openmw.world")

local function disown(objects)
    for _, object in ipairs(objects) do
        object.owner.recordId = nil
    end
end

local function onObjectActive(object)
    if object.owner.recordId ~= nil then
        for _, player in ipairs(world.players) do
            player:sendEvent("checkActorStatus", object)
        end
    end
end

local function recordDead(recordId)
    for _, player in ipairs(world.players) do
        player:sendEvent("setDeadActor", recordId)
    end
end

return {
    engineHandlers = {
        onObjectActive = onObjectActive
    },
    eventHandlers = {
        disown = disown,
        recordDead = recordDead,
    }
}