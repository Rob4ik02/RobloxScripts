return function(Env)
	print("Cloud Oxygen Hub: Loading GymFarm.Lua
	local AutoTab = Env.Tabs.Auto
	local HomeTab = Env.Tabs.Home
	local ShopTab = Env.Tabs.Shop
	local StatusTab = Env.Tabs.Status
	local SettingsTab = Env.Tabs.Settings
	local MiscTab = Env.Tabs.Misc
    local MainTab = Env.Tabs.Main
    local player = Env.player
    local playInterfaceSound = Env.playInterfaceSound
    local Notifier = Env.Notifier
    local RS = Env.RS
    local rEvents = Env.rEvents
	
  local GymExtractTab = MainTab:DrawTab({
	    Name = "Gym Farm",
	    Type = "Single"
	});
	
	local player = game:GetService("Players").LocalPlayer
	local VirtualUser = game:GetService("VirtualUser")
	local MachineRemote = game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("machineInteractRemote")
	local MuscleEvent = player:WaitForChild("muscleEvent")
	
	local AutoBenchActive = false
	local AutoDeadliftActive = false
	local AutoPullUpsActive = false
	local AutoSquatActive = false
	local AutoBoulderActive = false
	
	local BenchSessionId = 0
	local DeadliftSessionId = 0
	local PullUpsSessionId = 0
	local SquatSessionId = 0
	local BoulderSessionId = 0
	
	-- =============================================================================
	-- БАЗЫ ДАННЫХ КООРДИНАТ ДЛЯ ВСЕХ ТИПОВ ТРЕНАЖЁРОВ
	-- =============================================================================
	
	local PressGymCoordinates = {
	    Beach = {
	        { RequiredStrength = 10, Pos = CFrame.new(4.56580687, 11.7406235, 47.3095512) },
	        { RequiredStrength = 150, Pos = CFrame.new(-195.177597, 11.8042336, 325.867859) },
	        { RequiredStrength = 400, Pos = CFrame.new(-194.664642, 15.124114, 300.262512) },
	        { RequiredStrength = 3000, Pos = CFrame.new(193.944305, 9.06989098, -317.204987) }, 
	        { RequiredStrength = 4000, Pos = CFrame.new(195.582413, 20.8960342, -376.011322) }
	    },
	    Frozen = {
	        { RequiredStrength = 1000, Pos = CFrame.new(-2641.50854, 15.6024895, -176.592865) },
	        { RequiredStrength = 3000, Pos = CFrame.new(-2748.31396, 21.3311634, -177.561401) },
	        { RequiredStrength = 7500, Pos = CFrame.new(-3029.85547, 42.4843216, -198.339371) },
	        { RequiredStrength = 15000, Pos = CFrame.new(-3024.20312, 45.1994934, -340.741882) }
	    },
	    Mythical = {
	        { RequiredStrength = 15000, Pos = CFrame.new(2362.84351, 54.2037773, 1247.8866) }
	    },
	    Eternal = {
	        { RequiredStrength = 15000, Pos = CFrame.new(-7177.34229, 65.1182785, -1110.91418) }
	    },
	    Jungle = {
	        { RequiredStrength = 25000, Pos = CFrame.new(-8629.71094, 41.5877151, 1900.79858) },
	        { RequiredStrength = 50000, Pos = CFrame.new(-8432.30273, 52.8216362, 1897.68323) },
	        { RequiredStrength = 100000, Pos = CFrame.new(-8184.95996, 74.079422, 1897.22717) }
	    },
	    Legends = {
	        { RequiredStrength = 0, Pos = CFrame.new(4105.96191, 1031.13354, -3803.53735) }
	    },
	    King = {
	        { RequiredStrength = 0, Pos = CFrame.new(-8592.48047, 58.2521019, -6045.61621) }
	    }
	}
	
	local DeadLiftGymCoordinates = {
	    Beach = {
	        { RequiredStrength = 1500, Pos = CFrame.new(134.75325, 7.38249779, 98.164238) },
	        { RequiredStrength = 2500, Pos = CFrame.new(132.676361, 7.38249779, 66.3972778) },
	        { RequiredStrength = 4000, Pos = CFrame.new(131.726059, 7.38249779, 25.0158882) },
	        { RequiredStrength = 8000, Pos = CFrame.new(94.5604095, 7.38249874, -491.569092) }
	    },
	    Frozen = {
	        { RequiredStrength = 5000, Pos = CFrame.new(-2915.80298, 42.1200752, -206.68248) }
	    },
	    Mythical = {},
	    Eternal = {},
	    Jungle = {
	        { RequiredStrength = 100000, Pos = CFrame.new(-8643.12012, 34.8121109, 2086.97778) }
	    },
	    Legends = {
	        { RequiredStrength = 0, Pos = CFrame.new(4537.5542, 1006.31934, -4019.25586) }
	    },
	    King = {
	        { RequiredStrength = 0, Pos = CFrame.new(-8768.9248, 53.0697861, -5655.74609) }
	    }
	}
	
	local PullUpsGymCoordinates = {
	    Beach = {
	        { RequiredStrength = 1000, Pos = CFrame.new(-184.266815, 7.48090172, 137.441956) },
	        { RequiredStrength = 2500, Pos = CFrame.new(-182.733673, 7.55066586, 66.3643265) }
	    },
	    Frozen = {},
	    Mythical = {
	        { RequiredStrength = 4000, Pos = CFrame.new(2318.58301, 21.9050484, 842.690491) },
	        { RequiredStrength = 8000, Pos = CFrame.new(2488.80029, 34.9658737, 850.678223) }
	    },
	    Eternal = {},
	    Jungle = {},
	    Legends = {
	        { RequiredStrength = 0, Pos = CFrame.new(4508.84277, 1002.22406, -3636.75464) }
	    },
	    King = {}
	}
	
	local SquatGymCoordinates = {
	    Beach = {
	        { RequiredStrength = 1000, Pos = CFrame.new(-236.087708, 9.40880775, 136.522263) },
	        { RequiredStrength = 1500, Pos = CFrame.new(-235.243546, 9.39789677, 66.5699005) },
	        { RequiredStrength = 4000, Pos = CFrame.new(-195.344482, 16.5396786, -355.114319) },
	        { RequiredStrength = 10000, Pos = CFrame.new(-202.864655, 19.0439091, -420.019623) }
	    },
	    Frozen = {
	        { RequiredStrength = 4000, Pos = CFrame.new(-2629.88745, 24.3977108, -609.521973) },
	        { RequiredStrength = 10000, Pos = CFrame.new(-2629.88745, 24.3977108, -609.521973) }
	    },
	    Mythical = {},
	    Eternal = {},
	    Jungle = {
	        { RequiredStrength = 50000, Pos = CFrame.new(-8585.13672, 39.8470421, 2889.81445) },
	        { RequiredStrength = 125000, Pos = CFrame.new(-8381.70117, 63.8380241, 2863.64624) }
	    },
	    Legends = {
	        { RequiredStrength = 0, Pos = CFrame.new(4436.02588, 1027.27209, -4057.55005) }
	    },
	    King = {
	        { RequiredStrength = 0, Pos = CFrame.new(-8757.09766, 50.4703903, -6036.86816) }
	    }
	}
	
	local BoulderGymCoordinates = {
	    Beach = {
	        { RequiredStrength = 3000, Pos = CFrame.new(-85.6955109, 14.412055, -294.584167) },
	        { RequiredStrength = 7500, Pos = CFrame.new(-72.6057358, 21.1798668, -364.778656) },
	        { RequiredStrength = 15000, Pos = CFrame.new(63.930542, 32.3353081, -344.976776) },
	        { RequiredStrength = 25000, Pos = CFrame.new(32.3396454, 46.8911133, -411.44754) }
	    },
	    Frozen = {},
	    Mythical = {
	        { RequiredStrength = 10000, Pos = CFrame.new(2490.91821, 35.6372261, 1235.64319) },
	        { RequiredStrength = 18000, Pos = CFrame.new(2574.30298, 46.7175789, 1213.63062) },
	        { RequiredStrength = 25000, Pos = CFrame.new(2670.05078, 67.0565262, 1199.40808) }
	    },
	    Eternal = {},
	    Jungle = {
	        { RequiredStrength = 75000, Pos = CFrame.new(-8611.66016, 47.7893295, 2671.90845) }
	    },
	    Legends = {
	        { RequiredStrength = 0, Pos = CFrame.new(4258.91064, 1011.38422, -3631.5459) },
	        { RequiredStrength = 0, Pos = CFrame.new(4197.38086, 1029.78015, -3902.90356) }
	    },
	    King = {
	        { RequiredStrength = 0, Pos = CFrame.new(-8944.47754, 58.9421883, -5695.39844) }
	    }
	}
	
	-- =============================================================================
	-- ВСПОМОГАТЕЛЬНАЯ ФУНКЦИЯ ФИЛЬТРАЦИИ КОРДИНАТ ПО СИЛЕ
	-- =============================================================================
	local function getTargetCFrame(coordinateTable, gymName, currentStrength)
	    local stages = coordinateTable[gymName]
	    if not stages then return nil end
	    
	    local bestMatch = nil
	    for _, stage in ipairs(stages) do
	        if currentStrength >= stage.RequiredStrength then
	            if not bestMatch or stage.RequiredStrength > bestMatch.RequiredStrength then
	                bestMatch = stage
	            end
	        end
	    end
	    return bestMatch and bestMatch.Pos or nil
	end
	
	-- =============================================================================
	-- ИЗОЛИРОВАННЫЕ ЦИКЛЫ ФАРМА ДЛЯ КАЖДОГО ТИПА УПРАЖНЕНИЯ
	-- =============================================================================
	
	local function StartManualBenchFarm(gymName)
	    BenchSessionId = BenchSessionId + 1
	    local currentSession = BenchSessionId
	    task.spawn(function()
	        while AutoBenchActive and currentSession == BenchSessionId do
	            local char = player.Character
	            local hrp = char and char:FindFirstChild("HumanoidRootPart")
	            local hum = char and char:FindFirstChild("Humanoid")
	            if hrp and hum and hum.Health > 0 then
	                local leaderstats = player:FindFirstChild("leaderstats")
	                local strengthStat = leaderstats and leaderstats:FindFirstChild("Strength")
	                local playerStrength = strengthStat and strengthStat.Value or 0
	                local targetCFrame = getTargetCFrame(PressGymCoordinates, gymName, playerStrength)
	                if targetCFrame then
	                    if hum.Sit == false then
	                        hrp.CFrame = targetCFrame
	                        pcall(function() hrp.Velocity = Vector3.new(0, 0, 0) end)
	                        pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
	                    else
	                        task.spawn(function() pcall(function() MuscleEvent:FireServer("rep") end) end)
	                        task.spawn(function()
	                            local folder = workspace:FindFirstChild("machinesFolder") or workspace:FindFirstChild("MachinesFolder")
	                            if folder then
	                                for _, model in pairs(folder:GetChildren()) do
	                                    local prim = model:FindFirstChildWhichIsA("BasePart", true)
	                                    if prim and (hrp.Position - prim.Position).Magnitude < 10 then
	                                        pcall(function() MachineRemote:InvokeServer(model) end)
	                                        break
	                                    end
	                                end
	                            end
	                        end)
	                        VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	                    end
	                end
	            end
	            task.wait(0.04)
	        end
	    end)
	end
	
	local function StartManualDeadliftFarm(gymName)
	    DeadliftSessionId = DeadliftSessionId + 1
	    local currentSession = DeadliftSessionId
	    task.spawn(function()
	        while AutoDeadliftActive and currentSession == DeadliftSessionId do
	            local char = player.Character
	            local hrp = char and char:FindFirstChild("HumanoidRootPart")
	            local hum = char and char:FindFirstChild("Humanoid")
	            if hrp and hum and hum.Health > 0 then
	                local leaderstats = player:FindFirstChild("leaderstats")
	                local strengthStat = leaderstats and leaderstats:FindFirstChild("Strength")
	                local playerStrength = strengthStat and strengthStat.Value or 0
	                local targetCFrame = getTargetCFrame(DeadLiftGymCoordinates, gymName, playerStrength)
	                if targetCFrame then
	                    if hum.Sit == false then
	                        hrp.CFrame = targetCFrame
	                        pcall(function() hrp.Velocity = Vector3.new(0, 0, 0) end)
	                        pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
	                    else
	                        task.spawn(function() pcall(function() MuscleEvent:FireServer("rep") end) end)
	                        task.spawn(function()
	                            local folder = workspace:FindFirstChild("machinesFolder") or workspace:FindFirstChild("MachinesFolder")
	                            if folder then
	                                for _, model in pairs(folder:GetChildren()) do
	                                    local prim = model:FindFirstChildWhichIsA("BasePart", true)
	                                    if prim and (hrp.Position - prim.Position).Magnitude < 10 then
	                                        pcall(function() MachineRemote:InvokeServer(model) end)
	                                        break
	                                    end
	                                end
	                            end
	                        end)
	                        VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	                    end
	                end
	            end
	            task.wait(0.04)
	        end
	    end)
	end
	
	local function StartManualPullUpsFarm(gymName)
	    PullUpsSessionId = PullUpsSessionId + 1
	    local currentSession = PullUpsSessionId
	    task.spawn(function()
	        while AutoPullUpsActive and currentSession == PullUpsSessionId do
	            local char = player.Character
	            local hrp = char and char:FindFirstChild("HumanoidRootPart")
	            local hum = char and char:FindFirstChild("Humanoid")
	            if hrp and hum and hum.Health > 0 then
	                local leaderstats = player:FindFirstChild("leaderstats")
	                local strengthStat = leaderstats and leaderstats:FindFirstChild("Strength")
	                local playerStrength = strengthStat and strengthStat.Value or 0
	                local targetCFrame = getTargetCFrame(PullUpsGymCoordinates, gymName, playerStrength)
	                if targetCFrame then
	                    if hum.Sit == false then
	                        hrp.CFrame = targetCFrame
	                        pcall(function() hrp.Velocity = Vector3.new(0, 0, 0) end)
	                        pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
	                    else
	                        task.spawn(function() pcall(function() MuscleEvent:FireServer("rep") end) end)
	                        task.spawn(function()
	                            local folder = workspace:FindFirstChild("machinesFolder") or workspace:FindFirstChild("MachinesFolder")
	                            if folder then
	                                for _, model in pairs(folder:GetChildren()) do
	                                    local prim = model:FindFirstChildWhichIsA("BasePart", true)
	                                    if prim and (hrp.Position - prim.Position).Magnitude < 10 then
	                                        pcall(function() MachineRemote:InvokeServer(model) end)
	                                        break
	                                    end
	                                end
	                            end
	                        end)
	                        VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	                    end
	                end
	            end
	            task.wait(0.04)
	        end
	    end)
	end
	
	local function StartManualSquatFarm(gymName)
	    SquatSessionId = SquatSessionId + 1
	    local currentSession = SquatSessionId
	    task.spawn(function()
	        while AutoSquatActive and currentSession == SquatSessionId do
	            local char = player.Character
	            local hrp = char and char:FindFirstChild("HumanoidRootPart")
	            local hum = char and char:FindFirstChild("Humanoid")
	            if hrp and hum and hum.Health > 0 then
	                local leaderstats = player:FindFirstChild("leaderstats")
	                local strengthStat = leaderstats and leaderstats:FindFirstChild("Strength")
	                local playerStrength = strengthStat and strengthStat.Value or 0
	                local targetCFrame = getTargetCFrame(SquatGymCoordinates, gymName, playerStrength)
	                if targetCFrame then
	                    if hum.Sit == false then
	                        hrp.CFrame = targetCFrame
	                        pcall(function() hrp.Velocity = Vector3.new(0, 0, 0) end)
	                        pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
	                    else
	                        task.spawn(function() pcall(function() MuscleEvent:FireServer("rep") end) end)
	                        task.spawn(function()
	                            local folder = workspace:FindFirstChild("machinesFolder") or workspace:FindFirstChild("MachinesFolder")
	                            if folder then
	                                for _, model in pairs(folder:GetChildren()) do
	                                    local prim = model:FindFirstChildWhichIsA("BasePart", true)
	                                    if prim and (hrp.Position - prim.Position).Magnitude < 10 then
	                                        pcall(function() MachineRemote:InvokeServer(model) end)
	                                        break
	                                    end
	                                end
	                            end
	                        end)
	                        VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	                    end
	                end
	            end
	            task.wait(0.04)
	        end
	    end)
	end
	
	local function StartManualBoulderFarm(gymName)
	    BoulderSessionId = BoulderSessionId + 1
	    local currentSession = BoulderSessionId
	    task.spawn(function()
	        while AutoBoulderActive and currentSession == BoulderSessionId do
	            local char = player.Character
	            local hrp = char and char:FindFirstChild("HumanoidRootPart")
	            local hum = char and char:FindFirstChild("Humanoid")
	            if hrp and hum and hum.Health > 0 then
	                local leaderstats = player:FindFirstChild("leaderstats")
	                local strengthStat = leaderstats and leaderstats:FindFirstChild("Strength")
	                local playerStrength = strengthStat and strengthStat.Value or 0
	                local targetCFrame = getTargetCFrame(BoulderGymCoordinates, gymName, playerStrength)
	                if targetCFrame then
	                    if hum.Sit == false then
	                        hrp.CFrame = targetCFrame
	                        pcall(function() hrp.Velocity = Vector3.new(0, 0, 0) end)
	                        pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
	                    else
	                        task.spawn(function() pcall(function() MuscleEvent:FireServer("rep") end) end)
	                        task.spawn(function()
	                            local folder = workspace:FindFirstChild("machinesFolder") or workspace:FindFirstChild("MachinesFolder")
	                            if folder then
	                                for _, model in pairs(folder:GetChildren()) do
	                                    local prim = model:FindFirstChildWhichIsA("BasePart", true)
	                                    if prim and (hrp.Position - prim.Position).Magnitude < 10 then
	                                        pcall(function() MachineRemote:InvokeServer(model) end)
	                                        break
	                                    end
	                                end
	                            end
	                        end)
	                        VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	                    end
	                end
	            end
	            task.wait(0.04)
	        end
	    end)
	end
	
	-- =============================================================================
	-- ГЕНЕРАЦИЯ ИНТЕРФЕЙСА ДЛЯ ВСЕХ ОСТРОВОВ
	-- =============================================================================
	
	local GymsList = {
	    { Name = "Beach Gym", Code = "Beach" },
	    { Name = "Frozen Gym", Code = "Frozen" },
	    { Name = "Mythical Gym", Code = "Mythical" },
	    { Name = "Eternal Gym", Code = "Eternal" },
	    { Name = "Jungle Gym", Code = "Jungle" },
	    { Name = "Legends Gym", Code = "Legends" },
	    { Name = "King Gym", Code = "King" }
	}
	
	for _, gymInfo in ipairs(GymsList) do
	    local section = GymExtractTab:DrawSection({ Name = gymInfo.Name, Position = 'middle' })
	    
	    -- 1. Bench Press Toggle
	    section:AddToggle({
	        Name = "Auto Bench Press",
	        Flag = "Toggle_ManualBench_" .. gymInfo.Code,
	        Default = false,
	        Callback = function(v)
	            AutoBenchActive = v
	            pcall(function() playInterfaceSound("NotificationSound") end)
	            if v then
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "Bench Press ("..gymInfo.Name..") Enabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                StartManualBenchFarm(gymInfo.Code)
	            else
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "Bench Press ("..gymInfo.Name..") Disabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                local char = player.Character
	                local hum = char and char:FindFirstChild("Humanoid")
	                if hum then hum.Sit = false end
	            end
	        end
	    })
	    
	    -- 2. Deadlift Toggle
	    section:AddToggle({
	        Name = "Auto Deadlift",
	        Flag = "Toggle_ManualDeadlift_" .. gymInfo.Code,
	        Default = false,
	        Callback = function(v)
	            AutoDeadliftActive = v
	            pcall(function() playInterfaceSound("NotificationSound") end)
	            if v then
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "Deadlift ("..gymInfo.Name..") Enabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                StartManualDeadliftFarm(gymInfo.Code)
	            else
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "Deadlift ("..gymInfo.Name..") Disabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                local char = player.Character
	                local hum = char and char:FindFirstChild("Humanoid")
	                if hum then hum.Sit = false end
	            end
	        end
	    })
	    
	    -- 3. PullUps Toggle
	    section:AddToggle({
	        Name = "Auto PullUps",
	        Flag = "Toggle_ManualPullUps_" .. gymInfo.Code,
	        Default = false,
	        Callback = function(v)
	            AutoPullUpsActive = v
	            pcall(function() playInterfaceSound("NotificationSound") end)
	            if v then
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "PullUps ("..gymInfo.Name..") Enabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                StartManualPullUpsFarm(gymInfo.Code)
	            else
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "PullUps ("..gymInfo.Name..") Disabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                local char = player.Character
	                local hum = char and char:FindFirstChild("Humanoid")
	                if hum then hum.Sit = false end
	            end
	        end
	    })
	    
	    -- 4. Squat Rack Toggle
	    section:AddToggle({
	        Name = "Auto Squat Rack",
	        Flag = "Toggle_ManualSquat_" .. gymInfo.Code,
	        Default = false,
	        Callback = function(v)
	            AutoSquatActive = v
	            pcall(function() playInterfaceSound("NotificationSound") end)
	            if v then
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "Squat Rack ("..gymInfo.Name..") Enabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                StartManualSquatFarm(gymInfo.Code)
	            else
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "Squat Rack ("..gymInfo.Name..") Disabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                local char = player.Character
	                local hum = char and char:FindFirstChild("Humanoid")
	                if hum then hum.Sit = false end
	            end
	        end
	    })
	    
	    -- 5. Boulder Throw Toggle
	    section:AddToggle({
	        Name = "Auto Boulder Throw",
	        Flag = "Toggle_ManualBoulder_" .. gymInfo.Code,
	        Default = false,
	        Callback = function(v)
	            AutoBoulderActive = v
	            pcall(function() playInterfaceSound("NotificationSound") end)
	            if v then
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "Boulder Throw ("..gymInfo.Name..") Enabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                StartManualBoulderFarm(gymInfo.Code)
	            else
	                pcall(function() Notifier.new({Title = "Gym Farm", Content = "Boulder Throw ("..gymInfo.Name..") Disabled!", Duration = 3, Icon = "rbxassetid://102643647961511"}) end)
	                local char = player.Character
	                local hum = char and char:FindFirstChild("Humanoid")
	                if hum then hum.Sit = false end
	            end
	        end
	    })
	end
	
	local section2 = GymExtractTab:DrawSection({ Name = "Rock Farming", Position = 'middle' })
	
	local rockDurabilityThresholds = {
	    ["Tiny Rock"] = 0,
	    ["Punching Rock"] = 10,
	    ["Large Rock"] = 100,
	    ["Golden Rock"] = 5000,
	    ["Frozen Rock"] = 150000,
	    ["Mythical Rock"] = 400000,
	    ["Eternal Rock"] = 750000,
	    ["Legends Rock"] = 1000000,
	    ["Muscle King Mountain"] = 5000000,
	    ["Jungle Rock"] = 10000000,
	}
	
	-- Собираем названия в массив для Values
	local rockNames = {}
	for name, _ in pairs(rockDurabilityThresholds) do
	    table.insert(rockNames, name)
	end
	
	local selectedRockTier = rockNames[1]  -- "Tiny Rock"
	local AutoRockFarmActive = false
	local RockFarmSessionId = 0
	
	-- Функция для ударов (с автокликом)
	local function doPunchFarm()
	    local char = player.Character
	    if not char then return end
	    local hum = char:FindFirstChild("Humanoid")
	    if not hum or hum.Health <= 0 then return end
	
	    -- Экипируем Punch, если его нет в руках
	    local punch = char:FindFirstChild("Punch")
	    if not punch then
	        local tool = player.Backpack:FindFirstChild("Punch")
	        if tool then
	            hum:EquipTool(tool)
	            punch = tool
	        end
	    end
	
	    -- Отправляем события удара
	    pcall(function()
	        muscleEvent:FireServer("punch", "leftHand")
	        muscleEvent:FireServer("punch", "rightHand")
	    end)
	
	    -- Активируем инструмент (если есть)
	    if punch and punch:IsA("Tool") then
	        pcall(function()
	            punch:Activate()
	        end)
	    end
	
	    -- Имитация клика мыши (VirtualUser)
	    pcall(function()
	        VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	        task.wait(0.01)
	        VirtualUser:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	    end)
	end
	
	-- Основной цикл фарма
	local function StartRockFarm()
	    RockFarmSessionId = RockFarmSessionId + 1
	    local currentSession = RockFarmSessionId
	    local teleported = false
	
	    task.spawn(function()
	        while AutoRockFarmActive and currentSession == RockFarmSessionId do
	            local char = player.Character
	            local hrp = char and char:FindFirstChild("HumanoidRootPart")
	            local hum = char and char:FindFirstChild("Humanoid")
	            if not hrp or not hum or hum.Health <= 0 then
	                task.wait(0.5)
	                continue
	            end
	
	            local requiredDurability = rockDurabilityThresholds[selectedRockTier]
	            if requiredDurability == nil then
	                task.wait(1)
	                continue
	            end
	
	            local machinesFolder = workspace:FindFirstChild("machinesFolder")
	            if not machinesFolder then
	                task.wait(1)
	                continue
	            end
	
	            local targetRock = nil
	            for _, machine in pairs(machinesFolder:GetChildren()) do
	                local needed = machine:FindFirstChild("neededDurability")
	                if needed and needed.Value == requiredDurability then
	                    local rockPart = machine:FindFirstChild("Rock")
	                    if rockPart then
	                        targetRock = rockPart
	                        break
	                    end
	                end
	            end
	
	            if not targetRock then
	                task.wait(1)
	                continue
	            end
	
	            -- Телепортируемся только один раз
	            if not teleported then
	                local offset = targetRock.CFrame.LookVector * 3 + Vector3.new(0, 1, 0)
	                hrp.CFrame = targetRock.CFrame + offset
	                pcall(function() hrp.Velocity = Vector3.new(0, 0, 0) end)
	                pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
	                teleported = true
	            end
	
	            -- Бьём по камню через firetouchinterest (дополнительно)
	            local leftHand = char:FindFirstChild("LeftHand")
	            local rightHand = char:FindFirstChild("RightHand")
	            if leftHand and rightHand then
	                pcall(function()
	                    firetouchinterest(leftHand, targetRock, 0)
	                    firetouchinterest(leftHand, targetRock, 1)
	                    firetouchinterest(rightHand, targetRock, 0)
	                    firetouchinterest(rightHand, targetRock, 1)
	                end)
	            end
	
	            -- Вызываем удар с кликом
	            doPunchFarm()
	
	            task.wait(0.05) -- небольшая задержка для стабильности
	        end
	    end)
	end
	
	-- Создаём выпадающий список (используем Ваш синтаксис)
	local rockDropdown = section2:AddDropdown({
	    Name = "Select Rock Name",
	    Default = selectedRockTier,
	    Values = rockNames,
	    Callback = function(selected)
	        selectedRockTier = selected
	    end
	})
	
	-- Тумблер включения
	section2:AddToggle({
	    Name = "Auto Rock Farm",
	    Flag = "Toggle_AutoRockFarm",
	    Default = false,
	    Callback = function(v)
	        AutoRockFarmActive = v
	        pcall(function() playInterfaceSound("NotificationSound") end)
	        if v then
	            pcall(function()
	                Notifier.new({
	                    Title = "Rock Farm",
	                    Content = "Rock Farm Enabled! Target: " .. selectedRockTier,
	                    Duration = 3,
	                    Icon = "rbxassetid://102643647961511"
	                })
	            end)
	            StartRockFarm()
	        else
	            pcall(function()
	                Notifier.new({
	                    Title = "Rock Farm",
	                    Content = "Rock Farm Disabled!",
	                    Duration = 3,
	                    Icon = "rbxassetid://102643647961511"
	                })
	            end)
	            local char = player.Character
	            local hum = char and char:FindFirstChild("Humanoid")
	            if hum then hum.Sit = false end
	        end
	    end
	})
	
	local GeneralFarmExtractTab = MainTab:DrawTab({
		Name = "Farm General",
		Type = "Single"
	});
	
	local NormalSection1 = GeneralFarmExtractTab:DrawSection({
		Name = "Lifting",
		Position = 'left'	
	});
	
	local AutoLiftToggle = NormalSection1:AddToggle({
	    Name = "Auto Lift",
	    Flag = "Toggle_AutoLift", 
	    Default = false,
	    Callback = function(v)
	
	        playInterfaceSound("ButtonClick")
	        
	        local player = game:GetService("Players").LocalPlayer
	
	        local gamepass_AutoLift = player:FindFirstChild("autoLiftEnabled")
	
	        if not gamepass_AutoLift then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "Failed to find Auto Lift object in Player. Feature may not work.",
	                Duration = 6,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return -- Останавливаем выполнение функции
	        end
	
	        if v then
	
	            gamepass_AutoLift.Value = true
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Auto Lift has been enabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        else
	            gamepass_AutoLift.Value = false
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Auto Lift has been Disabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        end 
	    end, -- Убраны лишние скобки (), теперь это корректная функция
	});
	
	local NormalSection2 = GeneralFarmExtractTab:DrawSection({
	    Name = "Eguipment",
	    Position = 'right'  
	});
	
	-- ВЫНОСИМ ПЕРЕМЕННЫЕ НАРУЖУ (чтобы циклы могли их видеть и останавливаться)
	local AutoEquipWeightActive = false
	local AutoEquipPushupsActive = false
	local AutoEquipSitupsActive = false
	local AutoEquipHandstandsActive = false
	
	-- 1. ТУМБЛЕР: WEIGHT
	local AutoEquipToggle1 = NormalSection2:AddToggle({
	    Name = "Auto Equip Weight",
	    Flag = "Toggle_AutoEquipWeight",
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        AutoEquipWeightActive = v -- Обновляем внешнюю переменную
	        
	        if AutoEquipWeightActive then
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "Equipment",
	                Content = "Auto Equip Weight Started!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            })
	
	            task.spawn(function()
	                while AutoEquipWeightActive do
	                    local character = player.Character
	                    if character then
	                        local humanoid = character:FindFirstChild("Humanoid")
	                        local tool = player.Backpack:FindFirstChild("Weight") 
	                        if humanoid and tool and humanoid.Health > 0 then
	                            humanoid:EquipTool(tool)
	                        end
	                    end
	                    task.wait(0.5) -- Оптимальная задержка
	                end
	            end)
	        else
	            local character = player.Character
	            if character and character:FindFirstChild("Humanoid") then
	                character.Humanoid:UnequipTools()
	            end
	        end
	    end,
	})
	
	-- 2. ТУМБЛЕР: PUSHUPS
	local AutoEquipToggle2 = NormalSection2:AddToggle({
	    Name = "Auto Equip Pushups",
	    Flag = "Toggle_AutoEquipPushups",
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        AutoEquipPushupsActive = v
	        
	        if AutoEquipPushupsActive then
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "Equipment",
	                Content = "Auto Equip Pushups Started!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            })
	
	            task.spawn(function()
	                while AutoEquipPushupsActive do
	                    local character = player.Character
	                    if character then
	                        local humanoid = character:FindFirstChild("Humanoid")
	                        local tool = player.Backpack:FindFirstChild("Pushups") 
	                        if humanoid and tool and humanoid.Health > 0 then
	                            humanoid:EquipTool(tool)
	                        end
	                    end
	                    task.wait(0.5)
	                end
	            end)
	        else
	            local character = player.Character
	            if character and character:FindFirstChild("Humanoid") then
	                character.Humanoid:UnequipTools()
	            end
	        end
	    end,
	})
	
	-- 3. ТУМБЛЕР: SITUPS
	local AutoEquipToggle3 = NormalSection2:AddToggle({
	    Name = "Auto Equip Situps",
	    Flag = "Toggle_AutoEquipSitups",
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        AutoEquipSitupsActive = v
	        
	        if AutoEquipSitupsActive then
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "Equipment",
	                Content = "Auto Equip Situps Started!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            })
	
	            task.spawn(function()
	                while AutoEquipSitupsActive do
	                    local character = player.Character
	                    if character then
	                        local humanoid = character:FindFirstChild("Humanoid")
	                        -- Исправил название предмета на Situps (у вас в коде стояло Pushups)
	                        local tool = player.Backpack:FindFirstChild("Situps") 
	                        if humanoid and tool and humanoid.Health > 0 then
	                            humanoid:EquipTool(tool)
	                        end
	                    end
	                    task.wait(0.5)
	                end
	            end)
	        else
	            local character = player.Character
	            if character and character:FindFirstChild("Humanoid") then
	                character.Humanoid:UnequipTools()
	            end
	        end
	    end,
	})
	
	local AutoEquipToggle3 = NormalSection2:AddToggle({
	    Name = "Auto Equip Handstands",
	    Flag = "Toggle_AutoEquipHandstands",
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        AutoEquipHandstandsActive = v
	        
	        if AutoEquipHandstandsActive then
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "Equipment",
	                Content = "Auto Equip Handstands Started!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            })
	
	            task.spawn(function()
	                while AutoEquipHandstandsActive do
	                    local character = player.Character
	                    if character then
	                        local humanoid = character:FindFirstChild("Humanoid")
	                        -- Исправил название предмета на Situps (у вас в коде стояло Pushups)
	                        local tool = player.Backpack:FindFirstChild("Handstands") 
	                        if humanoid and tool and humanoid.Health > 0 then
	                            humanoid:EquipTool(tool)
	                        end
	                    end
	                    task.wait(0.5)
	                end
	            end)
	        else
	            local character = player.Character
	            if character and character:FindFirstChild("Humanoid") then
	                character.Humanoid:UnequipTools()
	            end
	        end
	    end,
	})
	
	local NormalSection3 = GeneralFarmExtractTab:DrawSection({
	    Name = "Rep Time Editor",
	    Position = 'right'  
	});
	
	local ToggleFastPunch = NormalSection3:AddToggle({
	    Name = "Fast Punch Speed",
	    Flag = "Toggle_FastPunch", -- Leave it blank will not save to config (ALL ELEMENTS)
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        
	        local character = player.Character or player.CharacterAdded:Wait()
	        local Item_Punch = character:FindFirstChild("Punch") or player:WaitForChild("Backpack"):FindFirstChild("Punch")
	
	        -- БЕЗОПАСНОСТЬ: Проверяем, существует ли предмет вообще
	        if not Item_Punch then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "Item 'Punch' not found in inventory or hands!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return -- Выходим из функции, чтобы избежать краша
	        end
	
	        -- Используем FindFirstChild вместо WaitForChild, чтобы избежать бесконечного зависания
	        local Rep_Time = Item_Punch:FindFirstChild("attackTime") 
	
	        if not Rep_Time then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "'attackTime' not found in Punch!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        if v then
	            Rep_Time.Value = 0.05
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Punch Speed has been enabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        else
	            Rep_Time.Value = 0.35
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Punch Speed has been Disabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        end
	    end, -- ИСПРАВЛЕНО: Добавлен недостающий end и запятая
	});
	
	local ToggleFastWeight = NormalSection3:AddToggle({
	    Name = "Fast Weight Speed",
	    Flag = "Toggle_FastWeight", -- Leave it blank will not save to config (ALL ELEMENTS)
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        
	        local character = player.Character or player.CharacterAdded:Wait()
	        local Item_Weight = character:FindFirstChild("Weight") or player:WaitForChild("Backpack"):FindFirstChild("Weight")
	
	        -- БЕЗОПАСНОСТЬ: Проверяем, существует ли предмет
	        if not Item_Weight then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "Item 'Weight' not found in inventory or hands!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        local Rep_Time = Item_Weight:FindFirstChild("repTime")
	
	        if not Rep_Time then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "'repTime' not found in Weight!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        if v then
	            Rep_Time.Value = 0.05
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Weight Speed has been enabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        else
	            Rep_Time.Value = 1
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Weight Speed has been Disabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        end
	    end, -- ИСПРАВЛЕНО: Добавлен недостающий end и запятая
	});
	
	local ToggleFastPushups = NormalSection3:AddToggle({
	    Name = "Fast Pushups Speed",
	    Flag = "Toggle_FastPushups", -- Leave it blank will not save to config (ALL ELEMENTS)
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        
	        local character = player.Character or player.CharacterAdded:Wait()
	        local Item_Pushups = character:FindFirstChild("Pushups") or player:WaitForChild("Backpack"):FindFirstChild("Pushups")
	
	        -- БЕЗОПАСНОСТЬ: Проверяем, существует ли предмет
	        if not Item_Pushups then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "Item 'Pushups' not found in inventory or hands!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        local Rep_Time = Item_Pushups:FindFirstChild("repTime")
	
	        if not Rep_Time then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "'repTime' not found in Pushups!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        if v then
	            Rep_Time.Value = 0.05
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Pushups Speed has been enabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        else
	            Rep_Time.Value = 1
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Pushups Speed has been Disabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        end
	    end, -- ИСПРАВЛЕНО: Добавлен недостающий end и запятая
	});
	
	local ToggleFastSitups = NormalSection3:AddToggle({
	    Name = "Fast Situps Speed",
	    Flag = "Toggle_FastSitups", -- Leave it blank will not save to config (ALL ELEMENTS)
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        
	        local character = player.Character or player.CharacterAdded:Wait()
	        local Item_Situps = character:FindFirstChild("Situps") or player:WaitForChild("Backpack"):FindFirstChild("Situps")
	
	        -- БЕЗОПАСНОСТЬ: Проверяем, существует ли предмет
	        if not Item_Situps then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "Item 'Situps' not found in inventory or hands!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        local Rep_Time = Item_Situps:FindFirstChild("repTime")
	
	        if not Rep_Time then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "'repTime' not found in Situps!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        if v then
	            Rep_Time.Value = 0.05
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Situps Speed has been enabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        else
	            Rep_Time.Value = 1
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Situps Speed has been Disabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        end
	    end, -- ИСПРАВЛЕНО: Добавлен недостающий end и запятая
	});
	
	local ToggleFastHandstands = NormalSection3:AddToggle({
	    Name = "Fast Handstands Speed",
	    Flag = "Toggle_FastHandstands", -- Leave it blank will not save to config (ALL ELEMENTS)
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        
	        local character = player.Character or player.CharacterAdded:Wait()
	        local Item_Handstands = character:FindFirstChild("Handstands") or player:WaitForChild("Backpack"):FindFirstChild("Handstands")
	
	        -- БЕЗОПАСНОСТЬ: Проверяем, существует ли предмет
	        if not Item_Handstands then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "Item 'Handstands' not found in inventory or hands!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        local Rep_Time = Item_Handstands:FindFirstChild("repTime")
	
	        if not Rep_Time then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "'repTime' not found in Handstands!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        if v then
	            Rep_Time.Value = 0.05
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Handstands Speed has been enabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        else
	            Rep_Time.Value = 1
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Handstands Speed has been Disabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        end
	    end, -- ИСПРАВЛЕНО: Добавлен недостающий end и запятая
	});
	
	local ToggleFastGroundSlam = NormalSection3:AddToggle({
	    Name = "Fast Ground Slam Speed",
	    Flag = "Toggle_FastHandstands", -- Leave it blank will not save to config (ALL ELEMENTS)
	    Default = false,
	    Callback = function(v)
	        playInterfaceSound("ButtonClick")
	        
	        local character = player.Character or player.CharacterAdded:Wait()
	        local Item_GroundSlam = character:FindFirstChild("Ground Slam") or player:WaitForChild("Backpack"):FindFirstChild("Ground Slam")
	
	        -- БЕЗОПАСНОСТЬ: Проверяем, существует ли предмет
	        if not Item_GroundSlam then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "Item 'Ground Slam' not found in inventory or hands!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        local Rep_Time = Item_GroundSlam:FindFirstChild("attackTime")
	
	        if not Rep_Time then
	            playInterfaceSound("ErrorSound")
	            Notifier.new({
	                Title = "02: Error",
	                Content = "'attackTime' not found in Handstands!",
	                Duration = 4,
	                Icon = "rbxassetid://102643647961511"
	            });
	            return
	        end
	
	        if v then
	            Rep_Time.Value = 0.05
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Ground Slam Speed has been enabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        else
	            Rep_Time.Value = 6
	            
	            playInterfaceSound("NotificationSound")
	            Notifier.new({
	                Title = "02: Notification",
	                Content = "Fast Ground Slam Speed has been Disabled!",
	                Duration = 3,
	                Icon = "rbxassetid://102643647961511"
	            });
	        end
	    end, -- ИСПРАВЛЕНО: Добавлен недостающий end и запятая
	});
	print("Cloud Oxygen Hub: Loaded GymFarm.lua!")
end
