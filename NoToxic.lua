--Monkey 🥵🤡

local HttpService = game:GetService("HttpService")
local location = game:GetService('LocalizationService')
local Webhook_URL = ''
local keywords = {
	"Ezz", "Noob", "No Skill", "Dev so noob" --you can edit
}

game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		for _, keyword in ipairs(keywords) do
			if string.find(string.lower(message), string.lower(keyword)) then
				local currentTime = os.date("%c")
				local platform = "Unknown"

				if player:IsA("Player") then
					local uis = game:GetService("UserInputService")
					if uis.KeyboardEnabled then
						platform = "PC 💻"
					elseif uis.TouchEnabled then
						platform = "Mobile 📱"
					elseif uis.GamepadEnabled then
						platform = "Console 🎮"
					end
				end

				local Data = {
					["content"] = "",
					["embeds"] = {{
						["title"] = player.Name .. " **Player Not following the rules 😡**",
						["description"] = message,
						["type"] = "rich",
						["color"] = tonumber(0xa83240),
						["icon_url"] = "https://thumbnails.roproxy.com/v1/users/avatar-headshot?userIds=" .. player.UserId .. "&size=48x48&format=png", --it bug LOL 😭
						["fields"] = {
							{
								["name"] = "Player ID😡: " .. player.UserId,
								["value"] = "",
								["inline"] = true
							},
							{
								["name"] = "Player Account Age 📩:",
								["value"] = player.AccountAge .. " days",
								["inline"] = true
							},
							{
								["name"] = "Joined at ⏳:",
								["value"] = currentTime,
								["inline"] = false
							},
							{
								["name"] = "Platform 📱💻🎮:",
								["value"] = platform,
								["inline"] = true
							},
							{
								["name"] = "Country Code 🌍:",
								["value"] = location:GetCountryRegionForPlayerAsync(player),
								["inline"] = false
							},
							{
								["name"] = "Player Message 💬:",
								["value"] = message,
								["inline"] = false
							}
						}
					}}
				}
				Data = HttpService:JSONEncode(Data)
				HttpService:PostAsync(Webhook_URL, Data)
				break
			end
		end
	end)
end)
