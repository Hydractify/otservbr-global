local refer = TalkAction("!refer")

local rewards = {
	[1] = function(player)
		player:addTibiaCoins(250)
		player:setBankBalance(player:getBankBalance() + 5000)
	end,
	[2] = function(player)
		player:addTibiaCoins(250)
		player:setBankBalance(player:getBankBalance() + 5000)

		player:addItem("Pinata Dragon", 1)
		player:addMount("Tempest")
	end,
	[3] = function(player)
		player:addTibiaCoins(500)
		player:setBankBalance(player:getBankBalance() + 10000)

		-- Revenant full outfit
		if player:getSex() == 0 then -- Female
			player:addOutfitAddon(1323)
			player:addOutfitAddon(1323, 3)
		else -- Male
			player:addOutfitAddon(1322)
			player:addOutfitAddon(1322, 3)
		end
	end,
	[4] = function(player)
		player:addTibiaCoins(1000)
		referringPlayer:setBankBalance(player:getBankBalance() + 50000)

		player:addItem("Golden Helmet", 1)
	end
}

function refer.onSay(player, words, param)
	local referringPlayer = Player(param)

	if not referringPlayer then
		player:sendCancelMessage("Player '" .. param .. "' not found.")
		return false
	end

	if referringPlayer == player or player:getAccountId() == referringPlayer:getAccountId() or player:getIp() == referringPlayer:getIp() then
		player:sendCancelMessage("You can't be referred by yourself.")
		return false
	end

	if not player:setReferring(referringPlayer:getAccountId()) then
		player:sendCancelMessage("You already were referred by someone!")
		return false
	end

	player:addTibiaCoins(500)
	player:setBankBalance(player:getBankBalance() + 10000)

	local referrals = referringPlayer:getReferred()

	if not referrals then
		rewards[1](referringPlayer)
	else
		if #rewards > #referrals then
			rewards[#referrals](referringPlayer)
		else
			rewards[#rewards](referringPlayer)
		end
	end

	player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You were referred by '" .. param .. "'!")
	return false
end

refer:separator(" ")
refer:register()
