local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub | Spawner Only",
   LoadingTitle = "Safe Mode Active",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Spawn List", 4483362458)

-- ФУНКЦИЯ ЧИСТОГО СПАВНА
local function pureSpawn(name)
    Rayfield:Notify({Title = "AliHub", Content = "Spawning: " .. name, Duration = 2})
    
    -- Ищем оригинал в папках сервера
    local storage = game:GetService("ReplicatedStorage")
    local original = storage:FindFirstChild(name, true)
    
    if original then
        local clone = original:Clone()
        -- Ставим модель рядом, чтобы не мешала ходить
        clone.Parent = game.Workspace
        clone:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(7, 0, 0))
    else
        Rayfield:Notify({Title = "Error", Content = "Model not found on this server", Duration = 3})
    end
end

-- Кнопки для спавна (без лишних скриптов на бег)
Tab:CreateButton({
   Name = "Spawn Strawberry Dream",
   Callback = function() pureSpawn("Strawberry Dream") end,
})

Tab:CreateButton({
   Name = "Spawn Dragon Cannelloni",
   Callback = function() pureSpawn("Dragon Cannelloni") end,
})

Tab:CreateButton({
   Name = "Spawn Garama",
   Callback = function() pureSpawn("Garama") end,
})

Tab:CreateButton({
   Name = "Spawn OG Brainrot",
   Callback = function() pureSpawn("OG Brainrot") end,
})
