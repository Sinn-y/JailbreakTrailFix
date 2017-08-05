--[[
	First file included serverside.
]]--

-- Includes

include "sh_init.lua"
include "sv_player_extension.lua"

-- Hooks

hook.Add('PlayerSpawn', 'PS_PlayerSpawn', function(ply) ply:PS_PlayerSpawn() end) -- Override PointShop's hook.
hook.Add('PlayerSilentDeath', 'PS_PlayerSilentDeath', function(ply) ply:PS_PlayerSilentDeath() end) -- Override PointShop's hook.