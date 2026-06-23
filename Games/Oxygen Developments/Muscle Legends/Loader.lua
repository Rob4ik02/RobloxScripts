-- // localization \\ --
local players = game:GetService("Players")
local player = players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RS = game:GetService("ReplicatedStorage")
local rEvents = RS:WaitForChild("rEvents")

_G.whitelistedPlayers = _G.whitelistedPlayers or {}
_G.blacklistedPlayers = _G.blacklistedPlayers or {}

-- // Загрузка звуков \\ --
local sounds = {
    ["ButtonClick"] = "rbxassetid://140387697208266",
    ["WarnSound"] = "rbxassetid://136001454409424",
    ["NotificationSound"] = "rbxassetid://134195160579609",
    ["LoadedSound"] = "rbxassetid://117683281438895",
    ["ErrorSound"] = "rbxassetid://131039887376992",
    ["LoadingSound"] = "rbxassetid://3320590485"
}

for soundName, assetId in pairs(sounds) do
    local existingSound = playerGui:FindFirstChild(soundName)
    if not existingSound then
        local newSound = Instance.new("Sound")
        newSound.Name = soundName
        newSound.SoundId = assetId
        newSound.Volume = 0.6
        newSound.PlayOnRemove = false
        newSound.Parent = playerGui
    else
        existingSound.SoundId = assetId
    end
end

local function playInterfaceSound(soundName)
    local sound = playerGui:FindFirstChild(soundName)
    if sound and sound:IsA("Sound") then
        sound:Play()
    end
end

-- // Oxygen Hub Library \\ --
local LibraryUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))();

local Notifier = LibraryUi.newNotify();
local ConfigManager = LibraryUi:ConfigManager({ Directory = "Oxygen-UI", Config = "Configs" });

playInterfaceSound("LoadingSound")
LibraryUi:Loader("rbxassetid://102643647961511" , 3).yield();
task.wait(3)
playInterfaceSound("LoadedSound")

-- // Создание Окна \\ --
local Window = LibraryUi.new({
    Name = "Oxygen Hub | Muscle Legends",
    Keybind = "LeftAlt",
    Logo = "rbxassetid://102643647961511",
    Scale = Mobile,
    TextSize = 10,
});

local Watermark = Window:Watermark();
Watermark:AddText({ Icon = "user", Text = "Tester" });
Watermark:AddText({ Icon = "star", Text = "Premium" });

Window:DrawCategory({ Name = "Muscle Legends" });

-- // СОЗДАНИЕ ВКЛАДОК \\ --
local Tabs = {
    Home = Window:DrawContainerTab({ Name = "Home", Icon = "house" }),
    Main = Window:DrawContainerTab({ Name = "Main", Icon = "scroll" }),
    Auto = Window:DrawContainerTab({ Name = "Automation", Icon = "repeat" }),
    Shop = Window:DrawContainerTab({ Name = "Shop", Icon = "shopping-cart" }),
    Kill = Window:DrawContainerTab({ Name = "Kill", Icon = "skull" }),
    Status = Window:DrawContainerTab({ Name = "Status", Icon = "info" }),
    Misc = Window:DrawContainerTab({ Name = "Miscellaneous", Icon = "cog" }),
    Settings = Window:DrawContainerTab({ Name = "Settings", Icon = "gear" })
}

-- =============================================================================
-- ENVIRONMENT (УПАКОВКА ДАННЫХ ДЛЯ ДРУГИХ ФАЙЛОВ)
-- =============================================================================
-- Мы передаём этот Env в другие файлы, чтобы они знали, куда рисовать UI
local Env = {
    LibraryUi = LibraryUi,
    Notifier = Notifier,
    Window = Window,
    Tabs = Tabs,
    player = player,
    RS = RS,
    rEvents = rEvents,
    playInterfaceSound = playInterfaceSound
}

-- =============================================================================
-- ЗАГРУЗКА МОДУЛЕЙ С GITHUB
-- =============================================================================
local REPO_URL = "https://github.com/Rob4ik02/RobloxScripts/tree/main/Games/Oxygen%20Developments/Muscle%20Legends"

-- Загружаем модули и передаем им таблицу Env
loadstring(game:HttpGet(REPO_URL .. "GymFarm.lua"))()(Env)
loadstring(game:HttpGet(REPO_URL .. "Automation.lua"))()(Env)
-- Добавляй сюда следующие файлы по такому же принципу

playInterfaceSound("NotificationSound")
Notifier.new({
    Title = "02: Notification",
    Content = "The script has been succesfuly loaded for use!",
    Duration = 6,
    Icon = "rbxassetid://102643647961511"
});
