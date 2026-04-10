-- AliHub Custom Stealer & Farm
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

print("AliHub Loaded! Starting Steal & Farm...")

-- Функция для воровства у всех на сервере
function stealFromEveryone()
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            -- Пытаемся забрать созревший урожай у других
            local otherGarden = workspace.Gardens:FindFirstChild(otherPlayer.Name)
            if otherGarden then
                for _, crop in pairs(otherGarden:GetChildren()) do
                    if crop:FindFirstChild("Harvestable") and crop.Harvestable.Value == true then
                        game:GetService("ReplicatedStorage").Events.Harvest:FireServer(crop)
                    end
                end
            end
        end
    end
end

-- Функция автофарма (сажаем и собираем у себя)
spawn(function()
    while wait(1) do
        -- Собираем свой урожай
        local myGarden = workspace.Gardens:FindFirstChild(player.Name)
        if myGarden then
            for _, crop in pairs(myGarden:GetChildren()) do
                game:GetService("ReplicatedStorage").Events.Harvest:FireServer(crop)
            end
        end
        -- Воруем у других каждые 5 секунд
        stealFromEveryone()
    end
end)

print("Steal Mode: ON")
