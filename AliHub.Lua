local EventTab = Window:CreateTab("Server Events", 4483362458)

-- Функция для отправки сигнала СЕРВЕРУ
local function fireServerEvent(eventName, args)
    -- Ищем скрытые папки с ивентами
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Events") 
    if remote then
        local targetEvent = remote:FindFirstChild(eventName)
        if targetEvent and targetEvent:IsA("RemoteEvent") then
            targetEvent:FireServer(unpack(args))
            Rayfield:Notify({Title = "AliHub", Content = "Сигнал отправлен на СЕРВЕР: " .. eventName, Duration = 4})
        end
    end
end

EventTab:CreateButton({
    Name = "Claim Strawberry Dream (Server)",
    Callback = function()
        -- Точное название ивента из файлов: StrawberryEvent или ClaimReward
        fireServerEvent("ClaimReward", {"Strawberry Dream"})
        fireServerEvent("StrawberryEvent", {true})
    end,
})

EventTab:CreateButton({
    Name = "Claim Dragon Cannelloni (Server)",
    Callback = function()
        fireServerEvent("ClaimReward", {"Dragon Cannelloni"})
        fireServerEvent("DragonEvent", {true})
    end,
})

EventTab:CreateButton({
    Name = "Start Secret Event (For ALL)",
    Callback = function()
        -- Пытаемся запустить глобальный ивент
        fireServerEvent("StartGlobalEvent", {"Garama"})
    end,
})
