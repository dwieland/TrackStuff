local L = LibStub("AceLocale-3.0"):NewLocale("TrackStuff", "enUS", true)
if not L then return end

L["trackables"] = {
    [Trackable.BEAST] = "Beast",
    [Trackable.DEMON] = "Demon",
    [Trackable.DRAGONKIN] = "Dragonkin",
    [Trackable.ELEMENTAL] = "Elemental",
    [Trackable.GIANT] = "Giant",
    [Trackable.HUMANOID] = "Humanoid",
    [Trackable.UNDEAD] = "Undead"
}
