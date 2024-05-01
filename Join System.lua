-- script เป็นเเบบ ServerScriptService นะ 🥺 --

local HttpService = game:GetService("HttpService")
local location = game:GetService('LocalizationService')
local uis = game:GetService("UserInputService")
local Webhook_URL = 'ez'

game.Players.PlayerAdded:Connect(function(player)
	local currentTime = os.date("%c")
	local platform = "Unknown"

	if uis.KeyboardEnabled then
		platform = "PC 💻"
	elseif uis.TouchEnabled then
		platform = "Mobile 📱"
	elseif uis.GamepadEnabled then
		platform = "Console  🎮"
	end


	local Data = {
		["content"] = "",
		["embeds"] = {{
			["title"] = player.Name .. " **Joined 👋 **",
			["description"] = "IDK",
			["type"] = "rich",
			["color"] = tonumber(0x00bdff),
			["icon_url"] = "https://thumbnails.roproxy.com/v1/users/avatar-headshot?userIds=%d&size=48x48&format=png" ..player.UserId,
			["fields"] = {
				{
					["name"] = "Player  👋  : " .. player.Name .. " has joined the game.",
					["value"] = "Player ID  : " .. player.UserId,
					["inline"] = true
				},
				{
					["name"] = "Player Account Age   📩  :",
					["value"] = player.AccountAge .. " days  ",
					["inline"] = true
				},
				{
					["name"] = "Joined at  ⏳  :",
					["value"] = currentTime,
					["inline"] = false
				},
				{
					["name"] = "Platform  📱💻🎮  :",
					["value"] = platform,
					["inline"] = true
				},
				{
					["name"] = "Country Code 🌍 : ",
					["value"] = location:GetCountryRegionForPlayerAsync(player),
					["inline"] = false
				}
			}
		}}
	}
	Data = HttpService:JSONEncode(Data)
	HttpService:PostAsync(Webhook_URL, Data)
end)

game.Players.PlayerRemoving:Connect(function(player)
	local currentTime = os.date("%c")
	local platform = "Unknown"

	if uis.KeyboardEnabled then
		platform = "PC 💻"
	elseif uis.TouchEnabled then
		platform = "Mobile 📱"
	elseif uis.GamepadEnabled then
		platform = "Console  🎮"
	end

	local Data = {
		["content"] = "",
		["embeds"] = {{
			["title"] = player.Name .. " **Left 😢 **",
			["description"] = "IDK",
			["type"] = "rich",
			["color"] = tonumber(0xe30741),
			["icon_url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid=" .. player.UserId,
			["fields"] = {
				{
					["name"] = "Player 😔   : " .. player.Name .. " has left the game.      😭",
					["value"] = "Player ID : " .. player.UserId,
					["inline"] = true
				},
				{
					["name"] = "Left at  ⏳  :",
					["value"] = currentTime,
					["inline"] = false
				},
				{
					["name"] = "Platform   📱💻🎮  :",
					["value"] = platform,
					["inline"] = true
				},
				{
					["name"] = "Country Code 🌍 : ",
					["value"] = location:GetCountryRegionForPlayerAsync(player),
					["inline"] = false
				}
			}
		}}
	}
	Data = HttpService:JSONEncode(Data)
	HttpService:PostAsync(Webhook_URL, Data)
end)
