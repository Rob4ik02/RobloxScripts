local regionserver = game:GetService("Workspace").CurrentCamera:FindFirstChild("RegionServer")
local PlaceId = game.PlaceId

local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()

local Window = Luna:CreateWindow({
	Name = "Global Script's", -- This Is Title Of Your Window
	Subtitle = "MEDVED [ Beta ] | Free", -- A Gray Subtitle next To the main title.
	LogoID = "82795327169782", -- The Asset ID of your logo. Set to nil if you do not have a logo for Luna to use.
	LoadingEnabled = true, -- Whether to enable the loading animation. Set to false if you do not want the loading screen or have your own custom one.
	LoadingTitle = "Global Scripts", -- Header for loading screen
	LoadingSubtitle = "MEDVED [ Beta ] ", -- Subtitle for loading screen

	ConfigSettings = {
		RootFolder = nil, -- The Root Folder Is Only If You Have A Hub With Multiple Game Scripts and u may remove it. DO NOT ADD A SLASH
		ConfigFolder = "Big Hub" -- The Name Of The Folder Where Luna Will Store Configs For This Script. DO NOT ADD A SLASH
	},

	KeySystem = false, -- As Of Beta 6, Luna Has officially Implemented A Key System!
	
})

local HomeTab = Window:CreateTab({
	Name = "Home",
	Icon = "cloud_queue",
	ImageSource = "Material",
	ShowTitle = true
})

local BigLabel = HomeTab:CreateParagraph({
	Title = "Before you will start using this script, please read the following information.",
	Text = "This script is tested and works on PC and Mobile. If you have any questions or suggestions, please contact us via Telegram: @Rob4ikOnly We hope you enjoy using this script!"
})

local BigLabel1 = HomeTab:CreateParagraph({
    Title = "Status key",
    Text = "Duration: Infinity, Active"
})

local BigLabel2 = HomeTab:CreateParagraph({
    Title = "Status place",
    Text = "Place ID: "..place..", Time server: "..(regionserver and regionserver.Value or "N/A"),
})

local BigLabel3 = HomeTab:CreateParagraph({
    Title = "Status player",
    Text = "Player: "..player.Name..", User ID: "..player.UserId,
})

local Label1 = HomeTab:CreateLabel({
    Text = "Updates & News",
    Style = 2
})

local BigLabel4 = HomeTab:CreateParagraph({
    Title = "V1.1.0 Soon..",
    Text = "+ Added new scripts without keys in Games\n" ..
           "+ Added new scripts with keys in Games\n" ..
           "+ Added new tab 'FAQ'\n" ..
           "+ Fixed some bugs\n"
})

local BigLabel4 = HomeTab:CreateParagraph({
    Title = "V1.0.0",
    Text = "+ Added new tab 'Games'\n" ..
           "+ Added new tab 'Misc'\n" ..
           "+ Added new tab 'Settings'\n" ..
           "+ Added new tab 'Credits'\n" ..
           "+ Added new scripts for games\n" ..
           "+ Fixed some bugs\n" ..
           "+ Improved interface\n" ..
           "+ Added key system\n"
})

local FarmTab = Window:CreateTab({
	Name = "Farm",
	Icon = "repeat",
	ImageSource = "Material",
	ShowTitle = true
})

local MiscTab = Window:CreateTab({
	Name = "Misc",
	Icon = "star",
	ImageSource = "Material",
	ShowTitle = true
})

local SliderSpeed = MiscTab:CreateSlider({
	Name = "Speed",
	Range = {1, 500},
	Increment = 1,
	CurrentValue = 16,
	Callback = function(Value)
		player.Character.Humanoid.WalkSpeed = Value
	end
}, "SliderSpeed")

local SliderJump = MiscTab:CreateSlider({
	Name = "Jump",
	Range = {1, 500},
	Increment = 1,
	CurrentValue = 50,
	Callback = function(Value)
		player.Character.Humanoid.JumpPower = Value
	end
}, "SliderJump")

local SliderFOV = MiscTab:CreateSlider({
	Name = "Field of View",
	Range = {1, 120},
	Increment = 1,
	CurrentValue = 60,
	Callback = function(Value)
		workspace.CurrentCamera.FieldOfView = Value
	end
}, "SliderFOV")

local PlayerTab = Window:CreateTab({
	Name = "Player",
	Icon = "person",
	ImageSource = "Material",
	ShowTitle = true
})

local VisualTab = Window:CreateTab({
	Name = "Visual",
	Icon = "eye",
	ImageSource = "Material",
	ShowTitle = true
})

local Toggle1 = VisualTab:CreateToggle({
	Name = "ESP Pages",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
        local highlight = Instance.new("Highlight")
        highlight.Name = "Highlight"
        highlight.FillColor = Color3.new(1, 0, 0) -- Красный цвет
        highlight.FillTransparency = 0.2
        local folder = workspace:FindFirstChild("Pages")
		if Value then
            if folder then
                highlight.Parent = folder
            end
            Luna:Notification({
                Title = "ESP Enabled",
                Icon = "info",
                ImageSource = "Material",
                Content = "Now in paged ESP enabled",
                Duration = 5
            })
        else
            highlight:Destroy()
            Luna:Notification({
                Title = "ESP Disabled",
                Icon = "info",
                ImageSource = "Material",
                Content = "Now in paged ESP disabled",
                Duration = 5
            })
        end
	end
}, "Toggle1")

local SettingsTab = Window:CreateTab({
	Name = "Settings",
	Icon = "settings",
	ImageSource = "Material",
	ShowTitle = true
})

local CreditsTab = Window:CreateTab({
	Name = "Credits & Info ",
	Icon = "info",
	ImageSource = "Material",
	ShowTitle = true
})
