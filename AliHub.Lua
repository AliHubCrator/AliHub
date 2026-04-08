-- @diagnostic disable: undefined-global

-- [[ LOADING LIBRARY ]] --
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- [[ WINDOW SETUP ]] --
local Window = OrionLib:MakeWindow({
    Name = "Ali Hub | PRO", 
    HidePremium = true, 
    SaveConfig = true, 
    ConfigFolder = "AliProject"
})

-- [[ MAIN TAB ]] --
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- [[ TOGGLE SECTION ]] --
Tab:AddToggle({
    Name = "Auto-Spawn OG", -- Название кнопки
    Default = false,
    Callback = function(Value)
        _G.Active = Value
        task.spawn(function()
            while _G.Active do
                -- Используем чистые пути без русского языка
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local event = ReplicatedStorage:WaitForChild("Events"):WaitForChild("SpawnBrainrot")
                event:FireServer("Normal")
                task.wait(0.1)
            end
        end)
    end    
})

OrionLib:Init()
