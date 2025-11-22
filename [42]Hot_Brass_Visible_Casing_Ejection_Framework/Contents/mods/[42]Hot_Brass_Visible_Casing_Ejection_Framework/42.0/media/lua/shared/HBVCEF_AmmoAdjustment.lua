local function doParam(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    Item:DoParam(Property .. " = " .. Value)
end

-- AMMO MODELS
doParam("Base.Bullets9mm", "WorldStaticModel", "New_9mm_Round")
doParam("Base.Bullets45", "WorldStaticModel", "New_45_Round")
doParam("Base.Bullets44", "WorldStaticModel", "New_44_Round")
doParam("Base.Bullets38", "WorldStaticModel", "New_38_Round")
doParam("Base.308Bullets", "WorldStaticModel", "New_308_Round")
doParam("Base.223Bullets", "WorldStaticModel", "New_223_Round")
doParam("Base.556Bullets", "WorldStaticModel", "New_556_Round")
doParam("Base.ShotgunShells", "WorldStaticModel", "New_Shotgun_Round")

-- AMMO ICONS
doParam("Base.ShotgunShells", "icon", "ShotgunShell")
doParam("Base.Bullets9mm", "icon", "9Bullets")
doParam("Base.Bullets45", "icon", "45Bullets")
doParam("Base.Bullets44", "icon", "44Bullets")
doParam("Base.Bullets38", "icon", "38Bullets")
doParam("Base.308Bullets", "icon", "308Bullets")
doParam("Base.556Bullets", "icon", "556Bullets")
doParam("Base.223Bullets", "icon", "223Bullets")

-- --Shotgun Modifiers
doParam("Base.DoubleBarrelShotgun", "ManuallyRemoveSpentRounds", "true")
doParam("Base.DoubleBarrelShotgunSawnoff", "ManuallyRemoveSpentRounds", "true")
