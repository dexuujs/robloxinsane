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

local cheeseFolder = workspace.FindCheese
local rat = workspace.Mouse
local players = game.Players
local keys = Instance.new("Folder")
local doors = Instance.new("Folder")
local invis = workspace.InvisibleParts
local endbrick = workspace.EndBrick

keys.Name = "Keys"
keys.Parent = workspace

doors.Name = "Doors"
doors.Parent = workspace

for i, v in workspace:GetChildren() do
	if v.Name == "Handle" then
		v.Parent = keys
	end
	if string.find(v.Name, "DoorKey") then
		v.Parent = doors
	end
end

--cheese esp

for i, v in cheeseFolder:GetChildren() do
	if v:FindFirstChild("Cheese") then
		if v.Cheese:FindFirstChild("Highlight") then return end
		addHighlight(Color3.fromRGB(255,255,0), v.Cheese, "Cheese")
	end
end

--mouse esp

addHighlight(Color3.fromRGB(255,0,0), rat, "Mouse")

--players esp

for i, v in players:GetPlayers() do
	addHighlight(Color3.fromRGB(0,255,0), v.Character, v.Name)
end

--keys esp
for i, v in keys:GetChildren() do
	addHighlight(v.Color, v, v.Name)
end

--doors esp
for i, v in doors:GetChildren() do
	addHighlight(Color3.fromRGB(255,0,255), v)
end

--invis parts esp
for i, v in invis:GetChildren() do
	if v.Name == "InvisiblePart" then v.Name = "SAFE ZONE" addHighlight(Color3.fromRGB(0,255,0), v) v.CanCollide = false end
	addHighlight(Color3.fromRGB(255,255,255), v)
end

--inf distance click

for i, v in workspace:GetDescendants() do
	if v:IsA("ClickDetector") then
		v.MaxActivationDistance = math.huge
	end
end

--endbrick esp

addHighlight(Color3.fromRGB(0,0,0), endbrick, "THE END")
