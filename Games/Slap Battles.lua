-- Проверяем, что скрипт запущен в нужной игре
local PlaceIdSlapBattles = 6403373529 -- ID игры Slap Battles
local placeId = game.PlaceId

if placeId == PlaceIdSlapBattles then
    -- Загружаем внешний скрипт
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CelerityRBLX/Roblox/refs/heads/main/Slap%20Battles/Slap%20Farm%20Loader.lua"))("https://t.me/universalscriptsroblox")
    end)

    if not success then
        warn("[Ошибка загрузки]: " .. tostring(err))
    else
        print("[Успех]: Сценарий Slap Battles загружен.")
    end

    -- Ожидание перед переходом
    task.wait(200)

    -- Переход на другой сервер (ServerHop)
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local function ServerHop()
        local HttpService = game:GetService("HttpService")
        local servers = {}
        local cursor = ""

        local success2, response = pcall(function()
            local url = "https://games.roblox.com/v1/games/" .. PlaceIdSlapBattles .. "/servers/Public?sortOrder=Asc&limit=100"
            return game:HttpGet(url)
        end)

        if success2 and response then
            local data = HttpService:JSONDecode(response)
            if data and data.data then
                for _, server in ipairs(data.data) do
                    if server.playing < server.maxPlayers then
                        table.insert(servers, server)
                    end
                end
            end
        end

        if #servers > 0 then
            local randomServer = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(PlaceIdSlapBattles, randomServer.id, player)
            print("[Инфо]: Переход на новый сервер...")
        else
            warn("[ServerHop]: Не найдено свободных серверов.")
        end
    end

    -- Вызываем переход
    ServerHop()
else
    warn("[Ошибка]: Скрипт предназначен только для Slap Battles!")
end
