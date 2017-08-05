-- Created by Sinn to fix JB+Pointshop trail issues. 8/5/17

if SERVER then AddCSLuaFile() include "trailfix/sv_init.lua" end
-- To shut up client lua errors. This addon only deals with server side implementations.
if CLIENT then return end

TF:Initialize()