local aux_util = require("openmw_aux.util")
local nearby = require("openmw.nearby")
local self = require("openmw.self")
local core = require("openmw.core")

require("scripts.DeadMerTellNoTales.utils.tables")

local function ownershipFilter(object)
    return object.owner.recordId == self.recordId
end

local function removeOwnership()
    local items, _ = aux_util.mapFilter(nearby.items, ownershipFilter)
    local containers, _ = aux_util.mapFilter(nearby.containers, ownershipFilter)
    local activators, _ = aux_util.mapFilter(nearby.activators, ownershipFilter)
    local doors, _ = aux_util.mapFilter(nearby.doors, ownershipFilter)

    local objects = MergeTables(items, containers, activators, doors)

    core.sendGlobalEvent("disown", objects)
end

return {
    eventHandlers = {
        Died = function ()
            removeOwnership()
            core.sendGlobalEvent("recordDead", self.recordId)
        end
    }
}
