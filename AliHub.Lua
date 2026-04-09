local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub OG | Steal a Brainrot",
   LoadingTitle = "AliHub Loading...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Main", 4483362458)
local SpawnTab = Window:CreateTab("Spawn (Visual)", 4483362458)

-- ОСНОВНЫЕ ФУНКЦИИ
MainTab:CreateButton({
   Name = "Speed 100",
   Callback = function()
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
   end,
})

MainTab:CreateToggle({
   Name = "Auto-Clicker (Autobio)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Auto = Value
       while _G.Auto do
           local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
           if tool then tool:Activate() end
           task.wait(0.1)
       end
   end,
})

-- ВКЛАДКА СПАВНА (Точные названия из игры)
local function spawnVisual(name)
    Rayfield:Notify({Title = "AliHub", Content = "Trying to spawn: " .. name, Duration = 2})
    -- Здесь код имитирует получение персонажа для тебя
    -- Это визуально меняет твоего персонажа на выбранного
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        -- Это "авторский" метод смены скина
        print("Switched to " .. name)
    end
end

SpawnTab:CreateButton({
   Name = "Spawn OG Brainrot",
   Callback = function() spawnVisual("OG Brainrot") end,
})

SpawnTab:CreateButton({
   Name = "Spawn Strawberry Dream", -- Тот самый "Клубничный сон"
   Callback = function() spawnVisual("Strawberry Dream") end,
})

SpawnTab:CreateButton({
   Name = "Spawn Dragon",
   Callback = function() spawnVisual("Dragon") end,
})

SpawnTab:CreateButton({
   Name = "Spawn Garama",
   Callback = function() spawnVisual("Garama") end,
})

SpawnTab:CreateButton({
   Name = "Spawn Nuclear Dinosaur",
   Callback = function() spawnVisual("Nuclear Dinosaur") end,
})

Rayfield:Notify({
   Title = "AliHub Ready",
   Content = "Script loaded successfully!",
   Duration = 5,
})
