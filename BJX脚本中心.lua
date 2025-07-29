local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
Library.DefaultColor = Color3.fromRGB(255,0,0)
      local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1237557124" 
     sound.Parent = game.Workspace 
     sound:Play()
  
Library:Notification({
	Text = "作者：北极星",
	Duration = 6
})

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/QQ-9-2-8-9-50173/refs/heads/main/Ul%E6%BA%90%E7%A0%81.lua"))()

local Window = redzlib:MakeWindow({
  Title = "北极星脚本中心",
  SubTitle = "BJX",
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
    Title = "飞行",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/refs/heads/main/%E5%8C%97%E6%9E%81%E6%98%9F%E9%A3%9E%E8%A1%8C.Lua"))()
    end
})

MainTab:AddButton({
    Title = "通用ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))()
    end
})

MainTab:AddButton({
    Title = "阿尔宙斯飞行",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/5zJu3hfN"))()
    end
})

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
    Title = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
    end
})

MainTab:AddButton({
    Title = "最强透视",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY"))()
    end
})

MainTab:AddButton({
    Title = "玩家加入提示",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
    end
})

MainTab:AddButton({
    Title = "死亡笔记",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
    end
})

MainTab:AddButton({
    Title = "电脑键盘",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
    end
})

MainTab:AddButton({
    Title = "反挂机V1",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
    end
})

MainTab:AddToggle({
    Title = "夜视模式",  -- 添加一个标题
    Callback = function(state)
        if state then
            game.Lighting.Ambient = Color3.new(1, 1, 1)  -- 开启夜视，设置环境光为白色
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)   -- 关闭夜视，恢复为黑色
        end
    end
})

MainTab:AddToggle({
    Title = '人物穿墙',
    Default = false,
    Callback = function(Value)
        if Value then
            -- 开启逻辑
            Noclip = true
            Stepped = game:GetService('RunService').Stepped:Connect(function()
                if Noclip and game.Players.LocalPlayer.Character then
                    for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            -- 关闭逻辑（三重保障）
            Noclip = false
            if game.Players.LocalPlayer.Character then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            if Stepped then
                Stepped:Disconnect()
                Stepped = nil
            end
        end
    end
})

local MainTab = Window:MakeTab({"汽车经销大亨", "cool"})


MainTab:AddButton({
    Title = "刷星星",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/LIMITED!-Car-Dealership-Tycoon-Moon-Team-16181"))()
    end
})

MainTab:AddButton({
    Title = "1/脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/Car%20Dealership%20Tycoon.lua"))()
    end
})

MainTab:AddButton({
    Title = "2/脚本",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/5o594Q0i/raw"))()
    end
})

MainTab:AddButton({
    Title = "3/脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/03sAlt/BlueLockSeason2/main/README.md"))()
    end
})

local MainTab = Window:MakeTab({"忍者传奇", "cool"})

MainTab:AddButton({
    Title = "北极星忍者传奇",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/refs/heads/main/%F0%9F%87%A9%F0%9F%87%AA%E5%BF%8D%E8%80%85%E4%BC%A0%E5%A5%87%E8%84%9A%E6%9C%AC%F0%9F%87%A9%F0%9F%87%AA.Lua"))()
    end
})

Tab:AddToggle({
    Title = '自动挥舞',
    Callbock = function(state)
        if state then
            autoswing = true
            swinging()
        else
            autoswing = false
        end
    end
})

Tab:AddToggle({
    Title = '自动售卖',
    Callbock = function(state)
        if state then
            autosell = true
            selling()
        else
            autosell = false
        end
    end
})

Tab:AddToggle({
    Title = '存满了自动售卖',
    Callbock = function(state)
        if state then
            autosellmax = true
            maxsell()
        else
            autosellmax = false
        end
    end
})

MainTab:AddButton({
    Title = '出生',  -- 使用 Title 作为显示名称
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665, 2.423, 29.920)
    end
})

MainTab:AddButton({
    Title = '魔法',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.172, 766.181, -138.449)
    end
})

MainTab:AddButton({
    Title = '置岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.299, 2013.880, 237.367)
    end
})

MainTab:AddButton({
    Title = '密岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.972, 4091.381, 42.070)
    end
})

MainTab:AddButton({
    Title = '天空岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.838, 5657.185, 73.591)
    end
})

MainTab:AddButton({
    Title = '冷岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.283, 9285.184, 71.364)
    end
})

MainTab:AddButton({
    Title = '无限岛',  
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.348, 13680.031, 73.386)
    end
})

MainTab:AddButton({
    Title = '沙岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.372, 17686.328, 72.004)
    end
})

MainTab:AddButton({
    Title = '雷岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.193, 24970.021, 78.059)
    end
})

MainTab:AddButton({
    Title = '达古塔教岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.272, 28256.295, 69.379)
    end
})

MainTab:AddButton({
    Title = '暗影岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.743, 33206.989, 57.496)
    end
})

MainTab:AddButton({
    Title = '灵魂岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.761, 29917.571, 61.066)
    end
})

MainTab:AddButton({
    Title = '黄金岛', 
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.322, 52607.766, 56.694)
    end
})

MainTab:AddButton({
    Title = '传奇岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.352, 59594.680, 71.532)
    end
})

MainTab:AddButton({
    Title = '科技传奇岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.232, 66669.164, 72.217)
    end
})

MainTab:AddButton({
    Title = '超能岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.987, 70211.156, 57.023)
    end
})

MainTab:AddButton({
    Title = '混沌传奇岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.584, 74492.852, 69.317)
    end
})

MainTab:AddButton({
    Title = '黑暗岛',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.970, 79746.984, 58.541)
    end
})

MainTab:AddButton({
    Title = "黑暗元素岛",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697, 83198.984, 72.731)
    end
})

MainTab:AddButton({
    Title = "和平岛",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.316, 87051.063, 66.784)
    end
})

MainTab:AddButton({
    Title = "旋涡岛",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.082, 91246.070, 69.567)
    end
})

local MainTab = Window:MakeTab({"最坚强战场", "cool"})

MainTab:AddButton({
    Title = "SkibidCen",
    Callbock = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/MainMenu/main/Code"))()
    end
})

MainTab:AddButton({
    Title = "Loader",
    Callbock = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VortexScripts/Project-Vortex-V9/main/Loader"))()
    end
})

MainTab:AddButton({
    Title = "TSBANIMS",
    Callbock = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/Mautiku/TSB-anim/main/TSBANIMS'), true))()
    end
})

MainTab:AddButton({
    Title = "Battlegrounuds77",
    Callbock = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Strongest/main/Battlegrounds77"))()
    end
})

MainTab:AddButton({
    Title = "复制卡密上面卡密",
    Callbock = function()
        setclipboard("BestTheStrongest5412Roblox")
    end
})

local MainTab = Window:MakeTab({"伐木大亨", "cool"})

MainTab:AddButton({
    Title = "北极星/伐木",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/refs/heads/main/%E4%BC%90%E6%9C%A8%E8%84%9A%E6%9C%AC.Lua"))()
    end
})