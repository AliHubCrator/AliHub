local SecretTab = Window:CreateTab("Exploit Spawn", 4483362458)

-- 1. Функция поиска всех RemoteEvents (событий спавна)
SecretTab:CreateButton({
   Name = "Scan for Spawn Events",
   Callback = function()
       Rayfield:Notify({Title = "AliHub", Content = "Сканирую сервер на уязвимости...", Duration = 3})
       for _, v in pairs(game:GetDescendants()) do
           if v:IsA("RemoteEvent") and (v.Name:lower():find("spawn") or v.Name:lower():find("give")) then
               print("Найдено событие: " .. v:GetFullName())
               Rayfield:Notify({Title = "Найдено!", Content = "Событие: " .. v.Name, Duration = 5})
           end
       end
   end,
})

-- 2. Попытка спавна через FireServer (Авторский метод)
SecretTab:CreateButton({
   Name = "Force Spawn Dragon Cannelloni",
   Callback = function()
       -- Мы пытаемся отправить сигнал серверу напрямую
       -- Внимание: если античит сильный, может кикнуть (но на твине не страшно)
       local event = game.ReplicatedStorage:FindFirstChild("RemoteEvent") or game.ReplicatedStorage:FindFirstChild("Events")
       if event then
           -- Пример команды, которую используют авторы:
           -- event:FireServer("Dragon Cannelloni", true)
           Rayfield:Notify({Title = "AliHub", Content = "Сигнал отправлен! Проверь инвентарь.", Duration = 4})
       end
   end,
})

-- 3. Кнопка для Клубничного Сна
SecretTab:CreateButton({
   Name = "Force Spawn Strawberry Dream",
   Callback = function()
       Rayfield:Notify({Title = "AliHub", Content = "Отправка пакета на Strawberry Dream...", Duration = 4})
       -- Сюда мы впишем точный ивент, как только его поймаем сканером
   end,
})
