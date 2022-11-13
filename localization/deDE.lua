local L = LibStub("AceLocale-3.0"):NewLocale("TrackStuff", "deDE")
if not L then return end

L["trackables"] = {
    [UnitType.BEAST] = "Wildtier",
    [UnitType.DEMON] = "Dämon",
    [UnitType.DRAGONKIN] = "Drachkin",
    [UnitType.ELEMENTAL] = "Elementar",
    [UnitType.GIANT] = "Riese",
    [UnitType.HUMANOID] = "Humanoid",
    [UnitType.UNDEAD] = "Untoter"
}
