local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub ULTIMATE",
   LoadingTitle = "Взлом Системы...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Хаки", 4483362458)

-- ЖЁСТКАЯ СКОРОСТЬ (через цикл, чтобы не сбрасывалась)
MainTab:CreateToggle({
   Name = "Super Speed (Loop)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Speed = Value
       while _G.Speed do
           game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
           task.wait(0.1)
       end
   end,
})

-- СКРИПТ НА СПАВН / ПОЛУЧЕНИЕ (Метод касания)
local function ultraSpawn(targetName)
    Rayfield:Notify({Title = "AliHub", Content = "Ищу " .. targetName .. " на сервере...", Duration = 3})
    
    local found = false
    for _, v in pairs(game.Workspace:GetDescendants()) do
        -- Ищем по названию или внутри папок с секретками
        if v.Name:lower():find(targetName:lower()) or v.Name == "Click" then
            if v:IsA("BasePart") or v:IsA("ClickDetector") then
                -- Телепортируем тебя на долю секунды к нему и обратно
                local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                task.wait(0.1)
                if v:IsA("ClickDetector") then fireclickdetector(v) end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
                found = true
            end
        end
    end
    
    if not found then
        Rayfield:Notify({Title = "Ошибка", Content = targetName .. " не найден на этом сервере", Duration = 3})
    end
end

MainTab:CreateButton({
   Name = "Get Strawberry Dream",
   Callback = function() ultraSpawn("Strawberry") end,
})

MainTab:CreateButton({
   Name = "Get Dragon Cannelloni",
   Callback = function() ultraSpawn("Dragon") end,
})

MainTab:CreateButton({
   Name = "Get Garama",
   Callback = function() ultraSpawn("Garama") end,
})
