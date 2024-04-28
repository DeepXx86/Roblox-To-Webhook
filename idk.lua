--- Script นี้อยุ่ใน ServerScriptService เป็น Script ไม่ใช่ Local Script ---

local HttpService = game:GetService("HttpService")
local Webhook_URL = 'https://discord.com/api/webhooks/1234089679142518844/5U43E_4Yx9OuhLVmWGXJSeehYLZrsTi8KiOL7E6yWzmcU4HQ-Nr_TLEs6j8Gwktmewv1'

game.Players.PlayerAdded:Connect(function(player)
	local currentTime = os.date("%c")
	local Data = {
		["content"] = "",
		["embeds"] = {{
			["title"] = player.Name.." **Joined 👋 **",
			["description"] = "IDK",
			["type"] = "rich",
			["color"] = tonumber(0x00bdff),
			["icon_url"] = "https://web.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userid=" .. player.UserId,
			["fields"] = {{
				["name"] = "Player   👋   : " .. player.Name .. " has joined the game.",
				["value"] = "Player ID  : " .. player.UserId,
				["inline"] = true
			}, {
				["name"] = "Player Account Age    📩   :",
				["value"] = player.AccountAge .. " days   💤",
				["inline"] = true
			}, {
				["name"] = "Joined at   ⏳   :",
				["value"] = currentTime,
				["inline"] = false  
			}}
		}}
	}
	Data = HttpService:JSONEncode(Data)
	HttpService:PostAsync(Webhook_URL, Data)
end)
