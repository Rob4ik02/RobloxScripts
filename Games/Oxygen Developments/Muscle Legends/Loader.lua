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

print(" OXYGEN SYSTEM: Welcome to console! The Script is loading now..")
warn(" OXYGEN SYSTEM: The script can maybe not loaded if your exploit not strong possible!")
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
-- БЕЗОПАСНАЯ ЗАГРУЗКА МОДУЛЕЙ
-- =============================================================================
local function loadExternalModule(url, env)
    local success, scriptContent = pcall(function()
        return game:HttpGet(url)
    end)
    
    if not success then
        warn("OXYGEN SYSTEM: Bad internet. (Can't download the module): " .. url)
        return
    end

    local func, err = loadstring(scriptContent)
    if not func then
        warn("OXYGEN SYSTEM: No func after then. (Syntax in file?): " .. url .. "\n" .. tostring(err))
        return
    end

    local successExec, result = pcall(func)
    if successExec then
        if type(result) == "function" then
            result(env) -- Передаем Env
        else
            warn("OXYGEN SYSTEM: Module " .. url .. " wasn't back the answer!")
        end
    else
        warn("OXYGEN SYSTEM: Module isn't loaded!" .. url .. "\n" .. tostring(result))
    end
end

wait(1)
print(" OXYGEN SYSTEM: Loading External Module 'VerifyPlayer.lua'")
loadExternalModule("https://raw.githubusercontent.com/Rob4ik02/RobloxScripts/refs/heads/main/Games/Oxygen%20Developments/Muscle%20Legends/VerifyPlayer.lua", Env)
wait(1)
print(" OXYGEN SYSTEM: Loading External Module 'Home.lua'")
loadExternalModule("https://raw.githubusercontent.com/Rob4ik02/RobloxScripts/refs/heads/main/Games/Oxygen%20Developments/Muscle%20Legends/Home.lua", Env)
wait(1)
print(" OXYGEN SYSTEM: Loading External Module 'GymFarm.lua'")
loadExternalModule("https://raw.githubusercontent.com/Rob4ik02/RobloxScripts/refs/heads/main/Games/Oxygen%20Developments/Muscle%20Legends/GymFarm.lua", Env)
wait(1)
print(" OXYGEN SYSTEM: Loading External Module 'Automation.lua'")
loadExternalModule("https://raw.githubusercontent.com/Rob4ik02/RobloxScripts/refs/heads/main/Games/Oxygen%20Developments/Muscle%20Legends/Automation.lua", Env)



playInterfaceSound("NotificationSound")
Notifier.new({
    Title = "02: Notification",
    Content = "The script has been succesfuly loaded for use!",
    Duration = 6,
    Icon = "rbxassetid://102643647961511"
});
