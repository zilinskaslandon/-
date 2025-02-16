local msg = Instance.new("北极星脚本中心",workspace)
msg.Text = "欢迎使用北极星中心"
wait(2) --时间
msg:Destroy()
local StartLoadTime = tick()  --计时的脚本
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
Notification.Notify("️北极星脚本[测试版]", "开始加载...", "rbxassetid://10483855823", { --定制通知(不是和脚本连的)
    Duration = 10,       
    Main = {
        Rounding = true,
    }
});

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Roblox-user/Raw.DL-HUB.Main/refs/heads/main/Wind-UI.Lua"))()--引导界面库(  已汉化,旧版本:(  )
--local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()  未汉化  最新!
local Window = WindUI:CreateWindow({ --窗口
    Title = "北极星的汉化中心",
    Icon = "cloud",
    Author = " OAO CNikunawa \n Beta2",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    KeySystem = {
        Key = "OAO ikunawa get key!",
        Note = "北极星脚本 | 重编",
        URL = "OAO ikunawa get key!!",
        SaveKey = true, 
    }, 
    Transparent = true,
    Theme = "Rose",
    SideBarWidth = 200,
    HasOutline = true,
})

Window:EditOpenButton({ --打开按钮
    Title = "[北极星 | 汉化中心]",
    Icon = "image-upscale",
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 3,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"),
        Color3.fromHex("F89B29")
    )
})

local HTab = Window:Tab({ --页面
    Title = "主页",
    Icon = "house",
})

HTab:Section({ 
    Title = "北极星脚本已回归脚本圈\n脚本为私人脚本不公开\n如果你在qq群里发现我的脚本请联系我QQ⬇️\n2518157831\nDone",
    TextSize = 10=,
})

MainTab:Section({ --标签🏷
    Title = "半缝合脚本\n不多逼逼",
    TextSize = 40,
})

local MainTab = Window:Tab({
    Title = "功能",
    Icon = "snowflake",
})

MainTab:Section({ 
    Title = "滑动获得速度",
    TextSize = 22,
})

MainTab:Button({ --按钮
    Title = "脚本未完成 点击退出脚本",
    Callback = function()
workspace.Game.Map.InvisParts:ClearAllChildren()
    end
})

local Button = MainTab:Toggle({ --开关
    Title = "开 关",
    Callback = function(state)
        print(state)
    end,
})

local Slider = MainTab:Slider({--滑块
    Title = "视角大小",
    Step = 1,
    Value = {
        Min = 20,
        Max = 120,
        Default = 70,
    },
    Callback = function(value)
        game.Workspace.Camera.FieldOfView = value  --视角
    end
})

local Dropdown = MainTab:Dropdown({ --下拉菜单
    Title = "选择玩家",
    Desc = "无",
    Multi = false,
    Value = "Tab 1",
    AllowNone = true,
    Values = {
        "Tab 1", "Tab 2", "Tab 3", "Tab 4", "Tab 5", "Tab 6", "Tab 7", "Tab 8", "Tab 9", "Tab 10",
    },
    Callback = function(Tab)
        WindUI:Notify({
            Title = "北极星中心",
            Content = "你已传被送到: " .. Tab,
            Duration = 2,
        })
    end
})


