local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub | STEALTH",
   LoadingTitle = "Executing Stealth Bypass...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

-- Ждем загрузки окна
repeat task.wait(0.5) until Window ~= nil

local Tab = Window:CreateTab("Safe Events", 4483362458)

local function safeFire(eventPath, name)
    if eventPath then
        Rayfield:Notify({Title = "AliHub", Content = "Activating: " .. name, Duration = 2})
        eventPath:FireServer()
        -- Ждем полсекунды, чтобы не лагало
        task.wait(0.5)
    end
end

Tab:CreateButton({
   Name = "Claim Egg & Coins (Safe)",
   Callback = function()
       local service = game:GetService("ReplicatedStorage"):FindFirstChild("EventService", true)
       if service then
           local hunt = service:FindFirstChild("EggrotHunt", true)
           if hunt then
               -- Активируем по очереди с паузой
               safeFire(hunt:FindFirstChild("SpawnCoin"), "Spawn Coin")
               safeFire(hunt:FindFirstChild("ClaimCoin"), "Claim Coin")
               safeFire(hunt:FindFirstChild("GoldEggReward"), "Gold Egg")
           end
       end
   end,
})

Tab:CreateButton({
   Name = "Force Strawberry Dream",
   Callback = function()
       -- Ищем именно секретные ивенты персонажей
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("RemoteEvent") and v.Name:lower():find("strawberry") then
               safeFire(v, "Strawberry Event")
               break
           end
       end
   end,
})

Tab:CreateButton({
   Name = "Anti-Lag Reset",
   Callback = function()
       -- Очистка персонажа если залагало
       game.Players.LocalPlayer.Character.Humanoid.Health = 0
       Rayfield:Notify({Title = "Reset", Content = "Character reset to fix lag", Duration = 2})
   end,
})
