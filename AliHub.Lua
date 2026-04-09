-- Library Boot
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Window Creation
local Window = Rayfield:CreateWindow({
   Name = "AliHub OG Edition",
   LoadingTitle = "AliHub Loading...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

if Window then
    local MainTab = Window:CreateTab("Main", 4483362458)
    local SpawnTab = Window:CreateTab("Items", 4483362458)

    -- SPEED FUNCTION
    MainTab:CreateButton({
       Name = "Set Speed 100",
       Callback = function()
           game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
       end,
    })

    -- SPAWN LOGIC (SEARCHING IN GAME MEMORY)
    local function spawnItem(name)
        Rayfield:Notify({Title = "AliHub", Content = "Scanning memory for: " .. name, Duration = 3})
        
        local storage = game:GetService("ReplicatedStorage")
        local item = storage:FindFirstChild(name, true)
        
        if item then
            local clone = item:Clone()
            clone.Parent = game.Players.LocalPlayer.Character
            Rayfield:Notify({Title = "Success", Content = name .. " spawned!", Duration = 3})
        else
            Rayfield:Notify({Title = "Error", Content = name .. " not found", Duration = 3})
        end
    end

    -- EXACT BUTTONS
    SpawnTab:CreateButton({
       Name = "Spawn Strawberry Dream",
       Callback = function() spawnItem("Strawberry Dream") end,
    })

    SpawnTab:CreateButton({
       Name = "Spawn Dragon Cannelloni",
       Callback = function() spawnItem("Dragon Cannelloni") end,
    })

    SpawnTab:CreateButton({
       Name = "Spawn Garama",
       Callback = function() spawnItem("Garama") end,
    })

    Rayfield:Notify({
       Title = "AliHub Ready",
       Content = "Enjoy your game!",
       Duration = 5,
    })
else
    warn("Failed to load AliHub Window")
end
