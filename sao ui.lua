local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/SAO_uLib/main/source.lua'))()
local intro = lib:Intro()
repeat wait() until intro:Done()

local win = lib:Window({Color = Color3.new(1, 0.666667, 0), Drag = true})
local tab1 = win:Tab("Tab 1")
local tab2 = win:Tab("Tab 2")
local tab3 = win:Tab("Tab 3")
local tab4 = win:Tab("Tab 4")
local tab5 = win:Tab("Tab 5")

local sec1 = tab1:Section("sec 1")
local sec2 = tab1:Section("sec 2")
local sec3 = tab1:Section("sec 3")
for i = 4, 9 do
	tab1:Section("sec "..i)
end

win:Nof("by acsu123#9826",6)

sec1:Line()
sec1:Button("test", function()
	print("click")
end)
sec1:Line()
sec1:Toggle("tog true",true, function(bool)
	print(bool)
end)
sec1:Toggle("tog false",false, function(bool)
	print(bool)
end)
sec1:Button("test 2", function()
	print("click 2")
	win:Nof("hi",6)
end)

local la = sec1:Label("ngu")
la:New("dep trai")

sec1:Slider("test",1,10,6,function(num)
	print(num)
end)

local drop = sec1:Dropdown("Enemy", {"as","ma","quang","huy"},function(e)
	print(e)
end)
drop:New({1,9,4,5,6,8})

sec1:Textbox("name","here",function(g)
	print(g)
end)