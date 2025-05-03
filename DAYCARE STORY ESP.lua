loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

function addBillboard(name, parent, color)
	local success, errorm = pcall(function()
		local board = Instance.new("BillboardGui")
		board.Parent = parent
		board.Size = UDim2.new(10,0,5,0)
		if name == "SAFE ZONE" then
			board.Size = UDim2.new(20,0,10,0)
		end
		board.AlwaysOnTop = true
		board.Adornee = parent
		local text = Instance.new("TextLabel")
		text.Parent = board
		text.Text = name
		text.TextScaled = true
		text.Size = UDim2.new(1,0,1,0)
		text.BackgroundTransparency = 1
		text.TextColor3 = color
	end)
	if success then
		print("Assigned billboard to "..name.." in "..parent.Parent.Name)
	else
		error(errorm)
	end
end

function addHighlight(color, object, name)
	if object:FindFirstChild("Highlight") then return end
	local highlight = Instance.new("Highlight")
	highlight.Parent = object
	highlight.FillColor = color
	highlight.FillTransparency = 0.7
	if safezone then
		addBillboard("SAFE ZONE", object, color)
	end
	return
	addBillboard(name, object, color)
end

while wait(0.5) do
	local guide = workspace.Guide
	local football = workspace.Daycare.Tech.FootballSystem.Football
	local backdoor = workspace.Daycare.Doors.Back
	local frontdoor = workspace.Daycare.Doors.Front
	local doors = workspace.Daycare.Structure.Doors
	local tv = workspace.Daycare.Tech.TV
	local ball = workspace.Daycare.Areas.PlayRoom.BeachBall
	local decor = workspace.Daycare.Decoration.HangingDecor
	local elevator = workspace.Daycare.Tech.Elevator
	local players = game.Players

	addHighlight(Color3.fromRGB(0,255,0), guide, "Sarah (Guide)")
	addHighlight(Color3.fromRGB(248,248,248), football, "Football")
	addHighlight(Color3.fromRGB(140,140,140), backdoor, "Back Door")
	addHighlight(Color3.fromRGB(140,140,140), frontdoor, "Front Door")
	addHighlight(Color3.fromRGB(0,0,0), tv, "The TV")
	addHighlight(Color3.fromRGB(255,255,0), ball, "Play Ball")
	addHighlight(Color3.fromRGB(255,140,0), decor, "Hanging Shapes")
	addHighlight(Color3.fromRGB(200,200,200), elevator, "Elevator")

	-- multiple obj highlight

	for i, v in doors:GetChildren() do
		addHighlight(Color3.fromRGB(170,0,170), v, "Door")
	end

	for i, v in players:GetPlayers() do
		addHighlight(Color3.fromRGB(0,140,0), v, v.Name)
	end

	task.spawn(function()
		local minions = workspace:WaitForChild("MonsterMinionsStorage", math.huge).Minions
		local monster = workspace.MonsterChase

		for i, v in minions:GetChildren() do
			addHighlight(Color3.fromRGB(170,0,170), v, "Monster's Minion")
		end
		addHighlight(Color3.new(255,0,0), monster, "MONSTER")
	end)
end
