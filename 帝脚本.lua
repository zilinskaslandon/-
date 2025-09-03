local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/sharksharksharkshark/-/main/black%20ui.txt'))()
 
local Window = library:CreateWindow("北极星工作室", "帝脚本", 10044538000)
 
local Tab = Window:CreateTab("感谢大家")

local Page = Tab:CreateFrame("常用")

Button = Page:CreateButton("飞行", "", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\90\66\122\99\84\109\49\102\34\41\41\40\41\10")()
end)

Button = Page:CreateButton("通用自瞄", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()
end)

Button = Page:CreateButton("速度", "数值25", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
end)

Button = Page:CreateButton("点击传送", "", function()
    mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "Equip to Click TP" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
end)

Button = Page:CreateButton("透视", "", function()
    loadstring(game:GetObjects("rbxassetid://10092697033")[1].Source)()
end)

Button = Page:CreateButton("高画质", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)
 
local Page = Tab:CreateFrame("通用")

Button = Page:CreateButton("无限跳跃", "", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)

Button = Page:CreateButton("透视", "看到所有玩家", function()
    loadstring(game:GetObjects("rbxassetid://10092697033")[1].Source)()
end)

Button = Page:CreateButton("隐身道具", "别人看不见", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()
end)

Button = Page:CreateButton("穿墙陀螺仪", "调到0可以穿墙", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
end)

Button = Page:CreateToggle("夜视", "可自由关闭", function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
end)

Button = Page:CreateButton("速度和无限跳", "按e穿墙", function()
    local kavoUi = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local window = kavoUi.CreateLib("所有大亨通用脚本汉化版","BloodTheme")

---Tabs

local Tab1 = window:NewTab("首页")
local Tab1Section = Tab1:NewSection("首页")
local Tab2 = window:NewTab("开发&汉化")
local Tab2Section = Tab2:NewSection("Made By JN HH Gaming 汉化by:ZERO")
local Tab2Section = Tab2:NewSection("给JN HH GAMING点点关注")

---Buttons

Tab1Section:NewButton("攻击体积","修改攻击体积",function()
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
end)

Tab1Section:NewToggle("无限跳跃"," 我要飞的更高～",function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

Tab1Section:NewButton("速度","修改速度",function()
function isNumber(str)
  if tonumber(str) ~= nil or str == 'inf' then
    return true
  end
end
local tspeed = 1
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed and isNumber(tspeed) then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end)

Tab1Section:NewButton("穿墙","老熟人不多介绍",function()
local StealthMode = true -- If game has an anticheat that checks the logs

local Indicator

if not StealthMode then
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    print("穿墙: 电脑端按住键盘E")
    Indicator = Instance.new("TextLabel", ScreenGui)
    Indicator.AnchorPoint = Vector2.new(0, 1)
    Indicator.Position = UDim2.new(0, 0, 1, 0)
    Indicator.Size = UDim2.new(0, 200, 0, 50)
    Indicator.BackgroundTransparency = 1
    Indicator.TextScaled = true
    Indicator.TextStrokeTransparency = 0
    Indicator.TextColor3 = Color3.new(0, 0, 0)
    Indicator.TextStrokeColor3 = Color3.new(1, 1, 1)
    Indicator.Text = "穿墙:运行成功"
end

local noclip = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local mouse = player:GetMouse()

mouse.KeyDown:Connect(function(key)
    if key == "e" then
        noclip = not noclip

        if not StealthMode then
            Indicator.Text = "Noclip: " .. (noclip and "Enabled" or "Disabled")
        end
    end
end)

while true do
    player = game.Players.LocalPlayer
    character = player.Character

    if noclip then
        for _, v in pairs(character:GetDescendants()) do
            pcall(function()
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end)
        end
    end

    game:GetService("RunService").Stepped:wait()
end
end)
end)

Button = Page:CreateButton("传送", "传送观战", function()
    function GetPlayer(String)
   local Found = {}
   local strl = String:lower()
       for i,v in pairs(game.Players:GetPlayers()) do
           if v.Name:lower():sub(1, #String) == String:lower() then
               table.insert(Found,v.Name)
           end
       end    
   return Found    
end
local PrisonRuinerGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Kill = Instance.new("TextButton")
local Merge = Instance.new("TextButton")
local Kick = Instance.new("TextButton")
local KillAll = Instance.new("TextButton")
local Sword = Instance.new("TextButton")
local Player = Instance.new("TextBox")
local TextLabel_2 = Instance.new("TextLabel")
local Line = Instance.new("TextLabel")
local Spectate = Instance.new("TextButton")
local Goto = Instance.new("TextButton")
local Unspectate = Instance.new("TextButton")
PrisonRuinerGui.Name = "监狱 Ruiner Gui"
PrisonRuinerGui.Parent = game.CoreGui
PrisonRuinerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Frame.Active = true
Frame.Draggable = true
Frame.Parent = PrisonRuinerGui
Frame.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0496657118, 0, 0.473186165, 0)
Frame.Size = UDim2.new(0, 337, 0, 319)
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 337, 0, 42)
TextLabel.Font = Enum.Font.Cartoon
TextLabel.Text = "监狱 Ruiner Gui"
TextLabel.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true
Kill.Name = "杀"
Kill.Parent = Frame
Kill.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Kill.BorderColor3 = Color3.new(0, 0, 0)
Kill.BorderSizePixel = 0
Kill.Position = UDim2.new(0.0579999983, 0, 0.173843265, 0)
Kill.Size = UDim2.new(0, 131, 0, 33)
Kill.Font = Enum.Font.Cartoon
Kill.Text = "杀"
Kill.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Kill.TextScaled = true
Kill.TextSize = 14
Kill.TextWrapped = true
Merge.Name = "合并"
Merge.Parent = Frame
Merge.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Merge.BorderColor3 = Color3.new(0, 0, 0)
Merge.BorderSizePixel = 0
Merge.Position = UDim2.new(0.550999999, 0, 0.173131928, 0)
Merge.Size = UDim2.new(0, 131, 0, 33)
Merge.Font = Enum.Font.Cartoon
Merge.Text = "合并"
Merge.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Merge.TextScaled = true
Merge.TextSize = 14
Merge.TextWrapped = true
Kick.Name = "踢"
Kick.Parent = Frame
Kick.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Kick.BorderColor3 = Color3.new(0, 0, 0)
Kick.BorderSizePixel = 0
Kick.Position = UDim2.new(0.0579999983, 0, 0.300999999, 0)
Kick.Size = UDim2.new(0, 131, 0, 33)
Kick.Font = Enum.Font.Cartoon
Kick.Text = "踢"
Kick.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Kick.TextScaled = true
Kick.TextSize = 14
Kick.TextWrapped = true
KillAll.Name = "杀死所有人"
KillAll.Parent = Frame
KillAll.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
KillAll.BorderColor3 = Color3.new(0, 0, 0)
KillAll.BorderSizePixel = 0
KillAll.Position = UDim2.new(0.550999999, 0, 0.302032351, 0)
KillAll.Size = UDim2.new(0, 131, 0, 33)
KillAll.Font = Enum.Font.Cartoon
KillAll.Text = "杀死所有人"
KillAll.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
KillAll.TextScaled = true
KillAll.TextSize = 14
KillAll.TextWrapped = true
Sword.Name = "剑"
Sword.Parent = Frame
Sword.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Sword.BorderColor3 = Color3.new(0, 0, 0)
Sword.BorderSizePixel = 0
Sword.Position = UDim2.new(0.0579999685, 0, 0.855558157, 0)
Sword.Size = UDim2.new(0, 131, 0, 33)
Sword.Font = Enum.Font.Cartoon
Sword.Text = "剑"
Sword.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Sword.TextScaled = true
Sword.TextSize = 14
Sword.TextWrapped = true
Player.Name = "玩家"
Player.Parent = Frame
Player.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Player.BorderColor3 = Color3.new(0, 0, 0)
Player.BorderSizePixel = 0
Player.Position = UDim2.new(0.202000022, 0, 0.609539211, 0)
Player.Size = UDim2.new(0, 200, 0, 33)
Player.Font = Enum.Font.Cartoon
Player.PlaceholderColor3 = Color3.new(0.490196, 0.490196, 0.490196)
Player.PlaceholderText = "Player"
Player.Text = ""
Player.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Player.TextScaled = true
Player.TextSize = 14
Player.TextWrapped = true
TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TextLabel_2.BorderColor3 = Color3.new(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.855000019, 0, 0.654999971, 0)
TextLabel_2.Size = UDim2.new(0, 49, 0, 40)
TextLabel_2.Font = Enum.Font.Cartoon
TextLabel_2.Text = "Gui by Uctron"
TextLabel_2.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextWrapped = true
Line.Name = "线"
Line.Parent = Frame
Line.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Line.BorderColor3 = Color3.new(0, 0, 0)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 0, 0.78076911, 0)
Line.Size = UDim2.new(0, 337, 0, 10)
Line.Font = Enum.Font.Cartoon
Line.Text = ""
Line.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Line.TextScaled = true
Line.TextSize = 14
Line.TextWrapped = true
Spectate.Name = "注意"
Spectate.Parent = Frame
Spectate.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Spectate.BorderColor3 = Color3.new(0, 0, 0)
Spectate.BorderSizePixel = 0
Spectate.Position = UDim2.new(0.0579999983, 0, 0.42899999, 0)
Spectate.Size = UDim2.new(0, 131, 0, 33)
Spectate.Font = Enum.Font.Cartoon
Spectate.Text = "注意"
Spectate.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Spectate.TextScaled = true
Spectate.TextSize = 14
Spectate.TextWrapped = true
Goto.Name = "去"
Goto.Parent = Frame
Goto.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Goto.BorderColor3 = Color3.new(0, 0, 0)
Goto.BorderSizePixel = 0
Goto.Position = UDim2.new(0.551999986, 0, 0.430999994, 0)
Goto.Size = UDim2.new(0, 131, 0, 33)
Goto.Font = Enum.Font.Cartoon
Goto.Text = "去"
Goto.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Goto.TextScaled = true
Goto.TextSize = 14
Goto.TextWrapped = true
Unspectate.Name = "不受欢迎"
Unspectate.Parent = Frame
Unspectate.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Unspectate.BorderColor3 = Color3.new(0, 0, 0)
Unspectate.BorderSizePixel = 0
Unspectate.Position = UDim2.new(0.550581574, 0, 0.855558157, 0)
Unspectate.Size = UDim2.new(0, 131, 0, 33)
Unspectate.Font = Enum.Font.Cartoon
Unspectate.Text = "不受欢迎"
Unspectate.TextColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Unspectate.TextScaled = true
Unspectate.TextSize = 14
Unspectate.TextWrapped = true

Kill.MouseButton1Click:Connect(function()
local savedteam = game.Players.LocalPlayer.TeamColor.Name
workspace.Remote.TeamEvent:FireServer("Medium stone grey")
workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)	
for i,v in pairs(GetPlayer(Player.Text)) do
local A_1 = {[1] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)), ["Distance"] = 3.2524313926697, ["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576), ["Hit"] = game.Players[v].Character.Head}, [2] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)), ["Distance"] = 3.2699294090271, ["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377), ["Hit"] = game.Players[v].Character.Head}, [3] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)), ["Distance"] = 3.1665518283844, ["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652), ["Hit"] = game.Players[v].Character.Head}, [4] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)), ["Distance"] = 3.3218522071838, ["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611), ["Hit"] = game.Players[v].Character.Head}, [5] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)), ["Distance"] = 3.222757101059, ["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302), ["Hit"] = game.Players[v].Character.Head}}
local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
local Event = game:GetService("ReplicatedStorage").ShootEvent
Event:FireServer(A_1, A_2)
Event:FireServer(A_1, A_2)
end
workspace.Remote.TeamEvent:FireServer(savedteam)
end)

KillAll.MouseButton1Click:Connect(function()
local savedteam = game.Players.LocalPlayer.TeamColor.Name
workspace.Remote.TeamEvent:FireServer("Medium stone grey")
workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)	
for i,v in pairs(game.Players:GetPlayers()) do
local A_1 = {[1] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)), ["Distance"] = 3.2524313926697, ["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576), ["Hit"] = v.Character.Head}, [2] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)), ["Distance"] = 3.2699294090271, ["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377), ["Hit"] = v.Character.Head}, [3] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)), ["Distance"] = 3.1665518283844, ["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652), ["Hit"] = v.Character.Head}, [4] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)), ["Distance"] = 3.3218522071838, ["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611), ["Hit"] = v.Character.Head}, [5] = {["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)), ["Distance"] = 3.222757101059, ["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302), ["Hit"] = v.Character.Head}}
local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
local Event = game:GetService("ReplicatedStorage").ShootEvent
Event:FireServer(A_1, A_2)
Event:FireServer(A_1, A_2)
end
game.Players.LocalPlayer.Character:BreakJoints()
workspace.Remote.TeamEvent:FireServer(savedteam)
end)

Merge.MouseButton1Click:Connect(function()
for i,v in pairs(GetPlayer(Player.Text)) do
repeat
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v].Character.HumanoidRootPart.CFrame
game:GetService("RunService").Heartbeat:Wait()
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
end
end)

Kick.MouseButton1Click:Connect(function()
for i,v in pairs(GetPlayer(Player.Text)) do
workspace.Remote.loadchar:InvokeServer(game.Players.LocalPlayer,game.Players[v].TeamColor.Name)
wait(.1)
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Starting...";
Text = "Now attempting to kick "..v;
Duration = 5;
})
for i=1,10 do
workspace.Remote.votekick:InvokeServer("Start",game.Players[v])
workspace.Remote.votekick:InvokeServer("Vote")
game:GetService("RunService").Stepped:Wait()
end
if not game.Players:FindFirstChild(v) then
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Success!";
Text = v.." has been kicked.";
Duration = 5;
})
end
end
end)

Spectate.MouseButton1Click:Connect(function()
for i,v in pairs(GetPlayer(Player.Text)) do
workspace.CurrentCamera.CameraSubject = game.Players[v].Character.Humanoid
end
end)

Goto.MouseButton1Click:Connect(function()
for i,v in pairs(GetPlayer(Player.Text)) do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v].Character.HumanoidRootPart.CFrame
end
end)

Unspectate.MouseButton1Click:Connect(function()
for i,v in pairs(GetPlayer(Player.Text)) do
workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end
end)

Sword.MouseButton1Click:Connect(function()
for i,v in pairs(GetPlayer(Player.Text)) do
local Sword = Instance.new("Tool")
local Handle = Instance.new("Part")
local Mesh = Instance.new("SpecialMesh")
local Unsheath = Instance.new("Sound")
local SwordSlash = Instance.new("Sound")
SwordSlash.Name = "剑"
Unsheath.Name = "Unsheath"
Unsheath.SoundId = "http://www.roblox.com/asset/?id=12222225"
Unsheath.Volume = 1
SwordSlash.SoundId = "http://www.roblox.com/asset/?id=12222216"
SwordSlash.Volume = .7
Unsheath.Parent = Handle
SwordSlash.Parent = Handle
Mesh.Parent = Handle
Mesh.MeshId = "rbxassetid://497078148"
Mesh.Scale = Vector3.new(5,5,5)
Handle.Name = "处理"
Handle.Parent = Sword
Sword.GripForward = Vector3.new(-1,0,0)
Sword.GripPos = Vector3.new(0,0,-1.5)
Sword.GripRight = Vector3.new(0,1,0)
Sword.GripUp = Vector3.new(0,0,1)
Sword.ToolTip = "Uctron's Sword"
Sword.TextureId = "rbxasset://Textures/Sword128.png"
Sword.CanBeDropped = false
Sword.RequiresHandle = true
Handle.Orientation = Vector3.new(-46.24, 42.14, 50.93)
Handle.Position = Vector3.new(-3.174,1.57,3.04)
Handle.CanCollide = true
Handle.Size = Vector3.new(1,.8,4)
Mesh.MeshId = "rbxasset://fonts/sword.mesh"
Mesh.MeshType = "FileMesh"
Mesh.Offset = Vector3.new(0,0,0)
Mesh.Scale = Vector3.new(1,1,1)
Mesh.TextureId = "rbxasset://textures/SwordTexture.png"
Sword.Equipped:Connect(function()
Unsheath:Play()
end)
Sword.Activated:Connect(function()
SwordSlash:Play()
Handle.Touched:Connect(function(Handle)
p=game.Players:FindFirstChild(Handle.Parent.Name)
game.ReplicatedStorage.meleeEvent:FireServer(p)
end)
local Anim = Instance.new("StringValue")
Anim.Name = "工具"
Anim.Value = "Slash"
Anim.Parent = Sword
end)
Mouse_Icon = "rbxasset://textures/GunCursor.png"
Reloading_Icon = "rbxasset://textures/GunWaitCursor.png"
Tool = Sword
Mouse = nil
function UpdateIcon()
if Mouse then
Mouse.Icon = Tool.Enabled and Mouse_Icon or Reloading_Icon
end
end
function OnEquipped(ToolMouse)
Mouse = ToolMouse
UpdateIcon()
end
function OnChanged(Property)
if Property == "Enabled" then
UpdateIcon()
end
end
Tool.Equipped:Connect(OnEquipped)
Tool.Changed:Connect(OnChanged)
Sword.Parent = game.Players.LocalPlayer.Backpack
end
end)
end)

Button = Page:CreateButton("子弹追踪", "部分游戏不通用", function()
    local Camera = game:GetService("Workspace").CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer

local function GetClosestPlayer()
   local ClosestPlayer = nil
   local FarthestDistance = math.huge

   for i, v in pairs(Players.GetPlayers(Players)) do
       if v ~= LocalPlayer and v.Character and v.Character.FindFirstChild(v.Character, "HumanoidRootPart") then
           local DistanceFromPlayer = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

           if DistanceFromPlayer < FarthestDistance then
               FarthestDistance = DistanceFromPlayer
               ClosestPlayer = v
           end
       end
   end

   if ClosestPlayer then
       return ClosestPlayer
   end
end

local GameMetaTable = getrawmetatable(game)
local OldGameMetaTableNamecall = GameMetaTable.__namecall
setreadonly(GameMetaTable, false)

GameMetaTable.__namecall = newcclosure(function(object, ...)
   local NamecallMethod = getnamecallmethod()
   local Arguments = {...}

   if tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" then
       local ClosestPlayer = GetClosestPlayer()
       
       if ClosestPlayer and ClosestPlayer.Character then
           Arguments[1] = Ray.new(Camera.CFrame.Position, (ClosestPlayer.Character.Head.Position - Camera.CFrame.Position).Unit * (Camera.CFrame.Position - ClosestPlayer.Character.Head.Position).Magnitude)
       end
   end

   return OldGameMetaTableNamecall(object, unpack(Arguments))
end)

setreadonly(GameMetaTable, true)
end)

Button = Page:CreateButton("蜘蛛爬行", "反重力", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

Button = Page:CreateButton("变黑色恶魔", "...", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/tTyiBiqe",true))()
end)

Button = Page:CreateButton("动作包", "别人可见", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end)

Button = Page:CreateButton("空中行走", "用一会会变开始卡", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)

Button = Page:CreateButton("透视", "远距离透视", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/OwlHub.txt"))()
end)

Button = Page:CreateButton("自定义范围", "你没看错", function()
    -- Gui to Lua
-- Version: 3.2

-- Instances:

local Close = Instance.new("TextButton")
local Open2 = Instance.new("ScreenGui")
local Open = Instance.new("TextButton")
local FightingGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local Cre = Instance.new("TextLabel")
local HitBox = Instance.new("TextBox")
local Red = Instance.new("TextBox")
local Green = Instance.new("TextBox")
local Blue = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")

--Properties:

FightingGui.Name = "FightingGui"
FightingGui.Parent = game.CoreGui
FightingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


Open2.Name = "Tools"
Open2.Parent = game.CoreGui
Open2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Open.Name = "打开"
Open.Parent = Open2
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.Position = UDim2.new(0, 0, 0.451871663, 0)
Open.Size = UDim2.new(0, 78, 0, 50)
Open.Font = Enum.Font.SourceSans
Open.Text = "打开"
Open.TextColor3 = Color3.fromRGB(250, 0, 0)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true
Open.MouseButton1Down:Connect(function()
	FightingGui.Enabled = true
end)

Close.Name = "Close"
Close.Parent = main
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.Position = UDim2.new(1, 0, -0.226244345, 0)
Close.Size = UDim2.new(0, 60, 0, 50)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Down:Connect(function()
	FightingGui.Enabled = false
end)

main.Parent = FightingGui
main.Active = true
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Position = UDim2.new(0.073011741, 0, 0.237333342, 0)
main.Size = UDim2.new(0, 273, 0, 221)
main.Draggable = true

Cre.Name = "Cre"
Cre.Parent = main
Cre.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Cre.Position = UDim2.new(0, 0, -0.226244345, 0)
Cre.Size = UDim2.new(0, 273, 0, 50)
Cre.Font = Enum.Font.SourceSans
Cre.Text = "攻击范围脚本61汉化"
Cre.TextColor3 = Color3.fromRGB(0, 0, 0)
Cre.TextScaled = true
Cre.TextSize = 14.000
Cre.TextWrapped = true

HitBox.Name = "选择"
HitBox.Parent = main
HitBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HitBox.Position = UDim2.new(0.0586080588, 0, 0.0995475128, 0)
HitBox.Size = UDim2.new(0, 65, 0, 50)
HitBox.Font = Enum.Font.SourceSans
HitBox.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
HitBox.PlaceholderText = "选择"
HitBox.Text = ""
HitBox.TextColor3 = Color3.fromRGB(0, 0, 0)
HitBox.TextScaled = true
HitBox.TextSize = 14.000
HitBox.TextWrapped = true

Red.Name = "Red"
Red.Parent = main
Red.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Red.Position = UDim2.new(0.485832304, 0, 0.0995475128, 0)
Red.Size = UDim2.new(0, 37, 0, 31)
Red.Font = Enum.Font.SourceSans
Red.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Red.PlaceholderText = "红色"
Red.Text = ""
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextSize = 14.000

Green.Name = "绿色"
Green.Parent = main
Green.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Green.Position = UDim2.new(0.665319502, 0, 0.0995475128, 0)
Green.Size = UDim2.new(0, 37, 0, 31)
Green.Font = Enum.Font.SourceSans
Green.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Green.PlaceholderText = "绿色"
Green.Text = ""
Green.TextColor3 = Color3.fromRGB(0, 0, 0)
Green.TextSize = 14.000

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.Position = UDim2.new(0.47118023, 0, 0.325791866, 0)
TextLabel.Size = UDim2.new(0, 140, 0, 37)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "执行"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Blue.Name = "蓝色"
Blue.Parent = main
Blue.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Blue.Position = UDim2.new(0.837480664, 0, 0.0995475128, 0)
Blue.Size = UDim2.new(0, 37, 0, 31)
Blue.Font = Enum.Font.SourceSans
Blue.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Blue.PlaceholderText = "蓝色"
Blue.Text = ""
Blue.TextColor3 = Color3.fromRGB(0, 0, 0)
Blue.TextSize = 14.000
game:GetService('RunService').RenderStepped:connect(function()
	for i,v in next, game:GetService('Players'):GetPlayers() do
		if v.Name ~= game:GetService('Players').LocalPlayer.Name then
			v.Character.HumanoidRootPart.Size = Vector3.new(HitBox.Text,HitBox.Text,HitBox.Text)
			v.Character.HumanoidRootPart.Transparency = 0.8
			v.Character.HumanoidRootPart.Color = Color3.new(Red.Text,Green.Text,Blue.Text)
			v.Character.HumanoidRootPart.Material = "Neon"
			v.Character.HumanoidRootPart.CanCollide = false
		end
	end
end)
end)

Button = Page:CreateButton("防踢", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Anti-Kick/main/Anti%20Kick.lua"))()
end)

local Page = Tab:CreateFrame("脚本整合♳")

Button = Page:CreateButton("加入群719247153获得脚本", "", function()
    
end)

Button = Page:CreateButton("键盘", "手机必须使用按shilt隐藏脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

Button = Page:CreateButton("造船寻宝", "用按shilt隐藏脚本", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XRoLLu/UWU/main/BUILD%20A%20BOAT%20FOR%20TREASURE.lua'))()
end)

Button = Page:CreateButton("鲨口求生", "按ch隐藏脚本", function()
    loadstring(game:HttpGet('https://ppearl.vercel.app'))()
end)

Button = Page:CreateButton("能力战争", "按shilt隐藏脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VxleLUA/Dynamic-Offical/main/System/GameChecker.lua"))()
end)

Button = Page:CreateButton("越狱", "卡密在群里", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/piglex9/icetray3/main/latest.lua"))()
end)


Button = Page:CreateButton("拍打战斗", "不能长时间打同一个人", function()
     
end)

Button = Page:CreateButton("夺旗战争", "暂时无法使用", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Flag%20Wars.txt'))()
end)

Button = Page:CreateButton("巨人模拟器", "自动秒杀巨人", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0giant", true))()
end)

Button = Page:CreateButton("洞穴", "Really", function()
    local CoreGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

getgenv().HitboxSize = 30
getgenv().HitboxTransparency = 1

getgenv().HitboxStatus = false
getgenv().TeamCheck = false
getgenv().FriendCheck = false

getgenv().Walkspeed = 16
getgenv().Jumppower = 50

getgenv().esp = false
local highlights = {}
 
function start()
    while task.wait() do
        local esp = getgenv().esp
        local rake = game.Workspace:FindFirstChild("Rake")
        local rakeHighlight = game.CoreGui:FindFirstChild("Rake")
 
        if esp and rake then
            if not rakeHighlight then
                local highlight = Instance.new("Highlight", game.CoreGui)
                highlight.Name = "Rake"
                highlight.Adornee = rake
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlights[rake] = highlight
            end
        else
            if rakeHighlight then
                rakeHighlight:Destroy()
                highlights[rake] = nil
            end
        end
    end
end

--// UI

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))();
local Window = Library:Create("HitBox 扩展器")

local ToggleGui = Instance.new("ScreenGui")
local Toggle = Instance.new("TextButton")

ToggleGui.Name = "ToggleGui_HE"
ToggleGui.Parent = game.CoreGui

Toggle.Name = "Toggle"
Toggle.Parent = ToggleGui
Toggle.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Toggle.BackgroundTransparency = 0.660
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Click on"
Toggle.TextScaled = true
Toggle.TextColor3 = Color3.fromRGB(40, 40, 40)
Toggle.TextSize = 24.000
Toggle.TextXAlignment = Enum.TextXAlignment.Left
Toggle.Active = true
Toggle.Draggable = true
Toggle.MouseButton1Click:connect(function()
    Library:ToggleUI()
end)

local HomeTab = Window:Tab("主页","rbxassetid://10888331510")
local PlayerTab = Window:Tab("玩家","rbxassetid://12296135476")
local VisualTab = Window:Tab("视觉效果","rbxassetid://12308581351")

HomeTab:Section("设置")

HomeTab:Slider("Hitbox 尺寸 (滑动)", 0,300, function(value)
    getgenv().HitboxSize = value
end)

HomeTab:TextBox("Hitbox 尺寸 (输入)", function(value)
    getgenv().HitboxSize = value
end)

HomeTab:TextBox("Hitbox 透明度", function(number)
    getgenv().HitboxTransparency = number
end)

HomeTab:Section("菜单")

HomeTab:Toggle("距离: ", function(state)
	getgenv().HitboxStatus = state
    game:GetService('RunService').RenderStepped:connect(function()
		if HitboxStatus == true and TeamCheck == false and FriendCheck == false then
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
						v.Character.HumanoidRootPart.Transparency = HitboxTransparency
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
        elseif HitboxStatus == true and TeamCheck == false and FriendCheck == true then
            for i,v in next, game:GetService('Players'):GetPlayers() do
                for i2,v2 in pairs(game:GetService('Players'):GetChildren()) do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name and not v2:IsFriendsWith(game:GetService('Players').LocalPlayer.UserId) then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                            v.Character.HumanoidRootPart.Transparency = HitboxTransparency
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
			end
        elseif HitboxStatus == true and TeamCheck == true and FriendCheck == false then
            for i,v in next, game:GetService('Players'):GetPlayers() do
				if game:GetService('Players').LocalPlayer.Team ~= v.Team then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
						v.Character.HumanoidRootPart.Transparency = HitboxTransparency
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
        elseif HitboxStatus == true and TeamCheck == true and FriendCheck == true then
            for i,v in next, game:GetService('Players'):GetPlayers() do
				if game:GetService('Players').LocalPlayer.Team ~= v.Team and not game:GetService('Players'):IsFriendsWith(UserId) then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
						v.Character.HumanoidRootPart.Transparency = HitboxTransparency
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		else
		    for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
						v.Character.HumanoidRootPart.Transparency = 1
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
						v.Character.HumanoidRootPart.Material = "Plastic"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		end
	end)
end)

HomeTab:Keybind("Toggle UI", Enum.KeyCode.F, function()
    Library:ToggleUI()
end)

PlayerTab:Slider("速度", 16,500, function(value)
    getgenv().Walkspeed = value
    pcall(function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)
end)

PlayerTab:Slider("跳跃", 50,1000, function(value)
    getgenv().