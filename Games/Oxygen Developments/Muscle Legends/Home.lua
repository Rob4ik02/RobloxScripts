return function(Env)
    local AutoTab = Env.Tabs.Auto
  	local HomeTab = Env.Tabs.Home
  	local ShopTab = Env.Tabs.Shop
  	local StatusTab = Env.Tabs.Status
  	local SettingsTab = Env.Tabs.Settings
    local KillTab = Env.Tabs.Kill
  	local MiscTab = Env.Tabs.Misc
    local MainTab = Env.Tabs.Main
    local player = Env.player
    local playInterfaceSound = Env.playInterfaceSound
    local Notifier = Env.Notifier
    local RS = Env.RS
    local rEvents = Env.rEvents
    print("Cloud Oxygen Hub: Loading Home.lua")
    print("Cloud Oxygen Hub: 0/2 Home.Lua")
    -- // Home Tab \\ --

    local CreditsExtractTab = HomeTab:DrawTab({
    	Name = "Credits Tab",
    	Type = "Single"
    });
    
    local TextSection1 = CreditsExtractTab:DrawSection({
    	Name = "Special Thanks To:",
    	Position = 'middle'	
    });
    
    TextSection1:AddParagraph({
    	Title = "Ai",
    	Content = "Gemini, ChatGpt."
    })
    
    TextSection1:AddParagraph({
    	Title = "Developer of UiLibrary",
    	Content = "4lpaca-pin"
    })
    
    TextSection1:AddParagraph({
    	Title = "Players (Helped in coding and testing)",
    	Content = "Axearoz, My4Back, 8h8ph."
    })
    print("Cloud Oxygen Hub: 1/2 Home.Lua")
    local FAQExtractTab = HomeTab:DrawTab({
    	Name = "FAQ",
    	Type = "Single"
    });
    
    local TextSection1 = FAQExtractTab:DrawSection({
    	Name = "Why devs used this library Ui?",
    	Position = 'middle'	
    });
    
    TextSection1:AddParagraph({
    	Title = "( 1 )",
    	Content = [[
    The ui library is very easy to use and has a lot of features
    that can be used to create
    a great ui for the script.
        ]]
    })
    
    local TextSection2 = FAQExtractTab:DrawSection({
    	Name = "Why the script is not working on other exploits?",
    	Position = 'middle'	
    });
    
    TextSection2:AddParagraph({
    	Title = "( 2 . 1 )",
    	Content = [[
    If it doesn't work, the exploit is not capable of supporting 
    a script that uses more complex details.
        ]]
    })
    
    TextSection2:AddParagraph({
    	Title = "( 2 . 2 )",
    	Content = [[
    Either the exploit is outdated and 
    does not work on current versions.
        ]]
    })
    
    TextSection2:AddParagraph({
    	Title = "( 2 . 3 )",
    	Content = [[
    The script works with the following exploits:
     Delta, JJsploit, Velocity, Arceus x neo
        ]]
    })
    
    
    local KeySystemExtractTab = HomeTab:DrawTab({
    	Name = "Key System",
    	Type = "Single"
    });

    print("Cloud Oxygen Hub: 2/2 Home.Lua")
    
    local TextSection1 = KeySystemExtractTab:DrawSection({
    	Name = "Key Time Status:",
    	Position = 'middle'	
    });
    
    TextSection1:AddParagraph({
    	Title = "Lifetime",
    	Content = [[
    The key is lifetime, cuz the script in
    the development stage, and the devs want to add more features in the future.
        ]]
    })
    wait(0.5)
    print("Cloud Oxygen Hub: Loaded Home.lua!")
end
