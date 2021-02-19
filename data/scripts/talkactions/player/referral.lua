local refer = TalkAction("!refer")

local rewards = {
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
		player:addOutfitAddon(1323, 3)
	end,
	[4] = function(player)
		player:addTibiaCoins(1000)
		referredPlayer:setBankBalance(player:getBankBalance() + 50000)

		player:addItem("Golden Helmet", 1)
	end
}

function refer.onSay(player, words, param)
	local referredPlayer = Player(param)

	if not referredPlayer then
		player:sendCancelMessage("Player '" .. param .. "' not found.")
		return false
	end

	if referredPlayer == player or player:getAccountId() == referredPlayer:getAccountId() or player:getIp() == referredPlayer:getIp() then
		player:sendCancelMessage("You can't refer yourself.")
		return false
	end

	if not player:addReferral(referredPlayer:getAccountId()) then
		player:sendCancelMessage("You already referred someone!")
		return false
	end

	player:addTibiaCoins(500)
	player:setBankBalance(player:getBankBalance() + 10000)

	local referrals = referredPlayer:getReferred()

	if not referrals then
		referredPlayer:addTibiaCoins(250)
		referredPlayer:setBankBalance(player:getBankBalance() + 5000)

		player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You referred '" .. param .. "'!")
		return false
	end

	rewards[#referrals](referredPlayer)

	player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You referred '" .. param .. "'!")
	return false
end

refer:separator(" ")
refer:register()
