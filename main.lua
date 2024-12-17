local addonName, addon = ...
local L = addon.L
local frame = CreateFrame("Frame")
local gray_level = 5 

local zonesByLevelAlliance = {
    [1] = {
        {name = "ZONE_ELWYNN_FOREST", minLevel = 1, maxLevel = 12, mapID = 1429},
        {name = "ZONE_DUN_MOROGH", minLevel = 1, maxLevel = 12, mapID = 1426},
        {name = "ZONE_TELDRASSIL", minLevel = 1, maxLevel = 12, mapID = 1438}
    },
    [10] = {
        {name = "ZONE_WESTFALL", minLevel = 10, maxLevel = 20, mapID = 1436},
        {name = "ZONE_DARKSHORE", minLevel = 11, maxLevel = 20, mapID = 1439},
        {name = "ZONE_LOCH_MODAN", minLevel = 10, maxLevel = 20, mapID = 1432}
    },
    [20] = {
        {name = "ZONE_REDRIDGE", minLevel = 15, maxLevel = 25, mapID = 1433},
        {name = "ZONE_DUSKWOOD", minLevel = 20, maxLevel = 30, mapID = 1431},
        {name = "ZONE_WETLANDS", minLevel = 20, maxLevel = 30, mapID = 1437},
        {name = "ZONE_ASHENVALE", minLevel = 20, maxLevel = 30, mapID = 1440}
    },
    [30] = {
        {name = "ZONE_STRANGLETHORN", minLevel = 30, maxLevel = 45, mapID = 1434},
        {name = "ZONE_ALTERAC", minLevel = 30, maxLevel = 40, mapID = 1416},
        {name = "ZONE_ARATHI", minLevel = 30, maxLevel = 40, mapID = 1417},
        {name = "ZONE_DESOLACE", minLevel = 30, maxLevel = 40, mapID = 1443}
    },
    [40] = {
        {name = "ZONE_BADLANDS", minLevel = 35, maxLevel = 45, mapID = 1418},
        {name = "ZONE_SWAMP_SORROWS", minLevel = 35, maxLevel = 45, mapID = 1435},
        {name = "ZONE_FERALAS", minLevel = 40, maxLevel = 50, mapID = 1444},
        {name = "ZONE_TANARIS", minLevel = 40, maxLevel = 50, mapID = 1446},
        {name = "ZONE_HINTERLANDS", minLevel = 40, maxLevel = 50, mapID = 1425}
    },
    [50] = {
        {name = "ZONE_SEARING_GORGE", minLevel = 45, maxLevel = 50, mapID = 1427},
        {name = "ZONE_BLASTED_LANDS", minLevel = 45, maxLevel = 55, mapID = 1419},
        {name = "ZONE_BURNING_STEPPES", minLevel = 50, maxLevel = 58, mapID = 1428},
        {name = "ZONE_WESTERN_PLAGUELANDS", minLevel = 51, maxLevel = 58, mapID = 1422},
        {name = "ZONE_EASTERN_PLAGUELANDS", minLevel = 53, maxLevel = 60, mapID = 1423},
        {name = "ZONE_WINTERSPRING", minLevel = 55, maxLevel = 60, mapID = 1452},
        {name = "ZONE_SILITHUS", minLevel = 55, maxLevel = 60, mapID = 1451},
        {name = "ZONE_UNGORO", minLevel = 48, maxLevel = 55, mapID = 1449},
        {name = "ZONE_AZSHARA", minLevel = 48, maxLevel = 55, mapID = 1447}
    }
}

local zonesByLevelHorde = {
    [1] = {
        {name = "ZONE_DUROTAR", minLevel = 1, maxLevel = 12, mapID = 1411},
        {name = "ZONE_MULGORE", minLevel = 1, maxLevel = 12, mapID = 1412},
        {name = "ZONE_TIRISFAL", minLevel = 1, maxLevel = 12, mapID = 1420}
    },
    [10] = {
        {name = "ZONE_SILVERPINE", minLevel = 10, maxLevel = 20, mapID = 1421},
        {name = "ZONE_BARRENS", minLevel = 10, maxLevel = 25, mapID = 1413},
        {name = "ZONE_STONETALON", minLevel = 15, maxLevel = 27, mapID = 1442}
    },
    [20] = {
        {name = "ZONE_ASHENVALE", minLevel = 20, maxLevel = 30, mapID = 1440},
        {name = "ZONE_HILLSBRAD", minLevel = 20, maxLevel = 30, mapID = 1424},
        {name = "ZONE_THOUSAND_NEEDLES", minLevel = 25, maxLevel = 35, mapID = 1441}
    },
    [30] = {
        {name = "ZONE_STRANGLETHORN", minLevel = 30, maxLevel = 45, mapID = 1434},
        {name = "ZONE_ARATHI", minLevel = 30, maxLevel = 40, mapID = 1417},
        {name = "ZONE_DESOLACE", minLevel = 30, maxLevel = 40, mapID = 1443},
        {name = "ZONE_ALTERAC", minLevel = 30, maxLevel = 40, mapID = 1416}
    },
    [40] = {
        {name = "ZONE_BADLANDS", minLevel = 35, maxLevel = 45, mapID = 1418},
        {name = "ZONE_SWAMP_SORROWS", minLevel = 35, maxLevel = 45, mapID = 1435},
        {name = "ZONE_FERALAS", minLevel = 40, maxLevel = 50, mapID = 1444},
        {name = "ZONE_TANARIS", minLevel = 40, maxLevel = 50, mapID = 1446},
        {name = "ZONE_HINTERLANDS", minLevel = 40, maxLevel = 50, mapID = 1425}
    },
    [50] = {
        {name = "ZONE_SEARING_GORGE", minLevel = 45, maxLevel = 50, mapID = 1427},
        {name = "ZONE_BLASTED_LANDS", minLevel = 45, maxLevel = 55, mapID = 1419},
        {name = "ZONE_BURNING_STEPPES", minLevel = 50, maxLevel = 58, mapID = 1428},
        {name = "ZONE_WESTERN_PLAGUELANDS", minLevel = 51, maxLevel = 58, mapID = 1422},
        {name = "ZONE_EASTERN_PLAGUELANDS", minLevel = 53, maxLevel = 60, mapID = 1423},
        {name = "ZONE_WINTERSPRING", minLevel = 55, maxLevel = 60, mapID = 1452},
        {name = "ZONE_SILITHUS", minLevel = 55, maxLevel = 60, mapID = 1451},
        {name = "ZONE_UNGORO", minLevel = 48, maxLevel = 55, mapID = 1449},
        {name = "ZONE_AZSHARA", minLevel = 48, maxLevel = 55, mapID = 1447}
    }
}

local function GetDifficultyColor(playerLevel, zoneMinLevel, zoneMaxLevel)
    local effectiveLevel
    
    if playerLevel <= zoneMinLevel then
        effectiveLevel = zoneMinLevel
    elseif playerLevel >= zoneMaxLevel then
        effectiveLevel = zoneMaxLevel
    else
        effectiveLevel = math.min(zoneMaxLevel, math.max(zoneMinLevel, playerLevel))
    end
    
    local levelDiff = effectiveLevel - playerLevel
    
    if levelDiff >= 5 then
        return 1, 0.1, 0.1 
    elseif levelDiff >= 3 then
        return 1, 0.5, 0.25 
    elseif levelDiff >= -2 then
        return 1, 1, 0       
    elseif -gray_level >= levelDiff then
        return 0.5, 0.5, 0.5 
    else
        return 0.25, 0.75, 0.25
    end
end


local function CreateMainWindow()
    local f = CreateFrame("Frame", "QuestZonesMainWindow", UIParent, "BasicFrameTemplateWithInset")
    f:SetSize(300, 400)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    
    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.title:SetPoint("TOP", f, "TOP", 0, -5)
    f.title:SetText(L["QUEST_ZONES_TITLE"])
    
    f.showAllZones = CreateFrame("CheckButton", nil, f, "UICheckButtonTemplate")
    f.showAllZones:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -25)
    f.showAllZones:SetSize(24, 24)
    
    f.showAllZonesText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.showAllZonesText:SetPoint("LEFT", f.showAllZones, "RIGHT", 2, 0)
    f.showAllZonesText:SetText(L["SHOW_ALL_ZONES"])
    
    f.scrollFrame = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
    f.scrollFrame:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -50)
    f.scrollFrame:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -30, 10)
    
    f.scrollChild = CreateFrame("Frame", nil, f.scrollFrame)
    f.scrollChild:SetSize(f.scrollFrame:GetWidth(), 1)
    f.scrollFrame:SetScrollChild(f.scrollChild)

    f.showAllZones:SetScript("OnClick", function()
        UpdateZoneList()
    end)
    
    return f
end

local function GetZoneQuests(zoneInfo)
    local quests = {
        active = {},
        completed = {}
    }
    local zoneName = L[zoneInfo.name]
    
    local currentSelection = GetQuestLogSelection()
    
    local numEntries = GetNumQuestLogEntries()
    local i = 1
    while i <= numEntries do
        local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(i)
        
        if isHeader then
            if title == zoneName then
                i = i + 1
                while i <= numEntries do
                    local questTitle, questLevel, _, questIsHeader, _, questIsComplete = GetQuestLogTitle(i)
                    
                    if questIsHeader then break end
                    
                    if questTitle then
                        table.insert(quests.active, {
                            title = questTitle,
                            level = questLevel,
                            isComplete = (questIsComplete == 1)
                        })
                    end
                    
                    i = i + 1
                end
                break
            end
        end
        i = i + 1
    end
    
    SelectQuestLogEntry(currentSelection)

    local function sortByLevel(a, b) return a.level < b.level end
    table.sort(quests.active, sortByLevel)
    table.sort(quests.completed, sortByLevel)
    
    return quests
end

local function CreateZoneButton(parent, zoneInfo, index, playerLevel)
    local button = CreateFrame("Button", nil, parent)
    button:SetSize(250, 20)
    button:SetPoint("TOPLEFT", parent, "TOPLEFT", 5, -5 - (index - 1) * 25)
    
    button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    
    button.zoneText = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.zoneText:SetPoint("LEFT", button, "LEFT", 5, 0)
    button.zoneText:SetText(L[zoneInfo.name])
    
    local r, g, b = GetDifficultyColor(playerLevel, zoneInfo.minLevel, zoneInfo.maxLevel)
    button.zoneText:SetTextColor(r, g, b)
    
    button.levelText = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.levelText:SetPoint("RIGHT", button, "RIGHT", -5, 0)
    button.levelText:SetText(string.format("(%d-%d)", zoneInfo.minLevel, zoneInfo.maxLevel))
    button.levelText:SetTextColor(0.7, 0.7, 0.7)
    
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(L[zoneInfo.name])
        GameTooltip:AddLine(" ")
        
        local quests = GetZoneQuests(zoneInfo)
        local playerLevel = UnitLevel("player")
        
        if #quests.active > 0 then
            for _, quest in ipairs(quests.active) do
 
                local levelDiff = quest.level - playerLevel
                local r, g, b
                if levelDiff >= 5 then
                    r, g, b = 1, 0.1, 0.1
                elseif levelDiff >= 3 then
                    r, g, b = 1, 0.5, 0.25
                elseif levelDiff >= -2 then
                    r, g, b = 1, 1, 0
                elseif levelDiff >= -8 then
                    r, g, b = 0.25, 0.75, 0.25
                else
                    r, g, b = 0.5, 0.5, 0.5
                end
                
                local statusText = quest.isComplete and " (|cFF00FF00" .. L["COMPLETED"] .. "|r)" or ""
                GameTooltip:AddLine(string.format("[%d] %s%s", quest.level, quest.title, statusText), r, g, b)
            end
        else
            GameTooltip:AddLine(L["NO_QUESTS_IN_ZONE"], 0.7, 0.7, 0.7)
        end
        
        GameTooltip:Show()
    end)
    
    button:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    
    button:SetScript("OnClick", function()
        WorldMapFrame:Show()
        WorldMapFrame:SetMapID(zoneInfo.mapID)
    end)
    
    return button
end

local function GetSortedZones(zonesByLevel)
    local allZones = {}
    
    for _, zones in pairs(zonesByLevel) do
        for _, zoneInfo in ipairs(zones) do
            table.insert(allZones, zoneInfo)
        end
    end
    
    table.sort(allZones, function(a, b)
        if a.minLevel == b.minLevel then
            return a.maxLevel < b.maxLevel
        else
            return a.minLevel < b.minLevel
        end
    end)
    
    return allZones
end

local function UpdateZoneList()
    if not addon.mainWindow or not addon.mainWindow.scrollChild then return end
    
    local playerLevel = UnitLevel("player")
    local _, playerFaction = UnitFactionGroup("player")
    local zonesByLevel = playerFaction == "Alliance" and zonesByLevelAlliance or zonesByLevelHorde
    local showAll = addon.mainWindow.showAllZones:GetChecked()
    
    if addon.mainWindow.scrollChild.buttons then
        for _, button in pairs(addon.mainWindow.scrollChild.buttons) do
            button:Hide()
            button = nil
        end
    end
    
    addon.mainWindow.scrollChild.buttons = {}
    local buttonIndex = 1
    local totalHeight = 0
    
    local sortedZones = GetSortedZones(zonesByLevel)
    
    for _, zoneInfo in ipairs(sortedZones) do
        local isGrey = zoneInfo.maxLevel < (playerLevel - gray_level)
        if showAll or (zoneInfo.minLevel <= playerLevel + 5 and not isGrey) then
            local button = CreateZoneButton(addon.mainWindow.scrollChild, zoneInfo, buttonIndex, playerLevel)
            table.insert(addon.mainWindow.scrollChild.buttons, button)
            buttonIndex = buttonIndex + 1
            totalHeight = totalHeight + 25
        end
    end
    
    addon.mainWindow.scrollChild:SetHeight(math.max(totalHeight, 1))
end


local minimapButton = CreateFrame("Button", "QuestZonesMinimapButton", Minimap)
QuestZonesDB = QuestZonesDB or {
    minimapPos = 45 
}

local function SetupMinimapButton()
    minimapButton:SetSize(31, 31)
    minimapButton:SetFrameStrata("MEDIUM")
    minimapButton:SetFrameLevel(8)
    
    minimapButton.icon = minimapButton:CreateTexture(nil, "BACKGROUND")
    minimapButton.icon:SetSize(25, 25)
    minimapButton.icon:SetPoint("CENTER", -2, 1)
    minimapButton.icon:SetTexture("Interface\\QuestFrame\\UI-QuestLog-BookIcon")
    
    minimapButton.border = minimapButton:CreateTexture(nil, "OVERLAY")
    minimapButton.border:SetSize(53, 53)
    minimapButton.border:SetPoint("TOPLEFT")
    minimapButton.border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    
    minimapButton:EnableMouse(true)
    minimapButton:SetMovable(false)
    minimapButton:RegisterForDrag("LeftButton")
    
    minimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    
    local function UpdatePosition()
        local angle = math.rad(QuestZonesDB.minimapPos or 45)
        local x = math.cos(angle) * 80
        local y = math.sin(angle) * 80
        minimapButton:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end
    
    local isDragging = false
    
    minimapButton:SetScript("OnDragStart", function(self)
        self:LockHighlight()
        isDragging = true
    end)
    
    minimapButton:SetScript("OnDragStop", function(self)
        self:UnlockHighlight()
        isDragging = false
    end)

    
    minimapButton:SetScript("OnUpdate", function(self)
        if isDragging then
            local xpos, ypos = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            local minimapX, minimapY = Minimap:GetCenter()
            minimapX = minimapX * scale
            minimapY = minimapY * scale
            
            local angle = math.deg(math.atan2(ypos - minimapY, xpos - minimapX))
            
            QuestZonesDB.minimapPos = angle
            
            UpdatePosition()
        end
    end)
    
    minimapButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if addon.mainWindow:IsShown() then
                addon.mainWindow:Hide()
            else
                addon.mainWindow:Show()
                UpdateZoneList()
            end
        end
    end)
    
    minimapButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine(L["QUEST_ZONES_TITLE"])
        GameTooltip:AddLine(L["CLICK_TO_TOGGLE"], 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    
    minimapButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    
    UpdatePosition()
    return minimapButton
end

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("QUEST_LOG_UPDATE")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        addon.mainWindow = CreateMainWindow()
        addon.minimapButton = SetupMinimapButton()
        UpdateZoneList()
        addon.mainWindow:Hide()
        print(L["ADDON_LOADED_MESSAGE"])
    elseif event == "PLAYER_LEVEL_UP" or event == "QUEST_LOG_UPDATE" then
        if addon.mainWindow and addon.mainWindow:IsShown() then
            UpdateZoneList()
        end
    end
end)

SLASH_QUESTZONES1 = "/qz"
SLASH_QUESTZONES2 = "/questzones"
SlashCmdList["QUESTZONES"] = function()
    if addon.mainWindow:IsShown() then
        addon.mainWindow:Hide()
    else
        addon.mainWindow:Show()
        UpdateZoneList()
    end
end

_G.UpdateZoneList = UpdateZoneList