local player = game.Players.LocalPlayer

repeat
	print("plr nil")
	player = game.Players.LocalPlayer
	wait()
until player ~= nil

local char = player.CharacterAdded:Wait()

function guid()
	return game:GetService("HttpService"):GenerateGUID(false)
end

repeat
	print("char nil")
	char = player.Character
	wait()
until char ~= nil

local su = player.PlayerGui
local newGui = Instance.new("ScreenGui", su)
newGui.Name = guid()
newGui.IgnoreGuiInset = true

local dragframe = Instance.new("Frame", newGui)
dragframe.BackgroundColor3 = Color3.new()
dragframe.Size = UDim2.new(0,100,.1,0)
dragframe.Position = UDim2.new(0,0,.5,0)

local button = Instance.new("TextButton", dragframe)
button.Name = guid()
button.Size = UDim2.new(0,100,0,100)
button.BackgroundColor3 = Color3.new(1, 0.184314, 0.603922)
button.Text = "NoClip"
button.Position = UDim2.new(0,0,-1,0)
button.TextScaled = true

Instance.new("UIDragDetector", dragframe)

local button2 = Instance.new("TextButton", newGui)
button2.Name = guid()
button2.Size = UDim2.new(0,100,0,100)
button2.BackgroundColor3 = Color3.new(0.364706, 1, 0.439216)
button2.Text = "Clip"
button2.Position = UDim2.new(.6,0,.6,0)
button2.TextScaled = true

button.MouseButton1Click:Connect(function()
	for i, v in char:GetDescendants() do
		if v:IsA("BasePart") then
			print(v.Name)
			v.CanCollide = false
			v.CanTouch = false
		end
	end
end)
button2.MouseButton1Click:Connect(function()
	for i, v in char:GetDescendants() do
		if v:IsA("BasePart") then
			print(v.Name)
			v.CanCollide = true
			v.CanTouch = true
		end
		char.HumanoidRootPart.CanCollide = false
	end
end)
