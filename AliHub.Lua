local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub | EVENT BREAKER",
   LoadingTitle = "Bypassing Server Security...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Event Hacks", 4483362458)

-- ГЛАВНАЯ ФУНКЦИЯ: АКТИВАЦИЯ ИВЕНТА
local function activateEvent(eventName)
    Rayfield:Notify({Title = "AliHub", Content = "Trying to force event: " .. eventName, Duration = 3})
    
    -- Пробуем найти ивент в скрытых папках игры
    local replicated = game:GetService("ReplicatedStorage")
    
    -- Список возможных путей, где разработчик прячет ивенты
    local paths = {
        replicated:FindFirstChild("Events"),
        replicated:FindFirstChild("Remotes"),
        replicated:FindFirstChild("Modules")
    }
    
    for _, path in pairs(paths) do
        if path then
            for _, v in pairs(path:GetDescendants()) do
                -- Ищем ивент, который совпадает с названием персонажа
                if v:IsA("RemoteEvent") and v.Name:lower():find(eventName:lower()) then
                    v:FireServer() -- Отправляем сигнал серверу
                    Rayfield:Notify({Title = "SUCCESS", Content = "Event signal sent to: " .. v.Name, Duration = 4})
                end
            end
        end
    end
end

Tab:CreateButton({
   Name = "Start Strawberry Dream Event",
   Callback = function() activateEvent("Strawberry") end,
})

Tab:CreateButton({
   Name = "Start Dragon Cannelloni Event",
   Callback = function() activateEvent("Dragon") end,
})

Tab:CreateButton({
   Name = "Start Garama Event",
   Callback = function() activateEvent("Garama") end,
})

-- ЧИТ-КНОПКА: ТЕЛЕПОРТ К ИВЕНТУ (если он уже идет)
Tab:CreateButton({
   Name = "Teleport to Active Event",
   Callback = function()
       for _, v in pairs(game.Workspace:GetDescendants()) do
           if v.Name:lower():find("event") or v.Name:lower():find("portal") then
               if v:IsA("BasePart") then
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                   Rayfield:Notify({Title = "Teleported", Content = "Found event object!", Duration = 3})
                   return
               end
           end
       end
       Rayfield:Notify({Title = "Not Found", Content = "No active event objects on map", Duration = 3})
   end,
})
