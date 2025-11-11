local function refreshSpriteNextTick(weapon)
    local w = weapon
    local function once()
        Events.OnTick.Remove(once)
        VFESetWeaponModel(w, false)
        VFESetWeaponIcon(w)
    end
    Events.OnTick.Add(once)
end

local ISRemoveWeaponUpgrade_performHook = ISRemoveWeaponUpgrade.perform
function ISRemoveWeaponUpgrade:perform()
    local scope = self.weapon:getWeaponPart("Scope")

    if scope then
        if scope:getFullType() == "Base.x2Scope_Fake" then
            self.weapon:detachWeaponPart(self.part)
            self.character:getInventory():DoRemoveItem(self.part)
            self.part = instanceItem("Base.x2Scope")
        elseif scope:getFullType() == "Base.x4Scope_Fake" then
            self.weapon:detachWeaponPart(self.part)
            self.character:getInventory():DoRemoveItem(self.part)
            self.part = instanceItem("Base.x4Scope")
        elseif scope:getFullType() == "Base.x8Scope_Fake" then
            self.weapon:detachWeaponPart(self.part)
            self.character:getInventory():DoRemoveItem(self.part)
            self.part = instanceItem("Base.x8Scope")
        end
    end

    refreshSpriteNextTick(self.weapon)
    ISRemoveWeaponUpgrade_performHook(self)
end

local ISUpgradeWeapon_performHook = ISUpgradeWeapon.perform
function ISUpgradeWeapon:perform()
    local scope = self.weapon:getWeaponPart("Scope")

    if scope then
        if scope:getFullType() == "Base.x2Scope_Fake" then
            self.character:getInventory():DoRemoveItem(self.part)
            self.part = instanceItem("Base.x2Scope")
        elseif scope:getFullType() == "Base.x4Scope_Fake" then
            self.character:getInventory():DoRemoveItem(self.part)
            self.part = instanceItem("Base.x4Scope")
        elseif scope:getFullType() == "Base.x8Scope_Fake" then
            self.character:getInventory():DoRemoveItem(self.part)
            self.part = instanceItem("Base.x8Scope")
        end
    end

    refreshSpriteNextTick(self.weapon)
    ISUpgradeWeapon_performHook(self)
end
