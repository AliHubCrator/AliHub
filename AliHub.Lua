local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

print("AliHub Loaded Successfully!")

function stealFromEveryone()
    -- Look for the folder with gardens (checks multiple names just in case)
    local gardens = workspace:FindFirstChild("Gardens") or workspace:FindFirstChild("Plots") or workspace:FindFirstChild("Farms") or workspace:FindFirstChild("PlotsModel")
    
    if gardens then
        for _, plot in pairs(gardens:GetChildren()) do
            for _, item in pairs(plot:GetDescendants()) do
                -- Check for harvestable tag
                if item.Name == "Harvestable" and item.Value == true then
                    local crop = item.Parent
                    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                    if remote and remote:FindFirstChild("Harvest") then
                        remote.Harvest:FireServer(crop)
                    end
                end
            end
        end
    end
end

-- Main loop
spawn(function()
    while task.wait(1) do
        -- Steal and harvest
        pcall(stealFromEveryone)
    end
end)

print("AliHub System: Running")
