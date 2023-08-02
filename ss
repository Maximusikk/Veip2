local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local LeaderstatsDataStore = DataStoreService:GetDataStore("LeaderstatsDataStore")
local ChangeLeaderstatsValue = game.ReplicatedStorage.events.Sell
local ChangeLegkiyeValue = game.ReplicatedStorage.events.asdasd
local ServStorage = game:GetService("ServerStorage")
local Dim1 = game.ReplicatedStorage.events.CuviePlus
local Dim2 = game.ReplicatedStorage.events.Cuvie



local ChangeLegkiyeValue1 = Dim1.GiveDim1
local ChangeLegkiyeValue2 = Dim1.GiveDim2
local ChangeLegkiyeValue3 =	Dim1.GiveDim3
local ChangeLegkiyeValue4 = Dim1.GiveDim4
local ChangeLegkiyeValue5 = Dim1.GiveDim5
local ChangeLegkiyeValue6 = Dim2.GiveDim1
local ChangeLegkiyeValue7 = Dim2.GiveDim2
local ChangeLegkiyeValue8 = Dim2.GiveDim3
local ChangeLegkiyeValue9 = Dim2.GiveDim4
local ChangeLegkiyeValue10 = Dim2.GiveDim5

Players.PlayerAdded:Connect(function(player)
	local leader = Instance.new("Folder",player)
	leader.Name = "leaderstats"

	local other = Instance.new("Folder",player)
	other.Name = "numbers"

	local Coins = Instance.new("IntValue")
	Coins.Parent = leader
	Coins.Name = "Coins"
	
	local CurrentPod = Instance.new("StringValue", other)
	CurrentPod.Name = "CurrencyPod"


	local legkiy = Instance.new("IntValue",other)
	legkiy.Name = "Legkiye" -- или вместо RUB ваша валюта
	legkiy.Value = 0

	local maxlegkiy = Instance.new("IntValue",other)
	maxlegkiy.Name = "MaxLegkiye" -- или вместо RUB ваша валюта
	maxlegkiy.Value = 75

	local data = LeaderstatsDataStore:GetAsync(player.UserId.."-Leaderstats")


	if data  == nil  then
		Coins.Value = 0
		CurrentPod.Value = 0
	else
		Coins.Value = data
		CurrentPod.Value = data
	end
	
	
	if CurrentPod.Value == "None" then
		repeat task.wait() until player.Character
		ServStorage.hqdCuviePlus.Red.Tool:Clone().Parent = player.Backpack
	end
	
	if CurrentPod.Value == "RedCuvie" then
		repeat task.wait() until player.Character
		ServStorage.hqdCuviePlus.Red.Tool:Clone().Parent = player.Backpack
	end
	
end)


ChangeLegkiyeValue.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")
	
	Legkiye.Value += 5
end)
ChangeLegkiyeValue1.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 10
end)
ChangeLegkiyeValue2.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 15
end)
ChangeLegkiyeValue3.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 20
end)
ChangeLegkiyeValue4.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 25
end)
ChangeLegkiyeValue5.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 35
end)
ChangeLegkiyeValue6.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 50
end)
ChangeLegkiyeValue7.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 70
end)
ChangeLegkiyeValue8.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 85
end)
ChangeLegkiyeValue9.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 100
end)
ChangeLegkiyeValue10.OnServerEvent:Connect(function(Player)
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")

	Legkiye.Value += 125
end)


ChangeLeaderstatsValue.OnServerEvent:Connect(function(Player) -- Receiving the remote event here.

	-- Doing all the modifications in the server instead of in the client
	
	local Coins = Player:WaitForChild("leaderstats"):WaitForChild("Coins")
	local Legkiye = Player:WaitForChild("numbers"):WaitForChild("Legkiye")
	print(Legkiye.Value)
	Coins.Value = Coins.Value + Legkiye.Value
	Legkiye.Value = 0
end)

game.Players.PlayerRemoving:Connect(function(player)
	local Coins = player.leaderstats.Coins.Value
	local CurrentPod = player.numbers.CurrencyPod.Value
	


	LeaderstatsDataStore:SetAsync(player.UserId.."-Leaderstats", Coins)
	LeaderstatsDataStore:SetAsync(player.UserId.."-Leaderstats", CurrentPod)
	print(CurrentPod)
end)	

