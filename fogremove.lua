local Lighting = game:GetService("Lighting")
if Lighting:FindFirstChild("Atmosphere") then
  Lighting.Atmosphere:Destroy()
end
Lighting.FogEnd = 100000
Lighting.Brightness = 4
