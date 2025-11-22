SpentCasingPhysics = {}

---Vanilla Weapons
-- SpentCasingPhysics.WeaponEjectionPortParams = {
--     --Pistols
--     ["Base.Pistol3"] = {
--         casing = "Base.Bullets44_Casing",
--         ammo = "Base.Bullets44",
--         forwardOffset = 0.50,
--         sideOffset = 0.0,
--         heightOffset = 0.45,
--         shellForce = 0.30,
--         manualEjection = false
--     },

--     ["Base.Pistol2"] = {
--         casing = "Base.Bullets45_Casing",
--         ammo = "Base.Bullets45",
--         forwardOffset = 0.50,
--         sideOffset = 0.0,
--         heightOffset = 0.45,
--         shellForce = 0.25,
--         manualEjection = false
--     },

--     ["Base.Revolver_Short"] = {
--         casing = "Base.Bullets38_Casing",
--         ammo = "Base.Bullets38",
--         forwardOffset = 0.15,
--         sideOffset = 0.0,
--         heightOffset = 0.35,
--         shellForce = 0.10,
--         manualEjection = true
--     },

--     ["Base.Revolver"] = {
--         casing = "Base.Bullets45_Casing",
--         ammo = "Base.Bullets45",
--         forwardOffset = 0.15,
--         sideOffset = 0.0,
--         heightOffset = 0.35,
--         shellForce = 0.10,
--         manualEjection = true
--     },

--     ["Base.Pistol"] = {
--         casing = "Base.Bullets9mm_Casing",
--         ammo = "Base.Bullets9mm",
--         forwardOffset = 0.50,
--         sideOffset = 0.0,
--         heightOffset = 0.45,
--         shellForce = 0.25,
--         manualEjection = false
--     },

--     ["Base.Revolver_Long"] = {
--         casing = "Base.Bullets44_Casing",
--         ammo = "Base.Bullets44",
--         forwardOffset = 0.15,
--         sideOffset = 0.0,
--         heightOffset = 0.35,
--         shellForce = 0.10,
--         manualEjection = true
--     },

--     --Shotguns
--     ["Base.DoubleBarrelShotgun"] = {
--         casing = "Base.ShotgunShells_Casing",
--         ammo = "Base.ShotgunShells",
--         forwardOffset = 0.27,
--         sideOffset = 0.10,
--         heightOffset = 0.45,
--         shellForce = 0.15,
--         manualEjection = true
--     },

--     ["Base.DoubleBarrelShotgunSawnoff"] = {
--         casing = "Base.ShotgunShells_Casing",
--         ammo = "Base.ShotgunShells",
--         forwardOffset = 0.27,
--         sideOffset = 0.10,
--         heightOffset = 0.45,
--         shellForce = 0.15,
--         manualEjection = true
--     },

--     ["Base.Shotgun"] = {
--         casing = "Base.ShotgunShells_Casing",
--         ammo = "Base.ShotgunShells",
--         forwardOffset = 0.27,
--         sideOffset = 0.10,
--         heightOffset = 0.45,
--         shellForce = 0.15,
--         manualEjection = true
--     },
-- }

SpentCasingPhysics.WeaponEjectionPortParams = {

    ["Base.AssaultRifle"] = {
        casing = "Base.556Bullets_Casing",
        ammo = "Base.556Bullets",
        forwardOffset = 0.30,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.30,
        manualEjection = false
    },

    ["Base.CAR15D"] = {
        casing = "Base.556Bullets_Casing",
        ammo = "Base.556Bullets",
        forwardOffset = 0.30,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.30,
        manualEjection = false
    },

    ["Base.HuntingRifle"] = {
        casing = "Base.556Bullets_Casing",
        ammo = "Base.556Bullets",
        forwardOffset = 0.30,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.30,
        manualEjection = true
    },

    ["Base.Shotgun"] = {
        casing = "Base.ShotgunShells_Casing",
        ammo = "Base.ShotgunShells",
        forwardOffset = 0.27,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.15,
        manualEjection = true
    },

    ["Base.DoubleBarrelShotgun"] = {
        casing = "Base.ShotgunShells_Casing",
        ammo = "Base.ShotgunShells",
        forwardOffset = 0.27,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.15,
        manualEjection = true
    },

    ["Base.Revolver"] = {
        casing = "Base.Bullets45_Casing",
        ammo = "Base.Bullets45",
        forwardOffset = 0.40,
        sideOffset = 0.0,
        heightOffset = 0.30,
        shellForce = 0.10,
        manualEjection = true
    },
}

SpentCasingPhysics.registerWeapon = function(
    weapon,
    casing,
    ammo,
    forwardOffset,
    sideOffset,
    heightOffset,
    shellForce,
    manualEjection)
    SpentCasingPhysics.WeaponEjectionPortParams[weapon] = {
        casing         = casing,
        ammo           = ammo,
        forwardOffset  = forwardOffset or 0,
        sideOffset     = sideOffset or 0,
        heightOffset   = heightOffset or 0,
        shellForce     = shellForce or 0,
        manualEjection = manualEjection or false
    }
end
