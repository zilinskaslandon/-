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
    Title = "指令脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
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

MainTab:AddButton({
    Title = "爬墙",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end
})

MainTab:AddButton({
    Title = "甩飞",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/L9QBifcX"))()
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

local MainTab = Window:MakeTab({"伐木大亨二", "cool"})

MainTab:AddButton({
    Title = "北极星伐木脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/refs/heads/main/%E4%BC%90%E6%9C%A8%E8%84%9A%E6%9C%AC.Lua"))()
    end
})

local MainTab = Window:MakeTab({"俄亥俄州", "cool"})

MainTab:AddButton({
    Title = "俄亥俄州/北极星",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/refs/heads/main/%E4%BF%84%E4%BA%A5%E4%BF%84%E5%B7%9E.lua"))()
    end
})

local MainTab = Window:MakeTab({"doors", "cool"})

MainTab:AddButton({
    Title = "doors脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/refs/heads/main/%F0%9F%87%A9%F0%9F%87%AAdoors%E8%84%9A%E6%9C%AC%F0%9F%87%A9%F0%9F%87%AA.Lua"))()
    end
})


