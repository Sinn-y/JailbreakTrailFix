TF = {}
TF.__index = TF

-- Initialization

function TF:Initialize()
	if SERVER then 
		print("Trail Fix plugin started!")
	end
end