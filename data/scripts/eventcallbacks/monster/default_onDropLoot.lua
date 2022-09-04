local ec = EventCallback

ec.onDropLoot = function(self, corpse)
	if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
		return
	end

	local mType = self:getType()

	local monsterLoot = mType:getLoot()
	for i = 1, #monsterLoot do
		local item = corpse:createLootItem(monsterLoot[i])
		if not item then
			print("[Warning] DropLoot: Could not add loot item to corpse.")
		end
	end
end

ec:register()
