local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/main.lua"))()

WindUI:Notify({
    Title = "在森林中的99夜",
    Content = "已开启",
    Duration = 5,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local hum = Character.HumanoidRootPart
local PlayerGui = LocalPlayer.PlayerGui

local Window = WindUI:CreateWindow({
    Title = "二狗子脚本--森林中的99夜",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Author = "欢迎付费版本用户",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(300, 270),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = false
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
})

Window:EditOpenButton({
    Title = "打开脚本",
    Icon = "star",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    Draggable = true,
})

MainSection = Window:Section({
    Title = "功能",
    Opened = true,
})

Main = MainSection:Tab({ Title = "武器", Icon = "Sword" })
