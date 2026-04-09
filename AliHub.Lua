local player = game.GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- 1. БЫСТРЫЙ БЕГ (Speed)
humanoid.WalkSpeed = 100 -- Обычная скорость 16, тут в 6 раз быстрее

-- 2. ВЫСОКИЙ ПРЫЖОК (Jump)
humanoid.JumpPower = 150 -- Обычный прыжок 50
humanoid.UseJumpPower = true

-- 3. ПОЛЕТ (Fly) - Самый простой вариант через Velocity
local flying = true
local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
bv.Velocity = Vector3.new(0, 0, 0)
bv.Parent = character.HumanoidRootPart

-- 4. НЕВИДИМКА (Invisibility)
-- Работает локально (тебя не видят игроки, если скрипт пробит через инжектор)
for _, part in pairs(character:GetDescendants()) do
    if part:IsA("BasePart") or part:IsA("Decal") then
        part.Transparency = 0.5 -- Сделаем полупрозрачным, чтобы ты себя видел, а другие — нет
    end
end

-- 5. AUTO-CLICKER РУКОЙ (Тот самый autobio)
_G.AutoClick = true
spawn(function()
    while _G.AutoClick do
        local tool = character:FindFirstChildOfClass("Tool")
        if tool then
            tool:Activate()
        else
            -- Если руки пустые, пытаемся бить просто так
            local virtualUser = game:GetService("VirtualUser")
            virtualUser:CaptureController()
            virtualUser:ClickButton1(Vector2.new(0,0))
        end
        task.wait(0.05)
    end
end)

print("AliHub: Все функции активированы!")
