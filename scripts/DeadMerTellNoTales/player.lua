local core = require("openmw.core")

require("scripts.DeadMerTellNoTales.utils.consts")

local function onQuestUpdate(questId, stage)
    local edgecase = QuestEdgecases[questId]
    if not (edgecase and stage >= edgecase.stage) then return end
    core.sendGlobalEvent("recordDead", edgecase.actor)
end

return {
    engineHandlers = {
        onQuestUpdate = onQuestUpdate
    }
}