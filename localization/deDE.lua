local L = LibStub("AceLocale-3.0"):NewLocale("TrackFiends", "deDE")
if not L then return end

L["Autotracking is %s"] = "Die Autoaufspüren ist %s"
L["ON"] = "AKTIVIERT"
L["OFF"] = "DEAKTIVIERT"
L["<Left Click> turns on tracking of hiddens"] = "<Linksklick> aktiviert aufspüren hiddens"
L["<Right Click> turns autotracking ON/OFF"] = "<Rechtsklick> dreht Autoaufspüren ON / OFF"
L["trackables"] = {
    [UnitType.BEAST] = "Wildtier",
    [UnitType.DEMON] = "Dämon",
    [UnitType.DRAGONKIN] = "Drachkin",
    [UnitType.ELEMENTAL] = "Elementar",
    [UnitType.GIANT] = "Riese",
    [UnitType.HUMANOID] = "Humanoid",
    [UnitType.UNDEAD] = "Untoter"
}
