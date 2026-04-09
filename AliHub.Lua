local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local JumpBtn = Instance.new("TextButton")
local InvisBtn = Instance.new("TextButton")
local AutoClickBtn = Instance.new("TextButton")

-- Настройки меню
ScreenGui.Parent = game.CoreGui
MainFrame.Name = "AliHub"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Active = true
MainFrame.Draggable = true -- Можно двигать мышкой

Title.Parent = MainFrame
Title.Text = "AliHub OG"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Функция создания кнопок
local function createBtn(btn, text, pos, color)
    btn.Parent = MainFrame
    btn.Text = text
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1)
end

createBtn(SpeedBtn, "Speed: OFF", UDim2.new(0.05, 0, 0.2, 0), Color3.fromRGB(70, 0, 0))
createBtn(JumpBtn, "Jump: OFF", UDim2.new(0.05, 0, 0.4, 0), Color3.fromRGB(0, 70, 0))
createBtn(InvisBtn, "Invis: OFF", UDim2.new(0.05, 0, 0.6, 0), Color3.fromRGB(0, 0, 70))
createBtn(AutoClickBtn, "Autobio: OFF", UDim2.new(0.05, 0, 0.8, 0), Color3.fromRGB(70, 70, 0))

-- Логика функций
local p = game.Players.LocalPlayer
local speedOn, jumpOn, invisOn, clickOn = false, false, false, false

SpeedBtn.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    p.Character.Humanoid.WalkSpeed = speedOn and 100 or 16
    SpeedBtn.Text = speedOn and "Speed: ON" or "Speed: OFF"
end)

JumpBtn.MouseButton1Click:Connect(function()
    jumpOn = not jumpOn
    p.Character.Humanoid.JumpPower = jumpOn and 150 or 50
    JumpBtn.Text = jumpOn and "Jump: ON" or "Jump: OFF"
end)

InvisBtn.MouseButton1Click:Connect(function()
    invisOn = not invisOn
    for _, v in pairs(p.Character:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("Decal") then
            v.Transparency = invisOn and 0.7 or 0
        end
    end
    InvisBtn.Text = invisOn and "Invis: ON" or "Invis: OFF"
end)

AutoClickBtn.MouseButton1Click:Connect(function()
    clickOn = not clickOn
    AutoClickBtn.Text = clickOn and "Autobio: ON" or "Autobio: OFF"
    task.spawn(function()
        while clickOn do
            local t = p.Character:FindFirstChildOfClass("Tool")
            if t then t:Activate() end
            task.wait(0.1)
        end
    end)
end)
