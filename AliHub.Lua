local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local function createBtn(name, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = pos
    btn.Text = name
    btn.Parent = Frame
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.MouseButton1Click:Connect(callback)
end

local p = game.Players.LocalPlayer
local speedOn = false

createBtn("Speed (100)", UDim2.new(0.05, 0, 0.1, 0), function()
    speedOn = not speedOn
    p.Character.Humanoid.WalkSpeed = speedOn and 100 or 16
end)

createBtn("Jump (150)", UDim2.new(0.05, 0, 0.35, 0), function()
    p.Character.Humanoid.JumpPower = 150
end)

createBtn("Autobio (Click)", UDim2.new(0.05, 0, 0.6, 0), function()
    _G.Auto = not _G.Auto
    while _G.Auto do
        local t = p.Character:FindFirstChildOfClass("Tool")
        if t then t:Activate() end
        task.wait(0.1)
    end
end)
