local storage = require("openmw.storage")

require("scripts.DeadMerTellNoTales.cellBlacklist")

local sectionDeadActors = storage.globalSection("deadActors")

local function disown(objects)
    for _, object in ipairs(objects) do
        object.owner.recordId = nil
    end
end

local function onObjectActive(object)
    if object.owner.recordId ~= nil then
        if sectionDeadActors:get(object.owner.recordId) then
            -- check blacklist
            if CellBlacklist[string.lower(object.cell.name)] then return end
            if object.cell.isExterior then
                local cellCoords = tostring(object.cell.gridX) .. "," .. tostring(object.cell.gridY)
                if CellBlacklist[cellCoords] then return end
            end

            disown({object})
        end
    end
end

local function recordDead(recordId)
    sectionDeadActors:set(recordId, true)
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