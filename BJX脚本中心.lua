local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/QQ-9-2-8-9-50173/refs/heads/main/Ul%E6%BA%90%E7%A0%81.lua"))()

local Window = redzlib:MakeWindow({
  Title = "北极星脚本中心",
  SubTitle = "监狱人生",
  SaveFolder = "Redz Config"
})

print("反挂机已开启")
Start = tick()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)

Window:AddMinimizeButton({
  Button = { Image = "rbxassetid://98541457845136", BackgroundTransparency = 0, Size = UDim2.fromOffset(60, 60), },
  Corner = { CornerRadius = UDim.new(0, 10) }
})

local MainTab = Window:MakeTab({"主功能", "cool"})

MainTab:AddButton({
    Title = "拿车",
    Callback = function()
        pcall(function()
            local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
            game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-910, 95, 2157))
            wait()
            local car = nil
            task.spawn(function()
                car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
            end)
            repeat wait(.1)
                local ohInstance1 = game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[8]["Car Spawner"]
                workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
            until car
            repeat task.wait() until car:FindFirstChild("RWD") and car:FindFirstChild("Body") and car:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
            car.PrimaryPart = car.RWD
            game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(OldPos)
            wait(1)
            local Done = false
            car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
            repeat 
                game:GetService("RunService").RenderStepped:Wait()
                car:SetPrimaryPartCFrame(OldPos)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(car.Body.VehicleSeat.Position)
                car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
                    Done = true
                end
            until Done
        end)
    end
})

MainTab:AddButton({
    Title = "获得所有枪",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(822, 101, 2251, 1, -0, 0, 0, 1, 0, -0, -0, 1)
        wait(1.1)
        local args = {
            [1] = workspace:WaitForChild("Prison_ITEMS"):WaitForChild("giver"):WaitForChild("M9"):WaitForChild("ITEMPICKUP")
        }
        workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(unpack(args))
        wait(1.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(824.801025, 104.330627, 2250.36157, 0.173624337, 0.984811902, 0, -0.984811902, 0.173624337, -0, -0, 0, 1)
        wait(1.1)
        local args = {
            [1] = workspace:WaitForChild("Prison_ITEMS"):WaitForChild("giver"):WaitForChild("Remington 870"):WaitForChild("ITEMPICKUP")
        }
        workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(unpack(args))
        wait(1.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-936.710632, 93.5627747, 2054.66602, 0, -1, 0, 1, 0, -0, 0, 0, 1)
        wait(1.1)
        local args = {
            [1] = workspace:WaitForChild("Prison_ITEMS"):WaitForChild("giver"):WaitForChild("AK-47"):WaitForChild("ITEMPICKUP")
        }
        workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(unpack(args))
    end
})


MainTab:AddButton({
    Title = "逮捕所有罪犯",
    Callback = function()
        wait(0.1)
        Player = game.Players.LocalPlayer
        Pcf = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
            if v.Name ~= Player.Name then
                local i = 10
                repeat
                    wait()
                    i = i-1
                    game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
                    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                until i == 0
            end
        end
    end
})

-- Kill Aura Toggle
MainTab:AddToggle({
    Title = "开启杀戮气场",
    Default = false,
    Callback = function(State)
        States.KillAura = State
        if State then
            notifications:notify({
                Title = "神青脚本",
                Description = "开启杀戮气场",
                Icon = 6031302918,
                Accept = {
                    Text = "好的",
                    Callback = function()
                        print("云");print("山");print("清风");print("忍")
                    end
                },
                Length = 10
            })
            CreateKillPart()
        else
            notifications:notify({
                Title = "神青脚本",
                Description = "关闭杀戮气场",
                Icon = 6031302918,
                Accept = {
                    Text = "好的",
                    Callback = function()
                        print("云");print("山");print("清风");print("忍")
                    end
                },
                Length = 10
            })
            if Parts[1] and Parts[1].Name == "KillAura" then
                Parts[1]:Destroy()
                Parts[1] = nil
            end
        end
    end
})

function CreateKillPart()
    if Parts[1] then
        pcall(function()
            Parts[1]:Destroy()
        end)
        Parts[1] = nil
    end
    local Part = Instance.new("Part", plr.Character)
    local hilight = Instance.new("Highlight", Part)
    hilight.FillTransparency = 1

    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.Material = Enum.Material.SmoothPlastic
    Part.Transparency = .98
    Part.Material = Enum.Material.SmoothPlastic
    Part.BrickColor = BrickColor.White()
    Part.Size = Vector3.new(20,2,20)
    Part.Name = "KillAura"
    Parts[1] = Part
end

task.spawn(function()
    repeat task.wait() until plr.Character and char and char:FindFirstChildOfClass("Humanoid")
    if States.KillAura then
        CreateKillPart()
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if States.KillAura then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude < 14 and v.Character.Humanoid.Health > 0 then
                    local args = {[1] = v}
                    for i = 1,2 do
                        task.spawn(function()
                            game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
                        end)
                    end
                end
            end
        end
    end
end)

-- Auto Kill Toggle
MainTab:AddToggle({
    Title = "自动杀所有人",
    Default = false,
    Callback = function(State)
        if State then
            isAutoKillRunning = true
            spawn(AutoKillLoop)
            spawn(AutoJump)
        else
            isAutoKillRunning = false
        end
    end
})

-- Door Toggle
MainTab:AddToggle({
    Title = "删除门🚪",
    Default = false,
    Callback = function(State)
        if State then
            for i,v in pairs(workspace.Doors:GetChildren()) do
                v.Parent = game:GetService("ReplicatedStorage").nikodoors
            end
        else
            for i,v in pairs(game:GetService("ReplicatedStorage").nikodoors:GetChildren()) do
                v.Parent = workspace.Doors
            end
        end
    end
})

-- Arrest Button
-- Team Buttons
MainTab:AddButton({
    Title = "变成警察",
    Callback = function()
        workspace.Remote.TeamEvent:FireServer("Bright blue")
    end
})

MainTab:AddButton({
    Title = "变成囚犯",
    Callback = function()
        workspace.Remote.TeamEvent:FireServer("Bright orange")
    end
})

-- Bullet Tracking (setup before button)
local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
        local Character = ClosestChar()
        if Character then
            return Character.Torso, Character.Torso.Position
        end
    end
    return __namecall(self, ...)
end)
setreadonly(MT, true)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- Other Buttons
MainTab:AddButton({
    Title = "无敌模式",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
    end
})

MainTab:AddButton({
    Title = "杀死所有人",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
    end
})

MainTab:AddButton({
    Title = "无敌神器（拿上范围秒杀）",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
    end
})

local MainTab = Window:MakeTab({"FE", "cool"})

MainTab:AddButton({
    Title = "变钢铁侠",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
    end
})

MainTab:AddButton({
    Title = "变死神",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/ewv9bbRp"))()
    end
})

MainTab:AddButton({
    Title = "变车模型",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
    end
})

local MainTab = Window:MakeTab({"传送功能", "cool"})

MainTab:AddDropdown({
    Title = "传送位置列表",
    Options = {"警卫室","监狱室内","犯罪点","院子"},
    Default = "",
    Callback = function(Value)
        if Value == "警卫室" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
        elseif Value == "监狱室内" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
        elseif Value == "犯罪点" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
        elseif Value == "院子" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
        end
    end
})

local MainTab = Window:MakeTab({"辅助", "cool"})
MainTab:AddToggle({
    Title = "速度 (开/关)",
    Default = false,
    Callback = function(v)
        if v == true then
            sudu = game:GetService("RunService").Heartbeat:Connect(function()
                if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and game:GetService("Players").LocalPlayer.Character.Humanoid.Parent then
                    if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                        game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 10)
                    end
                end
            end)
        elseif not v and sudu then
            sudu:Disconnect()
            sudu = nil
        end
    end
})

MainTab:AddSlider({
    Title = "速度设置",
    Description = "拉条",
    Default = 1,
    Min = 1,
    Max = 1000,
    Callback = function(v)
        Speed = v
    end
})

MainTab:AddButton({
    Title = "无限跳跃",
    Callback = function()
        game:GetService("UserInputService").JumpRequest:connect(function()
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")		
        end)
    end
})

MainTab:AddButton({
    Title = "神青飞行",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/shenqin/refs/heads/main/%E7%A5%9E%E9%9D%92%E9%A3%9E%E8%A1%8C.lua"))()
    end
})