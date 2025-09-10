local storage = require("openmw.storage")
local core = require("openmw.core")

require("scripts.DeadMerTellNoTales.cellBlacklist")

local sectionDeadActors = storage.playerSection("deadActors")

local function checkActorStatus(object)
    if sectionDeadActors:get(object.owner.recordId) then
        if CellBlacklist[string.lower(object.cell.name)] then return end
        if object.cell.isExterior then
            local cellCoords = tostring(object.cell.gridX) .. "," .. tostring(object.cell.gridY)
            if CellBlacklist[cellCoords] then return end
        end
        core.sendGlobalEvent("disown", {object})
    end
end

local function setDeadActor(recordId)
    sectionDeadActors:set(recordId, true)
end

return {
    eventHandlers = {
        checkActorStatus = checkActorStatus,
        setDeadActor = setDeadActor,
    }
}