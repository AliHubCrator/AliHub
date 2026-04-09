local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub | PRO BREAKER",
   LoadingTitle = "Bypassing Security...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

-- Защита от ошибки index nil
if Window then
    local Tab = Window:CreateTab("Event Hacks", 4483362458)

    -- ГЛАВНАЯ ФУНКЦИЯ ПРОРЫВА
    local function forceEvent(name)
        Rayfield:Notify({Title = "AliHub", Content = "Bruteforcing: " .. name, Duration = 3})
        
        -- Ищем скрытые команды сервера (RemoteEvents)
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") and (v.Name:lower():find(name:lower()) or v.Name:lower():find("event")) then
                -- Мы не просто тыкаем, мы шлем сигнал "True", что ивент выполнен
                v:FireServer(true) 
                v:FireServer()
                Rayfield:Notify({Title = "SUCCESS", Content = "Signal sent to: " .. v.Name, Duration = 3})
            end
        end
    end

    Tab:CreateButton({
       Name = "Force Strawberry Event",
       Callback = function() forceEvent("Strawberry") end,
    })

    Tab:CreateButton({
       Name = "Force Dragon Event",
       Callback = function() forceEvent("Dragon") end,
    })

    Tab:CreateButton({
       Name = "Force Garama Event",
       Callback = function() forceEvent("Garama") end,
    })

    -- КНОПКА ТЕЛЕПОРТА (Там всегда лежит ивент)
    Tab:CreateButton({
       Name = "Teleport to Event Item",
       Callback = function()
           for _, item in pairs(game.Workspace:GetDescendants()) do
               if item.Name:lower():find("strawberry") or item.Name:lower():find("dragon") then
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = item.CFrame
                   return
               end
           end
       end,
    })
else
    warn("Rayfield Window Error!")
end
