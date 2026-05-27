local pcallSuccess = false
local pcallResult = pcall(function()
    pcallSuccess = true
    return
end)
local resultFlag = pcallResult
if pcallResult then
    resultFlag = pcallSuccess
end

local counter = 1
local mathRandom = math.random
local tableConcat = table.concat

local tableUnpack = table and table.unpack or unpack
local randomValue = mathRandom(3, 65)

local errorResult = {
    pcall(function()
        return "gv5" / (7208753 - "161B" ^ 5881356)
    end)
}
local errorMessage = errorResult[2]
local errorLineNum = tonumber(tostring(errorMessage):match(":(%d*):"))

local verificationPassed = true

for iterIndex = 1, randomValue do
    local currentIndex = iterIndex
    local randMax = mathRandom(1, 100)
    local randByte = mathRandom(0, 255)
    local randPos = mathRandom(1, randMax)
    local shouldError = mathRandom(1, 2) == 1
    local modifiedMsg = tostring(errorMessage):gsub(":(%d*):", ":" .. tostring(mathRandom(0, 10000)) .. ":")

    local callResult = {
        pcall(function()
            if mathRandom(1, 2) == 1 or currentIndex == randomValue then
                verificationPassed = verificationPassed and errorLineNum == tonumber(tostring(({
                    pcall(function()
                        return "xWqTk6ctkR" / (12289374 - "H5V13SGIN5drUQ" ^ 6075156)
                    end)
                })[2]):match(":(%d*):"))
            end
            if shouldError then
                error(modifiedMsg, 0)
            end
            local tempTable = {}
            for idx = 1, randMax do
                tempTable[idx] = mathRandom(0, 255)
            end
            tempTable[randPos] = randByte
            return tableUnpack(tempTable)
        end)
    }

    if shouldError then
        verificationPassed = verificationPassed and (pcall(function()
            if mathRandom(1, 2) == 1 or currentIndex == randomValue then
                verificationPassed = verificationPassed and errorLineNum == tonumber(tostring(({
                    pcall(function()
                        return "xWqTk6ctkR" / (12289374 - "H5V13SGIN5drUQ" ^ 6075156)
                    end)
                })[2]):match(":(%d*):"))
            end
            if shouldError then
                error(modifiedMsg, 0)
            end
            local tempTable = {}
            for idx = 1, randMax do
                tempTable[idx] = mathRandom(0, 255)
            end
            tempTable[randPos] = randByte
            return tableUnpack(tempTable)
        end) == false and callResult[2] == modifiedMsg)
    end
end

verificationPassed = verificationPassed and 0 == 0

if verificationPassed then
    local floorFunc = math.floor
    local accumulator = 0
    local multiplier = 2
    local charMap = {}
    local indexPool = {}
    local frameCount = 0

    for idx = 1, 256 do
        indexPool[idx] = idx
    end

    local poolEmpty = #indexPool == 0
    local pickedIndex = table.remove(indexPool, mathRandom(1, #indexPool))
    charMap[pickedIndex] = string.char(pickedIndex - 1)

    if #indexPool == 0 then
        local savedSounds = {}
        local proxyTable = {}
        local metaProxy = setmetatable({}, {
            __index = proxyTable,
            __metatable = nil
        })

        local gameRef = game
        local guiService = gameRef:GetService("GuiService")

        task.spawn(function()
            while task.wait(5) do
                if guiService:GetErrorMessage() ~= "" then
                    local teleportSvc = game:GetService("TeleportService")
                    teleportSvc:Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                end
            end
        end)

        local errorChangedSignal = guiService.ErrorMessageChanged
        errorChangedSignal:Connect(function()
            task.wait(0.1)
            local teleportSvc = game:GetService("TeleportService")
            teleportSvc:Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end)

        local localPlayer = game:GetService("Players").LocalPlayer
        local httpGame = game

        if not loadstring(httpGame:HttpGet("https://raw.githubusercontent.com/shp98/farmeo/refs/heads/main/whitelist.lua"))()[localPlayer.UserId] then
            localPlayer:Kick("IP CAPTURADA...\xf0\x9f\x94\x92")
            return
        end

        local guiLibrary = loadstring(httpGame:HttpGet("https://raw.githubusercontent.com/shp98/farmeo/refs/heads/main/guifarm"))()
        local displayPlayer = game.Players.LocalPlayer

        local mainWindow = guiLibrary:AddWindow("Private Blitz | Hello " .. (displayPlayer.DisplayName or displayPlayer.Name), {
            main_color = Color3.fromRGB(41, 74, 122),
            min_size = Vector2.new(500, 1200),
            can_resize = false
        })

        game:GetService("ReplicatedStorage")
        local playersService = game:GetService("Players")
        game:GetService("Stats")
        local lightingService = game:GetService("Lighting")
        game:GetService("VirtualInputManager")
        local workspaceService = game:GetService("Workspace")
        local starterGuiService = game:GetService("StarterGui")
        local currentPlayer = playersService.LocalPlayer

        local function formatShort(numValue)
            local val = numValue
            local suffixes = {"", "K", "M", "B", "T", "Qa", "Qi"}
            local suffixIdx = 1
            while val >= 1000 and suffixIdx < #suffixes do
                suffixIdx = suffixIdx + 1
                val = val / 1000
            end
            return string.format("%.2f%s", val, suffixes[suffixIdx])
        end

        local function formatComma(numValue)
            local str = tostring(numValue)
            local reversed = str:reverse()
            local withCommas = reversed:gsub("(%d%d%d)", "%1,")
            local result = withCommas:reverse()
            return result:gsub("^,", "")
        end

        local function formatBracket(numValue)
            return "[ " .. formatComma(numValue) .. " | " .. formatShort(numValue) .. " ]"
        end

        task.spawn(function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            task.wait(1)

            local suffixTable = {
                {"Qi", 1e+18},
                {"Qa", 1e+15},
                {"T", 1000000000000},
                {"B", 1000000000},
                {"M", 1000000},
                {"K", 1000}
            }

            local function formatHP(hpValue)
                for _, entry in ipairs(suffixTable) do
                    if hpValue >= entry[2] then
                        return string.format("%.2f%s", hpValue / entry[2], entry[1])
                    end
                end
                return tostring(math.floor(hpValue))
            end

            local function createHPBar(humanoid, character)
                if not character:FindFirstChild("Head") then
                    return
                end
                local existingBB = character:FindFirstChild("HP_BILLBOARD")
                if existingBB then
                    existingBB:Destroy()
                end
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "HP_BILLBOARD"
                billboard.Size = UDim2.new(6, 0, 1.2, 0)
                billboard.StudsOffset = Vector3.new(0, 3.5, 0)
                billboard.AlwaysOnTop = true
                billboard.MaxDistance = 200
                billboard.Parent = character.Head

                local bgFrame = Instance.new("Frame")
                bgFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                bgFrame.BackgroundTransparency = 0.3
                bgFrame.Size = UDim2.new(1, 0, 1, 0)
                bgFrame.BorderSizePixel = 0
                bgFrame.Parent = billboard

                local cornerUI = Instance.new("UICorner")
                cornerUI.CornerRadius = UDim.new(0, 8)
                cornerUI.Parent = bgFrame

                local healthBar = Instance.new("Frame")
                healthBar.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
                healthBar.Size = UDim2.new(1, 0, 1, 0)
                healthBar.BorderSizePixel = 0
                healthBar.Parent = bgFrame

                local gradient = Instance.new("UIGradient")
                gradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
                })
                gradient.Parent = healthBar

                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 2
                stroke.Color = Color3.fromRGB(0, 0, 0)
                stroke.Transparency = 0.7
                stroke.Parent = healthBar

                local hpLabel = Instance.new("TextLabel")
                hpLabel.BackgroundTransparency = 1
                hpLabel.Size = UDim2.new(1, 0, 1, 0)
                hpLabel.TextColor3 = Color3.new(1, 1, 1)
                hpLabel.Font = Enum.Font.GothamBold
                hpLabel.TextSize = 18
                hpLabel.TextStrokeTransparency = 0.5
                hpLabel.Parent = bgFrame

                local textConstraint = Instance.new("UITextSizeConstraint")
                textConstraint.MaxTextSize = 24
                textConstraint.MinTextSize = 14
                textConstraint.Parent = hpLabel

                local function updateHP()
                    if humanoid and humanoid.Parent then
                        local hp = humanoid.Health
                        local maxHP = humanoid.MaxHealth
                        healthBar.Size = UDim2.new(hp / maxHP, 0, 1, 0)
                        hpLabel.Text = formatHP(hp) .. " / " .. formatHP(maxHP)
                    end
                end

                humanoid.HealthChanged:Connect(updateHP)
                updateHP()
            end

            local function onCharacterAdded(character)
                createHPBar(character:WaitForChild("Humanoid"), character)
            end

            for _, player in ipairs(playersService:GetPlayers()) do
                if player.Character then
                    onCharacterAdded(player.Character)
                end
                player.CharacterAdded:Connect(onCharacterAdded)
            end

            playersService.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(onCharacterAdded)
            end)
        end)

        local mainTab = mainWindow:AddTab("Main")
        mainTab:AddLabel("Important:").TextSize = 22

        local lockSwitch = mainTab:AddSwitch("Lock Position", function(enabled)
            local lp = game.Players.LocalPlayer
            if enabled then
                local runSvc = game:GetService("RunService")
                _G.lockConnection = runSvc.Heartbeat:Connect(function()
                    local char = lp.Character
                    if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChildOfClass("Humanoid") then
                        return
                    end
                    local hrp = char.HumanoidRootPart
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if not hum or not hrp then
                        return
                    end
                    if not hum:FindFirstChild("LockState") then
                        hum.WalkSpeed = 0
                        hum.JumpPower = 0
                        hum.AutoRotate = false
                        hum:ChangeState(Enum.HumanoidStateType.Physics)
                        local boolVal = Instance.new("BoolValue", hum)
                        boolVal.Name = "LockState"
                        boolVal.Value = true
                        hum:SetAttribute("LockCFrame", tostring(hrp.CFrame))
                    end
                    hrp.Velocity = Vector3.zero
                    hrp.RotVelocity = Vector3.zero
                end)
            else
                if _G.lockConnection then
                    _G.lockConnection:Disconnect()
                    _G.lockConnection = nil
                end
                local char = lp.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum.WalkSpeed = 250
                        hum.JumpPower = 50
                        hum.AutoRotate = true
                        hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                        local lockState = hum:FindFirstChild("LockState")
                        if lockState then
                            lockState:Destroy()
                        end
                        hum:SetAttribute("LockCFrame", nil)
                    end
                end
            end
        end)
        lockSwitch:Set(false)

        local antiAfkSwitch = mainTab:AddSwitch("Anti AFK", function(enabled)
            if enabled then
                if getgenv().AntiAfkExecuted and game.CoreGui:FindFirstChild("thisoneissocoldww") then
                    getgenv().AntiAfkExecuted = false
                    getgenv().zamanbaslaticisi = false
                    game.CoreGui.thisoneissocoldww:Destroy()
                end
                getgenv().AntiAfkExecuted = true

                local screenGui = Instance.new("ScreenGui")
                local mainFrame = Instance.new("Frame")
                local destroyBtn = Instance.new("TextButton")
                local titleLabel = Instance.new("TextLabel")
                local timeLabel = Instance.new("TextLabel")
                local pingTitle = Instance.new("TextLabel")
                local fpsLabel = Instance.new("TextLabel")
                local fpsTitle = Instance.new("TextLabel")
                local pingLabel = Instance.new("TextLabel")
                local separatorFrame = Instance.new("Frame")
                local separatorCorner = Instance.new("UICorner")
                local statusLabel = Instance.new("TextLabel")

                screenGui.Name = "thisoneissocoldww"
                screenGui.Parent = game.CoreGui
                screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                mainFrame.Name = "madebybloodofbatus"
                mainFrame.Parent = screenGui
                mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                mainFrame.Position = UDim2.new(0.085, 0, 0.13, 0)
                mainFrame.Size = UDim2.new(0, 225, 0, 96)
                Instance.new("UICorner").Parent = mainFrame

                destroyBtn.Name = "DestroyButton"
                destroyBtn.Parent = mainFrame
                destroyBtn.BackgroundTransparency = 1
                destroyBtn.Position = UDim2.new(0.87, 0, 0.02, 0)
                destroyBtn.Size = UDim2.new(0, 27, 0, 15)
                destroyBtn.Font = Enum.Font.SourceSans
                destroyBtn.Text = "X"
                destroyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                destroyBtn.TextSize = 14
                destroyBtn.MouseButton1Click:Connect(function()
                    getgenv().AntiAfkExecuted = false
                    wait(0.1)
                    screenGui:Destroy()
                end)

                titleLabel.Parent = mainFrame
                titleLabel.BackgroundTransparency = 1
                titleLabel.Position = UDim2.new(0.3, 0, 0, 0)
                titleLabel.Size = UDim2.new(0, 95, 0, 24)
                titleLabel.Font = Enum.Font.SourceSans
                titleLabel.Text = "Anti Afk BY BLITZ"
                titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                titleLabel.TextSize = 14

                timeLabel.Parent = mainFrame
                timeLabel.BackgroundTransparency = 1
                timeLabel.Position = UDim2.new(0.65, 0, 0.68, 0)
                timeLabel.Size = UDim2.new(0, 60, 0, 24)
                timeLabel.Font = Enum.Font.SourceSans
                timeLabel.Text = "0:0:0"
                timeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                timeLabel.TextSize = 14

                pingTitle.Parent = mainFrame
                pingTitle.BackgroundTransparency = 1
                pingTitle.Position = UDim2.new(0.03, 0, 0.37, 0)
                pingTitle.Size = UDim2.new(0, 29, 0, 24)
                pingTitle.Font = Enum.Font.SourceSans
                pingTitle.Text = "Ping: "
                pingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                pingTitle.TextSize = 14

                fpsLabel.Parent = mainFrame
                fpsLabel.BackgroundTransparency = 1
                fpsLabel.Position = UDim2.new(0.72, 0, 0.35, 0)
                fpsLabel.Size = UDim2.new(0, 55, 0, 24)
                fpsLabel.Font = Enum.Font.SourceSans
                fpsLabel.Text = "0"
                fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                fpsLabel.TextSize = 14

                fpsTitle.Parent = mainFrame
                fpsTitle.BackgroundTransparency = 1
                fpsTitle.Position = UDim2.new(0.5, 0, 0.35, 0)
                fpsTitle.Size = UDim2.new(0, 26, 0, 24)
                fpsTitle.Font = Enum.Font.SourceSans
                fpsTitle.Text = "Fps: "
                fpsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                fpsTitle.TextSize = 14

                pingLabel.Parent = mainFrame
                pingLabel.BackgroundTransparency = 1
                pingLabel.Position = UDim2.new(0.2, 0, 0.37, 0)
                pingLabel.Size = UDim2.new(0, 55, 0, 24)
                pingLabel.Font = Enum.Font.SourceSans
                pingLabel.Text = "0"
                pingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                pingLabel.TextSize = 14
                pingLabel.TextWrapped = true

                separatorFrame.Parent = mainFrame
                separatorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                separatorFrame.Position = UDim2.new(0.004, 0, 0.24, 0)
                separatorFrame.Size = UDim2.new(0, 224, 0, 5)
                separatorCorner.CornerRadius = UDim.new(0, 50)
                separatorCorner.Parent = separatorFrame

                statusLabel.Parent = mainFrame
                statusLabel.BackgroundTransparency = 1
                statusLabel.Position = UDim2.new(0.05, 0, 0.81, 0)
                statusLabel.Size = UDim2.new(0, 95, 0, 12)
                statusLabel.Font = Enum.Font.SourceSans
                statusLabel.Text = "Anti-Afk Auto Enabled"
                statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                statusLabel.TextSize = 14

                local dragFrame = mainFrame
                local tweenService = game:GetService("TweenService")
                local isDragging = false
                local dragStart = nil
                local startPos = nil
                local dragInput = nil

                local function updateDrag(input)
                    local delta = input.Position - dragStart
                    local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                    local tween = tweenService:Create(dragFrame, TweenInfo.new(0.04, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = newPos})
                    tween:Play()
                end

                dragFrame.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        isDragging = true
                        dragStart = input.Position
                        startPos = dragFrame.Position
                        input.Changed:Connect(function()
                            if input.UserInputState == Enum.UserInputState.End then
                                isDragging = false
                            end
                        end)
                    end
                end)

                dragFrame.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                        dragInput = input
                    end
                end)

                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if input == dragInput and isDragging then
                        updateDrag(input)
                    end
                end)

                local virtualUser = game:GetService("VirtualUser")
                game.Players.LocalPlayer.Idled:Connect(function()
                    virtualUser:CaptureController()
                    virtualUser:ClickButton2(Vector2.new())
                end)

                local fpsStartTime = tick()
                local fpsFrames = {}
                game:GetService("RunService").RenderStepped:Connect(function()
                    local now = tick()
                    for idx = #fpsFrames, 1, -1 do
                        fpsFrames[idx + 1] = fpsFrames[idx] >= now - 1 and fpsFrames[idx] or nil
                    end
                    fpsFrames[1] = now
                    fpsLabel.Text = tostring(math.floor(tick() - fpsStartTime >= 1 and #fpsFrames or #fpsFrames / (tick() - fpsStartTime)))
                end)

                spawn(function()
                    while getgenv().AntiAfkExecuted do
                        wait(1)
                        local statsService = game:GetService("Stats")
                        local pingStat = statsService:FindFirstChild("PerformanceStats")
                        if pingStat then
                            local pingStat2 = pingStat:FindFirstChild("Ping")
                            if pingStat2 then
                                pingLabel.Text = tostring(math.floor(tonumber(pingStat2:GetValue()) or 0))
                            end
                        end
                    end
                end)

                local seconds = 0
                local minutes = 0
                local hours = 0
                getgenv().zamanbaslaticisi = true
                spawn(function()
                    while getgenv().zamanbaslaticisi do
                        seconds = seconds + 1
                        wait(1)
                        if seconds >= 60 then
                            seconds = 0
                            minutes = minutes + 1
                        end
                        if minutes >= 60 then
                            minutes = 0
                            hours = hours + 1
                        end
                        timeLabel.Text = hours .. ":" .. minutes .. ":" .. seconds
                    end
                end)
            else
                getgenv().AntiAfkExecuted = false
                getgenv().zamanbaslaticisi = false
                if game.CoreGui:FindFirstChild("thisoneissocoldww") then
                    game.CoreGui.thisoneissocoldww:Destroy()
                end
            end
        end)
        antiAfkSwitch:Set(true)

        local showPetsSwitch = mainTab:AddSwitch("Show Pets", function(enabled)
            local lp = game:GetService("Players").LocalPlayer
            if lp:FindFirstChild("hidePets") then
                lp.hidePets.Value = enabled
            end
        end)
        showPetsSwitch:Set(false)

        local showOtherPetsSwitch = mainTab:AddSwitch("Show Other Pets", function(enabled)
            local lp = game:GetService("Players").LocalPlayer
            if lp:FindFirstChild("showOtherPetsOn") then
                lp.showOtherPetsOn.Value = enabled
            end
        end)
        showOtherPetsSwitch:Set(false)

        mainTab:AddLabel("Misc:").TextSize = 22

        local jumpConnection = nil
        mainTab:AddSwitch("Infinite Jump", function(enabled)
            _G.InfiniteJump = enabled
            if enabled then
                jumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                    if _G.InfiniteJump then
                        local char = game:GetService("Players").LocalPlayer.Character
                        if char then
                            local hum = char:FindFirstChildOfClass("Humanoid")
                            if hum then
                                hum:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    else
                        if jumpConnection then
                            jumpConnection:Disconnect()
                        end
                    end
                end)
            end
        end)

        local waterParts = {}
        local partSize = 2048
        local mapRange = 50000
        local baseOffset = Vector3.new(-2, -9.5, -2)

        task.spawn(function()
            local tilesNeeded = math.ceil(mapRange / partSize)
            local function createPart(position, partName)
                local part = Instance.new("Part")
                part.Size = Vector3.new(partSize, 1, partSize)
                part.Position = position
                part.Anchored = true
                part.Transparency = 1
                part.CanCollide = true
                part.Name = partName
                part.Parent = workspace
                return part
            end
            for xIdx = 1, tilesNeeded do
                for zIdx = 1, tilesNeeded do
                    table.insert(waterParts, createPart(baseOffset + Vector3.new(xIdx * partSize, 0, zIdx * partSize), "Part_Side_" .. xIdx .. "_" .. zIdx))
                    table.insert(waterParts, createPart(baseOffset + Vector3.new(-xIdx * partSize, 0, zIdx * partSize), "Part_LeftRight_" .. xIdx .. "_" .. zIdx))
                    table.insert(waterParts, createPart(baseOffset + Vector3.new(-xIdx * partSize, 0, -zIdx * partSize), "Part_UpLeft_" .. xIdx .. "_" .. zIdx))
                    table.insert(waterParts, createPart(baseOffset + Vector3.new(xIdx * partSize, 0, -zIdx * partSize), "Part_UpRight_" .. xIdx .. "_" .. zIdx))
                end
            end
        end)

        local waterSwitch = mainTab:AddSwitch("Walk on Water", function(enabled)
            for _, part in ipairs(waterParts) do
                if part and part.Parent then
                    part.CanCollide = enabled
                end
            end
        end)
        waterSwitch:Set(true)

        local timeDropdown = mainTab:AddDropdown("Change Time", function(selected)
            if selected == "Night" then
                game:GetService("Lighting").ClockTime = 0
            elseif selected == "Day" then
                game:GetService("Lighting").ClockTime = 12
            elseif selected == "Midnight" then
                game:GetService("Lighting").ClockTime = 6
            end
        end)
        timeDropdown:Add("Night")
        timeDropdown:Add("Day")
        timeDropdown:Add("Midnight")

        local farmTab = mainWindow:AddTab("Farm Op")

        local hideFramesSwitch = farmTab:AddSwitch("Hide All Frames", function(enabled)
            local repStorage = game:GetService("ReplicatedStorage")
            for _, desc in pairs(repStorage:GetDescendants()) do
                if desc:IsA("GuiObject") and desc.Name:match("Frame$") then
                    desc.Visible = not enabled
                end
            end
            if enabled then
                if _G.HideFramesConn then
                    _G.HideFramesConn:Disconnect()
                end
                _G.HideFramesConn = repStorage.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("GuiObject") and descendant.Name:match("Frame$") then
                        descendant.Visible = false
                    end
                end)
            else
                if _G.HideFramesConn then
                    _G.HideFramesConn:Disconnect()
                    _G.HideFramesConn = nil
                end
                for _, desc in pairs(repStorage:GetDescendants()) do
                    if desc:IsA("GuiObject") and desc.Name:match("Frame$") then
                        desc.Visible = true
                    end
                end
            end
        end)
        hideFramesSwitch:Set(true)

        local spinWheelSwitch = farmTab:AddSwitch("Spin Fortune Wheel", function(enabled)
            _G.AutoSpinWheel = enabled
            if enabled then
                spawn(function()
                    while _G.AutoSpinWheel do
                        pcall(function()
                            local repStorage = game:GetService("ReplicatedStorage")
                            repStorage.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", repStorage.fortuneWheelChances["Fortune Wheel"])
                        end)
                        task.wait(0.1)
                    end
                end)
            end
        end)
        spinWheelSwitch:Set(true)

        farmTab:AddButton("Anti Lag", function()
            for _, desc in pairs(game:GetDescendants()) do
                if desc:IsA("ParticleEmitter") or desc:IsA("Smoke") or desc:IsA("Fire") or desc:IsA("Sparkles") then
                    desc.Enabled = false
                end
            end
            local lighting = game:GetService("Lighting")
            lighting.GlobalShadows = false
            lighting.FogEnd = 9000000000
            lighting.Brightness = 0
            settings().Rendering.QualityLevel = 1

            for _, desc in pairs(game:GetDescendants()) do
                if desc:IsA("Decal") or desc:IsA("Texture") then
                    desc.Transparency = 1
                elseif desc:IsA("BasePart") and not desc:IsA("MeshPart") then
                    desc.Material = Enum.Material.SmoothPlastic
                    if desc.Parent and not desc.Parent:FindFirstChild("Humanoid") then
                        desc.Reflectance = 0
                    end
                end
            end

            for _, child in pairs(lighting:GetChildren()) do
                if child:IsA("BlurEffect") or child:IsA("SunRaysEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("BloomEffect") or child:IsA("DepthOfFieldEffect") then
                    child.Enabled = false
                end
            end

            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "anti lag activado",
                Text = "Full optimization applied!",
                Duration = 5
            })
        end)

        farmTab:AddButton("Full Optimization", function()
            local lp = game.Players.LocalPlayer
            local playerGui = lp:WaitForChild("PlayerGui")
            local lightingSvc = game:GetService("Lighting")

            for _, child in pairs(playerGui:GetChildren()) do
                if child:IsA("ScreenGui") then
                    child:Destroy()
                end
            end

            for _, desc in pairs(workspace:GetDescendants()) do
                if desc:IsA("ParticleEmitter") then
                    desc:Destroy()
                end
            end

            for _, desc in pairs(workspace:GetDescendants()) do
                if desc:IsA("PointLight") or desc:IsA("SpotLight") or desc:IsA("SurfaceLight") then
                    desc:Destroy()
                end
            end

            for _, child in pairs(lightingSvc:GetChildren()) do
                if child:IsA("Sky") then
                    child:Destroy()
                end
            end

            local darkSky = Instance.new("Sky")
            darkSky.Name = "DarkSky"
            darkSky.SkyboxBk = "rbxassetid://0"
            darkSky.SkyboxDn = "rbxassetid://0"
            darkSky.SkyboxFt = "rbxassetid://0"
            darkSky.SkyboxLf = "rbxassetid://0"
            darkSky.SkyboxRt = "rbxassetid://0"
            darkSky.SkyboxUp = "rbxassetid://0"
            darkSky.Parent = lightingSvc
            lightingSvc.Brightness = 0
            lightingSvc.ClockTime = 0
            lightingSvc.TimeOfDay = "00:00:00"
            lightingSvc.OutdoorAmbient = Color3.new(0, 0, 0)
            lightingSvc.Ambient = Color3.new(0, 0, 0)
            lightingSvc.FogColor = Color3.new(0, 0, 0)
            lightingSvc.FogEnd = 100

            task.spawn(function()
                while true do
                    wait(5)
                    if not lightingSvc:FindFirstChild("DarkSky") then
                        darkSky:Clone().Parent = lightingSvc
                    end
                    lightingSvc.Brightness = 0
                    lightingSvc.ClockTime = 0
                    lightingSvc.OutdoorAmbient = Color3.new(0, 0, 0)
                    lightingSvc.Ambient = Color3.new(0, 0, 0)
                    lightingSvc.FogColor = Color3.new(0, 0, 0)
                    lightingSvc.FogEnd = 100
                end
            end)
        end)

        farmTab:AddLabel("Rebiths Gained").TextSize = 23
        local rebirthFolder = farmTab:AddFolder("Funciones de Renacimiento R\xc3\xa1pido")

        local repStorage = game:GetService("ReplicatedStorage")
        local virtualInput = game:GetService("VirtualInputManager")
        game:GetService("RunService")
        local farmPlayer = game:GetService("Players").LocalPlayer
        local leaderstats = farmPlayer:WaitForChild("leaderstats")
        local strengthStat = leaderstats:WaitForChild("Strength")
        local rebirthStat = leaderstats:WaitForChild("Rebirths")

        local function formatRebirth(numVal)
            local val = numVal
            local suffixList = {
                {1e+15, "Qa"},
                {1000000000000, "T"},
                {1000000000, "B"},
                {1000000, "M"},
                {1000, "K"}
            }
            for _, entry in ipairs(suffixList) do
                if math.abs(val) >= entry[1] then
                    return string.format("%.2f%s", numVal / entry[1], entry[2])
                end
            end
            return tostring(math.floor(val))
        end

        rebirthFolder:AddLabel("Tiempo:")
        local timeDisplay = rebirthFolder:AddLabel("0d 0h 0m 0s")
        local rateDisplay = rebirthFolder:AddLabel("Ritmo: 0 / Hora | 0 / D\xc3\xada | 0 / Sem.")
        local avgDisplay = rebirthFolder:AddLabel("Promedio: 0 / Hora | 0 / D\xc3\xada | 0 / Sem.")
        local rebirthCountDisplay = rebirthFolder:AddLabel("Renacimientos: 0 | Ganados: 0")
        local strengthNeededDisplay = rebirthFolder:AddLabel("Fuerza Necesaria: 0")

        local farmStartTime = tick()
        local initialRebirths = rebirthStat.Value
        local rebirthHistory = {}
        local rebirthsGained = 0

        local function getRequiredStrength(rebirthCount)
            return math.floor(5000 + 2500 * rebirthCount)
        end

        local function updateRebirthCount()
            local currentRebirths = rebirthStat.Value
            rebirthsGained = currentRebirths - initialRebirths
            rebirthCountDisplay.Text = "Renacimientos: " .. formatRebirth(currentRebirths) .. " | Ganados: " .. formatRebirth(rebirthsGained)
        end

        rebirthStat.Changed:Connect(updateRebirthCount)
        updateRebirthCount()

        getgenv().AutoFarm = true
        local farmCFrame = CFrame.new(-8652.8672, 29.2667, 2089.2617)
        local swiftSamurai = "Swift Samurai"
        local tribalOverlord = "Tribal Overlord"
        local weightTool = "Weight"

        local function equipPetByName(petName)
            local petsFolder = farmPlayer:FindFirstChild("petsFolder")
            if not petsFolder then
                return
            end
            for _, folder in pairs(petsFolder:GetChildren()) do
                if folder:IsA("Folder") then
                    for _, pet in pairs(folder:GetChildren()) do
                        if pet.Name == petName then
                            repStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
                        end
                    end
                end
            end
        end

        local function unequipAllPets()
            local petsFolder = farmPlayer:FindFirstChild("petsFolder")
            if not petsFolder then
                return
            end
            for _, folder in pairs(petsFolder:GetChildren()) do
                if folder:IsA("Folder") then
                    for _, pet in pairs(folder:GetChildren()) do
                        repStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
                    end
                end
            end
            task.wait(0.2)
        end

        local function sitOnBench()
            local char = farmPlayer.Character
            if not char then
                farmPlayer.CharacterAdded:Wait()
                char = farmPlayer.Character
            end
            if char then
                local hrp = char:WaitForChild("HumanoidRootPart")
                for attempt = 1, 5 do
                    if not getgenv().AutoFarm then
                        return false
                    end
                    hrp.CFrame = farmCFrame
                    task.wait(0.3)
                    virtualInput:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    virtualInput:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    task.wait(0.5)
                    if char:WaitForChild("Humanoid").Sit then
                        return true
                    end
                end
                return false
            end
            return false
        end

        task.spawn(function()
            while true do
                local now = tick()
                local elapsed = now - farmStartTime
                timeDisplay.Text = string.format("%dd %dh %dm %ds", math.floor(elapsed / 86400), math.floor(elapsed % 86400 / 3600), math.floor(elapsed % 3600 / 60), math.floor(elapsed % 60))
                strengthNeededDisplay.Text = "Fuerza Necesaria: " .. formatRebirth(getRequiredStrength(rebirthStat.Value))

                table.insert(rebirthHistory, {
                    time = now,
                    value = rebirthStat.Value
                })

                while #rebirthHistory > 0 and now - rebirthHistory[1].time > 3600 do
                    table.remove(rebirthHistory, 1)
                end

                if #rebirthHistory >= 2 then
                    local timeDiff = rebirthHistory[#rebirthHistory].time - rebirthHistory[1].time
                    if timeDiff > 0 then
                        local rate = (rebirthHistory[#rebirthHistory].value - rebirthHistory[1].value) / timeDiff
                        rateDisplay.Text = string.format("Ritmo: %s/H | %s/D | %s/Sem.", formatRebirth(rate * 3600), formatRebirth(rate * 86400), formatRebirth(rate * 604800))
                    end
                end

                if now - farmStartTime > 0 then
                    local avgRate = rebirthsGained / (now - farmStartTime)
                    avgDisplay.Text = string.format("Promedio: %s/H | %s/D | %s/Sem.", formatRebirth(avgRate * 3600), formatRebirth(avgRate * 86400), formatRebirth(avgRate * 604800))
                end

                task.wait(1)
            end
        end)

        task.spawn(function()
            while getgenv().AutoFarm do
                local char = farmPlayer.Character
                if not char then
                    farmPlayer.CharacterAdded:Wait()
                    char = farmPlayer.Character
                end

                if char and strengthStat.Value < 10 then
                    local backpack = farmPlayer.Backpack
                    local tool = backpack:FindFirstChild(weightTool) or char:FindFirstChild(weightTool)
                    if tool then
                        local hum = char:WaitForChild("Humanoid")
                        if tool.Parent ~= char then
                            hum:EquipTool(tool)
                        end
                        while strengthStat.Value < 10 and getgenv().AutoFarm do
                            for rep = 1, 10 do
                                repStorage.rEvents.muscleEvent:FireServer("rep")
                            end
                            task.wait()
                        end
                        local toolInChar = char:FindFirstChild(weightTool)
                        if toolInChar then
                            toolInChar.Parent = farmPlayer.Backpack
                        end
                    end
                end

                if getgenv().AutoFarm then
                    if sitOnBench() then
                        unequipAllPets()
                        equipPetByName(swiftSamurai)

                        while getgenv().AutoFarm and strengthStat.Value < getRequiredStrength(rebirthStat.Value) do
                            for rep = 1, 27 do
                                repStorage.rEvents.muscleEvent:FireServer("rep")
                            end
                            task.wait()
                        end

                        if getgenv().AutoFarm then
                            unequipAllPets()
                            equipPetByName(tribalOverlord)
                            task.wait(0.3)
                            local preRebirth = rebirthStat.Value
                            repStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                            task.wait(0.2)
                            if rebirthStat.Value > preRebirth then
                                task.wait(0.5)
                            end
                        end
                    end
                end

                task.wait(1)
            end
        end)

        local statsTab = mainWindow:AddTab("Estadisticas")
        local selectedPlayer = ""
        local playerDropdown = statsTab:AddDropdown("Select Player", function(selected)
            selectedPlayer = selected:match("| (.+)") or ""
        end)

        for _, player in pairs(game.Players:GetPlayers()) do
            playerDropdown:Add(player.DisplayName .. " | " .. player.Name)
        end

        game.Players.PlayerAdded:Connect(function(player)
            playerDropdown:Add(player.DisplayName .. " | " .. player.Name)
        end)

        local function formatStatComma(numValue)
            local str = tostring(numValue)
            local reversed = str:reverse()
            local withCommas = reversed:gsub("(%d%d%d)", "%1,")
            local result = withCommas:reverse()
            return result:gsub("^,", "")
        end

        local function formatStatShort(numValue)
            local val = numValue
            local suffixes = {"", "K", "M", "B", "T", "Qa", "Qi"}
            local suffIdx = 1
            while val >= 1000 and suffIdx < #suffixes do
                suffIdx = suffIdx + 1
                val = val / 1000
            end
            return string.format("%.2f%s", val, suffixes[suffIdx])
        end

        local function formatStatBracket(numValue)
            return "[ " .. formatStatComma(numValue) .. " | " .. formatStatShort(numValue) .. " ]"
        end

        local strengthLabel = statsTab:AddLabel("")
        local gemsLabel = statsTab:AddLabel("")
        local rebirthLabel = statsTab:AddLabel("")
        local agilityLabel = statsTab:AddLabel("")
        local durabilityLabel = statsTab:AddLabel("")
        local killsLabel = statsTab:AddLabel("")
        local muscleKingLabel = statsTab:AddLabel("")
        local currentMapLabel = statsTab:AddLabel("")
        local customSizeLabel = statsTab:AddLabel("")
        local customSpeedLabel = statsTab:AddLabel("")
        local evilKarmaLabel = statsTab:AddLabel("")
        local goodKarmaLabel = statsTab:AddLabel("")
        statsTab:AddLabel("\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94\xe2\x80\x94")
        statsTab:AddLabel("Stats Advanced").TextSize = 24

        local enemyLifeLabel = statsTab:AddLabel("Enemy life: N/A")
        enemyLifeLabel.TextSize = 20
        enemyLifeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

        local yourDamageLabel = statsTab:AddLabel("Your damage: N/A")
        yourDamageLabel.TextSize = 20
        yourDamageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

        local blowsLabel = statsTab:AddLabel("Blows to kill him: N/A")
        blowsLabel.TextSize = 20
        blowsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

        local wizardLabel = statsTab:AddLabel("Wild Wizard equipped: 0 (0 bonus)")
        wizardLabel.TextSize = 18

        local function countEquippedPet(player, petName)
            local count = 0
            local equippedPets = player:FindFirstChild("equippedPets")
            if not equippedPets then
                return 0
            end
            for _, slot in pairs(equippedPets:GetChildren()) do
                if slot:FindFirstChild("petReference") and slot.petReference.Value then
                    if slot.petReference.Value.Name == petName then
                        count = count + 1
                    end
                end
            end
            return count
        end

        local function calculateDamage()
            local lp = game.Players.LocalPlayer
            local ls = lp:FindFirstChild("leaderstats")
            local strVal = ls and ls:FindFirstChild("Strength")
            if not strVal then
                return 0
            end
            local baseDmg = strVal.Value * 0.1
            local wizCount = countEquippedPet(lp, "Wild Wizard")
            local wizBonus = wizCount * 0.33
            wizardLabel.Text = "Wild Wizard equipped: " .. wizCount .. " (" .. formatStatBracket(baseDmg * wizBonus) .. " bonus)"
            return baseDmg * (1 + wizBonus)
        end

        local function getEnemyHP(player)
            if not player then
                return 0
            end
            local durability = player:FindFirstChild("Durability")
            return durability and durability.Value or 0
        end

        local function calculateBlows(hp, dmg)
            if dmg <= 0 then
                return "\xe2\x88\x9e"
            end
            local hits = math.ceil(hp / dmg)
            if hits > 50 then
                return "\xe2\x88\x9e"
            end
            return tostring(hits < 1 and 1 or hits)
        end

        local function updateStats(player)
            if not player then
                strengthLabel.Text = "Strength: N/A"
                gemsLabel.Text = "Gems: N/A"
                rebirthLabel.Text = "Rebirth: N/A"
                agilityLabel.Text = "Agility: N/A"
                durabilityLabel.Text = "Durability: N/A"
                killsLabel.Text = "Kills: N/A"
                muscleKingLabel.Text = "Muscle King Time: N/A"
                currentMapLabel.Text = "Current Map: N/A"
                customSizeLabel.Text = "Custom Size: N/A"
                customSpeedLabel.Text = "Custom Speed: N/A"
                evilKarmaLabel.Text = "Evil Karma: N/A"
                goodKarmaLabel.Text = "Good Karma: N/A"
                enemyLifeLabel.Text = "Enemy life: N/A"
                yourDamageLabel.Text = "Your damage: N/A"
                blowsLabel.Text = "Blows to kill him: N/A"
                wizardLabel.Text = "Wild Wizard equipped: 0 (0 bonus)"
                return
            end

            local ls = player:FindFirstChild("leaderstats")
            strengthLabel.Text = "Strength: " .. (ls and ls:FindFirstChild("Strength") and formatStatBracket(ls.Strength.Value) or "N/A")

            local gems = player:FindFirstChild("Gems")
            gemsLabel.Text = "Gems: " .. (gems and formatStatBracket(gems.Value) or "N/A")

            rebirthLabel.Text = "Rebirth: " .. (ls and ls:FindFirstChild("Rebirths") and formatStatBracket(ls.Rebirths.Value) or "N/A")

            local agility = player:FindFirstChild("Agility")
            agilityLabel.Text = "Agility: " .. (agility and formatStatBracket(agility.Value) or "N/A")

            local durability = player:FindFirstChild("Durability")
            durabilityLabel.Text = "Durability: " .. (durability and formatStatBracket(durability.Value) or "N/A")

            killsLabel.Text = "Kills: " .. (ls and ls:FindFirstChild("Kills") and formatStatBracket(ls.Kills.Value) or "N/A")

            local mkt = player:FindFirstChild("muscleKingTime")
            muscleKingLabel.Text = "Muscle King Time: " .. (mkt and formatStatBracket(mkt.Value) or "N/A")

            local cmap = player:FindFirstChild("currentMap")
            currentMapLabel.Text = "Current Map: " .. (cmap and tostring(cmap.Value) or "N/A")

            local csize = player:FindFirstChild("customSize")
            customSizeLabel.Text = "Custom Size: " .. (csize and formatStatBracket(csize.Value) or "N/A")

            local cspeed = player:FindFirstChild("customSpeed")
            customSpeedLabel.Text = "Custom Speed: " .. (cspeed and formatStatBracket(cspeed.Value) or "N/A")

            local ekarma = player:FindFirstChild("evilKarma")
            evilKarmaLabel.Text = "Evil Karma: " .. (ekarma and formatStatBracket(ekarma.Value) or "N/A")

            local gkarma = player:FindFirstChild("goodKarma")
            goodKarmaLabel.Text = "Good Karma: " .. (gkarma and formatStatBracket(gkarma.Value) or "N/A")

            local eHP = getEnemyHP(player)
            local dmg = calculateDamage()

            enemyLifeLabel.Text = "Enemy life: " .. (eHP > 0 and formatStatBracket(eHP) or "N/A")
            yourDamageLabel.Text = "Your damage: " .. (dmg > 0 and formatStatBracket(dmg) or "N/A")
            blowsLabel.Text = "Blows to kill him: " .. tostring(calculateBlows(eHP, dmg))
        end

        task.spawn(function()
            while task.wait() do
                if selectedPlayer ~= "" then
                    local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
                    updateStats(targetPlayer)
                else
                    updateStats(nil)
                end
            end
        end)

        local soundTab = mainWindow:AddTab("Sound Control")

        local savedSoundVolumes = {}
        local isMuted = false
        local currentSound = nil
        local soundIdInput = ""
        local isLooped = false

        local function muteAllSounds()
            for _, desc in pairs(workspaceService:GetDescendants()) do
                if desc:IsA("Sound") then
                    savedSoundVolumes[desc] = desc.Volume
                    desc.Volume = 0
                end
            end
            for _, container in pairs({lightingService, farmPlayer}) do
                for _, desc in pairs(container:GetDescendants()) do
                    if desc:IsA("Sound") then
                        savedSoundVolumes[desc] = desc.Volume
                        desc.Volume = 0
                    end
                end
            end
            isMuted = true
            print("\xf0\x9f\x94\x87 Todos os sons foram silenciados")
            starterGuiService:SetCore("SendNotification", {
                Title = "Sound Control",
                Text = "Todos os sons foram silenciados",
                Duration = 3,
                Icon = "rbxassetid://0"
            })
        end

        local function unmuteAllSounds()
            for snd, vol in pairs(savedSoundVolumes) do
                if snd and snd.Parent then
                    snd.Volume = vol
                end
            end
            savedSoundVolumes = {}
            isMuted = false
            print("\xf0\x9f\x94\x8a Sons restaurados")
            starterGuiService:SetCore("SendNotification", {
                Title = "Sound Control",
                Text = "Sons restaurados",
                Duration = 3,
                Icon = "rbxassetid://0"
            })
        end

        local function stopCustomSound()
            if currentSound then
                currentSound:Stop()
                currentSound:Destroy()
                currentSound = nil
                local pGui = farmPlayer:WaitForChild("PlayerGui")
                local sGui = pGui:FindFirstChild("PrivateSoundGui")
                if sGui then
                    sGui:Destroy()
                end
                print("\xe2\x8f\xb9\xef\xb8\x8f Som personalizado parado")
                starterGuiService:SetCore("SendNotification", {
                    Title = "Sound Control",
                    Text = "Som personalizado parado",
                    Duration = 3,
                    Icon = "rbxassetid://0"
                })
            end
        end

        local function playCustomSound()
            if currentSound then
                currentSound:Stop()
                currentSound:Destroy()
                currentSound = nil
            end
            local soundGui = Instance.new("ScreenGui")
            soundGui.Name = "PrivateSoundGui"
            soundGui.ResetOnSpawn = false
            soundGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            soundGui.IgnoreGuiInset = true

            currentSound = Instance.new("Sound")
            currentSound.Name = "PrivateCustomSound"
            currentSound.SoundId = "rbxassetid://" .. soundIdInput
            currentSound.Volume = 1
            currentSound.Looped = isLooped
            currentSound.Parent = soundGui

            local pGui = farmPlayer:WaitForChild("PlayerGui")
            soundGui.Parent = pGui
            currentSound:Play()

            print("\xf0\x9f\x8e\xb5 Tocando som (somente voc\xc3\xaa ouve): " .. soundIdInput)
            starterGuiService:SetCore("SendNotification", {
                Title = "Sound Control",
                Text = "Som personalizado tocando (somente voc\xc3\xaa)",
                Duration = 3,
                Icon = "rbxassetid://0"
            })

            if not isLooped then
                currentSound.Ended:Connect(function()
                    task.wait(0.1)
                    if soundGui then
                        soundGui:Destroy()
                    end
                    currentSound = nil
                end)
            end
        end

        soundTab:AddButton("Toggle Mute", function()
            if isMuted then
                unmuteAllSounds()
            else
                muteAllSounds()
            end
        end)

        local muteSwitch = soundTab:AddSwitch("Mute All Sounds", function(enabled)
            if enabled then
                muteAllSounds()
            else
                unmuteAllSounds()
            end
        end)
        muteSwitch:Set(true)
    end
end
