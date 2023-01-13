AutoLoggerWotlk = AutoLoggerWotlk or
    LibStub("AceAddon-3.0"):NewAddon("AutoLoggerWotlk", "AceConsole-3.0", "AceEvent-3.0")

AutoLoggerWotlk.name = "AutoLoggerWotlk"
AutoLoggerWotlk.version = "1.0.1"

AutoLoggerWotlk.raids = {
    -- Naxxramas
    [533] = true,
    -- The Obsidian Sanctum
    [615] = true,
    -- The Eye Of Eternity
    [616] = true,
    -- Vault of Archavon
    [624] = true,
    -- Ulduar
    [603] = true,
    -- Trial of the Crusader
    [649] = true,
    -- Onyxia's Lair
    [249] = true,
    -- Icecrown Citadel
    [631] = true,
    -- The Ruby Sanctum
    [724] = true,
}
--[[
    Initializing the addon using Ace3.
    It includes options, commands, saved variables and basic events to register to.
--]]

function AutoLoggerWotlk:OnInitialize()
end

function AutoLoggerWotlk:OnEnable()
    self:RegisterEvent("UPDATE_INSTANCE_INFO")
    AutoLoggerWotlk:CheckInstanceAndLog()
end

function AutoLoggerWotlk:OnDisable()
end

--[[
    Events
--]]

function AutoLoggerWotlk:UPDATE_INSTANCE_INFO()
    AutoLoggerWotlk:CheckInstanceAndLog()
end

--[[
    Core functions
--]]

function AutoLoggerWotlk:CheckInstanceAndLog()
    local name, _, _, _, _, _, _, instanceID, instanceGroupSize, _ = GetInstanceInfo()
    if AutoLoggerWotlk.raids[tonumber(instanceID)] then
        if not LoggingCombat() then
            LoggingCombat(true)
            self:Print("Combat logging |cff33ff00activated|r for " .. name .. " (" .. instanceGroupSize .. ").")
        end
    else
        if LoggingCombat() then
            self:Print("Combat logging |cffff0000deactivated|r (not in a WotLK raid).")
            LoggingCombat(false)
        end
    end
end
