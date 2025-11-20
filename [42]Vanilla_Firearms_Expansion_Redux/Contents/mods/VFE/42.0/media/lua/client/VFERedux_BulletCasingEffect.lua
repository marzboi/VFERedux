require "ISBaseObject"

SpentCasingPhysics = {}
SpentCasingPhysics.activeCasings = {}
SpentCasingPhysics.GRAVITY = 0.005
local random_f = newrandom()

function SpentCasingPhysics.addCasing(square, casingType, startX, startY, startZ, velocityX, velocityY, velocityZ)
    if not square then return end

    local casingData = {
        square = square,
        casingType = casingType,
        x = startX,
        y = startY,
        z = startZ,
        velocityX = velocityX or 0,
        velocityY = velocityY or 0,
        velocityZ = velocityZ or 0.1,
        active = true,
        currentWorldItem = nil
    }

    casingData.currentWorldItem = square:AddWorldInventoryItem(casingType, startX, startY, startZ)

    table.insert(SpentCasingPhysics.activeCasings, casingData)
end

function SpentCasingPhysics.update()
    local i = 1

    local XY_STEP = 0.10           -- multiply X/Y velocity by this when adding to position (small step)
    local Z_STEP = 0.05            -- multiply Z velocity by this when adding to position (small step)
    local GRAVITY_SCALE = 1.0      -- scale for the global gravity (keeps existing constant but allows easy tweak)
    local DRAG_XY = 0.97           -- velocity damping for horizontal movement ("air resistance")
    local DRAG_Z = 0.995           -- velocity damping for vertical movement
    local SETTLE_THRESHOLD = 0.001 -- when velocities drop below this, consider the casing settled

    while i <= #SpentCasingPhysics.activeCasings do
        local casing = SpentCasingPhysics.activeCasings[i]

        if not casing.square or not casing.active then
            table.remove(SpentCasingPhysics.activeCasings, i)
        else
            casing.velocityZ = casing.velocityZ - (SpentCasingPhysics.GRAVITY * GRAVITY_SCALE)

            casing.x = casing.x + (casing.velocityX * XY_STEP)
            casing.y = casing.y + (casing.velocityY * XY_STEP)
            casing.z = casing.z + (casing.velocityZ * Z_STEP)

            casing.z = math.max(0, casing.z)

            local worldX = casing.square:getX() + casing.x
            local worldY = casing.square:getY() + casing.y
            local worldZ = casing.square:getZ()

            local targetTileX = math.floor(worldX)
            local targetTileY = math.floor(worldY)
            local targetSquare = getCell():getGridSquare(targetTileX, targetTileY, worldZ)

            if not targetSquare then
                targetSquare = casing.square
            end

            local localX = worldX - targetSquare:getX()
            local localY = worldY - targetSquare:getY()

            localX = PZMath.clamp_01(localX)
            localY = PZMath.clamp_01(localY)

            if casing.currentWorldItem then
                local wobj = casing.currentWorldItem:getWorldItem()
                if wobj then
                    casing.square:removeWorldObject(wobj)
                end
                casing.currentWorldItem = nil
            end

            casing.velocityX = casing.velocityX * DRAG_XY
            casing.velocityY = casing.velocityY * DRAG_XY
            casing.velocityZ = casing.velocityZ * DRAG_Z

            if casing.z > 0 then
                casing.currentWorldItem = targetSquare:AddWorldInventoryItem(
                    casing.casingType,
                    localX,
                    localY,
                    casing.z
                )
            else
                targetSquare:AddWorldInventoryItem(
                    casing.casingType,
                    localX,
                    localY,
                    0.0
                )

                if math.abs(casing.velocityX) < SETTLE_THRESHOLD
                    and math.abs(casing.velocityY) < SETTLE_THRESHOLD
                    and math.abs(casing.velocityZ) < SETTLE_THRESHOLD
                then
                    casing.active = false
                    table.remove(SpentCasingPhysics.activeCasings, i)
                    i = i - 1
                else
                    casing.active = false
                    table.remove(SpentCasingPhysics.activeCasings, i)
                    i = i - 1
                end
            end

            if targetSquare ~= casing.square then
                casing.square = targetSquare
            end

            casing.x = localX
            casing.y = localY

            i = i + 1
        end
    end
end

-- local function checkModel(weapon)
--     if not weapon then return end
--     local weaponModel = ScriptManager.instance:getModelScript(weapon:getOriginalWeaponSprite())
--     if weapon then print(weaponModel) end

--     for i = 0, weaponModel:getAttachmentCount() - 1 do
--         local partList = weaponModel:getAttachment(i)
--         if partList:getId() == "ejectionport" then
--             print(partList:getOffset())
--             print(partList:getRotate())
--         end
--     end
-- end

local function doSpawnCasing(player, weapon, params)
    local forwardOffset = params.forwardOffset or 0.0
    local sideOffset = params.sideOffset or 0.0
    local casingType = params.spentCasing

    if not casingType then return end

    local px, py, pz = player:getX(), player:getY(), player:getZ()

    local angleDeg = player:getDirectionAngle() or 0
    local angle = math.rad(angleDeg)

    local fx = math.cos(angle)
    local fy = math.sin(angle)
    local rx = math.cos(angle + math.pi / 2)
    local ry = math.sin(angle + math.pi / 2)

    local spawnWorldX = px + fx * forwardOffset + rx * sideOffset
    local spawnWorldY = py + fy * forwardOffset + ry * sideOffset
    local spawnWorldZ = 0.5

    local targetTileX = math.floor(spawnWorldX)
    local targetTileY = math.floor(spawnWorldY)
    local targetSquare = getCell():getGridSquare(targetTileX, targetTileY, pz)
    if not targetSquare then
        targetSquare = player:getCurrentSquare()
        if not targetSquare then return end
    end

    local startX = spawnWorldX - targetSquare:getX()
    local startY = spawnWorldY - targetSquare:getY()
    local startZ = spawnWorldZ

    local velX = (random_f:random(10) - 5) / 200
    local velY = (random_f:random(10) - 5) / 200
    local velZ = (random_f:random(10) + 25) / 200

    SpentCasingPhysics.addCasing(targetSquare, casingType, startX, startY, startZ, velX, velY, velZ)
end

local function spawnCasing(player, weapon, params)
    if not player or player:isDead() then return end
    if not weapon then return end
    if not params then return end

    if weapon:getCurrentAmmoCount() > 0 then
        doSpawnCasing(player, weapon, params)
    end
end

-- local ISRackFirearm_perform_old = ISRackFirearm.perform
-- function ISRackFirearm:perform()
--     local player = self.character
--     local weapon = self.gun
--     ISRackFirearm_perform_old(self)
-- end

Events.OnWeaponSwing.Add(function(player, weapon)
    local params = WeaponEjectionPortList[weapon:getFullType()]
    if params then
        spawnCasing(player, weapon, params)
    end
end)
Events.OnTick.Add(SpentCasingPhysics.update)
