local SVD = {}
SVD.Name = "Base.SVD"
SVD.Apply = function(weapon, open)
	local originalSprite = weapon:getOriginalWeaponSprite()
	local stock = weapon:getStock()
	if stock ~= nil then
		if stock:getType() == "FiberglassStock" then
			originalSprite = originalSprite .. "S"
		end
	end
	weapon:setWeaponSprite(originalSprite)
end
if VFEWeaponModelTable then
	table.insert(VFEWeaponModelTable, SVD);
end

