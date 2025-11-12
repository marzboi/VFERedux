local ISRemoveWeaponUpgrade_completeHook = ISRemoveWeaponUpgrade.complete
function ISRemoveWeaponUpgrade:complete()
    local part = self.weapon:getWeaponPart(self.partType)

    if part and part:getFullType() == "Base.Coupled556_Hidden" then
        self.weapon:attachWeaponPart(instanceItem("Base.Coupled556"), true)
    end
    if part and part:getFullType() == "Base.Coupled762_Hidden" then
        self.weapon:attachWeaponPart(instanceItem("Base.Coupled762"), true)
    end
    ISRemoveWeaponUpgrade_completeHook(self)
end

local ISUpgradeWeapon_completeHook = ISUpgradeWeapon.complete
function ISUpgradeWeapon:complete()
    local magazine = self.weapon:getWeaponPart("Clip")
    local part = self.part

    if part:getFullType() == 'Base.Coupled556' then
        if not magazine then
            self.character:getInventory():Remove(self.part);
            self.part = instanceItem("Base.Coupled556_Hidden")
        end
    end

    if part:getFullType() == 'Base.Coupled762' then
        if not magazine then
            self.character:getInventory():Remove(self.part);
            self.part = instanceItem("Base.Coupled762_Hidden")
        end
    end
    ISUpgradeWeapon_completeHook(self)
end
