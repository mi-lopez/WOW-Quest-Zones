local addonName, addon = ...

local L = {}
local LOCALE = GetLocale()

-- Spanish Translations
if LOCALE == "esES" or LOCALE == "esMX" then
    -- Zonas de nivel 1-10
    L["ZONE_ELWYNN_FOREST"] = "Bosque de Elwynn"
    L["ZONE_DUN_MOROGH"] = "Dun Morogh"
    L["ZONE_TELDRASSIL"] = "Teldrassil"
    L["ZONE_DUROTAR"] = "Durotar"
    L["ZONE_MULGORE"] = "Mulgore"
    L["ZONE_TIRISFAL"] = "Claros de Tirisfal"

    -- Zonas de nivel 10-20
    L["ZONE_WESTFALL"] = "Páramos de Poniente"
    L["ZONE_LOCH_MODAN"] = "Loch Modan"
    L["ZONE_DARKSHORE"] = "Costa Oscura"
    L["ZONE_SILVERPINE"] = "Bosque de Argénteos"
    L["ZONE_BARRENS"] = "Los Baldíos"

    -- Zonas de nivel 20-30
    L["ZONE_REDRIDGE"] = "Montañas Crestagrana"
    L["ZONE_DUSKWOOD"] = "Bosque del Ocaso"
    L["ZONE_WETLANDS"] = "Los Humedales"
    L["ZONE_ASHENVALE"] = "Vallefresno"
    L["ZONE_STONETALON"] = "Montañas Stonetalon"
    L["ZONE_HILLSBRAD"] = "Laderas de Trabalomas"

    -- Zonas de nivel 30-40
    L["ZONE_ARATHI"] = "Tierras Altas de Arathi"
    L["ZONE_DESOLACE"] = "Desolace"
    L["ZONE_STRANGLETHORN"] = "Vega de Tuercespina"
    L["ZONE_ALTERAC"] = "Montañas de Alterac"
    L["ZONE_THOUSAND_NEEDLES"] = "Las Mil Agujas"

    -- Zonas de nivel 40-50
    L["ZONE_BADLANDS"] = "Tierras Inhóspitas"
    L["ZONE_SWAMP_SORROWS"] = "Pantano de las Penas"
    L["ZONE_FERALAS"] = "Feralas"
    L["ZONE_TANARIS"] = "Tanaris"
    L["ZONE_HINTERLANDS"] = "Tierras del Interior"

    -- Zonas de nivel 50-60
    L["ZONE_SEARING_GORGE"] = "La Garganta de Fuego"
    L["ZONE_BLASTED_LANDS"] = "Las Tierras Devastadas"
    L["ZONE_BURNING_STEPPES"] = "Las Estepas Ardientes"
    L["ZONE_WESTERN_PLAGUELANDS"] = "Tierras de la Peste del Oeste"
    L["ZONE_EASTERN_PLAGUELANDS"] = "Tierras de la Peste del Este"
    L["ZONE_WINTERSPRING"] = "Cuna del Invierno"
    L["ZONE_SILITHUS"] = "Silithus"
    L["ZONE_UNGORO"] = "Cráter de Un'Goro"
    L["ZONE_AZSHARA"] = "Azshara"

    -- Títulos y otros textos
    L["QUEST_ZONES_TITLE"] = "Zonas de Quest"
    L["SHOW_ALL_ZONES"] = "Mostrar todas las zonas" -- Nueva línea añadida
    L["CLICK_TO_TOGGLE"] = "Click izquierdo para mostrar/ocultar la ventana"
    L["COMPLETED"] = "Completadas"
    L["NO_QUESTS_IN_ZONE"] = "No tienes misiones activas en esta zona"
    L["ADDON_LOADED_MESSAGE"] = "Addon Quest Zones cargado. Escribe /qz para activar o desactivar."

else
    -- English (Default) Translations
    -- Level 1-10 Zones
    L["ZONE_ELWYNN_FOREST"] = "Elwynn Forest"
    L["ZONE_DUN_MOROGH"] = "Dun Morogh"
    L["ZONE_TELDRASSIL"] = "Teldrassil"
    L["ZONE_DUROTAR"] = "Durotar"
    L["ZONE_MULGORE"] = "Mulgore"
    L["ZONE_TIRISFAL"] = "Tirisfal Glades"

    -- Level 10-20 Zones
    L["ZONE_WESTFALL"] = "Westfall"
    L["ZONE_LOCH_MODAN"] = "Loch Modan"
    L["ZONE_DARKSHORE"] = "Darkshore"
    L["ZONE_SILVERPINE"] = "Silverpine Forest"
    L["ZONE_BARRENS"] = "The Barrens"

    -- Level 20-30 Zones
    L["ZONE_REDRIDGE"] = "Redridge Mountains"
    L["ZONE_DUSKWOOD"] = "Duskwood"
    L["ZONE_WETLANDS"] = "Wetlands"
    L["ZONE_ASHENVALE"] = "Ashenvale"
    L["ZONE_STONETALON"] = "Stonetalon Mountains"
    L["ZONE_HILLSBRAD"] = "Hillsbrad Foothills"

    -- Level 30-40 Zones
    L["ZONE_ARATHI"] = "Arathi Highlands"
    L["ZONE_DESOLACE"] = "Desolace"
    L["ZONE_STRANGLETHORN"] = "Stranglethorn Vale"
    L["ZONE_ALTERAC"] = "Alterac Mountains"
    L["ZONE_THOUSAND_NEEDLES"] = "Thousand Needles"

    -- Level 40-50 Zones
    L["ZONE_BADLANDS"] = "Badlands"
    L["ZONE_SWAMP_SORROWS"] = "Swamp of Sorrows"
    L["ZONE_FERALAS"] = "Feralas"
    L["ZONE_TANARIS"] = "Tanaris"
    L["ZONE_HINTERLANDS"] = "The Hinterlands"

    -- Level 50-60 Zones
    L["ZONE_SEARING_GORGE"] = "Searing Gorge"
    L["ZONE_BLASTED_LANDS"] = "Blasted Lands"
    L["ZONE_BURNING_STEPPES"] = "Burning Steppes"
    L["ZONE_WESTERN_PLAGUELANDS"] = "Western Plaguelands"
    L["ZONE_EASTERN_PLAGUELANDS"] = "Eastern Plaguelands"
    L["ZONE_WINTERSPRING"] = "Winterspring"
    L["ZONE_SILITHUS"] = "Silithus"
    L["ZONE_UNGORO"] = "Un'Goro Crater"
    L["ZONE_AZSHARA"] = "Azshara"

    -- Titles and other text
    L["QUEST_ZONES_TITLE"] = "Quest Zones"
    L["SHOW_ALL_ZONES"] = "Show All Zones" -- Nueva línea añadida
    L["CLICK_TO_TOGGLE"] = "Left click to show/hide window"
    L["COMPLETED"] = "Completed"
    L["NO_QUESTS_IN_ZONE"] = "No active quests in this zone"
    L["ADDON_LOADED_MESSAGE"] = "Quest Zones addon loaded. Type /qz to toggle."

end

addon.L = L