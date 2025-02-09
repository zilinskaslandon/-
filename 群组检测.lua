local leaflet = game:GetService("Players").LocalPlayer
local xiaoye = 
local xiaoyegroup = "https://www.roblox.com/groups//unnamed#!/about"
local xy = "北极星"

if leaflet:IsInGroup(xiaoye) then
	print("你还没有加入北极星工作室群组，无法体验到本脚本")
else

local sound = Instance.new("Sound", workspace)
sound.Volume = 2
sound.SoundId = "rbxassetid://35603822"
sound:Play()            

local library = 
local window = library:new("北极星脚本中心")

local creds = window:Tab("你是不是很疑惑？",'7733993211')

local Tab1 = creds:section("我为什么会在这里?",true)
    
    Tab1:Label("问: 为什么我在这里？")
    Tab1:Label("答: 因为你没加入叶脚本群组")
    Tab1:Label("问: 什么是北极星脚本群组？")
    Tab1:Label("答: 是Roblox里的一个名为北极星工作室的群组")
    Tab1:Label("问: 手机怎么加入群组")
    Tab1:Label("答: Roblox主界面→更多→社区→更多群组→搜索北极星工作室→加入")
	setclipboard(xiaoyegroup)
	wait(999999999999)
end

print(xy)
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "北极星脚本",Text = "群组验证成功",})
wait(1.2)

loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/main/%F0%9F%87%A9%F0%9F%87%AA%E5%B8%9D%E8%84%9A%E6%9C%AC%F0%9F%87%A9%F0%9F%87%AA.Lua"))()