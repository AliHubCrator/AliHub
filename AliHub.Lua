local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Создаем окно
local Window = Rayfield:CreateWindow({
   Name = "AliHub | PRO BREAKER",
   LoadingTitle = "Bypassing Security...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

-- ЖДЕМ ОКНО ДО ПОБЕДНОГО (Цикл ожидания)
repeat task.wait(0.5) until Window ~= nil

-- Теперь создаем вкладку, когда окно ТОЧНО есть
local Tab = Window:CreateTab("Event Hacks", 4483362458)

local function forceEvent(name)
    Rayfield:Notify({Title = "AliHub", Content = "Bruteforcing: " .. name, Duration = 3})
    
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") and (v.Name:lower():find(name:lower()) or v.Name:lower():find("event")) then
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
