local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "北极星脚本",
    Text = "北极星脚本，新人",
    Duration = 5, 
})
wait(2)
print("Anti Afk On")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "反挂机已自动开启",
    Text = "被踢出服务器的概率已降低",
    Duration = 5,
})
wait(2)
local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "启动成功",
    Text = "您好"..game.Players.LocalPlayer.Name.."，欢迎使用脚本",
    Duration = 5,
})

local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北极时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "北极星脚本",
    Text = "加载成功，欢迎！！！",
    Duration = 5, 
})
local OrionLib =  loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoLingUwU/Bei_-_-Ji_-_-Xing_-_-Xiao_-_-Ling_-_-/main/RGB-code-1.Lua"))()
local Window = OrionLib:MakeWindow({IntroText = "北极星中心",Name = "北极星中心", HidePremium = false, SaveConfig = true, ConfigFolder = ""})
local about = Window:MakeTab({
    Name = "必看公告",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")
about:AddParagraph("您当前服务器的ID"," "..game.GameId.."")
about:AddParagraph("脚本永久免费","")
about:AddParagraph("作者是新人，虽然是缝合但是以后会多多自制，请理解","")
about:AddParagraph("圈钱人死全家","")
about:AddParagraph("师傅：小凌、空","")
about:AddParagraph("群号:985228498","")
about:AddParagraph("更新内容:暂无","")


local Tab = Window:MakeTab({
    Name = "玩家",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "欢迎欢迎"
})

Tab:AddSlider({
	Name = "速度",
	Min = 16,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(255,0,0),
	Increment = 1,
	ValueName = "数值",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

Tab:AddTextbox({
	Name = "移动速度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)		    		    

		end

	end	
})

Tab:AddButton ({
  Name = "北极星飞行",
  Callback = function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/main/%E5%8C%97%E6%9E%81%E6%98%9F%E9%A3%9E%E8%A1%8C.Lua"))()
   end
})

Tab:AddButton ({
	Name = "阿尔宙斯飞行",
	Callback = function ()
	 loadstring(game:HttpGet("https://pastebin.com/raw/5zJu3hfN"))()
	end
})

Tab:AddButton({	
    Name = "透视加自瞄",	
    Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/main/%E9%80%8F%E8%A7%86%E5%8A%A0%E8%87%AA%E7%9E%84%EF%BC%88%E9%80%9A%E7%94%A8%EF%BC%89.txt"))()
   end
})

Tab:AddButton({	
    Name = "通用透视",	
    Callback = function()	
loadstring(game:GetObjects("rbxassetid://10092697033")[1].Source)()
   end
})

Tab:AddButton({
	Name = "修改攻击体积(hitbox)",
	Callback = function()
		_G.HeadSize = 25
		_G.Disabled = true
 
		game:GetService('RunService').RenderStepped:connect(function()
			if _G.Disabled then
				for i,v in next, game:GetService('Players'):GetPlayers() do
					if v.Name ~= game:GetService('Players').LocalPlayer.Name then
						pcall(function()
							v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
							v.Character.HumanoidRootPart.Transparency = 0.7
							v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
							v.Character.HumanoidRootPart.Material = "Neon"
							v.Character.HumanoidRootPart.CanCollide = false
						end)
					end
				end
			end
		end)
	end,
})



Tab:AddButton({
	Name = "音乐",
	Callback = function()		
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/beta/main/music.lua"))()
    end
})

Tab:AddButton({
	Name = "变玩家（R6）",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
  	end    
})

Tab:AddButton({
  Name = "加速回血",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))()
  end
})

Tab:AddButton({
	Name = "轰炸（封号风险）",
	Callback = function()		
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/%E8%BD%B0%E7%82%B8.lua"))()
    end
})

Tab:AddButton({
  Name = "娱乐蓝屏(还需要手动开启)(大退关闭)",
  Callback = function()
    local gui = Instance.new('ScreenGui', game:service'CoreGui')local button = Instance.new('TextButton', gui)button.Size = UDim2.new(0, 200, 0, 100)button.Position = UDim2.new(.5, 0, .5, 0)button.Text = '点击蓝屏'button.MouseButton1Click:Connect(loadstring(game:HttpGet'https://github.com/RunDTM/roblox-bluescreen/raw/main/bsod.lua'))
  end
})

Tab:AddButton({
	Name = "爬墙",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end
})
Tab:AddButton({
	Name = "光影V4",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end
})

Tab:AddButton({
	Name = "变成蛇",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/tWBTcE4R/raw'),true))()
	end
})

Tab:AddButton({
	Name = "让别让别人控制自己",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/a7RTi4un/raw'),true))()
	end
})

Tab:AddButton({
	Name = "北极星『传送功能』",
	Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10.342241287231445, 10.268034934997559, -285.943115234375)
	end
})

Tab:AddButton({
	Name = "全(英文😭)",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/kEq7bdf9"))()
  end
})

Tab:AddButton({
	Name = "地岩",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\98\97\109\120\98\98\97\109\120\98\98\97\109\120\47\99\111\100\101\115\112\97\99\101\115\45\98\108\97\110\107\47\109\97\105\110\47\37\69\55\37\57\57\37\66\68\34\41\41\40\41")()
	end
})

Tab:AddButton({
	Name = "dx旧版本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/test-lol/main/YO.lua"))()
end
})

Tab:AddButton({
	Name = "脚本中心",
	Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
end
})

Tab:AddButton({
	Name = "无敌",
	Callback = function()
local lp = game:GetService "Players".LocalPlayer
if lp.Character:FindFirstChild "Head" then
    local char = lp.Character
    char.Archivable = true
    local new = char:Clone()
    new.Parent = workspace
    lp.Character = new
    wait(2)
    local oldhum = char:FindFirstChildWhichIsA "Humanoid"
    local newhum = oldhum:Clone()
    newhum.Parent = char
    newhum.RequiresNeck = false
    oldhum.Parent = nil
    wait(2)
    lp.Character = char
    new:Destroy()
    wait(1)
    newhum:GetPropertyChangedSignal("Health"):Connect(
        function()
            if newhum.Health <= 0 then
                oldhum.Parent = lp.Character
                wait(1)
                oldhum:Destroy()
            end
        end)
    workspace.CurrentCamera.CameraSubject = char
    if char:FindFirstChild "Animate" then
        char.Animate.Disabled = true
        wait(.1)
        char.Animate.Disabled = false
    end
    lp.Character:FindFirstChild "Head":Destroy()
end
end
})

Tab:AddButton({
	Name = "甩飞别人",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
  	end    
})

Tab:AddButton({
	Name = "防止掉线（反挂机）",
	Callback = function()
	print("Anti Afk On")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
  	end
})

Tab:AddButton({
	Name = "自瞄",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()
  	end    
})

Tab:AddButton({
	Name = "吸取全部玩家",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/hQSBGsw2'))()
  	end    
})

Tab:AddButton({
	Name = "人物无敌",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
	end    
})

Tab:AddButton({
	Name = "隐身(E)",
	Callback = function()
	 loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
  	end    
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Tab:AddButton({
	Name = "飞车(E)(别人看到)",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))()
  	end    
})

Tab:AddTextbox({
	Name = "跳跃高度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end	 
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddToggle({
	Name = "穿墙2",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

Tab:AddButton({
	Name = "鼠标（手机非常不建议用）",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()
	end
})

Tab:AddButton({
	Name = "跟踪玩家",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
  	end
})

Tab:AddButton({
	Name = "变大变小",
	Callback = function()	
	loadstring(game:HttpGet("http://pan.rlyun.asia/api/v3/file/get/18187/%E5%8F%98%E5%A4%A7%E5%8F%98%E5%B0%8F?sign=nR9TjQacuB58vmwKApyTIaWJykPqbr3KNPusu_MqNbg%3D%3A0"))()
	end
})

Tab:AddButton({
	Name = "伪名说话",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()
	end 
})

Tab:AddButton({
	Name = "踏空行走",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
	end
})

Tab:AddButton({
	Name = "透视",
	Callback = function()
loadstring(game:GetObjects("rbxassetid://10092697033")[1].Source)()
	end 
})

Tab:AddButton({
	Name = "转起来",
	Callback = function()
      	loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
  	end
})

Tab:AddButton({
	Name = "隐身(E)",
	Callback = function()
	 loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
  	end    
})

Tab:AddButton({
    Name="立即死亡",
    Callback=function()
        game.Players.LocalPlayer.Character.Humanoid.Health=0
    end
})

Tab:AddButton({
	Name = "黑客脚本",
	Callback = function()
loadstring(game: HttpGet("https://raw.githubusercontent.com/BirthScripts/Scripts/main/c00l.lua"))()
    end
})

Tab:AddButton({
	Name = "管理员",
	Callback = function()
loadstring(game: HttpGet(('https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua'),true))()
    end
})

Tab:AddButton({
    Name="回满血后分服务器可能不可以能用",
    Callback=function()
        game.Players.LocalPlayer.Character.Humanoid.Health=10000
    end
})

Tab:AddButton({
	Name = "键盘",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

Tab:AddButton({
    Name="玩家动作",
    Callback=function()
        getgenv().she="作者北极星免费请勿倒卖"
loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
    end
})

local Tab = Window:MakeTab({
    Name = "doors",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "自动完成",
	Callback = function()
	loadstring(game:HttpGet('https://reddyhub.xyz/loader.html'))()
end
})

Tab:AddButton({
	Name = "微山白脚本",
	Callback = function()
	--白脚本0.0.5(微山工作室)[已修复]loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\75\113\117\97\68\70\53\120\34\41\41\40\41\10")()
	end
})

Tab:AddButton({
	Name = "脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
	end
})

Tab:AddButton({
	Name = "超级脚本",
	Callback = function()
loadstring(game: HttpGet("https://raw.githubusercontent.com/Fazedrab/EntitySpawner/main/doors(orionlib).lua"))()
end
})

Tab:AddButton({
	Name = "修改",
	Callback = function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/Doors-Entity-Replicator/main/source.lua")()
	end
})

Tab:AddButton({
    Name="微山doors",
    Callback=function()
        --微山doors 2.3.2(愚人节快乐)
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\117\72\72\112\56\102\122\83"))()
    end
})

Tab:AddButton({
	Name = "DX",
	Callback = function()
	loadstring(game:HttpGet("https://github.com/DocYogurt/lolololololololololololololollolololololololololololololollolololololololololololololollolololololol/raw/main/lolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololollolololololololololololololol.lua"))()
	end
})

Tab:AddButton({
    Name="ms要白名单",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/zoophiliaphobic/POOPDOORS/main/script.lua'))()
    end
})

Tab:AddButton({
	Name = "不要白名单MSDOORS2.4.0",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/mstudio45/MSDOORS/7bd97c2d956a775d683c2d7973d79715b30998ea/MSDOORS/Moonsec.lua'))()
  	end
})

Tab:AddButton({
    Name="云doors",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/EntitySpawner/main/doors(orionlib).lua"))()
    end
})

Tab:AddButton({
	Name = "最强",
	Callback = function()
     loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
  	end    
})

Tab:AddButton({
    Name="白",
    Callback=function()
        _G["白脚本作者修狗"]="xdjhadgdsrfcyefjhsadcctyseyr6432478rudghfvszhxcaheey"loadstring(game:HttpGet(('https://raw.githubusercontent.com/wev666666/baijiaobengV2.0beta/main/%E7%99%BD%E8%84%9A%E6%9C%ACbeta'),true))()
    end
})

local Tab = Window:MakeTab({
    Name = "忍者传奇︎",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name="不知道什么名字",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/1"))()
    end
})

Tab:AddButton({
    Name="一样",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/5repo/main/script4.lua"))()
    end
})

local Tab = Window:MakeTab({
    Name = "速度传奇",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "极速传奇（o.o提供）",
	Callback = function()		loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\111\121\115\99\112\47\98\101\116\97\47\109\97\105\110\47\37\69\57\37\56\48\37\57\70\37\69\53\37\66\65\37\65\54\37\69\55\37\56\50\37\66\56\37\69\56\37\66\53\37\66\55\46\108\117\97'))()
	end
})

 Tab:AddButton({
	Name = "自动卡宠",
	Callback = function()
	wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,304,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="自动卡宠脚本"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,304,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,304,0,21)_b.Font=Enum.Font.Arial;_b.Text="作者莫羽"
_b.TextColor3=Color3.new(1,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377379,0)
ab.Size=UDim2.new(0,304,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="自动卡宠:已开启 "
ab.TextColor3=Color3.new(1,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="You went idle and ROBLOX tried to kick you but we reflected it!"wait(2)ab.Text="Script Re-Enabled"end)
  	end
})

Tab:AddButton({	
    Name = "极速传奇『整合』",	
    Callback = function()	
loadstring(Game:HttpGet("https://pastebin.com/raw/0A4J7V8M"))()
   end
})

local Tab = Window:MakeTab({
	Name = "鲨口求生2🦈",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddDropdown({
	Name = "免费船只",
	Default = "1",
	Options = {"DuckyBoatBeta", "DuckyBoat", "BlueCanopyMotorboat", "BlueWoodenMotorboat", "UnicornBoat", "Jetski", "RedMarlin", "Sloop", "TugBoat", "SmallDinghyMotorboat", "JetskiDonut", "Marlin", "TubeBoat", "FishingBoat", "VikingShip", "SmallWoodenSailboat", "RedCanopyMotorboat", "Catamaran", "CombatBoat", "TourBoat", "Duckmarine", "PartyBoat", "MilitarySubmarine",  "GingerbreadSteamBoat", "Sleigh2022", "Snowmobile", "CruiseShip"},
	Callback = function(Value)
local ohString1 = (Value)

game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(ohString1)
	end    
})

Tab:AddButton({
	Name = "自动杀鲨鱼🦈",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()
  	end    
})

Tab:AddButton({	
    Name = "鲨鱼求生——高级版",	
    Callback = function()	
loadstring(rawget(game:GetObjects("rbxassetid://3623753581"), 1).Source)("Pepsi Byte")loadstring(game:HttpGet("https://raw.githubusercontent.com/LOOF-sys/Roblox-Shit/main/SharkBite.lua",true))()
   end
})

local Tab = Window:MakeTab({
	Name = "bf脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "bf",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "FE脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "C00lgui",
	Callback = function()
     loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
  	end    
})

Tab:AddButton({
	Name = "1x1x1x1",
	Callback = function()
     loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()
  	end    
})

Tab:AddButton({
	Name = "动画中心",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
  	end    
})

local Tab = Window:MakeTab({
    Name = "力量传奇",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name="修改力量",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
    end
})

Tab:AddButton({
	Name = "力量传奇Muscle Legend",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/Roblox-Script/main/Muscle%20Legend"))()
  	end    
})


local Tab = Window:MakeTab({
    Name = "彩虹朋友",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name="彩虹朋友",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Sempiller/RainbowTool/main/Turkish.lua'))();
    end
})

Tab:AddButton({
	Name = "彩虹朋友2",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()
  	end    
})

local Tab = Window:MakeTab({
    Name = "大闹监狱（监狱人生）",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "Moon Hub",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/Gae7YC84"))();
  	end    
})

Tab:AddButton({
	Name = "新菜单",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/xRawnder/main/HubMoblie'))()
  	end    
})

Tab:AddButton({
	Name = "v1",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
  	end    
})

Tab:AddButton({	
    Name = "监狱人生『一』",	
    Callback = function()	
loadstring(game:HttpGet("https://pastebin.com/raw/LnAUPBXj",true))()
   end
})

Tab:AddButton({	
    Name = "监狱人生『二』",	
    Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
   end
})

Tab:AddButton({	
    Name = "监狱人生『三』",	
    Callback = function()	
loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/xRawnder/main/HubMoblie'))()
   end
})

local Tab = Window:MakeTab({
    Name = "自然灾害模拟器",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "自然灾害模拟器",
	Callback = function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/TurkOyuncu99/7c75386107937fa006304efd24543ad4/raw/8d759dfcd95d39949c692735cfdf62baec0bf835/cafwetweg", true))() 
end
})

Tab:AddButton({	
    Name = "自然灾害高级脚本",	
    Callback = function()	
loadstring(game:HttpGet('https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main'))()--Made By 1kWoof#0143
   end
})

Tab:AddButton({	
    Name = "自然灾害『油管』",	
    Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
   end
})

local Tab = Window:MakeTab({
    Name = "兵工厂",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "由鲨汉化组提供",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/p634jAYs"))()
  	end    
})

Tab:AddButton({
	Name = "兵工厂",
	Callback = function()
		loadstring(game:HttpGet('http://pan.rlyun.asia/api/v3/file/get/15369/%E4%B9%92%E5%B7%A5%E5%8E%82?sign=pDWgMBQ_m8pjcTS9-o8N1zvCmYmc6LsQVjeDaypp0bw%3D%3A0'))()
	end
})

local Tab = Window:MakeTab({
    Name = "代木大亨🌳",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "伐木大亨",
	Callback = function()
loadstring(game:HttpGet('https://getexploits.com/key-system/',true))('https://da.com/936657404291084298/1006220505583460352/Script.txt')
	end
})

Tab:AddButton({
	Name = "伐木大亨——最强",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
    end
})

Tab:AddButton({	
    Name = "伐木大亨——其他人的",	
    Callback = function()	
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/butter-hub/main/Butterhub.txt'))()
   end
})

Tab:AddButton({	
    Name = "汉化伐木",	
    Callback = function()	
loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/butter-hub/main/Butterhub.txt'))()
   end
})

Tab:AddButton({	
    Name = "白伐木脚本",	
    Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/ScriptsDache/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A822.lua", true))()
   end
})

local Tab = Window:MakeTab({
	Name = "一路向西",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "防摔",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040712770")[1].Source)()
	end
})
Tab:AddButton({
	Name = "防套",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040719318")[1].Source)()
	end
})
Tab:AddButton({
	Name = "范围",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040722920")[1].Source)()
	end
})
Tab:AddButton({
	Name = "无后座，无限，超级",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040701935")[1].Source)()
	end
})

local Tab = Window:MakeTab({
	Name = "蜂群模拟器",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "蜂",
	Callback = function()	
	loadstring(game:HttpGet("https://roblox.servegame.com/roblox_bss/chocmoc.lua"))()
		end
})

local Tab = Window:MakeTab({
	Name = "宠物X",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "云宠物",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/T34M-V0ID/cloud-hub/main/cloud"))()
	end
})

Tab:AddButton({	
    Name = "蜂群脚本二",	
    Callback = function()	
loadstring(game:GetObjects("rbxassetid://4384103988")[0X1].Source)("Pepsi Swarm")
   end
})

local Tab = Window:MakeTab({
    Name = "巴掌模拟器",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


Tab:AddButton({
	Name = "巴掌模拟器",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Unknownkellymc1/Unknownscripts/main/slap-battles')))()
end
})

local Tab = Window:MakeTab({
    Name = "各大脚本",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "小云V1.0.4)",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/XiaoYunbarkV1.0.4.lua"))()
end
})

Tab:AddButton({
	Name = "小云V1.0.6)真多",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/XiaoYun_currentedition_beta.lua"))()
end
})

Tab:AddButton({
	Name = "☁脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/Xiaos______________________________________________________________Yun__________________________________________________________________________betaV2.2------------------------------------------------------------------------------------jsja.lua"))()
  	end
})

Tab:AddButton({
    Name="XC",
    Callback=function()
        getgenv().XC="作者XC"
loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
    end
})

Tab:AddButton({
    Name="龙脚本",
    Callback=function()
        getgenv().long = "龙脚本，加载时间长请耐心"
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\108\121\121\97\105\110\105\47\108\111\110\47\109\97\105\110\47\108\105\115\119\109\34\41\41\40\41")()
    end
})

Tab:AddButton({
	Name = "复制usa卡密",
	Callback = function()
     setclipboard("USA AER")
  	end
})

Tab:AddButton({
  Name = "USA（卡密：USA AER）",
  Callback = function()
    getgenv().USA="作者莫羽免费请勿倒卖"loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/beta/main/USA.lua"))()
  end
})

Tab:AddButton({
	Name = "复制青脚本卡密",
	Callback = function()
     setclipboard("Green2023scriptkeyroblox")
  	end
})

Tab:AddButton({
  Name = "青脚本",
  Callback = function()
--支持游戏自然,doors,Evade,lifting simulator,x20 lifting simulator有3个没加上(懒)
local Green = "作者天隊QQ3585189460"
local key = "卡密在QQ群665141481"
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\39\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\121\117\97\110\49\49\52\53\49\52\47\53\56\52\48\47\109\97\105\110\47\53\52\49\56\56\46\108\117\97\39\41\41\40\41\10")()
  end
})

Tab:AddButton({	
  Name = "冬凌中心 By：小凌",	
  Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoLingUwU/XiaoLing-KeySystemV3-------Xiao-Yun--------/main/%E5%B0%8F%E5%87%8CXSC%E5%90%8C%E6%AC%BE%E5%8D%A1%E5%AF%86%E7%B3%BB%E7%BB%9F.Lua"))()
  end
})

Tab:AddButton({	
  Name = "落叶中心",	
  Callback = function()	
getgenv().LS="落叶中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
  end
})

Tab:AddButton({	
  Name = "导管中心",	
  Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/useranewrff/roblox/main/%E6%9D%A1%E6%AC%BE%E5%8D%8F%E8%AE%AE.lua"))()
  end
})

Tab:AddButton({	
  Name = "XK脚本中心",	
  Callback = function()	
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\88\75\46\84\88\84\34\41\41\40\41\10")()
  end
})



local Tab = Window:MakeTab({
    Name = "内脏与黑火药",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({	
    Name = "黑火药『牢大版』",	
    Callback = function()	
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")()
   end
})

Tab:AddButton({	
    Name = "黑火药『明月清风』",	
    Callback = function()	
loadstring(game:HttpGet(("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\65\81\84\70\69\72\54\84"),true))()
   end
})

local Tab = Window:MakeTab({
    Name = "汽车销售",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({	
    Name = "汽车飞行【兔子汉化】",	
    Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/dixjzj67/jiaoben/main/vfly.txt"))()
   end
})

Tab:AddButton({	
    Name = "汽车经销大亨『寻蛋活动』",	
    Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0cardealership2",true))()
   end
})

Tab:AddButton({	
    Name = "汽车销售——新脚本",	
    Callback = function()	
pcall(function()    repeat wait() until game:IsLoaded()  loadstring(game:HttpGet("https://raw.githubusercontent.com/03sAlt/BlueLockSeason2/main/README.md"))()end)--- i remove the key now
   end
})

Tab:AddButton({	
    Name = "汽车销售『收集所有砖头』",	
    Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/Car%20Dealership%20Tycoon.lua"))()
   end
})

local Tab = Window:MakeTab({
    Name = "压力脚本区",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({	
    Name = "压力脚本『一』",	
    Callback = function()	
 loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/New-C4-Remote.lua/main/pressure_kuy.lua"))()
   end
})

Tab:AddButton({	
    Name = "压力脚本『二』",	
    Callback = function()	
loadstring(game:HttpGet(('https://raw.githubusercontent.com/zuohongjian/bjb/main/Pressure')))()
   end
})

Tab:AddButton({	
    Name = "压力脚本『三』",	
    Callback = function()	
loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))()
   end
})

local Tab = Window:MakeTab({
    Name = "51区",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({	
    Name = "51区脚本",	
    Callback = function()	
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Saktk-In-Area51/main/Area51", true))()
   end
})

local Tab = Window:MakeTab({
	Name = "忍者传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton ({
	Name = "附魔岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(83.028564453125, 766.3915405273438, -128.62686157226562)
	end
})
Tab:AddButton ({
	Name = "星界岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.43006896972656, 2014.091064453125, 247.5571746826172)
	end
})
Tab:AddButton ({
	Name = "神秘岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(162.7420654296875, 4047.7841796875, 13.378257751464844)
	end
})
Tab:AddButton ({
	Name = "太空岛",
	Callback = function ()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.0364227294922, 5657.091796875, 161.54000854492188)
	end
})
Tab:AddButton ({
	Name = "冻土岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(186.7508544921875, 9285.08984375, 158.16287231445312)
	end
})
Tab:AddButton ({
	Name = "沙暴",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(183.7511749267578, 17686.236328125, 147.5008087158203)
	end
})
Tab:AddButton ({
	Name = "雷暴",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(186.87640380859375, 24069.9296875, 158.25582885742188)
	end
})
Tab:AddButton ({
	Name = "远古炼狱岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(166.48052978515625, 28256.201171875, 160.25828552246094)
	end
})
Tab:AddButton ({
	Name = "午夜暗影岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(182.76388549804688, 33206.88671875, 136.66305541992188)
	end
})
Tab:AddButton ({
	Name = "神秘灵魂岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(157.39967346191406, 39317.4765625, 146.05630493164062)
	end
			
})
	Tab:AddButton ({
	Name = "冬季奇迹岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(168.73797607421875, 46010.4609375, 158.589599609375)
	end
})
	Tab:AddButton ({
	Name = "黄金大师岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.56202697753906, 52607.671875, 166.47279357910156)
	end
})
	Tab:AddButton ({
	Name = "龙传奇岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(166.83065795898438, 59594.58984375, 150.16586303710938)
	end
})
	Tab:AddButton ({
	Name = "赛博传奇岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(167.66766357421875, 66669.0703125, 142.27223205566406)
	end
})
	Tab:AddButton ({
	Name = "天岚超能岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(182.09237670898438, 70271.0625, 157.14857482910156)
	end
})
	Tab:AddButton ({
	Name = "混沌传奇岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(177.88784790039062, 74442.7578125, 143.346435546875)
	end
})
	Tab:AddButton ({
	Name = "灵魂融合岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(183.39129638671875, 79746.890625, 163.01148986816406)
	end
})
	Tab:AddButton ({
	Name = "黑暗元素岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(169.4972381591797, 83198.890625, 170.53890991210938)
	end
})
	Tab:AddButton ({
	Name = "禅心岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(173.4744873046875, 87050.9765625, 141.89602661132812)
	end
})
Tab:AddButton ({
	Name = "炽热漩涡之岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(178.33023071289062, 91245.96875, 152.53775024414062)
	end
})
local Tab = Window:MakeTab({
	Name = "力量传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton ({
	Name = "小岛",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-44.46185302734375, 3.8302507400512695, 1901.6556396484375)
	end
})
Tab:AddButton ({
	Name = "冰霜健身房",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2623.78466796875, 3.676866054534912, -409.1138000488281)
	end
})
Tab:AddButton ({
	Name = "神话健身房",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2250.778076171875, 3.654913902282715, 1073.2266845703125)
	end
})
Tab:AddButton ({
	Name = "永恒健身房",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6734.2587890625, 3.6268656253814697, -1310.8692626953125)
	end
})
Tab:AddButton ({
	Name = "传奇健身房",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4625.86279296875, 987.8297729492188, -3916.247802734375)
	end
})
Tab:AddButton ({
	Name = "肌肉之王健身房",
	Callback = function ()
	 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8668.4169921875, 13.526894569396973, -5743.12939453125)
	end
})

    