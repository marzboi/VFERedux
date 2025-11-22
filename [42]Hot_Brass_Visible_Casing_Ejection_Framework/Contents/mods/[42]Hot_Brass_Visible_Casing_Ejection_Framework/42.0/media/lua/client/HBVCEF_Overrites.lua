local allowChanges = sandboxVars.BulletCasingRework

if allowChanges and allowChanges.allowChanges then
    ------- Racking ---------------
    function ISRackFirearm:removeBullet()
        SpentCasingPhysics.rackCasing(self.character, self.gun, true)
    end

    function ISRackFirearm:ejectSpentRounds()
        if self.gun:getSpentRoundCount() > 0 then
            for i = 1, self.gun:getSpentRoundCount() do
                SpentCasingPhysics.rackCasing(self.character, self.gun, false)
            end
            self.gun:setSpentRoundCount(0)
            syncHandWeaponFields(self.character, self.gun)
        elseif self.gun:isSpentRoundChambered() then
            self.gun:setSpentRoundChambered(false)
            SpentCasingPhysics.rackCasing(self.character, self.gun, false)
            syncHandWeaponFields(self.character, self.gun)
        else
            return
        end
        -- if self.gun:getShellFallSound() then
        --     self.character:getEmitter():playSound(self.gun:getShellFallSound())
        -- end
    end

    ------- Reloading -------------

    function ISReloadWeaponAction:ejectSpentRounds()
        if self.gun:getSpentRoundCount() > 0 then
            for i = 1, self.gun:getSpentRoundCount() do
                SpentCasingPhysics.rackCasing(self.character, self.gun, false)
            end
            self.gun:setSpentRoundCount(0)
            syncHandWeaponFields(self.character, self.gun)
        elseif self.gun:isSpentRoundChambered() then
            self.gun:setSpentRoundChambered(false)
            SpentCasingPhysics.rackCasing(self.character, self.gun, false)
            syncHandWeaponFields(self.character, self.gun)
        else
            return
        end
        -- if self.gun:getShellFallSound() then
        -- 	self.character:getEmitter():playSound(self.gun:getShellFallSound())
        -- end
    end
end
