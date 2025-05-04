loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

function addBillboard(name, parent, color)
	local success, errorm = pcall(function()
		local board = Instance.new("BillboardGui")
		board.Parent = parent
		board.Size = UDim2.new(10,0,5,0)
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
	return
	addBillboard(name, object, color)
end

local felipes = Instance.new("Folder", workspace)
felipes.Name = "Felipes"

local tp = workspace.Folder.Teleporters

local doors = Instance.new("Folder", workspace)
doors.Name = "Doors"

for i, v in workspace.Folder:GetChildren() do
    if v.Name == "Felipe" then
        v.Parent = felipes
    end
    if v.Name == "DoorModel" then
        v.Parent = doors
    end
end

for i, v in felipes:GetChildren() do
    addHighlight(Color3.fromRGB(200,0,0), v, "Felipe")
end

for i, v in tp:GetChildren() do
    addHighlight(Color3.fromRGB(248,248,248), v, "Teleporter")
end

for i, v in doors:GetChildren() do
    addHighlight(Color3.fromRGB(170,0,170), v, "Door")
end
