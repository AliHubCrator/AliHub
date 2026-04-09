-- Ждем загрузку библиотеки Rayfield
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success or not Rayfield then
    warn("Rayfield не загрузился! Попробуй еще раз через 5 секунд.")
    return
end

local Window = Rayfield:CreateWindow({
   Name = "AliHub OG | Steal a Brainrot",
   LoadingTitle = "AliHub Loading...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

-- Создаем вкладки только после успешной загрузки Window
local MainTab = Window:CreateTab("Main", 4483362458)
local SpawnTab = Window:CreateTab("Spawn (Visual)", 4483362458)

-- ФУНКЦИИ
MainTab:CreateButton({
   Name = "Speed 100",
   Callback = function()
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
   end,
})

-- Функция для спавна персонажей (Визуальная)
local function spawnVisual(name)
    Rayfield:Notify({Title = "AliHub", Content = "Trying to spawn: " .. name, Duration = 3})
end

SpawnTab:CreateButton({
   Name = "Spawn OG Brainrot",
   Callback = function() spawnVisual("OG Brainrot") end,
})

SpawnTab:CreateButton({
   Name = "Spawn Strawberry Dream",
   Callback = function() spawnVisual("Strawberry Dream") end,
})

SpawnTab:CreateButton({
   Name = "Spawn Garama",
   Callback = function() spawnVisual("Garama") end,
})

Rayfield:Notify({
   Title = "AliHub Ready",
   Content = "Хаб успешно запущен!",
   Duration = 5,
})
