local ADDON_NAME = "TrackStuff"

local defaultIcon = 132150
local addon = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true)
local dataObject = LibStub("LibDataBroker-1.1"):NewDataObject(ADDON_NAME, {
	type = "data source",
	text = ADDON_NAME,
	icon = defaultIcon
})

function addon:OnInitialize()
    LibStub("LibDBIcon-1.0"):Register(ADDON_NAME, dataObject)
end

function addon:GetTrackingInfoByName(name)
    if not self.trackableByName then
        self.trackableByName = {}
        for k, v in ipairs(L["trackables"]) do
            self.trackableByName[v] = k
        end
    end
    local trackable = self.trackableByName[name]
    if not trackable then return end
    return self.trackingInfo[trackable]
end

function addon:GetTrackingInfoBySpellId(spellId)
    local trackable = TrackingSpells[spellId]
    if not trackable then return end
    return self.trackingInfo[trackable]
end

function addon:CacheTrackingInfo()
    self.trackingInfo = {}
    local numTrackingTypes = GetNumTrackingTypes();
    for i=1,numTrackingTypes do
        local name, _, _, _, _, spellId = GetTrackingInfo(i);
        if spellId then
            local trackable = TrackingSpells[spellId]
            local _, _, spellIcon = GetSpellInfo(spellId)
            if trackable then
                self.trackingInfo[trackable] = {
                    trackingId = i,
                    icon = spellIcon
                }
            end
        end
    end
end

function addon:SetTracking(tracking)
    if not tracking then return end
    local _, _, active = GetTrackingInfo(tracking.trackingId)
    if active then return end

    SetTracking(tracking.trackingId, true)
    self:SetIcon(tracking.icon)
end

function addon:SetIcon(icon)
    dataObject.icon = icon
end

function addon:OnPlayerTargetChanged()
    local unitTypeName = UnitCreatureType("target")
    if not unitTypeName then return end

    local trackingInfo = self:GetTrackingInfoByName(unitTypeName)
    self:SetTracking(trackingInfo)
end

function addon:OnPlayerEnteringWorld()
    self:CacheTrackingInfo()
    self.player = GetUnitName("player")
    local numTrackingTypes = GetNumTrackingTypes();
    for i=1,numTrackingTypes do
        local name, _, active, _, _, spellId = GetTrackingInfo(i);
        if spellId and active then
            local _, _, spellIcon = GetSpellInfo(spellId)
            self:SetIcon(spellIcon)
        end
    end
end

function addon:OnCombatLogEvent()
    local _, event, _, _, name, _, _, _, _, _, _, spellId = CombatLogGetCurrentEventInfo()
    if name ~= self.player then return end
    if event == "SPELL_AURA_APPLIED" then
        local trackingInfo = self:GetTrackingInfoBySpellId(spellId)
        self:SetIcon(trackingInfo.icon)
        return
    end
    if event == "SPELL_AURA_REMOVED" then
        local trackingInfo = self:GetTrackingInfoBySpellId(spellId)
        if trackingInfo then
            self:SetIcon(defaultIcon)
        end
        return
    end
end

addon:RegisterEvent("PLAYER_TARGET_CHANGED", "OnPlayerTargetChanged")
addon:RegisterEvent("PLAYER_ENTERING_WORLD", "OnPlayerEnteringWorld")
addon:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "OnCombatLogEvent")
