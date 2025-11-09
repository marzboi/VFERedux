local function refreshSpriteNextTick(weapon)
    local w = weapon
    local function once()
        Events.OnTick.Remove(once)
        VFESetWeaponModel(w, false)
        VFESetWeaponIcon(w)
    end
    Events.OnTick.Add(once)
end

local ISUpgradeWeapon_perform_old = ISUpgradeWeapon.perform
function ISUpgradeWeapon:perform()
    ISUpgradeWeapon_perform_old(self)
    refreshSpriteNextTick(self.weapon)
end

local ISRemoveWeaponUpgrade_perform_old = ISRemoveWeaponUpgrade.perform
function ISRemoveWeaponUpgrade:perform()
    ISRemoveWeaponUpgrade_perform_old(self)
    refreshSpriteNextTick(self.weapon)
end
