-- AliHub Optimized Script
local p = game:GetService("Players").LocalPlayer
local char = p.Character or p.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- 1. Скорость и Прыжок
hum.WalkSpeed = 80
hum.JumpPower = 120

-- 2. Авто-клик (Autobio)
_G.Clicking = true
task.spawn(function()
    while _G.Clicking do
        local tool = char:FindFirstChildOfClass("Tool")
        if tool then 
            tool:Activate() 
        end
        task.wait(0.1)
    end
end)

-- 3. Простая Невидимка (Local)
for _, v in pairs(char:GetChildren()) do
    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
        v.Transparency = 0.5
    end
end

print("AliHub Loaded Successfully!")
