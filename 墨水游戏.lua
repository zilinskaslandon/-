Fork
Bottle
workspace.Live.DayFineQWQ.SwingSpeed
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/main.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/bailib/Roblox/refs/heads/main/main/ESP.lua"))()

local lastUpdate = tick()
local updateInterval = 0.1

function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    
    local length = #chars
    
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', 
            math.floor(r * 255), 
            math.floor(g * 255), 
            math.floor(b * 255), 
            chars[i])
    end
    
    return result
end

local Confirmed = false  

WindUI:Popup({
    Title = gradient("霖溺脚本中心", Color3.fromHex("#eb1010"), Color3.fromHex("#1023eb")),
    Icon = "info",
    Content = gradient("作者:霖溺", Color3.fromHex("#10eb3c"), Color3.fromHex("#67c97a")) .. gradient(" \n@霖溺团队制作", Color3.fromHex("#001e80"), Color3.fromHex("#16f2d9")),  
    Buttons = {  
        {
            Title = gradient("关闭脚本", Color3.fromHex("#e80909"), Color3.fromHex("#630404")),
            Callback = function() end,
            Variant = "Tertiary",
        },
        {
            Title = gradient("加载脚本", Color3.fromHex("#90f09e"), Color3.fromHex("#13ed34")),
            Callback = function() Confirmed = true end,
            Variant = "Secondary",
        }
    }
})

repeat task.wait() until Confirmed

WindUI:Notify({
    Title = gradient("霖溺免费脚本", Color3.fromHex("#eb1010"), Color3.fromHex("#1023eb")),
    Content = "脚本加载成功",
    Icon = "check-circle",
    Duration = 3,
})

local Window = WindUI:CreateWindow({
    Title = gradient("墨水游戏", Color3.fromHex("#001e80"), Color3.fromHex("#16f2d9")), 
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Author = gradient("@霖溺", Color3.fromHex("#1bf2b2"), Color3.fromHex("#1bcbf2")),
    Folder = "InkHelper",
    Size = UDim2.fromOffset(300, 400),
    Transparent = true,
    Theme = "Light",
    SideBarWidth = 200,
    HideSearchBar = true,
    ScrollBarEnabled = true,
})

Window:EditOpenButton({
    Title = "打开霖溺脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(2, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0000"),
        Color3.fromHex("1F75FE")
    ),
    Draggable = true,
})

local Tabs = {
    PlayerTab = Window:Tab({ Title = gradient("帮助玩家", Color3.fromHex("#FF9900"), Color3.fromHex("#636363")), Icon = "users" }),
    MovementTab = Window:Tab({ Title = gradient("移动", Color3.fromHex("#FF9900"), Color3.fromHex("#636363")), Icon = "move" }),
    CombatTab = Window:Tab({ Title = gradient("战斗", Color3.fromHex("#FF9900"), Color3.fromHex("#636363")), Icon = "swords" }),
    GameTab = Window:Tab({ Title = gradient("游戏作弊", Color3.fromHex("#FF9900"), Color3.fromHex("#636363")), Icon = "gamepad" }),
    ESPTab = Window:Tab({ Title = gradient("透视功能", Color3.fromHex("#FF9900"), Color3.fromHex("#636363")), Icon = "eye" })
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

ESP.AddFolder("HiderESPFolder")
ESP.AddFolder("HunterESPFolder")
ESP.AddFolder("GlassESPFolder")

Tabs.ESPTab:Section({Title = "透视设置"})
Tabs.ESPTab:Toggle({
    Title = "透视躲藏者",
    Image = "bird",
    Value = false,
    Callback = function(state)
        if state then
            for _,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v:GetAttribute("IsHider") then
                    ESP.AddESP("HiderESPFolder", "躲藏者" .. v.Name, v.Character, Color3.new(0,0,1))
                end
            end
        else
            ESP.Clear("HiderESPFolder")
        end
    end
})

Tabs.ESPTab:Toggle({
    Title = "透视搜查者",
    Image = "bird",
    Value = false,
    Callback = function(state)
        if state then
            for _,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v:GetAttribute("IsHunter") then
                    ESP.AddESP("HunterESPFolder", "搜查者" .. v.Name, v.Character, Color3.new(1,0,0))
                end
            end
        else
            ESP.Clear("HunterESPFolder")
        end
    end
})

Tabs.ESPTab:Toggle({
    Title = "透视假玻璃板",
    Image = "bird",
    Value = false,
    Callback = function(state)
        if state then
            for _, v in next, workspace.GlassBridge.GlassHolder:GetChildren() do
                if v.Name:find("ClonedPanel") then
                    for _, panelChild in next, v:GetChildren() do
                        for _, glassPart in next, panelChild:GetChildren() do
                            if glassPart.Name == "glasspart" and glassPart:FindFirstChild("TouchInterest") then
                                ESP.AddESP("GlassESPFolder", "假玻璃", glassPart, Color3.new(0, 1, 0))
                            end
                        end
                    end
                end
            end
        else
            ESP.Clear("GlassESPFolder")
        end
    end
})

local a = {
    list = {},
    selectname = "",
    autoPush = false
}

for _, v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer then
        table.insert(a.list, v.Name)
    end
end

Tabs.CombatTab:Section({Title = "自动推人"})
Tabs.CombatTab:Dropdown({
    Title = "选择玩家",
    Values = a.list,
    Value = "",
    Callback = function(option)
        a.selectname = option
    end
})

Tabs.CombatTab:Toggle({
    Title = "自动推人",
    Default = false,
    Image = "check",
    Callback = function(state)
        a.autoPush = state
        if state then
            spawn(function()
                while a.autoPush and wait() do
                    local targetPlayer = Players:FindFirstChild(a.selectname)
                    local localChar = LocalPlayer.Character
                    
                    if targetPlayer and targetPlayer.Character and localChar then
                        localChar:MoveTo(targetPlayer.Character:GetPivot().Position)
                        
                        local pushTool = LocalPlayer.Backpack:FindFirstChild("Push")
                        if pushTool then
                            local args = {
                                [1] = "UsingMoveCustom",
                                [2] = pushTool,
                                [4] = {
                                    ["AutoUse"] = true
                                }
                            }
                            ReplicatedStorage.Remotes.UsedTool:FireServer(unpack(args))
                        end
                    end
                end
            end)
        end
    end
})

Tabs.CombatTab:Toggle({
    Title = "自动砍人(捉迷藏)",
    Default = false,
    Image = "check",
    Callback = function(state)
        if state then
            spawn(function()
                while state and wait() do
                    local potentialTargets = {}
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer then
                            if player.Character and player.Character:FindFirstChild("Humanoid") then
                                if player.Character:GetAttribute("IsHunter") == true then
                                    table.insert(potentialTargets, player)
                                end
                            end
                        end
                    end
                    if #potentialTargets > 0 then
                        local targetPlayer = potentialTargets[math.random(1, #potentialTargets)]
                        local localChar = LocalPlayer.Character
                        local targetChar = targetPlayer.Character
                        
                        if localChar and targetChar then
                            localChar:MoveTo(targetChar:GetPivot().Position)
                            
                            local knifeTool = LocalPlayer.Backpack:FindFirstChild("Knife")
                            if knifeTool then
                                local args = {
                                    [1] = "UsingMoveCustom",
                                    [2] = knifeTool,
                                    [4] = {
                                        ["Clicked"] = true
                                    }
                                }
                                ReplicatedStorage.Remotes.UsedTool:FireServer(unpack(args))
                            end
                        end
                    end
                end
            end)
        end
    end
})

Tabs.MovementTab:Section({Title = "属性加成"})
Tabs.MovementTab:Slider({
    Title = "速度提升加成",
    Desc = "Speed Boost",
    Value = {
        Min = 1,
        Max = 500,
        Default = 16,
    },
    Callback = function(Value)
        LocalPlayer.Boosts["Faster Sprint"].Value = Value
    end
})

Tabs.MovementTab:Slider({
    Title = "胜利加成",
    Desc = "Won Boost",
    Value = {
        Min = 1,
        Max = 500,
        Default = 16,
    },
    Callback = function(Value)
        LocalPlayer.Boosts["Won Boost"].Value = Value
    end
})

Tabs.CombatTab:Slider({
    Title = "伤害加成",
    Desc = "Damage Boost",
    Value = {
        Min = 1,
        Max = 500,
        Default = 16,
    },
    Callback = function(Value)
        LocalPlayer.Boosts["Damage Boost"].Value = Value
    end
})

local polygon = {
    Vector2.new(-52, -515),
    Vector2.new(115, -515),
    Vector2.new(115, 84),
    Vector2.new(-216, 84)
}

local function isPointInPolygon(point, poly)
    local inside = false
    local j = #poly
    for i = 1, #poly do
        local xi, zi = poly[i].X, poly[i].Y
        local xj, zj = poly[j].X, poly[j].Y
        if ((zi > point.Y) ~= (zj > point.Y)) and
            (point.X < (xj - xi) * (point.Y - zi) / (zj - zi + 1e-9) + xi) then
            inside = not inside
        end
        j = i
    end
    return inside
end

local function tpTo(cf)
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = cf
    end
end

local function fireProximityPrompt(prompt)
    if fireproximityprompt then
        pcall(fireproximityprompt, prompt)
    elseif prompt and prompt:IsA("ProximityPrompt") then
        prompt:InputHoldBegin()
        task.wait(0.1)
        prompt:InputHoldEnd()
    end
end

Tabs.PlayerTab:Section({Title = "帮助玩家功能"})
Tabs.PlayerTab:Button({
    Title = "帮助玩家到终点，同时你自己也可以(木头人关)",
    Callback = function()
        local foundPlayer = false
        
        if tick() - lastUpdate < updateInterval then
            WindUI:Notify({
                Title = "帮助玩家",
                Content = "操作过于频繁，请稍后再试",
                Icon = "clock",
                Duration = 1,
            })
            return
        end
        lastUpdate = tick()
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local liveChar = workspace:FindFirstChild("Live") and workspace.Live:FindFirstChild(player.Name)
                local hrp = liveChar and liveChar:FindFirstChild("HumanoidRootPart")

                if hrp then
                    local posXZ = Vector2.new(hrp.Position.X, hrp.Position.Z)
                    if isPointInPolygon(posXZ, polygon) then
                        local prompt = hrp:FindFirstChild("CarryPrompt")

                        if prompt and prompt:IsA("ProximityPrompt") and prompt.Enabled then
                            WindUI:Notify({
                                Title = "帮助玩家",
                                Content = "正在帮助: " .. player.Name,
                                Icon = "user-check",
                                Duration = 1,
                            })
                            
                            pcall(function()
                                tpTo(hrp.CFrame + Vector3.new(0, 2, 0))
                                task.wait(0.4)
                                fireProximityPrompt(prompt)
                                task.wait(0.7)
                                tpTo(CFrame.new(-46, 1024, 110))
                            end)
                            
                            WindUI:Notify({
                                Title = "帮助完成",
                                Content = "已完成帮助: " .. player.Name,
                                Icon = "check-circle",
                                Duration = 1,
                            })
                            foundPlayer = true
                            break
                        end
                    end
                end
            end
        end
        
        if not foundPlayer then
            WindUI:Notify({
                Title = "帮助玩家",
                Content = "没有可帮助的玩家",
                Icon = "user-x",
                Duration = 1,
            })
        end
    end
})

local playerSpeed = 28
local isInfiniteJumpEnabled = false
local isNoclipEnabled = false
local noclipParts = {}
local lastWalkSpeedUpdate = 0

Tabs.MovementTab:Section({Title = "移动设置"})
Tabs.MovementTab:Slider({
    Title = "移动速度",
    Desc = "记得每次调",
    Value = {Min = 16, Max = 100, Default = 28},
    Callback = function(value)
        playerSpeed = value

        if tick() - lastWalkSpeedUpdate > 0.5 then
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = playerSpeed
                end
            end
            lastWalkSpeedUpdate = tick()
        end
    end
})

Tabs.MovementTab:Toggle({
    Title = "无限跳跃",
    Callback = function(state)
        isInfiniteJumpEnabled = state
    end
})

Tabs.MovementTab:Toggle({
    Title = "穿墙模式",
    Callback = function(state)
        isNoclipEnabled = state
        if not state then
            for part, _ in pairs(noclipParts) do
                if part and part.Parent then
                    part.CanCollide = true
                end
            end
            noclipParts = {}
        end
    end
})

local lastJumpTime = 0
UserInputService.JumpRequest:Connect(function()
    if isInfiniteJumpEnabled and tick() - lastJumpTime > 0.1 then
        lastJumpTime = tick()
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

local lastNoclipCheck = 0
RunService.Stepped:Connect(function()
    if isNoclipEnabled and LocalPlayer.Character then
        if tick() - lastNoclipCheck > 0.1 then
            lastNoclipCheck = tick()
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    if part.CanCollide then
                        noclipParts[part] = true
                        part.CanCollide = false
                    end
                end
            end
        end
    end
end)

local isAimbotEnabled = false
local isEspEnabled = false
local aimbotLerpFactor = 0.1
local espCache = {}
local lastEspUpdate = 0

Tabs.CombatTab:Section({Title = "战斗设置"})
Tabs.CombatTab:Toggle({
    Title = "自瞄 (Rebel)",
    Callback = function(state)
        isAimbotEnabled = state
    end
})

Tabs.CombatTab:Toggle({
    Title = "ESP透视 (Rebel)",
    Callback = function(state)
        isEspEnabled = state
        if not isEspEnabled then
            for _, esp in pairs(espCache) do
                if esp and esp.Parent then
                    esp:Destroy()
                end
            end
            espCache = {}
        end
    end
})

local lastCombatUpdate = 0
RunService.RenderStepped:Connect(function()
    local now = tick()
    if now - lastCombatUpdate < updateInterval then return end
    lastCombatUpdate = now
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local rootPart = character.HumanoidRootPart
    local nearestTarget = nil
    local nearestDistance = math.huge

    if now - lastEspUpdate > 0.5 then
        lastEspUpdate = now
        if isEspEnabled then
            for _, model in ipairs(workspace:GetDescendants()) do
                if model:IsA("Model") and not model:IsDescendantOf(Players) and not model:IsDescendantOf(character) then
                    local modelName = model.Name:lower()
                    if modelName:find("guard") or modelName:find("guy") or modelName:find("squid") then
                        local part = model:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local distance = (part.Position - rootPart.Position).Magnitude
                            if distance < nearestDistance then
                                nearestTarget = model
                                nearestDistance = distance
                            end
                            
                            if not espCache[part] then
                                local espBox = Instance.new("BoxHandleAdornment")
                                espBox.Name = "ESP"
                                espBox.Adornee = part
                                espBox.Size = part.Size
                                espBox.Color3 = Color3.fromRGB(255, 0, 0)
                                espBox.AlwaysOnTop = true
                                espBox.ZIndex = 10
                                espBox.Transparency = 0.25
                                espBox.AdornCullingMode = Enum.AdornCullingMode.Never
                                espBox.Parent = part
                                espCache[part] = espBox
                            end
                        end
                    end
                end
            end
        end
    end

    if isAimbotEnabled and nearestTarget then
        local targetPart = nearestTarget:FindFirstChild("Head") or nearestTarget:FindFirstChild("Torso")
        if targetPart then
            local cameraPos = workspace.CurrentCamera.CFrame.Position
            local targetDir = (targetPart.Position - cameraPos).Unit
            local currentCFrame = workspace.CurrentCamera.CFrame
            local newCFrame = currentCFrame:Lerp(CFrame.new(cameraPos, targetPart.Position), aimbotLerpFactor)
            workspace.CurrentCamera.CFrame = newCFrame
        end
    end
end)

local isRedLightGodMode = false
local lastRootPartCFrame = nil
local isGreenLight = false

Tabs.GameTab:Section({Title = "红绿灯模式"})
Tabs.GameTab:Toggle({
    Title = "红绿灯无敌模式",
    Callback = function(state)
        isRedLightGodMode = state
    end
})

Tabs.GameTab:Section({Title = "糖饼挑战"})
Tabs.GameTab:Toggle({
    Title = "自动完成糖饼",
    Callback = function(state)
        if state then
            pcall(function()
                local DalgonaClientModule = game.ReplicatedStorage.Modules.Games.DalgonaClient
                for _, Value in ipairs(getreg()) do
                    if typeof(Value) == "function" and islclosure(Value) then
                        if getfenv(Value).script == DalgonaClientModule then
                            if getinfo(Value).nups == 73 then
                                setupvalue(Value, 31, 9e9)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
})

Tabs.GameTab:Section({Title = "拔河游戏"})
Tabs.GameTab:Toggle({
    Title = "自动拔河",
    Callback = function(state)
        if state then
            pcall(function()
                local TemporaryReachedBindableRemote = ReplicatedStorage.Remotes.TemporaryReachedBindable
                local VALID_PULL_DATA = {["PerfectQTE"] = true}
                while task.wait(0.025) and state do
                    TemporaryReachedBindableRemote:FireServer(VALID_PULL_DATA)
                end
            end)
        end
    end
})

Tabs.GameTab:Section({Title = "玻璃桥"})
Tabs.GameTab:Toggle({
    Title = "玻璃桥ESP",
    Callback = function(state)
        pcall(function()
            local GlassHolder = workspace.GlassBridge.GlassHolder
            for _, PanelPair in ipairs(GlassHolder:GetChildren()) do
                for _, Panel in ipairs(PanelPair:GetChildren()) do
                    local GlassPart = Panel:FindFirstChild("glasspart")
                    if GlassPart then
                        if state then
                            local Color = GlassPart:GetAttribute("exploitingisevil") and Color3.fromRGB(248, 87, 87) or Color3.fromRGB(28, 235, 87)
                            GlassPart.Color = Color
                            GlassPart.Transparency = 0
                            GlassPart.Material = Enum.Material.Neon
                        else
                            GlassPart.Color = Color3.fromRGB(106, 106, 106)
                            GlassPart.Transparency = 0.45
                            GlassPart.Material = Enum.Material.SmoothPlastic
                        end
                    end
                end
            end
        end)
    end
})

Tabs.GameTab:Section({Title = "社交游戏"})
Tabs.GameTab:Toggle({
    Title = "自动完成社交游戏",
    Callback = function(state)
        if state then
            pcall(function()
                local function OnCharacterAdded(Character)
                    local function OnChildAdded(Object)
                        if Object.ClassName == "RemoteEvent" and Object.Name == "RemoteForQTE" then
                            while task.wait(0.5) and state do
                                if not Object or not Object.Parent then break end
                                pcall(function() Object:FireServer() end)
                            end
                        end
                    end
                    
                    Character.ChildAdded:Connect(OnChildAdded)
                    for _, Object in ipairs(Character:GetChildren()) do
                        task.spawn(OnChildAdded, Object)
                    end
                end
                
                LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)
                if LocalPlayer.Character then
                    task.spawn(OnCharacterAdded, LocalPlayer.Character)
                end
            end)
        end
    end
})

local originalNamecall
if getrawmetatable then
    originalNamecall = hookfunction(getrawmetatable(game).__namecall, newcclosure(function(Instance, ...)
        local Args = {...}

        if getnamecallmethod() == "FireServer" and Instance.ClassName == "RemoteEvent" and Instance.Name == "rootCFrame" then
            if isRedLightGodMode and not isGreenLight and lastRootPartCFrame then
                Args[1] = lastRootPartCFrame
                return originalNamecall(Instance, unpack(Args))
            end
        end

        return originalNamecall(Instance, ...)
    end))
end

pcall(function()
    local TrafficLightImage = LocalPlayer.PlayerGui:WaitForChild("ImpactFrames"):WaitForChild("TrafficLightEmpty")
    isGreenLight = TrafficLightImage.Image == ReplicatedStorage.Effects.Images.TrafficLights.GreenLight.Image

    local RootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    lastRootPartCFrame = RootPart and RootPart.CFrame

    ReplicatedStorage.Remotes.Effects.OnClientEvent:Connect(function(EffectsData)
        if EffectsData.EffectName == "TrafficLight" then
            isGreenLight = EffectsData.GreenLight == true
            local RootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            lastRootPartCFrame = RootPart and RootPart.CFrame
        end
    end)
end)

local function cleanup()
    if originalNamecall and hookfunction then
        pcall(function()
            hookfunction(getrawmetatable(game).__namecall, originalNamecall)
        end)
    end
    
    for part, _ in pairs(noclipParts) do
        if part and part.Parent then
            part.CanCollide = true
        end
    end
    
    for _, esp in pairs(espCache) do
        if esp and esp.Parent then
            esp:Destroy()
        end
    end
    
    ESP.Clear("HiderESPFolder")
    ESP.Clear("HunterESPFolder")
    ESP.Clear("GlassESPFolder")
    
    pcall(function()
        local GlassHolder = workspace.GlassBridge.GlassHolder
        for _, PanelPair in ipairs(GlassHolder:GetChildren()) do
            for _, Panel in ipairs(PanelPair:GetChildren()) do
                local GlassPart = Panel:FindFirstChild("glasspart")
                if GlassPart then
                    GlassPart.Color = Color3.fromRGB(106, 106, 106)
                    GlassPart.Transparency = 0.45
                    GlassPart.Material = Enum.Material.SmoothPlastic
                end
            end
        end
    end)
end

if game.BindToClose then
    pcall(function()
        game:BindToClose(cleanup)
    end)
end
