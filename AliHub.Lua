local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub CREATOR MODE",
   LoadingTitle = "Accessing Server Logs...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Creator Spawn", 4483362458)

-- ФУНКЦИЯ НАСТОЯЩЕГО СОЗДАНИЯ (Instance Creation)
local function creatorSpawn(itemName, color)
    Rayfield:Notify({Title = "AliHub", Content = "Generating " .. itemName .. "...", Duration = 3})
    
    -- Создаем деталь (как основу персонажа)
    local p = Instance.new("Part")
    p.Name = itemName
    p.Size = Vector3.new(4, 4, 4)
    p.BrickColor = BrickColor.new(color)
    p.Material = Enum.Material.Neon
    p.Parent = game.Players.LocalPlayer.Character
    
    -- Привязываем к игроку, чтобы он следовал за тобой
    local weld = Instance.new("WeldConstraint")
    weld.Parent = p
    weld.Part0 = p
    weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart
    p.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)

    Rayfield:Notify({Title = "Success", Content = itemName .. " Created at your position!", Duration = 3})
end

Tab:CreateButton({
   Name = "Spawn Strawberry Dream (Creator)",
   Callback = function() 
       creatorSpawn("Strawberry Dream", "Bright red") 
   end,
})

Tab:CreateButton({
   Name = "Spawn Dragon Cannelloni (Creator)",
   Callback = function() 
       creatorSpawn("Dragon Cannelloni", "New Yeller") 
   end,
})

Tab:CreateButton({
   Name = "Spawn Garama (Creator)",
   Callback = function() 
       creatorSpawn("Garama", "Really black") 
   end,
})
