local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub OG | Steal a Brainrot",
   LoadingTitle = "Final Protocol...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Spawn Menu", 4483362458)

local function finalSpawn(name)
    Rayfield:Notify({Title = "AliHub", Content = "Попытка взлома инвентаря: " .. name, Duration = 3})
    
    -- Ищем модельку во ВСЕЙ игре, а не только на карте
    local storage = game:GetService("ReplicatedStorage")
    local target = storage:FindFirstChild(name, true) or game:GetService("Lighting"):FindFirstChild(name, true)
    
    if target then
        -- Если нашли в памяти - клонируем его тебе!
        local clone = target:Clone()
        clone.Parent = game.Players.LocalPlayer.Character
        Rayfield:Notify({Title = "Успех!", Content = name .. " спавнится!", Duration = 3})
    else
        -- Если даже в памяти нет, значит название другое. Пробуем найти похожее:
        for _, v in pairs(storage:GetDescendants()) do
            if v.Name:lower():find(name:lower()) then
                v:Clone().Parent = game.Players.LocalPlayer.Character
                Rayfield:Notify({Title = "Нашел похожее", Content = "Спавню: " .. v.Name, Duration = 3})
                return
            end
        end
        Rayfield:Notify({Title = "Ошибка", Content = "Сервер скрыл данные " .. name, Duration = 3})
    end
end

Tab:CreateButton({
   Name = "Spawn Garama (From Storage)",
   Callback = function() finalSpawn("Garama") end,
})

Tab:CreateButton({
   Name = "Spawn Strawberry Dream",
   Callback = function() finalSpawn("Strawberry") end,
})

Tab:CreateButton({
   Name = "Spawn Dragon",
   Callback = function() finalSpawn("Dragon") end,
})
