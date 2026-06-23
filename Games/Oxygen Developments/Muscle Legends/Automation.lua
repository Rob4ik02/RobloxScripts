return function(Env)
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

    -- // Rebirth Tab \\ (упрощённая версия)
  local RebirthsExtractTab = AutoTab:DrawTab({
      Name = "Rebirths",
      Type = "Single"
  });
  
  -- Используем уже объявленные переменные: player, rEvents, leaderstats
  local rebirthMenu = player.PlayerGui:WaitForChild("gameGui"):WaitForChild("rebirthMenu")
  local autoRebirthActive = false
  local autoTargetActive = false
  local targetAmount = 80
  
  local function doRebirth()
      pcall(function()
          rEvents.rebirthRemote:InvokeServer("rebirthRequest")
      end)
  end
  
  -- Цикл для целевого ребирта
  task.spawn(function()
      while true do
          if autoTargetActive then
              local current = leaderstats.Rebirths.Value
              if current >= targetAmount then
                  autoTargetActive = false
                  Notifier.new({
                      Title = "Success",
                      Content = "Target reached: " .. current,
                      Duration = 5
                  })
              else
                  doRebirth()
              end
          end
          task.wait(0.1)
      end
  end)
  
  -- Цикл для бесконечного ребирта
  task.spawn(function()
      while true do
          if autoRebirthActive then
              doRebirth()
          end
          task.wait(0.1)
      end
  end)
  
  -- Интерфейс
  local NormalSection1 = RebirthsExtractTab:DrawSection({
      Name = "Target Rebirths",
      Position = 'right'
  });
  
  NormalSection1:AddDropdown({
      Name = "Select Rebirth Target",
      Default = "80",
      Values = {"80","280","580","980","1480","2080","2780","3580","4480","5480","6580","7780","9080","10480","11980","13580","15280","17080","18980"},
      Callback = function(v)
          targetAmount = tonumber(v)
      end
  })
  
  NormalSection1:AddToggle({
      Name = "Auto Rebirth to Target",
      Flag = "Toggle_AutoRebirthTarget",
      Default = false,
      Callback = function(v)
          autoTargetActive = v
          if v then autoRebirthActive = false end
      end
  })
  
  local NormalSection2 = RebirthsExtractTab:DrawSection({
      Name = "Infinite Rebirths",
      Position = 'right'
  });
  
  NormalSection2:AddToggle({
      Name = "Auto Rebirth (Infinite)",
      Flag = "Toggle_AutoRebirthInfinite",
      Default = false,
      Callback = function(v)
          autoRebirthActive = v
          if v then autoTargetActive = false end
      end
  })
  
  local NormalSection3 = RebirthsExtractTab:DrawSection({
      Name = "Lock Position",
      Position = 'right'  
  });
  
  local lockPosConnection = nil
  local lockPositionEnabled = false
  
  NormalSection3:AddToggle({
      Name = "Lock Position (Prevents Knockback)",
      Flag = "Toggle_LockPosition",
      Default = false,
      Callback = function(v)
          lockPositionEnabled = v
          if v then
              local char = player.Character
              local hrp = char and char:FindFirstChild("HumanoidRootPart")
              if hrp then
                  local lockedCFrame = hrp.CFrame
                  lockPosConnection = game:GetService("RunService").Heartbeat:Connect(function()
                      if lockPositionEnabled and hrp and hrp.Parent then
                          hrp.CFrame = lockedCFrame
                          hrp.Velocity = Vector3.new(0, 0, 0)
                          hrp.RotVelocity = Vector3.new(0, 0, 0)
                      else
                          -- если персонаж исчез или переродился, обновляем ссылку и CFrame
                          local newChar = player.Character
                          if newChar then
                              hrp = newChar:FindFirstChild("HumanoidRootPart")
                              if hrp then
                                  lockedCFrame = hrp.CFrame
                              end
                          end
                      end
                  end)
              end
              playInterfaceSound("NotificationSound")
              Notifier.new({
                  Title = "Lock Position",
                  Content = "Position locked!",
                  Duration = 2
              })
          else
              if lockPosConnection then
                  lockPosConnection:Disconnect()
                  lockPosConnection = nil
              end
              playInterfaceSound("NotificationSound")
              Notifier.new({
                  Title = "Lock Position",
                  Content = "Position unlocked!",
                  Duration = 2
              })
          end
      end
  })
  
  -- // SPIN FORTUNE AUTO \\ --
  
  
  local SpinExtractTab = AutoTab:DrawTab({
  	Name = "Spin Wheel",
  	Type = "Single"
  });
  
  local NormalSection1 = SpinExtractTab:DrawSection({
      Name = "Cool functions",
      Position = 'right'  
  });
  
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local lplr = game:GetService("Players").LocalPlayer
  local fortuneRemote = ReplicatedStorage:WaitForChild("rEvents"):FindFirstChild("openFortuneWheelRemote")
  local fortuneGui = lplr:WaitForChild("PlayerGui"):WaitForChild("fortuneWheelMenuGui")
  local spinButton = fortuneGui.fortuneMenu.buttonsFrame.spinButton
  local autoFortuneEnabled = false
  local autoUnequipEnabled = false
  local spinCD = 2 -- Стандартная задержка
  
  local function unequipNewItems()
      if autoUnequipEnabled and lplr.Character then
          local hum = lplr.Character:FindFirstChildOfClass("Humanoid")
          if hum then hum:UnequipTools() end
      end
  end
  
  task.spawn(function()
      while true do
          if autoFortuneEnabled then
              pcall(function()
                  replicatedStorage.rEvents.openFortuneWheelRemote:InvokeServer(
                          "openFortuneWheel",
                      replicatedStorage.fortuneWheelChances["Fortune Wheel"]
                  )
              end)
          end
          task.wait(spinCD) 
      end
  end)
  
  NormalSection1:AddToggle({
      Name = "Auto Spin Fortune",
      Default = false,
      Callback = function(v) 
          autoFortuneEnabled = v
          playInterfaceSound("NotificationSound")
          Notifier.new({
              Title = "02: Notification",
              Content = "Auto Spin has been " .. (v and "Enabled!" or "Disabled!"),
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          });
      end
  })
  
  NormalSection1:AddToggle({
      Name = "Auto Unequip Rewards",
      Default = false,
      Callback = function(v) 
          autoUnequipEnabled = v
          playInterfaceSound("NotificationSound")
          Notifier.new({
              Title = "02: Notification",
              Content = "Auto Unequip has been " .. (v and "Enabled!" or "Disabled!"),
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          });
      end
  })
  
  NormalSection1:AddSlider({
      Name = "Spin Check Delay",
      Min = 0.5,
      Max = 10,
      Default = 2,
      Decimal = 1,
      Callback = function(Value)
          spinCD = Value
      end
  })
  
  -- // Gift Box Tab \\ --
  
  
  local GiftExtractTab = AutoTab:DrawTab({
  	Name = "Gift Box",
  	Type = "Single"
  });
  
  
  local NormalSection1 = GiftExtractTab:DrawSection({
      Name = "Cool Functions",
      Position = 'right'  
  });
  
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local lplr = game:GetService("Players").LocalPlayer
  local rEvents = ReplicatedStorage:WaitForChild("rEvents")
  
  local remotes = {
      rEvents:FindFirstChild("giftRemote"),
      rEvents:FindFirstChild("freeGiftClaimRemote")
  }
  
  local giftsGui = lplr:WaitForChild("PlayerGui"):WaitForChild("freeGiftsGui")
  local giftsFrame = giftsGui.freeGiftsMenu.giftsFrame
  
  local autoGiftEnabled = false
  local giftNotifyEnabled = false -- Переменная для тоггла уведомлений о сборе
  local autoUnequipEnabled = false -- Переменная для тоггла снятия предметов
  local giftCD = 2
  
  -- Функция для снятия предметов (Unequip)
  local function unequipNewItems()
      if autoUnequipEnabled and lplr.Character then
          local hum = lplr.Character:FindFirstChildOfClass("Humanoid")
          if hum then hum:UnequipTools() end
      end
  end
  
  local function claimLogic()
      for i = 1, 8 do
          local gift = giftsFrame:FindFirstChild("gift" .. i)
          if gift then
              local timer = gift:FindFirstChild("timerLabel")
              local tick = gift:FindFirstChild("tickIcon")
              
              if timer and timer.Text:upper():find("READY") and (not tick or not tick.Visible) then
                  local giftNum = gift:FindFirstChild("giftNumber") and gift.giftNumber.Value or i
                  
                  -- Уведомление о том, что подарок забирается
                  if giftNotifyEnabled then
                      Notifier.new({
                          Title = "02: Notification",
                          Content = "You can claim gift!",
                          Duration = 3,
                          Icon = "rbxassetid://102643647961511"
                      });
                  end
  
                  -- Массовая рассылка сигналов
                  for _, remote in pairs(remotes) do
                      if remote then
                          task.spawn(function() pcall(function() remote:InvokeServer(giftNum) end) end)
                          task.spawn(function() pcall(function() remote:FireServer(giftNum) end) end)
                      end
                  end
                  
                  -- Имитация нажатия на UI
                  pcall(function()
                      local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
                      for _, ename in pairs(events) do
                          for _, con in pairs(getconnections(gift[ename])) do
                              con:Fire()
                          end
                      end
                  end)
  
                  -- Автоматическое снятие через секунду после сбора
                  task.delay(1, unequipNewItems)
              end
          end
      end
  end
  
  task.spawn(function()
      while true do
          if autoGiftEnabled then
              claimLogic()
          end
          task.wait(giftCD) 
      end
  end)
  
  
  NormalSection1:AddToggle({
      Name = "Auto Claim Gifts",
      Default = false,
      Callback = function(v) 
          autoGiftEnabled = v
          playInterfaceSound("NotificationSound")
          Notifier.new({
              Title = "02: Notification",
              Content = "Auto Gift Claim has been " .. (v and "Enabled!" or "Disabled!"),
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          });
      end
  })
  
  NormalSection1:AddToggle({
      Name = "Gift Ready Notification",
      Default = false,
      Callback = function(v) 
          giftNotifyEnabled = v
          playInterfaceSound("NotificationSound")
          Notifier.new({
              Title = "02: Notification",
              Content = "Gift Notifications " .. (v and "Enabled!" or "Disabled!"),
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          });
      end
  })
  
  NormalSection1:AddToggle({
      Name = "Auto Unequip Items",
      Default = false,
      Callback = function(v) 
          autoUnequipEnabled = v
          playInterfaceSound("NotificationSound")
          Notifier.new({
              Title = "02: Notification",
              Content = "Auto Unequip has been " .. (v and "Enabled!" or "Disabled!"),
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          });
      end
  })
  
  NormalSection1:AddSlider({
      Name = "Gift Collect Delay (Sec)",
      Min = 0.1, Max = 10, Default = 2, Decimal = 1,
      Flag = "GiftDelay_Slider",
      Callback = function(Value)
          giftCD = Value
          Notifier.new({
              Title = "02: Notification",
              Content = "Delay changed to: " .. Value .. " sec!",
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          });
      end
  })
  
  local QuestsExtractTab = AutoTab:DrawTab({
  	Name = "Quests",
  	Type = "Single"
  });
  
  local NormalSection1 = QuestsExtractTab:DrawSection({
  	Name = "There nothing here :(",
  	Position = 'left'	
  });
  
  NormalSection1:AddParagraph({
  	Title = "Cooming soon!",
  	Content = "Потому что я делаю другие функции, я потом создам здесь все."
  })
  
  local AutoEatExtractTab = AutoTab:DrawTab({
      Name = "Auto Eat",
      Type = "Double"
  });
  
  -- 2. Затем переменные и логика
  local lplr = game:GetService("Players").LocalPlayer
  local backpack = lplr:WaitForChild("Backpack")
  
  local autoEatOnce = false
  local autoEatAll = false
  local eatDelay = 1
  
  -- Счетчики
  local totalEaten = 0
  local sessionEaten = 0
  
  -- Твои предметы
  local foodNames = {
      "Energy Bar", "Energy Shake", 
      "Protein Bar", "Protein Shake", 
      "TOUGH Bar", "ULTRA Shake"
  }
  
  local function isFood(item)
      for _, name in pairs(foodNames) do
          if item.Name == name then return true end
      end
      return false
  end
  
  -- Объекты интерфейса для обновления
  local statusParagraphOnce
  local statusParagraphAll
  
  local function updateStatus()
      -- Используем :Update() вместо :Set(), чтобы исправить ошибку
      if statusParagraphOnce and statusParagraphOnce.Update then
          local speed = 1 / eatDelay
          statusParagraphOnce:Update({
              Title = "Have been eaten:",
              Content = string.format("Total: %d | Speed: %.1f per sec", sessionEaten, speed)
          })
      end
      if statusParagraphAll and statusParagraphAll.Update then
          statusParagraphAll:Update({
              Title = "Have been eaten:",
              Content = "Total: " .. totalEaten
          })
      end
  end
  
  local function eatProcess(tool, mode)
      -- Проверка Parent для защиты от ошибки Locked
      if tool and tool.Parent == backpack and lplr.Character then
          local hum = lplr.Character:FindFirstChildOfClass("Humanoid")
          if hum then
              pcall(function()
                  hum:EquipTool(tool) -- Берем в руки
                  task.wait(0.05)
                  tool:Activate()     -- Сьедаем
                  task.wait(0.05)
                  hum:UnequipTools()  -- Убираем
                  
                  -- Обновление статистики
                  if mode == "once" then 
                      sessionEaten = sessionEaten + 1 
                  else 
                      totalEaten = totalEaten + 1 
                  end
                  updateStatus()
              end)
          end
      end
  end
  
  -- Цикл поедания
  task.spawn(function()
      while true do
          if autoEatOnce then
              local foundTypes = {}
              for _, item in pairs(backpack:GetChildren()) do
                  if isFood(item) and not foundTypes[item.Name] then
                      foundTypes[item.Name] = true
                      eatProcess(item, "once")
                      task.wait(eatDelay)
                  end
              end
          elseif autoEatAll then
              for _, item in pairs(backpack:GetChildren()) do
                  if not autoEatAll then break end
                  if isFood(item) then
                      eatProcess(item, "all")
                      -- В режиме Turbo задержка минимальна для скорости
                  end
              end
          end
          task.wait(0.5)
      end
  end)
  
  -- 3. Секции и элементы управления
  local NormalSection1 = AutoEatExtractTab:DrawSection({
      Name = "Only once",
      Position = 'left'   
  });
  
  NormalSection1:AddToggle({
      Name = "Eat Each Type Once",
      Flag = "Toggle_AutoEatOnce1",
      Default = false,
      Callback = function(v) 
          autoEatOnce = v 
          if v then autoEatAll = false end
      end,
  });
  
  statusParagraphOnce = NormalSection1:AddParagraph({
      Title = "Have been eaten:",
      Content = "Total: 0 | Speed: 0 per sec"
  })
  
  -- Правая секция
  local NormalSection2 = AutoEatExtractTab:DrawSection({
      Name = "All the time",
      Position = 'right'  
  });
  
  NormalSection2:AddToggle({
      Name = "Turbo Eat All",
      Flag = "Toggle_AutoEatAll1",
      Default = false,
      Callback = function(v) 
          autoEatAll = v 
          if v then autoEatOnce = false end
      end,
  });
  
  statusParagraphAll = NormalSection2:AddParagraph({
      Title = "Have been eaten:",
      Content = "Total: 0"
  })
  
  -- Слайдер задержки
  NormalSection1:AddSlider({
      Name = "Eat Delay",
      Min = 0.1, Max = 10, Default = 1, Decimal = 0.1,
      Callback = function(v) 
          eatDelay = v 
          updateStatus()
      end
  });
  
  -- // Shop Tab \\ --
  
  local CrystalExtractTab = ShopTab:DrawTab({
      Name = "Crystal",
      Type = "Single"
  });
  
  local crystalSection = CrystalExtractTab:DrawSection({
      Name = "Buy Crystals",
      Position = 'middle'
  });
  
  -- Список кристаллов (названия из игры)
  local crystalNames = {
      "Blue Crystal",
      "Green Crystal",
      "Frost Crystal",
      "Mythical Crystal",
      "Inferno Crystal",
      "Legends Crystal",
      "Muscle Elite Crystal",
      "Galaxy Oracle Crystal",
      "Jungle Crystal"
  }
  
  local selectedCrystal = crystalNames[1]
  
  local crystalDropdown = crystalSection:AddDropdown({
      Name = "Select Crystal",
      Default = selectedCrystal,
      Values = crystalNames,
      Callback = function(selected)
          selectedCrystal = selected
          playInterfaceSound("ButtonClick")
      end
  })
  
  -- Функция покупки кристалла (используем remote, если есть)
  local function buyCrystal()
      local shopRemote = RS:FindFirstChild("crystalShopRemote") or RS:FindFirstChild("crystalRemote")
      if not shopRemote then
          Notifier.new({Title = "Error", Content = "Crystal shop remote not found!", Duration = 3})
          return
      end
  
      -- Пробуем передать имя кристалла
      local success, err = pcall(function()
          shopRemote:InvokeServer(selectedCrystal)
      end)
  
      if success then
          Notifier.new({
              Title = "Success",
              Content = "Bought " .. selectedCrystal,
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          })
      else
          Notifier.new({
              Title = "Purchase Failed",
              Content = "Error: " .. tostring(err),
              Duration = 4,
              Icon = "rbxassetid://102643647961511"
          })
      end
  end
  
  crystalSection:AddButton({
      Name = "Buy Crystal",
      Callback = buyCrystal
  })
  
  -- Автопокупка кристаллов
  local autoBuyCrystal = false
  crystalSection:AddToggle({
      Name = "Auto Buy Crystal",
      Flag = "AutoBuyCrystal",
      Default = false,
      Callback = function(v)
          autoBuyCrystal = v
          if v then
              task.spawn(function()
                  while autoBuyCrystal do
                      buyCrystal()
                      task.wait(0.5)
                  end
              end)
              playInterfaceSound("NotificationSound")
          else
              playInterfaceSound("NotificationSound")
          end
      end
  })
  
  -- ВКЛАДКА PETS (упрощённая версия из Rafael)
  local PetExtractTab = ShopTab:DrawTab({
      Name = "Pets",
      Type = "Single"
  });
  
  local petSection = PetExtractTab:DrawSection({
      Name = "Pet Shop",
      Position = 'middle'
  });
  
  -- Список питомцев (только имена, без скобок)
  local petNames = {
      "Orange Hedgehog",
      "Silver Dog",
      "Yellow Butterfly",
      "Red Dragon",
      "Gold Viking",
      "Blue Birdie",
      "Dark Golem",
      "Purple Dragom",
      "Purple Falcon",
      "Red Kitty",
      "Blue Bunny",
      "Green Butterfly",
      "Orange Pegasus",
      "Blue Firecaster",
      "Dark Vampy",
      "Crimson Falcon",
      "Blue Phoenix",
      "Golden Phoenix",
      "Neon Guardian"
  }
  
  local selectedPet = petNames[1]
  
  local petDropdown = petSection:AddDropdown({
      Name = "Select Pet",
      Default = selectedPet,
      Values = petNames,
      Callback = function(selected)
          selectedPet = selected
          playInterfaceSound("ButtonClick")
      end
  })
  
  -- Функция покупки (как в Rafael)
  local function buyPet()
      if not RS then
          Notifier.new({Title = "Error", Content = "ReplicatedStorage not found!", Duration = 3})
          return
      end
  
      local petShopRemote = RS:FindFirstChild("cPetShopRemote")
      local petShopFolder = RS:FindFirstChild("cPetShopFolder")
  
      if not petShopRemote or not petShopFolder then
          Notifier.new({
              Title = "Error",
              Content = "Pet Shop not found! Check names.",
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          })
          return
      end
  
      local petObject = petShopFolder:FindFirstChild(selectedPet)
      if not petObject then
          Notifier.new({
              Title = "Error",
              Content = "Pet not found: " .. selectedPet,
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          })
          return
      end
  
      local success, err = pcall(function()
          petShopRemote:InvokeServer(petObject)
      end)
  
      if success then
          Notifier.new({
              Title = "Success",
              Content = "Bought " .. selectedPet,
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          })
      else
          Notifier.new({
              Title = "Purchase Failed",
              Content = "Error: " .. tostring(err),
              Duration = 4,
              Icon = "rbxassetid://102643647961511"
          })
      end
  end
  
  petSection:AddButton({
      Name = "Buy Selected Pet",
      Callback = buyPet
  })
  
  -- Автопокупка
  local autoBuyActive = false
  
  petSection:AddToggle({
      Name = "Auto Buy Pet",
      Flag = "AutoPetBuy",
      Default = false,
      Callback = function(v)
          autoBuyActive = v
          if v then
              task.spawn(function()
                  while autoBuyActive do
                      buyPet()
                      task.wait(0.5)
                  end
              end)
              playInterfaceSound("NotificationSound")
          else
              playInterfaceSound("NotificationSound")
          end
      end
  })
  
  local AuraExtractTab = ShopTab:DrawTab({
      Name = "Aura",
      Type = "Single"
  });
  
  local auraSection = AuraExtractTab:DrawSection({
      Name = "Buy Auras",
      Position = 'middle'
  });
  
  -- Список аур (из скрипта Rafael)
  local auraNames = {
      "Blue Aura",
      "Green Aura",
      "Purple Aura",
      "Red Aura",
      "Yellow Aura",
      "Ultra Inferno",
      "Azure Tundra",
      "Grand Supernova",
      "Muscle King",
      "Entropic Blast",
      "Eternal Megastrike"
  }
  
  local selectedAura = auraNames[1]
  
  local auraDropdown = auraSection:AddDropdown({
      Name = "Select Aura",
      Default = selectedAura,
      Values = auraNames,
      Callback = function(selected)
          selectedAura = selected
          playInterfaceSound("ButtonClick")
      end
  })
  
  -- Функция покупки ауры (через тот же remote, что и питомцы)
  local function buyAura()
      local petShopRemote = RS:FindFirstChild("cPetShopRemote")
      local petShopFolder = RS:FindFirstChild("cPetShopFolder")
  
      if not petShopRemote or not petShopFolder then
          Notifier.new({
              Title = "Error",
              Content = "Pet shop remote/folder not found!",
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          })
          return
      end
  
      local auraObject = petShopFolder:FindFirstChild(selectedAura)
      if not auraObject then
          Notifier.new({
              Title = "Error",
              Content = "Aura not found: " .. selectedAura,
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          })
          return
      end
  
      local success, err = pcall(function()
          petShopRemote:InvokeServer(auraObject)
      end)
  
      if success then
          Notifier.new({
              Title = "Success",
              Content = "Bought " .. selectedAura,
              Duration = 3,
              Icon = "rbxassetid://102643647961511"
          })
      else
          Notifier.new({
              Title = "Purchase Failed",
              Content = "Error: " .. tostring(err),
              Duration = 4,
              Icon = "rbxassetid://102643647961511"
          })
      end
  end
  
  auraSection:AddButton({
      Name = "Buy Selected Aura",
      Callback = buyAura
  })
  
  -- Автопокупка ауры
  local autoBuyAura = false
  auraSection:AddToggle({
      Name = "Auto Buy Aura",
      Flag = "AutoBuyAura",
      Default = false,
      Callback = function(v)
          autoBuyAura = v
          if v then
              task.spawn(function()
                  while autoBuyAura do
                      buyAura()
                      task.wait(0.5)
                  end
              end)
              playInterfaceSound("NotificationSound")
          else
              playInterfaceSound("NotificationSound")
          end
      end
  })
  
  
  -- // Kill Tab \\ --
  local function getLocalCharacter()
      local char = player.Character
      if not char then
          char = player.CharacterAdded:Wait()
      end
      return char
  end
  
  local function isPlayerValid(target)
      if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
          return true
      end
      return false
  end
  
  local function doPunchAttack()
      local char = getLocalCharacter()
      if not char then return end
      local hum = char:FindFirstChild("Humanoid")
      if not hum or hum.Health <= 0 then return end
  
      if not char:FindFirstChild("Punch") then
          local tool = player.Backpack:FindFirstChild("Punch")
          if tool then
              hum:EquipTool(tool)
          end
      end
  
      pcall(function()
          MuscleEvent:FireServer("punch", "leftHand")
          MuscleEvent:FireServer("punch", "rightHand")
      end)
  end  -- <-- только один end, и больше ничего после него не должно быть
  
  
  local function attackPlayer(target)
      if not isPlayerValid(target) then return end
      local myChar = getLocalCharacter()
      if myChar and myChar:FindFirstChild("LeftHand") then
          pcall(function()
              local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
              if targetHRP then
                  firetouchinterest(targetHRP, myChar.LeftHand, 0)
                  firetouchinterest(targetHRP, myChar.LeftHand, 1)
                  doPunchAttack()
              end
          end)
      end
  end
  
  local function isWhitelisted(target)
      if not _G.whitelistedPlayers then return false end
      for _, name in ipairs(_G.whitelistedPlayers) do
          if name:lower() == target.Name:lower() then
              return true
          end
      end
      return false
  end
  
  local function isBlacklisted(target)
      if not _G.blacklistedPlayers then return false end
      for _, name in ipairs(_G.blacklistedPlayers) do
          if name:lower() == target.Name:lower() then
              return true
          end
      end
      return false
  end
  
  
  local KillingExtractTab = KillTab:DrawTab({
      Name = "Killing",
      Type = "Single"
  });
  
  local killSection = KillingExtractTab:DrawSection({
      Name = "Kill Options",
      Position = 'middle'
  });
  
  -- Переменные для управления
  local killAllActive = false
  local killBlacklistActive = false
  local killAllConnection = nil
  local killBlacklistConnection = nil
  
  -- Toggle: Kill All (except whitelist)
  killSection:AddToggle({
      Name = "Kill All (except Whitelist)",
      Flag = "Toggle_KillAll",
      Default = false,
      Callback = function(v)
          killAllActive = v
          if v then
              if killAllConnection then killAllConnection:Disconnect() end
              killAllConnection = game:GetService("RunService").Heartbeat:Connect(function()
                  if killAllActive then
                      for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
                          if plr ~= player and not isWhitelisted(plr) then
                              attackPlayer(plr)
                          end
                      end
                  end
              end)
          else
              if killAllConnection then
                  killAllConnection:Disconnect()
                  killAllConnection = nil
              end
          end
      end
  })
  
  -- Toggle: Kill Blacklisted Only
  killSection:AddToggle({
      Name = "Kill Blacklisted Only",
      Flag = "Toggle_KillBlacklist",
      Default = false,
      Callback = function(v)
          killBlacklistActive = v
          if v then
              if killBlacklistConnection then killBlacklistConnection:Disconnect() end
              killBlacklistConnection = game:GetService("RunService").Heartbeat:Connect(function()
                  if killBlacklistActive then
                      for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
                          if plr ~= player and isBlacklisted(plr) then
                              attackPlayer(plr)
                          end
                      end
                  end
              end)
          else
              if killBlacklistConnection then
                  killBlacklistConnection:Disconnect()
                  killBlacklistConnection = nil
              end
          end
      end
  })
  
  -- Death Ring (как в справке)
  local deathRingPart = nil
  local deathRingRange = 20
  local deathRingEnabled = false
  local showDeathRing = false
  
  killSection:AddTextBox({
      Name = "Death Ring Range",
      Flag = "DeathRingRange",
      Callback = function(input)
          local num = tonumber(input)
          if num then
              deathRingRange = math.clamp(num, 1, 140)
              if deathRingPart then
                  local diameter = deathRingRange * 2
                  deathRingPart.Size = Vector3.new(0.2, diameter, diameter)
              end
          end
      end
  })
  
  local deathRingToggle = killSection:AddToggle({
      Name = "Death Ring Kill",
      Flag = "Toggle_DeathRing",
      Default = false,
      Callback = function(v)
          deathRingEnabled = v
          if v then
              -- Создаём кольцо, если нужно
              if not deathRingPart and showDeathRing then
                  deathRingPart = Instance.new("Part")
                  deathRingPart.Shape = Enum.PartType.Cylinder
                  deathRingPart.Material = Enum.Material.Neon
                  deathRingPart.Color = Color3.fromRGB(0, 0, 0)
                  deathRingPart.Transparency = 0.6
                  deathRingPart.Anchored = true
                  deathRingPart.CanCollide = false
                  deathRingPart.CastShadow = false
                  local diameter = deathRingRange * 2
                  deathRingPart.Size = Vector3.new(0.2, diameter, diameter)
                  deathRingPart.Parent = workspace
              end
              -- Запускаем цикл убийств в радиусе
              task.spawn(function()
                  while deathRingEnabled do
                      local char = player.Character
                      if char and char:FindFirstChild("HumanoidRootPart") then
                          local myPos = char.HumanoidRootPart.Position
                          if deathRingPart then
                              deathRingPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(90))
                          end
                          for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
                              if plr ~= player and not isWhitelisted(plr) then
                                  pcall(function()
                                      if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                          local dist = (myPos - plr.Character.HumanoidRootPart.Position).Magnitude
                                          if dist <= deathRingRange then
                                              attackPlayer(plr)
                                          end
                                      end
                                  end)
                              end
                          end
                      end
                      task.wait(0.05)
                  end
                  -- Очистка при выключении
                  if deathRingPart then
                      deathRingPart:Destroy()
                      deathRingPart = nil
                  end
              end)
          else
              if deathRingPart then
                  deathRingPart:Destroy()
                  deathRingPart = nil
              end
          end
      end
  })
  
  local showRingToggle = killSection:AddToggle({
      Name = "Show Death Ring",
      Flag = "Toggle_ShowDeathRing",
      Default = false,
      Callback = function(v)
          showDeathRing = v
          if v then
              if not deathRingPart then
                  deathRingPart = Instance.new("Part")
                  deathRingPart.Shape = Enum.PartType.Cylinder
                  deathRingPart.Material = Enum.Material.Neon
                  deathRingPart.Color = Color3.fromRGB(0, 0, 0)
                  deathRingPart.Transparency = 0.6
                  deathRingPart.Anchored = true
                  deathRingPart.CanCollide = false
                  deathRingPart.CastShadow = false
                  local diameter = deathRingRange * 2
                  deathRingPart.Size = Vector3.new(0.2, diameter, diameter)
                  deathRingPart.Parent = workspace
                  -- Обновляем позицию в цикле, если deathRingEnabled не активен
                  if not deathRingEnabled then
                      task.spawn(function()
                          while showDeathRing and not deathRingEnabled do
                              local char = player.Character
                              if char and char:FindFirstChild("HumanoidRootPart") then
                                  deathRingPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(90))
                              end
                              task.wait(0.1)
                          end
                      end)
                  end
              end
          else
              if deathRingPart and not deathRingEnabled then
                  deathRingPart:Destroy()
                  deathRingPart = nil
              end
          end
      end
  })
  
  local BlackListExtractTab = KillTab:DrawTab({
      Name = "Blacklist",
      Type = "Single"
  });
  
  local blacklistSection = BlackListExtractTab:DrawSection({
      Name = "Manage Blacklist",
      Position = 'middle'
  });
  
  local blacklistDropdown = nil
  
  local function createBlacklistDropdown()
      if blacklistDropdown then
          pcall(function() blacklistDropdown:Destroy() end)
          blacklistDropdown = nil
      end
  
      local playerList = {}
      for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
          if plr ~= player then
              table.insert(playerList, plr.DisplayName .. " | " .. plr.Name)
          end
      end
  
      blacklistDropdown = blacklistSection:AddDropdown({
          Name = "Add to Blacklist",
          Values = playerList,
          Callback = function(selected)
              local name = selected:match("| (.+)$")
              if name then
                  name = name:gsub("^%s*(.-)%s*$", "%1")
                  for _, existing in ipairs(_G.blacklistedPlayers) do
                      if existing:lower() == name:lower() then return end
                  end
                  table.insert(_G.blacklistedPlayers, name)
                  playInterfaceSound("NotificationSound")
              end
          end
      })
  end
  
  createBlacklistDropdown()
  
  blacklistSection:AddButton({
      Name = "Refresh Player List",
      Callback = function()
          createBlacklistDropdown()
          playInterfaceSound("ButtonClick")
          Notifier.new({
              Title = "02: Notification",
              Content = "Player list refreshed!",
              Duration = 2,
              Icon = "rbxassetid://102643647961511"
          })
      end
  })
  
  local blacklistInfoLabel = blacklistSection:AddParagraph({
      Title = "Blacklist:",
      Content = "None"
  })
  
  -- // Status Tab \\ --
  
  local OtherPlrExtractTab = StatusTab:DrawTab({
      Name = "Other Players",
      Type = "Single"
  });
  
  local otherSection = OtherPlrExtractTab:DrawSection({
      Name = "Player Stats",
      Position = 'middle'
  });
  
  local selectedPlayer = nil
  local playerStatLabels = {}
  
  -- Dropdown для выбора игрока
  local playerDropdown = otherSection:AddDropdown({
      Name = "Select Player",
      Values = function()
          local list = {}
          for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
              if plr ~= player then
                  table.insert(list, plr.DisplayName .. " | " .. plr.Name)
              end
          end
          return list
      end,
      Callback = function(selected)
          local name = selected:match("| (.+)$")
          if name then
              selectedPlayer = game:GetService("Players"):FindFirstChild(name)
          end
      end
  })
  
  -- Создаём лейблы
  for _, name in ipairs({"Strength", "Rebirths", "Durability", "Agility", "Kills"}) do
      local label = otherSection:AddLabel(name .. ": N/A")
      label.TextSize = 18
      playerStatLabels[name] = label
  end
  
  -- Обновление
  task.spawn(function()
      while true do
          if selectedPlayer then
              local leaderstats = selectedPlayer:FindFirstChild("leaderstats")
              if leaderstats then
                  for _, name in ipairs({"Strength", "Rebirths", "Durability", "Agility", "Kills"}) do
                      local stat = leaderstats:FindFirstChild(name)
                      if stat then
                          playerStatLabels[name].Text = name .. ": " .. formatNumberShort(stat.Value) .. " (" .. formatNumberComma(stat.Value) .. ")"
                      else
                          playerStatLabels[name].Text = name .. ": N/A"
                      end
                  end
              end
          else
              for _, label in pairs(playerStatLabels) do
                  label.Text = "Select a player"
              end
          end
          task.wait(0.5)
      end
  end)
  
  --// Miscellaneous Tab \\ --
  
  local FpsBoosterExtractTab = MiscellaneousTab:DrawTab({
      Name = "FPS",
      Type = "Single"
  });
  
  local fpsSection = FpsBoosterExtractTab:DrawSection({
      Name = "FPS Display",
      Position = 'middle'
  });
  
  local fpsGui = nil
  local fpsLabel = nil
  
  fpsSection:AddToggle({
      Name = "Show FPS (Center Bottom)",
      Flag = "Toggle_FPSDisplay",
      Default = false,
      Callback = function(v)
          if v then
              -- Создаём GUI
              fpsGui = Instance.new("ScreenGui")
              fpsGui.Name = "FPS_Display"
              fpsGui.ResetOnSpawn = false
              fpsGui.Parent = playerGui
  
              fpsLabel = Instance.new("TextLabel")
              fpsLabel.Size = UDim2.new(0, 80, 0, 30)
              fpsLabel.Position = UDim2.new(0.5, -40, 1, -40)
              fpsLabel.AnchorPoint = Vector2.new(0.5, 1)
              fpsLabel.BackgroundTransparency = 1
              fpsLabel.Text = "FPS: 0"
              fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
              fpsLabel.TextSize = 20
              fpsLabel.Font = Enum.Font.GothamBold
              fpsLabel.TextStrokeTransparency = 0.5
              fpsLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
              fpsLabel.Parent = fpsGui
  
              -- Обновление FPS
              local RunService = game:GetService("RunService")
              local fpsCounter = 0
              local lastTime = tick()
              local connection
              connection = RunService.RenderStepped:Connect(function()
                  fpsCounter = fpsCounter + 1
                  local now = tick()
                  if now - lastTime >= 1 then
                      if fpsLabel then
                          fpsLabel.Text = "FPS: " .. fpsCounter
                      end
                      fpsCounter = 0
                      lastTime = now
                  end
              end)
  
              -- Сохраняем соединение для очистки
              getgenv()._fpsConnection = connection
  
              playInterfaceSound("NotificationSound")
          else
              if fpsGui then
                  fpsGui:Destroy()
                  fpsGui = nil
                  fpsLabel = nil
              end
              if getgenv()._fpsConnection then
                  getgenv()._fpsConnection:Disconnect()
                  getgenv()._fpsConnection = nil
              end
              playInterfaceSound("NotificationSound")
          end
      end
  })
  
  local ServerExtractTab = MiscellaneousTab:DrawTab({
      Name = "Server",
      Type = "Single"
  });
  
  local TextSection2 = ServerExtractTab:DrawSection({
  	Name = "Cooming soon...",
  	Position = 'middle'	
  });
  
  local SlidersExtractTab = MiscellaneousTab:DrawTab({
  	Name = "Adjustment Tab",
  	Type = "Single"
  });
  
  local TextSection1 = SlidersExtractTab:DrawSection({
  	Name = "Player Adjustment",
  	Position = 'middle'	
  });
  
  -- Добавьте в раздел Miscellaneous или Main Tab
  
  TextSection1:AddToggle({
      Name = "Auto Size 1",
      Flag = "Toggle_AutoSize1",
      Default = false,
      Callback = function(v)
          _G.autoSizeActive = v
          if v then
              task.spawn(function()
                  while _G.autoSizeActive do
                      local success, err = pcall(function()
                          RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 1)
                      end)
                      if not success then
                          warn("AutoSize error: " .. tostring(err))
                      end
                      task.wait(0.5) -- задержка, чтобы не спамить
                  end
              end)
              playInterfaceSound("NotificationSound")
          else
              playInterfaceSound("NotificationSound")
          end
      end
  })
  
  TextSection1:AddSlider({
  	Name = "Speed",
  	Min = 1,
  	Max = 500,
  	Default = 16,
  	Round = 1,
  	Flag = "Speed_PlayerSlider",
  	Callback = function(Value)
          local char = player.Character or player.CharacterAdded:Wait()
          local hum = char:FindFirstChildOfClass("Humanoid")
          if hum then
              while hum.WalkSpeed ~= Value do
                  hum.WalkSpeed = Value
                  task.wait(0.1)
              end
          end
      end,
  });
  
  TextSection1:AddSlider({
  	Name = "Jump Power",
  	Min = 50,
  	Max = 500,
  	Default = 16,
  	Round = 1,
  	Flag = "JumpPower_PlayerSlider",
  	Callback = function(Value)
          local char = player.Character or player.CharacterAdded:Wait()
          local hum = char:FindFirstChildOfClass("Humanoid")
          if hum then
              while hum.JumpPower ~= Value do
                  hum.JumpPower = Value
                  task.wait(0.1)
              end
          end
      end,
  });
  
  local TextSection2 = SlidersExtractTab:DrawSection({
  	Name = "Camera Adjustment",
  	Position = 'middle'	
  });
  
  TextSection2:AddSlider({
  	Name = "Field of View",
  	Min = 40,
  	Max = 120,
  	Default = 70,
  	Round = 1,
  	Flag = "FieldOfVied_CameraSlider",
  	Callback = function(Value)
          local cam = workspace.CurrentCamera
              cam.FieldOfView = Value
              task.wait(0.1)
      end,
  });
  
  local TeleportExtractTab = MiscellaneousTab:DrawTab({
      Name = "Teleports",
      Type = "Single"
  });
  
  local teleSection = TeleportExtractTab:DrawSection({
      Name = "Quick Teleport",
      Position = 'middle'
  });
  
  -- Список локаций
  local locations = {
      {"Spawn", CFrame.new(2, 8, 115)},
      {"Tiny Island", CFrame.new(-34, 7, 1903)},
      {"Frozen Island", CFrame.new(-2600, 3, -403)},
      {"Mythical Island", CFrame.new(2255, 7, 1071)},
      {"Hell Island", CFrame.new(-6768, 7, -1287)},
      {"Legend Island", CFrame.new(4604, 991, -3887)},
      {"Muscle King", CFrame.new(-8646, 17, -5738)},
      {"Jungle Island", CFrame.new(-8659, 6, 2384)},
      {"Brawl Lava", CFrame.new(4471, 119, -8836)},
      {"Brawl Desert", CFrame.new(960, 17, -7398)},
      {"Brawl Regular", CFrame.new(-1849, 20, -6335)}
  }
  
  for _, loc in ipairs(locations) do
      teleSection:AddButton({
          Name = loc[1],
          Callback = function()
              local char = player.Character
              if char and char:FindFirstChild("HumanoidRootPart") then
                  char.HumanoidRootPart.CFrame = loc[2]
                  playInterfaceSound("ButtonClick")
                  Notifier.new({Title = "Teleport", Content = "Teleported to " .. loc[1], Duration = 2})
              end
          end
      })
  end
  
  -- // Anti AFK Tab \\ --
  local AntiAFKExtractTab = MiscellaneousTab:DrawTab({
      Name = "Anti AFK",
      Type = "Single"
  });
  
  local afkSection = AntiAFKExtractTab:DrawSection({
      Name = "Anti AFK with UI",
      Position = 'middle'
  });
  
  afkSection:AddToggle({
      Name = "Enable Anti AFK",
      Flag = "Toggle_AntiAFK",
      Default = false,
      Callback = function(v)
          if v then
              -- Создаём UI
              local screenGui = Instance.new("ScreenGui")
              screenGui.Name = "AntiAFK_UI"
              screenGui.ResetOnSpawn = false
              screenGui.Parent = playerGui
  
              local frame = Instance.new("Frame")
              frame.Size = UDim2.new(0, 220, 0, 90)
              frame.Position = UDim2.new(0.01, 0, 0.3, 0)
              frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
              frame.BackgroundTransparency = 0.2
              frame.BorderSizePixel = 0
              frame.Parent = screenGui
              Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
  
              -- Заголовок
              local title = Instance.new("TextLabel")
              title.Size = UDim2.new(1, 0, 0, 20)
              title.BackgroundTransparency = 1
              title.Text = "Anti AFK"
              title.TextColor3 = Color3.fromRGB(255, 255, 255)
              title.TextSize = 16
              title.Font = Enum.Font.GothamBold
              title.Parent = frame
  
              -- Время
              local timerLabel = Instance.new("TextLabel")
              timerLabel.Size = UDim2.new(0.5, 0, 0, 20)
              timerLabel.Position = UDim2.new(0, 0, 0.25, 0)
              timerLabel.BackgroundTransparency = 1
              timerLabel.Text = "0:0:0"
              timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
              timerLabel.TextSize = 14
              timerLabel.Font = Enum.Font.Gotham
              timerLabel.Parent = frame
  
              -- Ping
              local pingLabel = Instance.new("TextLabel")
              pingLabel.Size = UDim2.new(0.5, 0, 0, 20)
              pingLabel.Position = UDim2.new(0.5, 0, 0.25, 0)
              pingLabel.BackgroundTransparency = 1
              pingLabel.Text = "Ping: 0"
              pingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
              pingLabel.TextSize = 14
              pingLabel.Font = Enum.Font.Gotham
              pingLabel.Parent = frame
  
              -- FPS
              local fpsLabel = Instance.new("TextLabel")
              fpsLabel.Size = UDim2.new(0.5, 0, 0, 20)
              fpsLabel.Position = UDim2.new(0, 0, 0.5, 0)
              fpsLabel.BackgroundTransparency = 1
              fpsLabel.Text = "FPS: 0"
              fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
              fpsLabel.TextSize = 14
              fpsLabel.Font = Enum.Font.Gotham
              fpsLabel.Parent = frame
  
              -- Статус
              local statusLabel = Instance.new("TextLabel")
              statusLabel.Size = UDim2.new(1, 0, 0, 20)
              statusLabel.Position = UDim2.new(0, 0, 0.7, 0)
              statusLabel.BackgroundTransparency = 1
              statusLabel.Text = "Active"
              statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
              statusLabel.TextSize = 12
              statusLabel.Font = Enum.Font.Gotham
              statusLabel.Parent = frame
  
              -- Drag functionality (перетаскивание)
              local dragging = false
              local dragStart, startPos
              frame.InputBegan:Connect(function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                      dragging = true
                      dragStart = input.Position
                      startPos = frame.Position
                  end
              end)
              frame.InputEnded:Connect(function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                      dragging = false
                  end
              end)
              game:GetService("UserInputService").InputChanged:Connect(function(input)
                  if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                      local delta = input.Position - dragStart
                      frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                  end
              end)
  
              -- Таймер
              local s, m, h = 0, 0, 0
              spawn(function()
                  while screenGui do
                      s = s + 1
                      if s >= 60 then s = 0; m = m + 1 end
                      if m >= 60 then m = 0; h = h + 1 end
                      timerLabel.Text = h .. ":" .. m .. ":" .. s
                      wait(1)
                  end
              end)
  
              -- Обновление пинга и FPS
              local RunService = game:GetService("RunService")
              local fpsCounter = 0
              local lastTime = tick()
              RunService.RenderStepped:Connect(function()
                  fpsCounter = fpsCounter + 1
                  local now = tick()
                  if now - lastTime >= 1 then
                      fpsLabel.Text = "FPS: " .. fpsCounter
                      fpsCounter = 0
                      lastTime = now
                  end
                  -- Ping
                  local ping = pcall(function() return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() end)
                  if ping then pingLabel.Text = "Ping: " .. math.floor(ping) else pingLabel.Text = "Ping: N/A" end
              end)
  
              -- Anti AFK клик
              local vu = game:GetService("VirtualUser")
              player.Idled:Connect(function()
                  vu:CaptureController()
                  vu:ClickButton2(Vector2.new())
              end)
  
              -- Сохраняем GUI в переменную для уничтожения при выключении
              getgenv()._antiAFKGui = screenGui
  
              playInterfaceSound("NotificationSound")
              Notifier.new({Title = "Anti AFK", Content = "Enabled with UI!", Duration = 3})
          else
              -- Удаляем GUI
              if getgenv()._antiAFKGui then
                  getgenv()._antiAFKGui:Destroy()
                  getgenv()._antiAFKGui = nil
              end
              playInterfaceSound("NotificationSound")
              Notifier.new({Title = "Anti AFK", Content = "Disabled!", Duration = 3})
          end
      end
  })
  
  -- // Settings Tab \\ --
  
  
  
  
  -- // Notifications \\ --
  
  playInterfaceSound("NotificationSound")
  Notifier.new({
  	Title = "02: Notification",
  	Content = "The script has been succesfuly loaded for use!",
  	Duration = 6,
  	Icon = "rbxassetid://102643647961511"
  });
  
  wait(0.5)
  
  local executor = (identifyexecutor and identifyexecutor()) or "Unknown"
  local supportedExploits = {"JJsploit", "Delta", "Velocity", "Arceus", "Neo", "Vortex", "Wave", "WeAreDevs", "Yub-X"}
  local isSupported = false;
  
  for _, s in ipairs(supportedExploits) do
      if string.find(string.lower(executor), string.lower(s)) then
          isSupported = true
          break
      end
  end
  
  playInterfaceSound("WarnSound")
  Notifier.new({
      Title = "Exploit Check",
      Content = isSupported and ("Your exploit (%s) is supported!"):format(executor) 
                 or ("Your exploit (%s) is not supported! Errors may occur."):format(executor),
      Duration = 10,
      Icon = "rbxassetid://102643647961511"
  });
end
