local player = game.Players.LocalPlayer

local char = player.CharacterAdded:Wait()
local exec = getexecutor()

player.Chatted:Connect(function(msg)
    if msg == "!noclip" then
      for i, v in char:GetDescendants() do
        if v:IsA("BasePart") then
          v.CanCollide = false
          v.CanTouch = false
        end
      end
    elseif msg == "!clip" then
      for i, v in char:GetDescendants() do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
          v.CanCollide = true
          v.CanTouch = true
        end
        char.HumanoidRootPart.CanTouch = true
      end
    end
  end)
