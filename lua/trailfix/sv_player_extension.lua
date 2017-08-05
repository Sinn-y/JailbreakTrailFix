local Player = FindMetaTable('Player')

function Player:PS_PlayerSpawn()
	if not self:PS_CanPerformAction() then return end
	
	timer.Simple(3, function()
		if !IsValid(self) then return end
		if self:Team() == TEAM_PRISONER and (self:Alive() == false) then
			for item_id, item in pairs(self.PS_Items) do
				local ITEM = PS.Items[item_id]
				ITEM:OnHolster(self, item.Modifiers)
			end
		end
	end)
		
	-- TTT ( and others ) Fix
	if TEAM_SPECTATOR != nil and self:Team() == TEAM_SPECTATOR then return end
	if TEAM_SPEC != nil and self:Team() == TEAM_SPEC then return end

	-- Murder Spectator Fix (they don't specify the above enums when making teams)
	-- https://github.com/mechanicalmind/murder/blob/master/gamemode/sv_spectate.lua#L15
	if self.Spectating then return end

	timer.Simple(1, function()
		if !IsValid(self) then return end
		for item_id, item in pairs(self.PS_Items) do
			local ITEM = PS.Items[item_id]
			if item.Equipped then
				ITEM:OnEquip(self, item.Modifiers)
			end
		end
	end)
end

function Player:PS_PlayerSilentDeath()
	for item_id, item in pairs(self.PS_Items) do
		if item.Equipped then
			local ITEM = PS.Items[item_id]
			ITEM:OnHolster(self, item.Modifiers)
		end
	end
end