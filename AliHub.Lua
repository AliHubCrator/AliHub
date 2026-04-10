local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AliHub | Grow a Garden",
   LoadingTitle = "AliHub Loading...",
   LoadingSubtitle = "by Ali",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Main Hacks", nil) -- Вкладка с функциями

-- Функция для воровства
local function stealItems()
    local gardens = workspace:FindFirstChild("Gardens") or workspace:FindFirstChild("Plots")
    if gardens then
        for _, plot in pairs(gardens:GetChildren()) do
            for _, item in pairs(plot:GetDescendants()) do
                if item.Name == "Harvestable" and item.Value == true then
                    game:GetService("ReplicatedStorage").Events.Harvest:FireServer(item.Parent)
                end
            end
        end
    end
end

-- Кнопка для воровства
MainTab:CreateButton({
   Name = "Steal Everything (Воровать)",
   Callback = function()
       stealItems()
   end,
})

-- Переключатель для авто-фарма
MainTab:CreateToggle({
   Name = "Auto Farm & Steal (Авто-вор)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       _G.AutoFarm = Value
       while _G.AutoFarm do
           stealItems()
           task.wait(1)
       end
   end,
})

Rayfield:Notify({
   Title = "AliHub Loaded!",
   Content = "Enjoy stealing gardens!",
   Duration = 5,
})
