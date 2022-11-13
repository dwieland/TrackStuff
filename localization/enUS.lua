local L = LibStub("AceLocale-3.0"):NewLocale("TrackFiends", "enUS", true)
if not L then return end

L["Autotracking is %s"] = true
L["ON"] = true
L["OFF"] = true
L["<Left Click> turns on tracking of hiddens"] = true
L["<Right Click> turns autotracking ON/OFF"] = true
L["trackables"] = {
    [Trackable.BEAST] = "Beast",
    [Trackable.DEMON] = "Demon",
    [Trackable.DRAGONKIN] = "Dragonkin",
    [Trackable.ELEMENTAL] = "Elemental",
    [Trackable.GIANT] = "Giant",
    [Trackable.HUMANOID] = "Humanoid",
    [Trackable.UNDEAD] = "Undead"
}
