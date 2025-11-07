local function manageMagazineAttachment(weapon, shouldAttach)
	if not weapon then return end

	if shouldAttach then
		local Magazine = instanceItem("MagazineAttachment")
		if Magazine then
			weapon:attachWeaponPart(instanceItem("MagazineAttachment"), true)
		end
	else
		local Magazine = weapon:getWeaponPart("Clip")
		if Magazine then
			weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
		end
	end
end

local ISInsertMagazine_complete_old = ISInsertMagazine.complete
function ISInsertMagazine:complete()
	manageMagazineAttachment(self.gun, true)
	ISInsertMagazine_complete_old(self)
end

local ISEjectMagazine_complete_old = ISEjectMagazine.complete
function ISEjectMagazine:complete()
	manageMagazineAttachment(self.gun, false)
	ISEjectMagazine_complete_old(self)
end
