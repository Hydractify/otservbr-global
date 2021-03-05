--[[
	/addoutfit playername, looktype
	make sure you’re adding a male outfit to a male character
	if you try to add a female outfit to a male character, it won’t work
]]

local addOutfit = TalkAction("/addoutfit")

function addOutfit.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local split = param:split(",")
	local name = split[1]
	local lookType = tonumber(split[2])
	local addons = tonumber(split[3])

	if not lookType then
		player:sendCancelMessage("'" .. lookType .. "' is not a valid lookType")
		return true
	end

	if addons and addons > 3 then
		player:sendCancelMessage("'" .. addons .. "' is not a valid addon")
		return true
	end

	local target = Player(name)
	if target then
		target:addOutfit(lookType)

		if addons then
			target:addOutfitAddon(lookType, addons)
		end

		target:sendTextMessage(MESSAGE_ADMINISTRADOR, player:getName() .. " has given you a new outfit.")
		player:sendTextMessage(MESSAGE_ADMINISTRADOR, "You have sucessfully added the looktype " .. lookType .. " to the player ".. target:getName() .. ".")
		print(addons)

		return true
	else
		player:sendCancelMessage("Player not found.")
		return true
	end
	return false
end

addOutfit:separator(" ")
addOutfit:register()
