local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()





local b=game:GetService"RunService"local d=
b.Heartbeat
local e=game:GetService"UserInputService"
local f=game:GetService"TweenService"
local g=game:GetService"LocalizationService"

local h=loadstring(game:HttpGetAsync"https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua")()
h.SetIconsType"lucide"


local i

local j={
Font="rbxassetid://12187365364",
Localization=nil,
CanDraggable=true,
Theme=nil,
Themes=nil,
Signals={},
Objects={},
LocalizationObjects={},
FontObjects={},
Language=string.match(g.SystemLocaleId,"^[a-z]+"),
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
},
VideoFrame={
BorderSizePixel=0,
}
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
},
}



function j.Init(l)
i=l
end

function j.AddSignal(l,m)
local p=l:Connect(m)
table.insert(j.Signals,p)
return p
end

function j.DisconnectAll()
for l,m in next,j.Signals do
local p=table.remove(j.Signals,l)
p:Disconnect()
end
end


function j.SafeCallback(l,...)
if not l then
return
end

local m,p=pcall(l,...)
if not m then local
r, u=p:find":%d+: "


warn("[ WindUI: DEBUG Mode ] "..p)

return i:Notify{
Title="DEBUG Mode: Error",
Content=not u and p or p:sub(u+1),
Duration=8,
}
end
end

function j.SetTheme(l)
j.Theme=l
j.UpdateTheme(nil,true)
end

function j.AddFontObject(l)
table.insert(j.FontObjects,l)
j.UpdateFont(j.Font)
end

function j.UpdateFont(l)
j.Font=l
for m,p in next,j.FontObjects do
p.FontFace=Font.new(l,p.FontFace.Weight,p.FontFace.Style)
end
end

function j.GetThemeProperty(l,m)
return m[l]or j.Themes.Dark[l]
end

function j.AddThemeObject(l,m)
j.Objects[l]={Object=l,Properties=m}
j.UpdateTheme(l,false)
return l
end
function j.AddLangObject(l)
local m=j.LocalizationObjects[l]
local p=m.Object
local r=currentObjTranslationId
j.UpdateLang(p,r)
return p
end

function j.UpdateTheme(l,m)
local function ApplyTheme(p)
for r,u in pairs(p.Properties or{})do
local v=j.GetThemeProperty(u,j.Theme)
if v then
if not m then
p.Object[r]=Color3.fromHex(v)
else
j.Tween(p.Object,0.08,{[r]=Color3.fromHex(v)}):Play()
end
end
end
end

if l then
local p=j.Objects[l]
if p then
ApplyTheme(p)
end
else
for p,r in pairs(j.Objects)do
ApplyTheme(r)
end
end
end

function j.SetLangForObject(l)
if j.Localization and j.Localization.Enabled then
local m=j.LocalizationObjects[l]
if not m then return end

local p=m.Object
local r=m.TranslationId

local u=j.Localization.Translations[j.Language]
if u and u[r]then
p.Text=u[r]
else
local v=j.Localization and j.Localization.Translations and j.Localization.Translations.en or nil
if v and v[r]then
p.Text=v[r]
else
p.Text="["..r.."]"
end
end
end
end


function j.ChangeTranslationKey(l,m,p)
if j.Localization and j.Localization.Enabled then
local r=string.match(p,"^"..j.Localization.Prefix.."(.+)")
if r then
for u,v in ipairs(j.LocalizationObjects)do
if v.Object==m then
v.TranslationId=r
j.SetLangForObject(u)
return
end
end

table.insert(j.LocalizationObjects,{
TranslationId=r,
Object=m
})
j.SetLangForObject(#j.LocalizationObjects)
end
end
end


function j.UpdateLang(l)
if l then
j.Language=l
end

for m=1,#j.LocalizationObjects do
local p=j.LocalizationObjects[m]
if p.Object and p.Object.Parent~=nil then
j.SetLangForObject(m)
else
j.LocalizationObjects[m]=nil
end
end
end

function j.SetLanguage(l)
j.Language=l
j.UpdateLang()
end

function j.Icon(l)
return h.Icon(l)
end

function j.New(l,m,p)
local r=Instance.new(l)

for u,v in next,j.DefaultProperties[l]or{}do
r[u]=v
end

for x,z in next,m or{}do
if x~="ThemeTag"then
r[x]=z
end
if j.Localization and j.Localization.Enabled and x=="Text"then
local A=string.match(z,"^"..j.Localization.Prefix.."(.+)")
if A then
local B=#j.LocalizationObjects+1
j.LocalizationObjects[B]={TranslationId=A,Object=r}

j.SetLangForObject(B)
end
end
end

for A,B in next,p or{}do
B.Parent=r
end

if m and m.ThemeTag then
j.AddThemeObject(r,m.ThemeTag)
end
if m and m.FontFace then
j.AddFontObject(r)
end
return r
end

function j.Tween(l,m,p,...)
return f:Create(l,TweenInfo.new(m,...),p)
end


function j.NewRoundFrame(l,m,p,r,x,z)
local function getImageForType(A)
return A=="Squircle"and"rbxassetid://80999662900595"
or A=="SquircleOutline"and"rbxassetid://117788349049947"
or A=="SquircleOutline2"and"rbxassetid://117817408534198"
or A=="Shadow-sm"and"rbxassetid://84825982946844"
or A=="Squircle-TL-TR"and"rbxassetid://73569156276236"
or A=="Squircle-BL-BR"and"rbxassetid://93853842912264"
or A=="Square"and"rbxassetid://82909646051652"
end

local function getSliceCenterForType(A)
return A~="Shadow-sm"and Rect.new(256
,256
,256
,256

)or Rect.new(512,512,512,512)
end

local A=j.New(x and"ImageButton"or"ImageLabel",{
Image=getImageForType(m),
ScaleType="Slice",
SliceCenter=getSliceCenterForType(m),
SliceScale=1,
BackgroundTransparency=1,
ThemeTag=p.ThemeTag and p.ThemeTag
},r)

for B,C in pairs(p or{})do
if B~="ThemeTag"then
A[B]=C
end
end

local function UpdateSliceScale(F)
local G=m~="Shadow-sm"and(F/(256))or(F/512)
A.SliceScale=math.max(G,0.0001)
end

local F={}

function F.SetRadius(G,H)
UpdateSliceScale(H)
end

function F.SetType(G,H)
m=H
A.Image=getImageForType(H)
A.SliceCenter=getSliceCenterForType(H)
UpdateSliceScale(l)
end

function F.UpdateShape(G,H,J)
if J then
m=J
A.Image=getImageForType(J)
A.SliceCenter=getSliceCenterForType(J)
end
if H then
l=H
end
UpdateSliceScale(l)
end

function F.GetRadius(G)
return l
end

function F.GetType(G)
return m
end

UpdateSliceScale(l)

return A,z and F or nil
end

local l=j.New local m=
j.Tween

function j.SetDraggable(p)
j.CanDraggable=p
end

function j.Drag(p,r,x)
local z
local A,B,C,F
local G={
CanDraggable=true
}

if not r or type(r)~="table"then
r={p}
end

local function update(H)
local J=H.Position-C
j.Tween(p,0.02,{Position=UDim2.new(
F.X.Scale,F.X.Offset+J.X,
F.Y.Scale,F.Y.Offset+J.Y
)}):Play()
end

for H,J in pairs(r)do
J.InputBegan:Connect(function(L)
if(L.UserInputType==Enum.UserInputType.MouseButton1 or L.UserInputType==Enum.UserInputType.Touch)and G.CanDraggable then
if z==nil then
z=J
A=true
C=L.Position
F=p.Position

if x and type(x)=="function"then
x(true,z)
end

L.Changed:Connect(function()
if L.UserInputState==Enum.UserInputState.End then
A=false
z=nil

if x and type(x)=="function"then
x(false,z)
end
end
end)
end
end
end)

J.InputChanged:Connect(function(L)
if z==J and A then
if L.UserInputType==Enum.UserInputType.MouseMovement or L.UserInputType==Enum.UserInputType.Touch then
B=L
end
end
end)
end

e.InputChanged:Connect(function(L)
if L==B and A and z~=nil then
if G.CanDraggable then
update(L)
end
end
end)

function G.Set(L,M)
G.CanDraggable=M
end

return G
end

h.Init(l,"Icon")

function j.Image(p,r,x,z,A,B,C)
local function SanitizeFilename(F)
F=F:gsub("[%s/\\:*?\"<>|]+","-")
F=F:gsub("[^%w%-_%.]","")
return F
end

z=z or"Temp"
r=SanitizeFilename(r)

local F=l("Frame",{
Size=UDim2.new(0,0,0,0),

BackgroundTransparency=1,
},{
l("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(j.Icon(p)or C)and{
ImageColor3=B and"Icon"or nil
}or nil,
},{
l("UICorner",{
CornerRadius=UDim.new(0,x)
})
})
})
if j.Icon(p)then




F.ImageLabel:Destroy()

local G=h.Image{
Icon=p,
Size=UDim2.new(1,0,1,0),
Colors={
(B and"Icon"or false),
"Button"
}
}.IconFrame
G.Parent=F
elseif string.find(p,"http")then
local G="WindUI/"..z.."/Assets/."..A.."-"..r..".png"
local H,J=pcall(function()
task.spawn(function()
if not isfile(G)then
local H=j.Request{
Url=p,
Method="GET",
}.Body

writefile(G,H)
end
F.ImageLabel.Image=getcustomasset(G)
end)
end)
if not H then
warn("[ WindUI.Creator ]  '"..identifyexecutor().."' doesnt support the URL Images. Error: "..J)

F:Destroy()
end
else
F.ImageLabel.Image=p
end

return F
end

return j end function a.b()
local b={}







function b.New(e,f,g)
local h={
Enabled=f.Enabled or false,
Translations=f.Translations or{},
Prefix=f.Prefix or"loc:",
DefaultLanguage=f.DefaultLanguage or"en"
}

g.Localization=h

return h
end



return b end function a.c()
local b=a.load'a'
local e=b.New
local f=b.Tween

local g={
Size=UDim2.new(0,300,1,-156),
SizeLower=UDim2.new(0,300,1,-56),
UICorner=13,
UIPadding=14,

Holder=nil,
NotificationIndex=0,
Notifications={}
}

function g.Init(h)
local i={
Lower=false
}

function i.SetLower(j)
i.Lower=j
i.Frame.Size=j and g.SizeLower or g.Size
end

i.Frame=e("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=g.Size,
Parent=h,
BackgroundTransparency=1,




},{
e("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
e("UIPadding",{
PaddingBottom=UDim.new(0,29)
})
})
return i
end

function g.New(h)
local i={
Title=h.Title or"Notification",
Content=h.Content or nil,
Icon=h.Icon or nil,
IconThemed=h.IconThemed,
Background=h.Background,
BackgroundImageTransparency=h.BackgroundImageTransparency,
Duration=h.Duration or 5,
Buttons=h.Buttons or{},
CanClose=true,
UIElements={},
Closed=false,
}
if i.CanClose==nil then
i.CanClose=true
end
g.NotificationIndex=g.NotificationIndex+1
g.Notifications[g.NotificationIndex]=i









local j

if i.Icon then





















j=b.Image(
i.Icon,
i.Title..":"..i.Icon,
0,
h.Window,
"Notification",
i.IconThemed
)
j.Size=UDim2.new(0,26,0,26)
j.Position=UDim2.new(0,g.UIPadding,0,g.UIPadding)

end

local l
if i.CanClose then
l=e("ImageButton",{
Image=b.Icon"x"[1],
ImageRectSize=b.Icon"x"[2].ImageRectSize,
ImageRectOffset=b.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-g.UIPadding,0,g.UIPadding),
AnchorPoint=Vector2.new(1,0),
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.4,
},{
e("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})
end

local m=e("Frame",{
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=.95,
ThemeTag={
BackgroundColor3="Text",
},

})

local p=e("Frame",{
Size=UDim2.new(1,
i.Icon and-28-g.UIPadding or 0,
1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
e("UIPadding",{
PaddingTop=UDim.new(0,g.UIPadding),
PaddingLeft=UDim.new(0,g.UIPadding),
PaddingRight=UDim.new(0,g.UIPadding),
PaddingBottom=UDim.new(0,g.UIPadding),
}),
e("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-30-g.UIPadding,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=16,
ThemeTag={
TextColor3="Text"
},
Text=i.Title,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium)
}),
e("UIListLayout",{
Padding=UDim.new(0,g.UIPadding/3)
})
})

if i.Content then
e("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=15,
ThemeTag={
TextColor3="Text"
},
Text=i.Content,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
Parent=p
})
end


local r=b.NewRoundFrame(g.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
ImageTransparency=.05,
ThemeTag={
ImageColor3="Background"
},

},{
e("CanvasGroup",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
m,
e("UICorner",{
CornerRadius=UDim.new(0,g.UICorner),
})

}),
e("ImageLabel",{
Name="Background",
Image=i.Background,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=i.BackgroundImageTransparency

},{
e("UICorner",{
CornerRadius=UDim.new(0,g.UICorner),
})
}),

p,
j,l,
})

local x=e("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=h.Holder
},{
r
})

function i.Close(z)
if not i.Closed then
i.Closed=true
f(x,0.45,{Size=UDim2.new(1,0,0,-8)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(r,0.55,{Position=UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(.45)
x:Destroy()
end
end

task.spawn(function()
task.wait()
f(x,0.45,{Size=UDim2.new(
1,
0,
0,
r.AbsoluteSize.Y
)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(r,0.45,{Position=UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if i.Duration then
f(m,i.Duration,{Size=UDim2.new(1,0,1,0)},Enum.EasingStyle.Linear,Enum.EasingDirection.InOut):Play()
task.wait(i.Duration)
i:Close()
end
end)

if l then
b.AddSignal(l.TextButton.MouseButton1Click,function()
i:Close()
end)
end


return i
end

return g end function a.d()
return{
Dark={
Name="Dark",
Accent="#18181b",
Dialog="#161616",
Outline="#FFFFFF",
Text="#FFFFFF",
Placeholder="#999999",
Background="#101010",
Button="#52525b",
Icon="#a1a1aa",
},
Light={
Name="Light",
Accent="#FFFFFF",
Dialog="#f4f4f5",
Outline="#09090b",
Text="#000000",
Placeholder="#777777",
Background="#e4e4e7",
Button="#18181b",
Icon="#52525b",
},
Rose={
Name="Rose",
Accent="#be185d",
Dialog="#4c0519",
Outline="#fecdd3",
Text="#fdf2f8",
Placeholder="#f9a8d4",
Background="#1f0308",
Button="#e11d48",
Icon="#fb7185",
},
Plant={
Name="Plant",
Accent="#166534",
Dialog="#052e16",
Outline="#bbf7d0",
Text="#f0fdf4",
Placeholder="#86efac",
Background="#0a1b0f",
Button="#16a34a",
Icon="#4ade80",
},
Red={
Name="Red",
Accent="#991b1b",
Dialog="#450a0a",
Outline="#fecaca",
Text="#fef2f2",
Placeholder="#f87171",
Background="#1c0606",
Button="#dc2626",
Icon="#ef4444",
},
Indigo={
Name="Indigo",
Accent="#3730a3",
Dialog="#1e1b4b",
Outline="#c7d2fe",
Text="#f1f5f9",
Placeholder="#a5b4fc",
Background="#0f0a2e",
Button="#4f46e5",
Icon="#6366f1",
},
Sky={
Name="Sky",
Accent="#0369a1",
Dialog="#0c4a6e",
Outline="#bae6fd",
Text="#f0f9ff",
Placeholder="#7dd3fc",
Background="#041f2e",
Button="#0284c7",
Icon="#0ea5e9",
},
Violet={
Name="Violet",
Accent="#6d28d9",
Dialog="#3c1361",
Outline="#ddd6fe",
Text="#faf5ff",
Placeholder="#c4b5fd",
Background="#1e0a3e",
Button="#7c3aed",
Icon="#8b5cf6",
},
Amber={
Name="Amber",
Accent="#b45309",
Dialog="#451a03",
Outline="#fde68a",
Text="#fffbeb",
Placeholder="#fcd34d",
Background="#1c1003",
Button="#d97706",
Icon="#f59e0b",
},
Emerald={
Name="Emerald",
Accent="#047857",
Dialog="#022c22",
Outline="#a7f3d0",
Text="#ecfdf5",
Placeholder="#6ee7b7",
Background="#011411",
Button="#059669",
Icon="#10b981",
},
Midnight={
Name="Midnight",
Accent="#1e3a8a",
Dialog="#0c1e42",
Outline="#bfdbfe",
Text="#dbeafe",
Placeholder="#60a5fa",
Background="#0a0f1e",
Button="#2563eb",
Icon="#3b82f6",
},
Crimson={
Name="Crimson",
Accent="#b91c1c",
Dialog="#450a0a",
Outline="#fca5a5",
Text="#fef2f2",
Placeholder="#9ca3af",
Background="#0c0404",
Button="#991b1b",
Icon="#dc2626",
},
MonokaiPro={
Name="Monokai Pro",
Accent="#fc9867",
Dialog="#1e1e1e",
Outline="#78dce8",
Text="#fcfcfa",
Placeholder="#939293",
Background="#191622",
Button="#ab9df2",
Icon="#a9dc76",
},
CottonCandy={
Name="Cotton Candy",
Accent="#ec4899",
Dialog="#2d1b3d",
Outline="#f9a8d4",
Text="#fdf2f8",
Placeholder="#c084fc",
Background="#1a0b2e",
Button="#d946ef",
Icon="#06b6d4",
},
}end function a.e()











local b=4294967296;local e=b-1;local function c(f,g)local h,i=0,1;while f~=0 or g~=0 do local j,l=f%2,g%2;local m=(j+l)%2;h=h+m*i;f=math.floor(f/2)g=math.floor(g/2)i=i*2 end;return h%b end;local function k(f,g,h,...)local i;if g then f=f%b;g=g%b;i=c(f,g)if h then i=k(i,h,...)end;return i elseif f then return f%b else return 0 end end;local function n(f,g,h,...)local i;if g then f=f%b;g=g%b;i=(f+g-c(f,g))/2;if h then i=n(i,h,...)end;return i elseif f then return f%b else return e end end;local function o(f)return e-f end;local function q(f,g)if g<0 then return lshift(f,-g)end;return math.floor(f%4294967296/2^g)end;local function s(f,g)if g>31 or g<-31 then return 0 end;return q(f%b,g)end;local function lshift(f,g)if g<0 then return s(f,-g)end;return f*2^g%4294967296 end;local function t(f,g)f=f%b;g=g%32;local h=n(f,2^g-1)return s(f,g)+lshift(h,32-g)end;local f={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(g)return string.gsub(g,".",function(h)return string.format("%02x",string.byte(h))end)end;local function y(g,h)local i=""for j=1,h do local l=g%256;i=string.char(l)..i;g=(g-l)/256 end;return i end;local function D(g,h)local i=0;for j=h,h+3 do i=i*256+string.byte(g,j)end;return i end;local function E(g,h)local i=64-(h+9)%64;h=y(8*h,8)g=g.."\128"..string.rep("\0",i)..h;assert(#g%64==0)return g end;local function I(g)g[1]=0x6a09e667;g[2]=0xbb67ae85;g[3]=0x3c6ef372;g[4]=0xa54ff53a;g[5]=0x510e527f;g[6]=0x9b05688c;g[7]=0x1f83d9ab;g[8]=0x5be0cd19;return g end;local function K(g,h,i)local j={}for l=1,16 do j[l]=D(g,h+(l-1)*4)end;for l=17,64 do local m=j[l-15]local p=k(t(m,7),t(m,18),s(m,3))m=j[l-2]j[l]=(j[l-16]+p+j[l-7]+k(t(m,17),t(m,19),s(m,10)))%b end;local l,m,p,r,x,z,A,B=i[1],i[2],i[3],i[4],i[5],i[6],i[7],i[8]for C=1,64 do local F=k(t(l,2),t(l,13),t(l,22))local G=k(n(l,m),n(l,p),n(m,p))local H=(F+G)%b;local J=k(t(x,6),t(x,11),t(x,25))local L=k(n(x,z),n(o(x),A))local M=(B+J+L+f[C]+j[C])%b;B=A;A=z;z=x;x=(r+M)%b;r=p;p=m;m=l;l=(M+H)%b end;i[1]=(i[1]+l)%b;i[2]=(i[2]+m)%b;i[3]=(i[3]+p)%b;i[4]=(i[4]+r)%b;i[5]=(i[5]+x)%b;i[6]=(i[6]+z)%b;i[7]=(i[7]+A)%b;i[8]=(i[8]+B)%b end;local function Z(g)g=E(g,#g)local h=I{}for i=1,#g,64 do K(g,i,h)end;return w(y(h[1],4)..y(h[2],4)..y(h[3],4)..y(h[4],4)..y(h[5],4)..y(h[6],4)..y(h[7],4)..y(h[8],4))end;local g;local h={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local i={["/"]="/"}for j,l in pairs(h)do i[l]=j end;local m=function(m)return"\\"..(h[m]or string.format("u%04x",m:byte()))end;local p=function(p)return"null"end;local r=function(r,x)local z={}x=x or{}if x[r]then error"circular reference"end;x[r]=true;if rawget(r,1)~=nil or next(r)==nil then local A=0;for B in pairs(r)do if type(B)~="number"then error"invalid table: mixed or invalid key types"end;A=A+1 end;if A~=#r then error"invalid table: sparse array"end;for C,F in ipairs(r)do table.insert(z,g(F,x))end;x[r]=nil;return"["..table.concat(z,",").."]"else for A,B in pairs(r)do if type(A)~="string"then error"invalid table: mixed or invalid key types"end;table.insert(z,g(A,x)..":"..g(B,x))end;x[r]=nil;return"{"..table.concat(z,",").."}"end end;local x=function(x)return'"'..x:gsub('[%z\1-\31\\"]',m)..'"'end;local z=function(z)if z~=z or z<=-math.huge or z>=math.huge then error("unexpected number value '"..tostring(z).."'")end;return string.format("%.14g",z)end;local A={["nil"]=p,table=r,string=x,number=z,boolean=tostring}g=function(B,C)local F=type(B)local G=A[F]if G then return G(B,C)end;error("unexpected type '"..F.."'")end;local B=function(B)return g(B)end;local C;local F=function(...)local F={}for G=1,select("#",...)do F[select(G,...)]=true end;return F end;local G=F(" ","\t","\r","\n")local H=F(" ","\t","\r","\n","]","}",",")local J=F("\\","/",'"',"b","f","n","r","t","u")local L=F("true","false","null")local M={["true"]=true,["false"]=false,null=nil}local N=function(N,O,P,Q)for R=O,#N do if P[N:sub(R,R)]~=Q then return R end end;return#N+1 end;local O=function(O,P,Q)local R=1;local S=1;for T=1,P-1 do S=S+1;if O:sub(T,T)=="\n"then R=R+1;S=1 end end;error(string.format("%s at line %d col %d",Q,R,S))end;local P=function(P)local Q=math.floor;if P<=0x7f then return string.char(P)elseif P<=0x7ff then return string.char(Q(P/64)+192,P%64+128)elseif P<=0xffff then return string.char(Q(P/4096)+224,Q(P%4096/64)+128,P%64+128)elseif P<=0x10ffff then return string.char(Q(P/262144)+240,Q(P%262144/4096)+128,Q(P%4096/64)+128,P%64+128)end;error(string.format("invalid unicode codepoint '%x'",P))end;local Q=function(Q)local R=tonumber(Q:sub(1,4),16)local S=tonumber(Q:sub(7,10),16)if S then return P((R-0xd800)*0x400+S-0xdc00+0x10000)else return P(R)end end;local R=function(R,S)local T=""local U=S+1;local V=U;while U<=#R do local W=R:byte(U)if W<32 then O(R,U,"control character in string")elseif W==92 then T=T..R:sub(V,U-1)U=U+1;local X=R:sub(U,U)if X=="u"then local Y=R:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",U+1)or R:match("^%x%x%x%x",U+1)or O(R,U-1,"invalid unicode escape in string")T=T..Q(Y)U=U+#Y else if not J[X]then O(R,U-1,"invalid escape char '"..X.."' in string")end;T=T..i[X]end;V=U+1 elseif W==34 then T=T..R:sub(V,U-1)return T,U+1 end;U=U+1 end;O(R,S,"expected closing quote for string")end;local S=function(S,T)local U=N(S,T,H)local V=S:sub(T,U-1)local W=tonumber(V)if not W then O(S,T,"invalid number '"..V.."'")end;return W,U end;local T=function(T,U)local V=N(T,U,H)local W=T:sub(U,V-1)if not L[W]then O(T,U,"invalid literal '"..W.."'")end;return M[W],V end;local U=function(U,V)local W={}local X=1;V=V+1;while 1 do local Y;V=N(U,V,G,true)if U:sub(V,V)=="]"then V=V+1;break end;Y,V=C(U,V)W[X]=Y;X=X+1;V=N(U,V,G,true)local _=U:sub(V,V)V=V+1;if _=="]"then break end;if _~=","then O(U,V,"expected ']' or ','")end end;return W,V end;local aa=function(V,W)local X={}W=W+1;while 1 do local Y,_;W=N(V,W,G,true)if V:sub(W,W)=="}"then W=W+1;break end;if V:sub(W,W)~='"'then O(V,W,"expected string for key")end;Y,W=C(V,W)W=N(V,W,G,true)if V:sub(W,W)~=":"then O(V,W,"expected ':' after key")end;W=N(V,W+1,G,true)_,W=C(V,W)X[Y]=_;W=N(V,W,G,true)local aa=V:sub(W,W)W=W+1;if aa=="}"then break end;if aa~=","then O(V,W,"expected '}' or ','")end end;return X,W end;local V={['"']=R,["0"]=S,["1"]=S,["2"]=S,["3"]=S,["4"]=S,["5"]=S,["6"]=S,["7"]=S,["8"]=S,["9"]=S,["-"]=S,t=T,f=T,n=T,["["]=U,["{"]=aa}C=function(W,X)local Y=W:sub(X,X)local _=V[Y]if _ then return _(W,X)end;O(W,X,"unexpected character '"..Y.."'")end;local W=function(W)if type(W)~="string"then error("expected argument of type string, got "..type(W))end;local X,Y=C(W,N(W,1,G,true))Y=N(W,Y,G,true)if Y<=#W then O(W,Y,"trailing garbage")end;return X end;
local X,Y,_=B,W,Z;





local ab={}


function ab.New(ac,ad)

local ae=ac;
local af=ad;
local ag=true;


local ah=function(ah)end;


repeat task.wait(1)until game:IsLoaded();


local ai=false;
local aj,ak,al,am,an,ao,ap,aq,ar=setclipboard or toclipboard,request or http_request or syn_request,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function()return game:GetService"Players".LocalPlayer.UserId end
local as,at="",0;


local au="https://api.platoboost.com";
local av=ak{
Url=au.."/public/connectivity",
Method="GET"
};
if av.StatusCode~=200 or av.StatusCode~=429 then
au="https://api.platoboost.net";
end


function cacheLink()
if at+(600)<ao()then
local aw=ak{
Url=au.."/public/start",
Method="POST",
Body=X{
service=ae,
identifier=_(ar())
},
Headers={
["Content-Type"]="application/json",
["User-Agent"]="Roblox/Exploit"
}
};

if aw.StatusCode==200 then
local ax=Y(aw.Body);

if ax.success==true then
as=ax.data.url;
at=ao();
return true,as
else
ah(ax.message);
return false,ax.message
end
elseif aw.StatusCode==429 then
local ax="you are being rate limited, please wait 20 seconds and try again.";
ah(ax);
return false,ax
end

local ax="Failed to cache link.";
ah(ax);
return false,ax
else
return true,as
end
end

cacheLink();


local aw=function()
local aw=""
for ax=1,16 do
aw=aw..al(aq(ap()*(26))+97)
end
return aw
end


for ax=1,5 do
local ay=aw();
task.wait(0.2)
if aw()==ay then
local az="platoboost nonce error.";
ah(az);
error(az);
end
end


local ax=function()
local ax,ay=cacheLink();

if ax then
aj(ay);
end
end


local ay=function(ay)
local az=aw();
local aA=au.."/public/redeem/"..am(ae);

local aB={
identifier=_(ar()),
key=ay
}

if ag then
aB.nonce=az;
end

local aC=ak{
Url=aA,
Method="POST",
Body=X(aB),
Headers={
["Content-Type"]="application/json"
}
};

if aC.StatusCode==200 then
local aD=Y(aC.Body);

if aD.success==true then
if aD.data.valid==true then
if ag then
if aD.data.hash==_("true".."-"..az.."-"..af)then
return true
else
ah"failed to verify integrity.";
return false
end
else
return true
end
else
ah"key is invalid.";
return false
end
else
if an(aD.message,1,27)=="unique constraint violation"then
ah"you already have an active key, please wait for it to expire before redeeming it.";
return false
else
ah(aD.message);
return false
end
end
elseif aC.StatusCode==429 then
ah"you are being rate limited, please wait 20 seconds and try again.";
return false
else
ah"server returned an invalid status code, please try again later.";
return false
end
end


local az=function(az)
if ai==true then
return false,("A request is already being sent, please slow down.")
else
ai=true;
end

local aA=aw();
local aB=au.."/public/whitelist/"..am(ae).."?identifier=".._(ar()).."&key="..az;

if ag then
aB=aB.."&nonce="..aA;
end

local aC=ak{
Url=aB,
Method="GET",
};

ai=false;

if aC.StatusCode==200 then
local aD=Y(aC.Body);

if aD.success==true then
if aD.data.valid==true then
if ag then
if aD.data.hash==_("true".."-"..aA.."-"..af)then
return true,""
else
return false,("failed to verify integrity.")
end
else
return true
end
else
if an(az,1,4)=="KEY_"then
return true,ay(az)
else
return false,("Key is invalid.")
end
end
else
return false,(aD.message)
end
elseif aC.StatusCode==429 then
return false,("You are being rate limited, please wait 20 seconds and try again.")
else
return false,("Server returned an invalid status code, please try again later.")
end
end


local aA=function(aA)
local aB=aw();
local aC=au.."/public/flag/"..am(ae).."?name="..aA;

if ag then
aC=aC.."&nonce="..aB;
end

local aD=ak{
Url=aC,
Method="GET",
};

if aD.StatusCode==200 then
local aE=Y(aD.Body);

if aE.success==true then
if ag then
if aE.data.hash==_(am(aE.data.value).."-"..aB.."-"..af)then
return aE.data.value
else
ah"failed to verify integrity.";
return nil
end
else
return aE.data.value
end
else
ah(aE.message);
return nil
end
else
return nil
end
end


return{
Verify=az,
GetFlag=aA,
Copy=ax,
}
end


return ab end function a.f()








local aa=game:GetService"HttpService"
local ab={}


function ab.New(ac)
local ad=gethwid or function()return game:GetService"Players".LocalPlayer.UserId end
local ae,af=request or http_request or syn_request,setclipboard or toclipboard

function ValidateKey(ag)
local ah="https://pandadevelopment.net/v2_validation?key="..tostring(ag).."&service="..tostring(ac).."&hwid="..tostring(ad())


local ai,aj=pcall(function()
return ae{
Url=ah,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"}
}
end)

if ai and aj then
if aj.Success then
local ak,al=pcall(function()
return aa:JSONDecode(aj.Body)
end)

if ak and al then
if al.V2_Authentication and al.V2_Authentication=="success"then

return true,"Authenticated"
else
local am=al.Key_Information.Notes or"Unknown reason"

return false,"Authentication failed: "..am
end
else

return false,"JSON decode error"
end
else
warn("[Pelinda Ov2.5] HTTP request was not successful. Code: "..tostring(aj.StatusCode).." Message: "..aj.StatusMessage)
return false,"HTTP request failed: "..aj.StatusMessage
end
else

return false,"Request pcall error"
end
end

function GetKeyLink()
return"https://pandadevelopment.net/getkey?service="..tostring(ac).."&hwid="..tostring(ad())
end

function CopyLink()
return af(GetKeyLink())
end

return{
Verify=ValidateKey,
Copy=CopyLink
}
end

return ab end function a.g()








local aa={}


function aa.New(ab,ac)
local ad=loadstring(game:HttpGet"https://sdkapi-public.luarmor.net/library.lua")()
local ae=setclipboard or toclipboard

ad.script_id=ab

function ValidateKey(af)
local ag=ad.check_key(af);


if(ag.code=="KEY_VALID")then
return true,"Whitelisted!"

elseif(ag.code=="KEY_HWID_LOCKED")then
return false,"Key linked to a different HWID. Please reset it using our bot"

elseif(ag.code=="KEY_INCORRECT")then
return false,"Key is wrong or deleted!"
else
return false,"Key check failed:"..ag.message.." Code: "..ag.code
end
end

function CopyLink()
ae(tostring(ac))
end

return{
Verify=ValidateKey,
Copy=CopyLink
}
end


return aa end function a.h()
return{
platoboost={
Name="Platoboost",
Icon="rbxassetid://75920162824531",
Args={"ServiceId","Secret"},


New=a.load'e'.New
},
pandadevelopment={
Name="Panda Development",
Icon="panda",
Args={"ServiceId"},


New=a.load'f'.New
},
luarmor={
Name="Luarmor",
Icon="rbxassetid://130918283130165",
Args={"ScriptId","Discord"},


New=a.load'g'.New
},

}end function a.i()


return[[
{
    "name": "windui",
    "version": "1.6.51",
    "main": "./dist/main.lua",
    "repository": "https://github.com/Footagesus/WindUI",
    "discord": "https://discord.gg/Q6HkNG4vwP",
    "author": "Footagesus",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "sh build/build.sh dev $INPUT_FILE",
        "build": "sh build/build.sh build $INPUT_FILE",
        "live": "python -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\""
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}]]end function a.j()

local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj,ak)
ah=ah or"Primary"
local al=not ak and 10 or 99
local am
if af and af~=""then
am=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local an=ac("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=ai,
BackgroundTransparency=1
},{
ab.NewRoundFrame(al,"Squircle",{
ThemeTag={
ImageColor3=ah~="White"and"Button"or nil,
},
ImageColor3=ah=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=ah=="Primary"and 0 or ah=="White"and 0 or 1
}),

ab.NewRoundFrame(al,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=ah=="Secondary"and 0.95 or 1
}),

ab.NewRoundFrame(al,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",

ImageTransparency=1,
Visible=not ak
}),

ab.NewRoundFrame(al,not ak and"SquircleOutline"or"SquircleOutline2",{
ThemeTag={
ImageColor3=ah~="White"and"Outline"or nil,
},
Size=UDim2.new(1,0,1,0),
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=ah=="Primary"and.95 or.85,
Name="SquircleOutline",
},{
ac("UIGradient",{
Rotation=70,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),

ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=ah~="White"and"Text"or nil
},
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
am,
ac("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ae or"Button",
ThemeTag={
TextColor3=(ah~="Primary"and ah~="White")and"Text",
},
TextColor3=ah=="Primary"and Color3.new(1,1,1)or ah=="White"and Color3.new(0,0,0)or nil,
AutomaticSize="XY",
TextSize=18,
})
})
})

ab.AddSignal(an.MouseEnter,function()
ad(an.Frame,.047,{ImageTransparency=.95}):Play()
end)
ab.AddSignal(an.MouseLeave,function()
ad(an.Frame,.047,{ImageTransparency=1}):Play()
end)
ab.AddSignal(an.MouseButton1Up,function()
if aj then
aj:Close()()
end
if ag then
ab.SafeCallback(ag)
end
end)

return an
end


return aa end function a.k()
local aa={}

local ab=a.load'a'
local ac=ab.New local ad=
ab.Tween


function aa.New(ae,af,ag,ah,ai,aj,ak)
ah=ah or"Input"
local al=ak or 10
local am
if af and af~=""then
am=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local an=ah~="Input"

local ao=ac("TextBox",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,am and-29 or 0,1,0),
PlaceholderText=ae,
ClearTextOnFocus=false,
ClipsDescendants=true,
TextWrapped=an,
MultiLine=an,
TextXAlignment="Left",
TextYAlignment=ah=="Input"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local ap=ac("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(al,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
ab.NewRoundFrame(al,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.95,
},{













}),
ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,ah=="Input"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,ah=="Input"and 0 or 12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=ah=="Input"and"Center"or"Top",
HorizontalAlignment="Left",
}),
am,
ao,
})
})
})










if aj then
ab.AddSignal(ao:GetPropertyChangedSignal"Text",function()
if ai then
ab.SafeCallback(ai,ao.Text)
end
end)
else
ab.AddSignal(ao.FocusLost,function()
if ai then
ab.SafeCallback(ai,ao.Text)
end
end)
end

return ap
end


return aa end function a.l()
local aa=a.load'a'
local ab=aa.New
local ac=aa.Tween



local ad={
Holder=nil,

Parent=nil,
}

function ad.Init(ae,af)
Window=ae
ad.Parent=af
return ad
end

function ad.Create(ae)
local af={
UICorner=24,
UIPadding=15,
UIElements={}
}

if ae then af.UIPadding=0 end
if ae then af.UICorner=26 end

if not ae then
af.UIElements.FullScreen=ab("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=ad.Parent or(Window and Window.UIElements and Window.UIElements.Main and Window.UIElements.Main.Main)
},{
ab("UICorner",{
CornerRadius=UDim.new(0,Window.UICorner)
})
})
end

af.UIElements.Main=ab("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3="Dialog",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,af.UIPadding),
PaddingLeft=UDim.new(0,af.UIPadding),
PaddingRight=UDim.new(0,af.UIPadding),
PaddingBottom=UDim.new(0,af.UIPadding),
})
})

af.UIElements.MainContainer=aa.NewRoundFrame(af.UICorner,"Squircle",{
Visible=false,

ImageTransparency=ae and 0.15 or 0,
Parent=ae and ad.Parent or af.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3="Dialog"
},
ZIndex=9999,
},{





af.UIElements.Main,



aa.NewRoundFrame(af.UICorner,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ThemeTag={
ImageColor3="Outline",
},
},{
ab("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

function af.Open(ag)
if not ae then
af.UIElements.FullScreen.Visible=true
af.UIElements.FullScreen.Active=true
end

task.spawn(function()
af.UIElements.MainContainer.Visible=true

if not ae then
ac(af.UIElements.FullScreen,0.1,{BackgroundTransparency=.3}):Play()
end
ac(af.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()


task.spawn(function()
task.wait(0.05)
af.UIElements.Main.Visible=true
end)
end)
end
function af.Close(ag)
if not ae then
ac(af.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
af.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(.1)
af.UIElements.FullScreen.Visible=false
end)
end
af.UIElements.Main.Visible=false

ac(af.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()



task.spawn(function()
task.wait(.1)
if not ae then
af.UIElements.FullScreen:Destroy()
else
af.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return af
end

return ad end function a.m()
local aa={}


local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween

local ae=a.load'j'.New
local af=a.load'k'.New

function aa.new(ag,ah,ai)
local aj=a.load'l'.Init(nil,ag.WindUI.ScreenGui.KeySystem)
local ak=aj.Create(true)

local al={}

local am

local an=(ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Width)or 200

local ao=430
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
ao=430+(an/2)
end

ak.UIElements.Main.AutomaticSize="Y"
ak.UIElements.Main.Size=UDim2.new(0,ao,0,0)

local ap

if ag.Icon then

ap=ab.Image(
ag.Icon,
ag.Title..":"..ag.Icon,
0,
"Temp",
"KeySystem",
ag.IconThemed
)
ap.Size=UDim2.new(0,24,0,24)
ap.LayoutOrder=-1
end

local aq=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=ag.Title,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})
local ar=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="Key System",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
TextTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=16
})

local as=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
ap,aq
})

local at=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





as,ar,
})

local au=af("Enter Key","key",nil,"Input",function(au)
am=au
end)

local av
if ag.KeySystem.Note and ag.KeySystem.Note~=""then
av=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ag.KeySystem.Note,
TextSize=18,
TextTransparency=.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local aw=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
})
})
})


local ax
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
local ay
if ag.KeySystem.Thumbnail.Title then
ay=ac("TextLabel",{
Text=ag.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
ax=ac("ImageLabel",{
Image=ag.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,an,1,-12),
Position=UDim2.new(0,6,0,6),
Parent=ak.UIElements.Main,
ScaleType="Crop"
},{
ay,
ac("UICorner",{
CornerRadius=UDim.new(0,20),
})
})
end

ac("Frame",{

Size=UDim2.new(1,ax and-an or 0,1,0),
Position=UDim2.new(0,ax and an or 0,0,0),
BackgroundTransparency=1,
Parent=ak.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
at,
av,
au,
aw,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})





local ay=ae("Exit","log-out",function()
ak:Close()()
end,"Tertiary",aw.Frame)

if ax then
ay.Parent=ax
ay.Size=UDim2.new(0,0,0,42)
ay.Position=UDim2.new(0,10,1,-10)
ay.AnchorPoint=Vector2.new(0,1)
end

if ag.KeySystem.URL then
ae("Get key","key",function()
setclipboard(ag.KeySystem.URL)
end,"Secondary",aw.Frame)
end

if ag.KeySystem.API then








local az=240
local aA=false
local aB=ae("Get key","key",nil,"Secondary",aw.Frame)

local aC=ab.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,1,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.9,
})

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=aB.Frame,
},{
aC,
ac("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
})
})

local aD=ab.Image(
"chevron-down",
"chevron-down",
0,
"Temp",
"KeySystem",
true
)

aD.Size=UDim2.new(1,0,1,0)

ac("Frame",{
Size=UDim2.new(0,21,0,21),
Parent=aB.Frame,
BackgroundTransparency=1,
},{
aD
})

local aE=ab.NewRoundFrame(15,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Background",
},
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,5),
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
}),
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
})
})

local b=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,az,0,0),
ClipsDescendants=true,
AnchorPoint=Vector2.new(1,0),
Parent=aB,
Position=UDim2.new(1,0,1,15)
},{
aE
})

ac("TextLabel",{
Text="Select Service",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
Parent=aE,
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
})
})

for e,g in next,ag.KeySystem.API do
local h=ag.WindUI.Services[g.Type]
if h then
local i={}
for j,l in next,h.Args do
table.insert(i,g[l])
end

local m=h.New(table.unpack(i))
m.Type=g.Type
table.insert(al,m)

local p=ab.Image(
g.Icon or h.Icon or Icons[g.Type]or"user",
g.Icon or h.Icon or Icons[g.Type]or"user",
0,
"Temp",
"KeySystem",
true
)
p.Size=UDim2.new(0,24,0,24)

local r=ab.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,0,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=1,
Parent=aE,
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,10),
VerticalAlignment="Center",
}),
p,
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,-34,0,0),
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
HorizontalAlignment="Center",
}),
ac("TextLabel",{
Text=g.Title or h.Name,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.05,
TextSize=18,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
}),
ac("TextLabel",{
Text=g.Desc or"",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
Visible=g.Desc and true or false,
TextXAlignment="Left",
})
})
},true)

ab.AddSignal(r.MouseEnter,function()
ad(r,0.08,{ImageTransparency=.95}):Play()
end)
ab.AddSignal(r.InputEnded,function()
ad(r,0.08,{ImageTransparency=1}):Play()
end)
ab.AddSignal(r.MouseButton1Click,function()
m.Copy()
ag.WindUI:Notify{
Title="Key System",
Content="Key link copied to clipboard.",
Image="key",
}
end)
end
end

ab.AddSignal(aB.MouseButton1Click,function()
if not aA then
ad(b,.3,{Size=UDim2.new(0,az,0,aE.AbsoluteSize.Y+1)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(aD,.3,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
else
ad(b,.25,{Size=UDim2.new(0,az,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(aD,.25,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
aA=not aA
end)

end

local function handleSuccess(az)
ak:Close()()
writefile((ag.Folder or ag.Title).."/"..ah..".key",tostring(az))
task.wait(.4)
ai(true)
end

local az=ae("Submit","arrow-right",function()
local az=tostring(am or"empty")local aA=
ag.Folder or ag.Title

if not ag.KeySystem.API then
local aB=type(ag.KeySystem.Key)=="table"
and table.find(ag.KeySystem.Key,az)
or ag.KeySystem.Key==az

if aB then
if ag.KeySystem.SaveKey then
handleSuccess(az)
else
ak:Close()()
task.wait(.4)
ai(true)
end
end
else
local aB,aC
for aD,aE in next,al do
local b,e=aE.Verify(az)
if b then
aB,aC=true,e
break
end
aC=e
end

if aB then
handleSuccess(az)
else
ag.WindUI:Notify{
Title="Key System. Error",
Content=aC,
Icon="triangle-alert",
}
end
end
end,"Primary",aw)

az.AnchorPoint=Vector2.new(1,0.5)
az.Position=UDim2.new(1,0,0.5,0)










ak:Open()
end

return aa end function a.n()


local function map(aa,ab,ac,ad,ae)
return(aa-ab)*(ae-ad)/(ac-ab)+ad
end

local function viewportPointToWorld(aa,ab)
local ac=game:GetService"Workspace".CurrentCamera:ScreenPointToRay(aa.X,aa.Y)
return ac.Origin+ac.Direction*ab
end

local function getOffset()
local aa=game:GetService"Workspace".CurrentCamera.ViewportSize.Y
return map(aa,0,2560,8,56)
end

return{viewportPointToWorld,getOffset}end function a.o()



local aa=a.load'a'
local ab=aa.New


local ac,ad=unpack(a.load'n')
local ae=Instance.new("Folder",game:GetService"Workspace".CurrentCamera)


local function createAcrylic()
local af=ab("Part",{
Name="Body",
Color=Color3.new(0,0,0),
Material=Enum.Material.Glass,
Size=Vector3.new(1,1,0),
Anchored=true,
CanCollide=false,
Locked=true,
CastShadow=false,
Transparency=0.98,
},{
ab("SpecialMesh",{
MeshType=Enum.MeshType.Brick,
Offset=Vector3.new(0,0,-1E-6),
}),
})

return af
end


local function createAcrylicBlur(af)
local ag={}

af=af or 0.001
local ah={
topLeft=Vector2.new(),
topRight=Vector2.new(),
bottomRight=Vector2.new(),
}
local ai=createAcrylic()
ai.Parent=ae

local function updatePositions(aj,ak)
ah.topLeft=ak
ah.topRight=ak+Vector2.new(aj.X,0)
ah.bottomRight=ak+aj
end

local function render()
local aj=game:GetService"Workspace".CurrentCamera
if aj then
aj=aj.CFrame
end
local ak=aj
if not ak then
ak=CFrame.new()
end

local al=ak
local am=ah.topLeft
local an=ah.topRight
local ao=ah.bottomRight

local ap=ac(am,af)
local aq=ac(an,af)
local ar=ac(ao,af)

local as=(aq-ap).Magnitude
local at=(aq-ar).Magnitude

ai.CFrame=
CFrame.fromMatrix((ap+ar)/2,al.XVector,al.YVector,al.ZVector)
ai.Mesh.Scale=Vector3.new(as,at,0)
end

local function onChange(aj)
local ak=ad()
local al=aj.AbsoluteSize-Vector2.new(ak,ak)
local am=aj.AbsolutePosition+Vector2.new(ak/2,ak/2)

updatePositions(al,am)
task.spawn(render)
end

local function renderOnChange()
local aj=game:GetService"Workspace".CurrentCamera
if not aj then
return
end

table.insert(ag,aj:GetPropertyChangedSignal"CFrame":Connect(render))
table.insert(ag,aj:GetPropertyChangedSignal"ViewportSize":Connect(render))
table.insert(ag,aj:GetPropertyChangedSignal"FieldOfView":Connect(render))
task.spawn(render)
end

ai.Destroying:Connect(function()
for aj,ak in ag do
pcall(function()
ak:Disconnect()
end)
end
end)

renderOnChange()

return onChange,ai
end

return function(af)
local ag={}
local ah,ai=createAcrylicBlur(af)

local aj=ab("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

aa.AddSignal(aj:GetPropertyChangedSignal"AbsolutePosition",function()
ah(aj)
end)

aa.AddSignal(aj:GetPropertyChangedSignal"AbsoluteSize",function()
ah(aj)
end)

ag.AddParent=function(ak)
aa.AddSignal(ak:GetPropertyChangedSignal"Visible",function()
ag.SetVisibility(ak.Visible)
end)
end

ag.SetVisibility=function(ak)
ai.Transparency=ak and 0.98 or 1
end

ag.Frame=aj
ag.Model=ai

return ag
end end function a.p()



local aa=a.load'a'
local ab=a.load'o'

local ac=aa.New

return function(ad)
local ae={}

ae.Frame=ac("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
},{












ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Name="Background",
ThemeTag={
BackgroundColor3="AcrylicMain",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{










}),

ac("ImageLabel",{
Image="rbxassetid://9968344105",
ImageTransparency=0.98,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("ImageLabel",{
Image="rbxassetid://9968344227",
ImageTransparency=0.9,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
ImageTransparency="AcrylicNoise",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ZIndex=2,
},{










}),
})


local af

task.wait()
if ad.UseAcrylic then
af=ab()

af.Frame.Parent=ae.Frame
ae.Model=af.Model
ae.AddParent=af.AddParent
ae.SetVisibility=af.SetVisibility
end

return ae,af
end end function a.q()



local aa={
AcrylicBlur=a.load'o',

AcrylicPaint=a.load'p',
}

function aa.init()
local ab=Instance.new"DepthOfFieldEffect"
ab.FarIntensity=0
ab.InFocusRadius=0.1
ab.NearIntensity=1

local ac={}

function aa.Enable()
for ad,ae in pairs(ac)do
ae.Enabled=false
end
ab.Parent=game:GetService"Lighting"
end

function aa.Disable()
for ad,ae in pairs(ac)do
ae.Enabled=ae.enabled
end
ab.Parent=nil
end

local function registerDefaults()
local function register(ad)
if ad:IsA"DepthOfFieldEffect"then
ac[ad]={enabled=ad.Enabled}
end
end

for ad,ae in pairs(game:GetService"Lighting":GetChildren())do
register(ae)
end

if game:GetService"Workspace".CurrentCamera then
for af,ag in pairs(game:GetService"Workspace".CurrentCamera:GetChildren())do
register(ag)
end
end
end

registerDefaults()
aa.Enable()
end

return aa end function a.r()

local aa={}

local ab=a.load'a'
local ac=ab.New local ad=
ab.Tween


function aa.new(ae)
local af={
Title=ae.Title or"Dialog",
Content=ae.Content,
Icon=ae.Icon,
IconThemed=ae.IconThemed,
Thumbnail=ae.Thumbnail,
Buttons=ae.Buttons,

IconSize=22,
}

local ag=a.load'l'.Init(nil,ae.WindUI.ScreenGui.Popups)
local ah=ag.Create(true)

local ai=200

local aj=430
if af.Thumbnail and af.Thumbnail.Image then
aj=430+(ai/2)
end

ah.UIElements.Main.AutomaticSize="Y"
ah.UIElements.Main.Size=UDim2.new(0,aj,0,0)



local ak

if af.Icon then
ak=ab.Image(
af.Icon,
af.Title..":"..af.Icon,
0,
ae.WindUI.Window,
"Popup",
true,
ae.IconThemed
)
ak.Size=UDim2.new(0,af.IconSize,0,af.IconSize)
ak.LayoutOrder=-1
end


local al=ac("TextLabel",{
AutomaticSize="Y",
BackgroundTransparency=1,
Text=af.Title,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20,
TextWrapped=true,
Size=UDim2.new(1,ak and-af.IconSize-14 or 0,0,0)
})

local am=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
ak,al
})

local an=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





am,
})

local ao
if af.Content and af.Content~=""then
ao=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=af.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ap=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local aq
if af.Thumbnail and af.Thumbnail.Image then
local ar
if af.Thumbnail.Title then
ar=ac("TextLabel",{
Text=af.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
aq=ac("ImageLabel",{
Image=af.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ai,1,0),
Parent=ah.UIElements.Main,
ScaleType="Crop"
},{
ar,
ac("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ac("Frame",{

Size=UDim2.new(1,aq and-ai or 0,1,0),
Position=UDim2.new(0,aq and ai or 0,0,0),
BackgroundTransparency=1,
Parent=ah.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
an,
ao,
ap,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local ar=a.load'j'.New

for as,at in next,af.Buttons do
ar(at.Title,at.Icon,at.Callback,at.Variant,ap,ah)
end

ah:Open()


return af
end

return aa end function a.s()
local aa={}

local ab=a.load'a'
local ac=ab.New local ad=
ab.Tween


function aa.New(ae,af,ag)
local ah=10
local ai
if af and af~=""then
ai=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local aj=ac("TextLabel",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ai and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3="Text",
},
Text=ae,
})

local ak=ac("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
Text="",
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(ah,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
ab.NewRoundFrame(ah,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
},{
ac("UIGradient",{
Rotation=70,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),
ab.NewRoundFrame(ah,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ai,
aj,
})
})
})

return ak
end


return aa end function a.t()
local aa={}

local ab=game:GetService"UserInputService"

local ac=a.load'a'
local ad=ac.New local ae=
ac.Tween


function aa.New(af,ag,ah,ai)
local aj=ad("Frame",{
Size=UDim2.new(0,ai,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=ag,
ZIndex=999,
Active=true,
})

local ak=ac.NewRoundFrame(ai/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=aj,
})

local al=ad("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=ak,
})

local am=false
local an=0

local function updateSliderSize()
local ao=af
local ap=ao.AbsoluteCanvasSize.Y
local aq=ao.AbsoluteWindowSize.Y

if ap<=aq then
ak.Visible=false
return
end

local ar=math.clamp(aq/ap,0.1,1)
ak.Size=UDim2.new(1,0,ar,0)
ak.Visible=true
end

local function updateScrollingFramePosition()
local ao=ak.Position.Y.Scale
local ap=af.AbsoluteCanvasSize.Y
local aq=af.AbsoluteWindowSize.Y
local ar=math.max(ap-aq,0)

if ar<=0 then return end

local as=math.max(1-ak.Size.Y.Scale,0)
if as<=0 then return end

local at=ao/as

af.CanvasPosition=Vector2.new(
af.CanvasPosition.X,
at*ar
)
end

local function updateThumbPosition()
if am then return end

local ao=af.CanvasPosition.Y
local ap=af.AbsoluteCanvasSize.Y
local aq=af.AbsoluteWindowSize.Y
local ar=math.max(ap-aq,0)

if ar<=0 then
ak.Position=UDim2.new(0,0,0,0)
return
end

local as=ao/ar
local at=math.max(1-ak.Size.Y.Scale,0)
local au=math.clamp(as*at,0,at)

ak.Position=UDim2.new(0,0,au,0)
end

ac.AddSignal(aj.InputBegan,function(ao)
if(ao.UserInputType==Enum.UserInputType.MouseButton1 or ao.UserInputType==Enum.UserInputType.Touch)then
local ap=ak.AbsolutePosition.Y
local aq=ap+ak.AbsoluteSize.Y

if not(ao.Position.Y>=ap and ao.Position.Y<=aq)then
local ar=aj.AbsolutePosition.Y
local as=aj.AbsoluteSize.Y
local at=ak.AbsoluteSize.Y

local au=ao.Position.Y-ar-at/2
local av=as-at

local aw=math.clamp(au/av,0,1-ak.Size.Y.Scale)

ak.Position=UDim2.new(0,0,aw,0)
updateScrollingFramePosition()
end
end
end)

ac.AddSignal(al.InputBegan,function(ao)
if ao.UserInputType==Enum.UserInputType.MouseButton1 or ao.UserInputType==Enum.UserInputType.Touch then
am=true
an=ao.Position.Y-ak.AbsolutePosition.Y

local ap
local aq

ap=ab.InputChanged:Connect(function(ar)
if ar.UserInputType==Enum.UserInputType.MouseMovement or ar.UserInputType==Enum.UserInputType.Touch then
local as=aj.AbsolutePosition.Y
local at=aj.AbsoluteSize.Y
local au=ak.AbsoluteSize.Y

local av=ar.Position.Y-as-an
local aw=at-au

local ax=math.clamp(av/aw,0,1-ak.Size.Y.Scale)

ak.Position=UDim2.new(0,0,ax,0)
updateScrollingFramePosition()
end
end)

aq=ab.InputEnded:Connect(function(ar)
if ar.UserInputType==Enum.UserInputType.MouseButton1 or ar.UserInputType==Enum.UserInputType.Touch then
am=false
if ap then ap:Disconnect()end
if aq then aq:Disconnect()end
end
end)
end
end)

ac.AddSignal(af:GetPropertyChangedSignal"AbsoluteWindowSize",function()
updateSliderSize()
updateThumbPosition()
end)

ac.AddSignal(af:GetPropertyChangedSignal"AbsoluteCanvasSize",function()
updateSliderSize()
updateThumbPosition()
end)

ac.AddSignal(af:GetPropertyChangedSignal"CanvasPosition",function()
if not am then
updateThumbPosition()
end
end)

updateSliderSize()
updateThumbPosition()

return aj
end


return aa end function a.u()
local aa={}


local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween

local function Color3ToHSB(ae)
local af,ag,ah=ae.R,ae.G,ae.B
local ai=math.max(af,ag,ah)
local aj=math.min(af,ag,ah)
local ak=ai-aj

local al=0
if ak~=0 then
if ai==af then
al=(ag-ah)/ak%6
elseif ai==ag then
al=(ah-af)/ak+2
else
al=(af-ag)/ak+4
end
al=al*60
else
al=0
end

local am=(ai==0)and 0 or(ak/ai)
local an=ai

return{
h=math.floor(al+0.5),
s=am,
b=an
}
end

local function GetPerceivedBrightness(ae)
local af=ae.R
local ag=ae.G
local ah=ae.B
return 0.299*af+0.587*ag+0.114*ah
end

local function GetTextColorForHSB(ae)
local af=Color3ToHSB(ae)local
ag, ah, ai=af.h, af.s, af.b
if GetPerceivedBrightness(ae)>0.5 then
return Color3.fromHSV(ag/360,0,0.05)
else
return Color3.fromHSV(ag/360,0,0.98)
end
end

local function GetAverageColor(ae)
local af,ag,ah=0,0,0
local ai=ae.Color.Keypoints
for aj,ak in ipairs(ai)do

af=af+ak.Value.R
ag=ag+ak.Value.G
ah=ah+ak.Value.B
end
local al=#ai
return Color3.new(af/al,ag/al,ah/al)
end


function aa.New(ae,af,ag)
local ah={
Title=af.Title or"Tag",
Color=af.Color or Color3.fromHex"#315dff",
Radius=af.Radius or 999,

TagFrame=nil,
Height=26,
Padding=10,
TextSize=14,
}

local ai=ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ah.TextSize,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ah.Title,
TextColor3=typeof(ah.Color)=="Color3"and GetTextColorForHSB(ah.Color)or nil,
})

local aj

if typeof(ah.Color)=="table"then

aj=ac"UIGradient"
for ak,al in next,ah.Color do
aj[ak]=al
end

ai.TextColor3=GetTextColorForHSB(GetAverageColor(aj))
end



local ak=ab.NewRoundFrame(ah.Radius,"Squircle",{
AutomaticSize="X",
Size=UDim2.new(0,0,0,ah.Height),
Parent=ag,
ImageColor3=typeof(ah.Color)=="Color3"and ah.Color or Color3.new(1,1,1),
},{
aj,
ac("UIPadding",{
PaddingLeft=UDim.new(0,ah.Padding),
PaddingRight=UDim.new(0,ah.Padding),
}),
ai,
ac("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
})
})


function ah.SetTitle(al,am)
ah.Title=am
ai.Text=am
end

function ah.SetColor(al,am)
ah.Color=am
if typeof(am)=="table"then
local an=GetAverageColor(am)
ad(ai,.06,{TextColor3=GetTextColorForHSB(an)}):Play()
local ao=ak:FindFirstChildOfClass"UIGradient"or ac("UIGradient",{Parent=ak})
for ap,aq in next,am do ao[ap]=aq end
ad(ak,.06,{ImageColor3=Color3.new(1,1,1)}):Play()
else
if aj then
aj:Destroy()
end
ad(ai,.06,{TextColor3=GetTextColorForHSB(am)}):Play()
ad(ak,.06,{ImageColor3=am}):Play()
end
end


return ah
end


return aa end function a.v()

local aa=game:GetService"HttpService"

local ab

local ac
ac={

Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Default:ToHex(),
transparency=ad.Transparency or nil,
}
end,
Load=function(ad,ae)
if ad then
ad:Update(Color3.fromHex(ae.value),ae.transparency or nil)
end
end
},
Dropdown={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value,
}
end,
Load=function(ad,ae)
if ad then
ad:Select(ae.value)
end
end
},
Input={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value,
}
end,
Load=function(ad,ae)
if ad then
ad:Set(ae.value)
end
end
},
Keybind={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value,
}
end,
Load=function(ad,ae)
if ad then
ad:Set(ae.value)
end
end
},
Slider={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value.Default,
}
end,
Load=function(ad,ae)
if ad then
ad:Set(ae.value)
end
end
},
Toggle={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value,
}
end,
Load=function(ad,ae)
if ad then
ad:Set(ae.value)
end
end
},
}
}

function ac.Init(ad,ae)
if not ae.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
return false
end

ab=ae
ac.Folder=ab.Folder
ac.Path="WindUI/"..tostring(ac.Folder).."/config/"

if not isfolder("WindUI/"..ac.Folder)then
makefolder("WindUI/"..ac.Folder)
if not isfolder("WindUI/"..ac.Folder.."/config/")then
makefolder("WindUI/"..ac.Folder.."/config/")
end
end

local af=ac:AllConfigs()

for ag,ah in next,af do
if isfile(ah..".json")then
ac.Configs[ah]=readfile(ah..".json")
end
end


return ac
end

function ac.CreateConfig(ad,ae)
local af={
Path=ac.Path..ae..".json",
Elements={},
CustomData={},
Version=1.1
}

if not ae then
return false,"No config file is selected"
end

function af.Register(ag,ah,ai)
af.Elements[ah]=ai
end

function af.Set(ag,ah,ai)
af.CustomData[ah]=ai
end

function af.Get(ag,ah)
return af.CustomData[ah]
end

function af.Save(ag)
local ah={
__version=af.Version,
__elements={},
__custom=af.CustomData
}

for ai,aj in next,af.Elements do
if ac.Parser[aj.__type]then
ah.__elements[tostring(ai)]=ac.Parser[aj.__type].Save(aj)
end
end

local ak=aa:JSONEncode(ah)
writefile(af.Path,ak)

return ah
end

function af.Load(ag)
if not isfile(af.Path)then
return false,"Config file does not exist"
end

local ah,ai=pcall(function()
return aa:JSONDecode(readfile(af.Path))
end)

if not ah then
return false,"Failed to parse config file"
end

if not ai.__version then
local aj={
__version=af.Version,
__elements=ai,
__custom={}
}
ai=aj
end

for aj,ak in next,(ai.__elements or{})do
if af.Elements[aj]and ac.Parser[ak.__type]then
task.spawn(function()
ac.Parser[ak.__type].Load(af.Elements[aj],ak)
end)
end
end

af.CustomData=ai.__custom or{}

return af.CustomData
end

function af.GetData(ag)
return{
elements=af.Elements,
custom=af.CustomData
}
end

ac.Configs[ae]=af
return af
end

function ac.AllConfigs(ad)
if not listfiles then return{}end

local ae={}
if not isfolder(ac.Path)then
makefolder(ac.Path)
return ae
end

for af,ag in next,listfiles(ac.Path)do
local ah=ag:match"([^\\/]+)%.json$"
if ah then
table.insert(ae,ah)
end
end

return ae
end

function ac.GetConfig(ad,ae)
return ac.Configs[ae]
end

return ac end function a.w()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween

game:GetService"UserInputService"


function aa.New(ae)
local af={
Button=nil
}

local ag













local ah=ac("TextLabel",{
Text=ae.Title,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

local ai=ac("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
ac("ImageLabel",{
Image=ab.Icon"move"[1],
ImageRectOffset=ab.Icon"move"[2].ImageRectPosition,
ImageRectSize=ab.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
})
})
local aj=ac("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

local ak=ac("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=ae.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})
local al=ac("TextButton",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=ak,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{



ac("UICorner",{
CornerRadius=UDim.new(1,0)
}),
ac("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
ac("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
ai,
aj,

ac("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

ac("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
ag,
ac("UIListLayout",{
Padding=UDim.new(0,ae.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ah,
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

af.Button=al



function af.SetIcon(am,an)
if ag then
ag:Destroy()
end
if an then
ag=ab.Image(
an,
ae.Title,
0,
ae.Folder,
"OpenButton",
true,
ae.IconThemed
)
ag.Size=UDim2.new(0,22,0,22)
ag.LayoutOrder=-1
ag.Parent=af.Button.TextButton
end
end

if ae.Icon then
af:SetIcon(ae.Icon)
end



ab.AddSignal(al:GetPropertyChangedSignal"AbsoluteSize",function()
ak.Size=UDim2.new(
0,al.AbsoluteSize.X,
0,al.AbsoluteSize.Y
)
end)

ab.AddSignal(al.TextButton.MouseEnter,function()
ad(al.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
ab.AddSignal(al.TextButton.MouseLeave,function()
ad(al.TextButton,.1,{BackgroundTransparency=1}):Play()
end)

local am=ab.Drag(ak)


function af.Visible(an,ao)
ak.Visible=ao
end

function af.Edit(an,ao)
local ap={
Title=ao.Title,
Icon=ao.Icon,
Enabled=ao.Enabled,
Position=ao.Position,
Draggable=ao.Draggable,
OnlyMobile=ao.OnlyMobile,
CornerRadius=ao.CornerRadius or UDim.new(1,0),
StrokeThickness=ao.StrokeThickness or 2,
Color=ao.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if ap.Enabled==false then
ae.IsOpenButtonEnabled=false
end

if ap.OnlyMobile~=false then
ap.OnlyMobile=true
else
ae.IsPC=false
end

if ap.Draggable==false and ai and aj then
ai.Visible=ap.Draggable
aj.Visible=ap.Draggable

if am then
am:Set(ap.Draggable)
end
end

if ap.Position and ak then
ak.Position=ap.Position
end





if ah then
if ap.Title then
ah.Text=ap.Title
ab:ChangeTranslationKey(ah,ap.Title)
elseif ap.Title==nil then

end
end

if ap.Icon then
af:SetIcon(ap.Icon)
end

al.UIStroke.UIGradient.Color=ap.Color
if Glow then
Glow.UIGradient.Color=ap.Color
end

al.UICorner.CornerRadius=ap.CornerRadius
al.TextButton.UICorner.CornerRadius=UDim.new(ap.CornerRadius.Scale,ap.CornerRadius.Offset-4)
al.UIStroke.Thickness=ap.StrokeThickness
end

return af
end



return aa end function a.x()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af)
local ag={
Container=nil,
ToolTipSize=16,
}

local ah=ac("TextLabel",{
AutomaticSize="XY",
TextWrapped=true,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Text=ae,
TextSize=17,
TextTransparency=1,
ThemeTag={
TextColor3="Text",
}
})

local ai=ac("UIScale",{
Scale=.9
})

local aj=ac("Frame",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=af,

Visible=false
},{
ac("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
ac("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=false
},{
ac("ImageLabel",{
Size=UDim2.new(0,ag.ToolTipSize,0,ag.ToolTipSize/2),
BackgroundTransparency=1,
Rotation=180,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Accent",
},
},{
ac("ImageLabel",{
Size=UDim2.new(0,ag.ToolTipSize,0,ag.ToolTipSize/2),
BackgroundTransparency=1,
LayoutOrder=99,
ImageTransparency=.9,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Text",
},
}),
}),
}),
ab.NewRoundFrame(14,"Squircle",{
AutomaticSize="XY",
ThemeTag={
ImageColor3="Accent",
},
ImageTransparency=1,
Name="Background",
},{



ac("Frame",{
ThemeTag={
BackgroundColor3="Text",
},
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

ah,
ac("UIPadding",{
PaddingTop=UDim.new(0,12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
}),
})
}),
ai,
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
ag.Container=aj

function ag.Open(ak)
aj.Visible=true


ad(aj.Background,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ah,.2,{TextTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ai,.18,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function ag.Close(ak)

ad(aj.Background,.3,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ah,.3,{TextTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ai,.35,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.35)

aj.Visible=false
aj:Destroy()
end

return ag
end



return aa end function a.y()
local aa=a.load'a'
local ab=aa.New
local ac=aa.NewRoundFrame
local ad=aa.Tween

game:GetService"UserInputService"


local function Color3ToHSB(ae)
local af,ag,ah=ae.R,ae.G,ae.B
local ai=math.max(af,ag,ah)
local aj=math.min(af,ag,ah)
local ak=ai-aj

local al=0
if ak~=0 then
if ai==af then
al=(ag-ah)/ak%6
elseif ai==ag then
al=(ah-af)/ak+2
else
al=(af-ag)/ak+4
end
al=al*60
else
al=0
end

local am=(ai==0)and 0 or(ak/ai)
local an=ai

return{
h=math.floor(al+0.5),
s=am,
b=an
}
end

local function GetPerceivedBrightness(ae)
local af=ae.R
local ag=ae.G
local ah=ae.B
return 0.299*af+0.587*ag+0.114*ah
end

local function GetTextColorForHSB(ae)
local af=Color3ToHSB(ae)local
ag, ah, ai=af.h, af.s, af.b
if GetPerceivedBrightness(ae)>0.5 then
return Color3.fromHSV(ag/360,0,0.05)
else
return Color3.fromHSV(ag/360,0,0.98)
end
end


local function getElementPosition(ae,af)
if type(af)~="number"or af~=math.floor(af)then
return nil,1
end






local ag=#ae


if ag==0 or af<1 or af>ag then
return nil,2
end

local function isDelimiter(ah)
if ah==nil then return true end
local ai=ah.__type
return ai=="Divider"or ai=="Space"or ai=="Section"or ai=="Code"
end

if isDelimiter(ae[af])then
return nil,3
end

local function calculate(ah,ai)
if ai==1 then return"Squircle"end
if ah==1 then return"Squircle-TL-TR"end
if ah==ai then return"Squircle-BL-BR"end
return"Square"
end

local ah=1
local ai=0

for aj=1,ag do
local ak=ae[aj]
if isDelimiter(ak)then
if af>=ah and af<=aj-1 then
local al=af-ah+1
return calculate(al,ai)
end
ah=aj+1
ai=0
else
ai=ai+1
end
end


if af>=ah and af<=ag then
local aj=af-ah+1
return calculate(aj,ai)
end

return nil,4
end


return function(ae)
local af={
Title=ae.Title,
Desc=ae.Desc or nil,
Hover=ae.Hover,
Thumbnail=ae.Thumbnail,
ThumbnailSize=ae.ThumbnailSize or 80,
Image=ae.Image,
IconThemed=ae.IconThemed or false,
ImageSize=ae.ImageSize or 30,
Color=ae.Color,
Scalable=ae.Scalable,
Parent=ae.Parent,
UIPadding=ae.Window.NewElements and 10 or 13,
UICorner=ae.Window.NewElements and 23 or 12,
UIElements={},

Index=ae.Index
}

local ag=af.ImageSize
local ah=af.ThumbnailSize
local ai=true


local aj=0

local ak
local al
if af.Thumbnail then
ak=aa.Image(
af.Thumbnail,
af.Title,
af.UICorner-3,
ae.Window.Folder,
"Thumbnail",
false,
af.IconThemed
)
ak.Size=UDim2.new(1,0,0,ah)
end
if af.Image then
al=aa.Image(
af.Image,
af.Title,
af.UICorner-3,
ae.Window.Folder,
"Image",
not af.Color and true or false
)
if typeof(af.Color)=="string"then
al.ImageLabel.ImageColor3=GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
elseif typeof(af.Color)=="Color3"then
al.ImageLabel.ImageColor3=GetTextColorForHSB(af.Color)
end

al.Size=UDim2.new(0,ag,0,ag)

aj=ag
end

local function CreateText(am,an)
local ao=typeof(af.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
or typeof(af.Color)=="Color3"
and GetTextColorForHSB(af.Color)

return ab("TextLabel",{
BackgroundTransparency=1,
Text=am or"",
TextSize=an=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not af.Color and"Text"or nil,
},
TextColor3=af.Color and ao or nil,
TextTransparency=an=="Desc"and.3 or 0,
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(aa.Font,an=="Desc"and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold)
})
end

local am=CreateText(af.Title,"Title")
local an=CreateText(af.Desc,"Desc")
if not af.Desc or af.Desc==""then
an.Visible=false
end

af.UIElements.Container=ab("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Vertical",
VerticalAlignment=ae.Window.NewElements and"Top"or"Center",
HorizontalAlignment="Left",
}),
ak,
ab("Frame",{
Size=UDim2.new(1,-ae.TextOffset,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Horizontal",
VerticalAlignment=ae.Window.NewElements and"Top"or"Center",
HorizontalAlignment="Left",
}),
al,
ab("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,-aj,1,0)
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,ae.Window.NewElements and af.UIPadding/2 or 0),
PaddingLeft=UDim.new(0,ae.Window.NewElements and af.UIPadding/2 or 0),
PaddingRight=UDim.new(0,ae.Window.NewElements and af.UIPadding/2 or 0),
PaddingBottom=UDim.new(0,ae.Window.NewElements and af.UIPadding/2 or 0),
}),
ab("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
am,
an
}),
})
})






local ao=aa.Image(
"lock",
"lock",
0,
ae.Window.Folder,
"Lock",
false
)
ao.Size=UDim2.new(0,20,0,20)
ao.ImageLabel.ImageColor3=Color3.new(1,1,1)
ao.ImageLabel.ImageTransparency=.4

local ap=ab("TextLabel",{
Text="Locked",
TextSize=18,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
AutomaticSize="XY",
BackgroundTransparency=1,
TextColor3=Color3.new(1,1,1),
TextTransparency=.05,
})

local aq,ar=ac(af.UICorner,"Squircle",{
Size=UDim2.new(1,af.UIPadding*2,1,af.UIPadding*2),
ImageTransparency=.25,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
ZIndex=9999999,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8)
}),
ao,ap
},nil,true)

local as,at=ac(af.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ImageTransparency=af.Color and.05 or.93,



Parent=ae.Parent,
ThemeTag={
ImageColor3=not af.Color and"Text"or nil
},
ImageColor3=af.Color and
(
typeof(af.Color)=="string"
and Color3.fromHex(aa.Colors[af.Color])
or typeof(af.Color)=="Color3"
and af.Color
)or nil
},{
af.UIElements.Container,
aq,
ab("UIPadding",{
PaddingTop=UDim.new(0,af.UIPadding),
PaddingLeft=UDim.new(0,af.UIPadding),
PaddingRight=UDim.new(0,af.UIPadding),
PaddingBottom=UDim.new(0,af.UIPadding),
}),
},true,true)

af.UIElements.Main=as
af.UIElements.Locked=aq

if af.Hover then
aa.AddSignal(as.MouseEnter,function()
if ai then
ad(as,.05,{ImageTransparency=af.Color and.15 or.9}):Play()
end
end)
aa.AddSignal(as.InputEnded,function()
if ai then
ad(as,.05,{ImageTransparency=af.Color and.05 or.93}):Play()
end
end)
end

function af.SetTitle(au,av)
af.Title=av
am.Text=av
end

function af.SetDesc(au,av)
af.Desc=av
an.Text=av or""
if not av then
an.Visible=false
elseif not an.Visible then
an.Visible=true
end
end

if ae.ElementTable then
aa.AddSignal(am:GetPropertyChangedSignal"Text",function()
if af.Title~=am.Text then
af:SetTitle(am.Text)
ae.ElementTable.Title=am.Text
end
end)
aa.AddSignal(an:GetPropertyChangedSignal"Text",function()
if af.Desc~=an.Text then
af:SetDesc(an.Text)
ae.ElementTable.Desc=an.Text
end
end)
end





function af.Destroy(au)
as:Destroy()
end


function af.Lock(au)
ai=false
aq.Active=true
aq.Visible=true
end

function af.Unlock(au)
ai=true
aq.Active=false
aq.Visible=false
end

function af.UpdateShape(au)
if ae.Window.NewElements then
local av=getElementPosition(au.Elements,af.Index)
if av and as then
at:SetType(av)
ar:SetType(av)
end
end
end





return af
end end function a.z()
local aa=a.load'a'
local ab=aa.New

local ac={}

local ad=a.load'j'.New

function ac.New(ae,af)
af.Hover=false
af.TextOffset=0
af.IsButtons=af.Buttons and#af.Buttons>0 and true or false

local ag={
__type="Paragraph",
Title=af.Title or"Paragraph",
Desc=af.Desc or nil,

Locked=af.Locked or false,
}
local ah=a.load'y'(af)

ag.ParagraphFrame=ah
if af.Buttons and#af.Buttons>0 then
local ai=ab("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=ah.UIElements.Container
},{
ab("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
})
})


for aj,ak in next,af.Buttons do
local al=ad(ak.Title,ak.Icon,ak.Callback,"White",ai)
al.Size=UDim2.new(1,0,0,38)

end
end

return ag.__type,ag

end

return ac end function a.A()
local aa=a.load'a'local ab=
aa.New

local ac={}

function ac.New(ad,ae)
local af={
__type="Button",
Title=ae.Title or"Button",
Desc=ae.Desc or nil,
Icon=ae.Icon or"mouse-pointer-click",
IconThemed=ae.IconThemed or false,
Locked=ae.Locked or false,
Callback=ae.Callback or function()end,
UIElements={}
}

local ag=true

af.ButtonFrame=a.load'y'{
Title=af.Title,
Desc=af.Desc,
Parent=ae.Parent,




Window=ae.Window,
TextOffset=20,
Hover=true,
Scalable=true,
Tab=ae.Tab,
Index=ae.Index,
ElementTable=af,
}














af.UIElements.ButtonIcon=aa.Image(
af.Icon,
af.Icon,
0,
ae.Window.Folder,
"Button",
true,
af.IconThemed
)
af.UIElements.ButtonIcon.Size=UDim2.new(0,20,0,20)
af.UIElements.ButtonIcon.Parent=af.ButtonFrame.UIElements.Main
af.UIElements.ButtonIcon.AnchorPoint=Vector2.new(1,0.5)
af.UIElements.ButtonIcon.Position=UDim2.new(1,0,0.5,0)

function af.Lock(ah)
af.Locked=true
ag=false
return af.ButtonFrame:Lock()
end
function af.Unlock(ah)
af.Locked=false
ag=true
return af.ButtonFrame:Unlock()
end

if af.Locked then
af:Lock()
end

aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if ag then
task.spawn(function()
aa.SafeCallback(af.Callback)
end)
end
end)
return af.__type,af
end

return ac end function a.B()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah)
local ai={}


local aj=13
local ak
if af and af~=""then
ak=ac("ImageLabel",{
Size=UDim2.new(1,-7,1,-7),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(af)[1],
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local al=ab.NewRoundFrame(aj,"Squircle",{
ImageTransparency=.93,
ThemeTag={
ImageColor3="Text"
},
Parent=ag,
Size=UDim2.new(0,41.6,0,26),
},{
ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(aj,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),


ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(0,3,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=0,
ImageColor3=Color3.new(1,1,1),



Name="Frame",
},{
ak,
})
})

function ai.Set(am,an,ao)
if an then
ad(al.Frame,0.1,{
Position=UDim2.new(1,-22,0.5,0),

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al.Layer,0.1,{
ImageTransparency=0,
}):Play()
ad(al.Stroke,0.1,{
ImageTransparency=0.95,
}):Play()

if ak then
ad(ak,0.1,{
ImageTransparency=0,
}):Play()
end
else
ad(al.Frame,0.1,{
Position=UDim2.new(0,4,0.5,0),
Size=UDim2.new(0,18,0,18),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al.Layer,0.1,{
ImageTransparency=1,
}):Play()
ad(al.Stroke,0.1,{
ImageTransparency=1,
}):Play()

if ak then
ad(ak,0.1,{
ImageTransparency=1,
}):Play()
end
end

if ao~=false then ao=true end

task.spawn(function()
if ah and ao then
ab.SafeCallback(ah,an)
end
end)


end

return al,ai
end


return aa end function a.C()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah)
local ai={}

af=af or"check"

local aj=10
local ak=ac("ImageLabel",{
Size=UDim2.new(1,-10,1,-10),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(af)[1],
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(1,1,1),
})

local al=ab.NewRoundFrame(aj,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=ag,
Size=UDim2.new(0,27,0,27),
},{
ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(aj,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),

ak,
})

function ai.Set(am,an)
if an then
ad(al.Layer,0.06,{
ImageTransparency=0,
}):Play()
ad(al.Stroke,0.06,{
ImageTransparency=0.95,
}):Play()
ad(ak,0.06,{
ImageTransparency=0,
}):Play()
else
ad(al.Layer,0.05,{
ImageTransparency=1,
}):Play()
ad(al.Stroke,0.05,{
ImageTransparency=1,
}):Play()
ad(ak,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if ah then
ab.SafeCallback(ah,an)
end
end)
end

return al,ai
end


return aa end function a.D()
local aa=a.load'a'local ab=
aa.New local ac=
aa.Tween

local ad=a.load'B'.New
local ae=a.load'C'.New

local af={}

function af.New(ag,ah)
local ai={
__type="Toggle",
Title=ah.Title or"Toggle",
Desc=ah.Desc or nil,
Locked=ah.Locked or false,
Value=ah.Value,
Icon=ah.Icon or nil,
Type=ah.Type or"Toggle",
Callback=ah.Callback or function()end,
UIElements={}
}
ai.ToggleFrame=a.load'y'{
Title=ai.Title,
Desc=ai.Desc,




Window=ah.Window,
Parent=ah.Parent,
TextOffset=44,
Hover=false,
Tab=ah.Tab,
Index=ah.Index,
ElementTable=ai,
}

local aj=true

if ai.Value==nil then
ai.Value=false
end



function ai.Lock(ak)
ai.Locked=true
aj=false
return ai.ToggleFrame:Lock()
end
function ai.Unlock(ak)
ai.Locked=false
aj=true
return ai.ToggleFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

local ak=ai.Value

local al,am
if ai.Type=="Toggle"then
al,am=ad(ak,ai.Icon,ai.ToggleFrame.UIElements.Main,ai.Callback)
elseif ai.Type=="Checkbox"then
al,am=ae(ak,ai.Icon,ai.ToggleFrame.UIElements.Main,ai.Callback)
else
error("Unknown Toggle Type: "..tostring(ai.Type))
end

al.AnchorPoint=Vector2.new(1,0)
al.Position=UDim2.new(1,0,0,0)

function ai.Set(an,ao,ap)
if aj then
am:Set(ao,ap)
ak=ao
ai.Value=ao
end
end

ai:Set(ak,false)

aa.AddSignal(ai.ToggleFrame.UIElements.Main.MouseButton1Click,function()
ai:Set(not ak)
end)

return ai.__type,ai
end

return af end function a.E()
local aa=a.load'a'
local ac=aa.New
local ad=aa.Tween

local ae={}

local af=false

function ae.New(ag,ah)
local ai={
__type="Slider",
Title=ah.Title or"Slider",
Desc=ah.Desc or nil,
Locked=ah.Locked or nil,
Value=ah.Value or{},
Step=ah.Step or 1,
Callback=ah.Callback or function()end,
UIElements={},
IsFocusing=false,

Width=130,
TextBoxWidth=30,
}
local aj
local ak
local al
local am=ai.Value.Default or ai.Value.Min or 0

local an=am
local ao=(am-(ai.Value.Min or 0))/((ai.Value.Max or 100)-(ai.Value.Min or 0))

local ap=true
local aq=ai.Step%1~=0

local function FormatValue(ar)
if aq then
return string.format("%.2f",ar)
else
return tostring(math.floor(ar+0.5))
end
end

local function CalculateValue(ar)
if aq then
return math.floor(ar/ai.Step+0.5)*ai.Step
else
return math.floor(ar/ai.Step+0.5)*ai.Step
end
end

ai.SliderFrame=a.load'y'{
Title=ai.Title,
Desc=ai.Desc,
Parent=ah.Parent,
TextOffset=ai.Width,
Hover=false,
Tab=ah.Tab,
Index=ah.Index,
Window=ah.Window,
ElementTable=ai,
}

ai.UIElements.SliderIcon=aa.NewRoundFrame(99,"Squircle",{
ImageTransparency=.95,
Size=UDim2.new(1,-ai.TextBoxWidth-8,0,4),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
aa.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(ao,0,1,0),
ImageTransparency=.1,
ThemeTag={
ImageColor3="Button",
},
},{
aa.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,13,0,13),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Text",
},
})
})
})

ai.UIElements.SliderContainer=ac("Frame",{
Size=UDim2.new(0,ai.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,0,.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Parent=ai.SliderFrame.UIElements.Main,
},{
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ai.UIElements.SliderIcon,
ac("TextBox",{
Size=UDim2.new(0,ai.TextBoxWidth,0,0),
TextXAlignment="Left",
Text=FormatValue(am),
ThemeTag={
TextColor3="Text"
},
TextTransparency=.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
})
})

function ai.Lock(ar)
ai.Locked=true
ap=false
return ai.SliderFrame:Lock()
end
function ai.Unlock(ar)
ai.Locked=false
ap=true
return ai.SliderFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

local ar=ai.SliderFrame.Parent:IsA"ScrollingFrame"and ai.SliderFrame.Parent or ai.SliderFrame.Parent.Parent.Parent

function ai.Set(as,at,au)
if ap then
if not ai.IsFocusing and not af and(not au or(au.UserInputType==Enum.UserInputType.MouseButton1 or au.UserInputType==Enum.UserInputType.Touch))then
at=math.clamp(at,ai.Value.Min or 0,ai.Value.Max or 100)

local av=math.clamp((at-(ai.Value.Min or 0))/((ai.Value.Max or 100)-(ai.Value.Min or 0)),0,1)
at=CalculateValue(ai.Value.Min+av*(ai.Value.Max-ai.Value.Min))

if at~=an then
ad(ai.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(av,0,1,0)}):Play()
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(at)
ai.Value.Default=FormatValue(at)
an=at
aa.SafeCallback(ai.Callback,FormatValue(at))
end

if au then
aj=(au.UserInputType==Enum.UserInputType.Touch)
ar.ScrollingEnabled=false
af=true
ak=game:GetService"RunService".RenderStepped:Connect(function()
local aw=aj and au.Position.X or game:GetService"UserInputService":GetMouseLocation().X
local ax=math.clamp((aw-ai.UIElements.SliderIcon.AbsolutePosition.X)/ai.UIElements.SliderIcon.AbsoluteSize.X,0,1)
at=CalculateValue(ai.Value.Min+ax*(ai.Value.Max-ai.Value.Min))

if at~=an then
ad(ai.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(ax,0,1,0)}):Play()
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(at)
ai.Value.Default=FormatValue(at)
an=at
aa.SafeCallback(ai.Callback,FormatValue(at))
end
end)
al=game:GetService"UserInputService".InputEnded:Connect(function(aw)
if(aw.UserInputType==Enum.UserInputType.MouseButton1 or aw.UserInputType==Enum.UserInputType.Touch)and au==aw then
ak:Disconnect()
al:Disconnect()
af=false
ar.ScrollingEnabled=true
end
end)
end
end
end
end

aa.AddSignal(ai.UIElements.SliderContainer.TextBox.FocusLost,function(as)
if as then
local at=tonumber(ai.UIElements.SliderContainer.TextBox.Text)
if at then
ai:Set(at)
else
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(an)
end
end
end)

aa.AddSignal(ai.UIElements.SliderContainer.InputBegan,function(as)
ai:Set(am,as)
end)

return ai.__type,ai
end

return ae end function a.F()
local aa=game:GetService"UserInputService"

local ac=a.load'a'
local ad=ac.New local ae=
ac.Tween

local af={
UICorner=6,
UIPadding=8,
}

local ag=a.load's'.New

function af.New(ah,ai)
local aj={
__type="Keybind",
Title=ai.Title or"Keybind",
Desc=ai.Desc or nil,
Locked=ai.Locked or false,
Value=ai.Value or"F",
Callback=ai.Callback or function()end,
CanChange=ai.CanChange or true,
Picking=false,
UIElements={},
}

local ak=true

aj.KeybindFrame=a.load'y'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=85,
Hover=aj.CanChange,
Tab=ai.Tab,
Index=ai.Index,
Window=ai.Window,
ElementTable=aj,
}

aj.UIElements.Keybind=ag(aj.Value,nil,aj.KeybindFrame.UIElements.Main)

aj.UIElements.Keybind.Size=UDim2.new(
0,24
+aj.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
aj.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
aj.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)

ad("UIScale",{
Parent=aj.UIElements.Keybind,
Scale=.85,
})

ac.AddSignal(aj.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",function()
aj.UIElements.Keybind.Size=UDim2.new(
0,24
+aj.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
end)

function aj.Lock(al)
aj.Locked=true
ak=false
return aj.KeybindtrueFrame:Lock()
end
function aj.Unlock(al)
aj.Locked=false
ak=true
return aj.KeybindFrame:Unlock()
end

function aj.Set(al,am)
aj.Value=am
aj.UIElements.Keybind.Frame.Frame.TextLabel.Text=am
end

if aj.Locked then
aj:Lock()
end

ac.AddSignal(aj.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if ak then
if aj.CanChange then
aj.Picking=true
aj.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."

task.wait(0.2)

local al
al=aa.InputBegan:Connect(function(am)
local an

if am.UserInputType==Enum.UserInputType.Keyboard then
an=am.KeyCode.Name
elseif am.UserInputType==Enum.UserInputType.MouseButton1 then
an="MouseLeft"
elseif am.UserInputType==Enum.UserInputType.MouseButton2 then
an="MouseRight"
end

local ao
ao=aa.InputEnded:Connect(function(ap)
if ap.KeyCode.Name==an or an=="MouseLeft"and ap.UserInputType==Enum.UserInputType.MouseButton1 or an=="MouseRight"and ap.UserInputType==Enum.UserInputType.MouseButton2 then
aj.Picking=false

aj.UIElements.Keybind.Frame.Frame.TextLabel.Text=an
aj.Value=an

al:Disconnect()
ao:Disconnect()
end
end)
end)
end
end
end)
ac.AddSignal(aa.InputBegan,function(al)
if ak then
if al.KeyCode.Name==aj.Value then
ac.SafeCallback(aj.Callback,al.KeyCode.Name)
end
end
end)
return aj.__type,aj
end

return af end function a.G()
local aa=a.load'a'
local ac=aa.New local ad=
aa.Tween

local ae={
UICorner=8,
UIPadding=8,
}local af=a.load'j'


.New
local ag=a.load'k'.New

function ae.New(ah,ai)
local aj={
__type="Input",
Title=ai.Title or"Input",
Desc=ai.Desc or nil,
Type=ai.Type or"Input",
Locked=ai.Locked or false,
InputIcon=ai.InputIcon or false,
Placeholder=ai.Placeholder or"Enter Text...",
Value=ai.Value or"",
Callback=ai.Callback or function()end,
ClearTextOnFocus=ai.ClearTextOnFocus or false,
UIElements={},

Width=150,
}

local ak=true

aj.InputFrame=a.load'y'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=aj.Width,
Hover=false,
Tab=ai.Tab,
Index=ai.Index,
Window=ai.Window,
ElementTable=aj,
}

local al=ag(
aj.Placeholder,
aj.InputIcon,
aj.Type=="Textarea"and aj.InputFrame.UIElements.Container or aj.InputFrame.UIElements.Main,
aj.Type,
function(al)
aj:Set(al)
end,
nil,
ai.Window.NewElements and 12 or 10
)

if aj.Type=="Input"then
al.Size=UDim2.new(0,aj.Width,0,36)
al.Position=UDim2.new(1,0,0.5,0)
al.AnchorPoint=Vector2.new(1,0.5)
else
al.Size=UDim2.new(1,0,0,148)
end

ac("UIScale",{
Parent=al,
Scale=1,
})

function aj.Lock(am)
aj.Locked=true
ak=false
return aj.InputFrame:Lock()
end
function aj.Unlock(am)
aj.Locked=false
ak=true
return aj.InputFrame:Unlock()
end


function aj.Set(am,an)
if ak then
aa.SafeCallback(aj.Callback,an)

al.Frame.Frame.TextBox.Text=an
aj.Value=an
end
end
function aj.SetPlaceholder(am,an)
al.Frame.Frame.TextBox.PlaceholderText=an
aj.Placeholder=an
end

aj:Set(aj.Value)

if aj.Locked then
aj:Lock()
end

return aj.__type,aj
end

return ae end function a.H()
local aa=game:GetService"UserInputService"
local ac=game:GetService"Players".LocalPlayer:GetMouse()
local ae=game:GetService"Workspace".CurrentCamera

local af=a.load'a'
local ag=af.New
local ah=af.Tween

local ai=a.load's'.New
local aj=a.load'k'.New


local ak={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
SearchBarHeight=39,
}

function ak.New(al,am)
local an={
__type="Dropdown",
Title=am.Title or"Dropdown",
Desc=am.Desc or nil,
Locked=am.Locked or false,
Values=am.Values or{},
MenuWidth=am.MenuWidth or 170,
Value=am.Value,
AllowNone=am.AllowNone,
SearchBarEnabled=am.SearchBarEnabled or false,
Multi=am.Multi,
Callback=am.Callback or function()end,

UIElements={},

Opened=false,
Tabs={},

Width=150,
}

if an.Multi and not an.Value then
an.Value={}
end

local ao=true

an.DropdownFrame=a.load'y'{
Title=an.Title,
Desc=an.Desc,
Parent=am.Parent,
TextOffset=an.Width,
Hover=false,
Tab=am.Tab,
Index=am.Index,
Window=am.Window,
ElementTable=an,
}


an.UIElements.Dropdown=ai("",nil,an.DropdownFrame.UIElements.Main)

an.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
an.UIElements.Dropdown.Frame.Frame.TextLabel.Size=UDim2.new(1,an.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

an.UIElements.Dropdown.Size=UDim2.new(0,an.Width,0,36)
an.UIElements.Dropdown.Position=UDim2.new(1,0,0.5,0)
an.UIElements.Dropdown.AnchorPoint=Vector2.new(1,0.5)






ag("ImageLabel",{
Image=af.Icon"chevrons-up-down"[1],
ImageRectOffset=af.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=af.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-12,0.5,0),
ThemeTag={
ImageColor3="Icon"
},
AnchorPoint=Vector2.new(1,0.5),
Parent=an.UIElements.Dropdown.Frame
})

an.UIElements.UIListLayout=ag("UIListLayout",{
Padding=UDim.new(0,ak.MenuPadding),
FillDirection="Vertical"
})

an.UIElements.Menu=af.NewRoundFrame(ak.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="Background",
},
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,ak.MenuPadding),
PaddingLeft=UDim.new(0,ak.MenuPadding),
PaddingRight=UDim.new(0,ak.MenuPadding),
PaddingBottom=UDim.new(0,ak.MenuPadding),
}),
ag("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ak.MenuPadding)
}),
ag("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,an.SearchBarEnabled and-ak.MenuPadding-ak.SearchBarHeight),

ClipsDescendants=true,
LayoutOrder=999,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,ak.MenuCorner-ak.MenuPadding),
}),
ag("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
an.UIElements.UIListLayout,
})
})
})

an.UIElements.MenuCanvas=ag("Frame",{
Size=UDim2.new(0,an.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=am.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
an.UIElements.Menu,






ag("UISizeConstraint",{
MinSize=Vector2.new(170,0)
})
})

function an.Lock(ap)
an.Locked=true
ao=false
return an.DropdownFrame:Lock()
end
function an.Unlock(ap)
an.Locked=false
ao=true
return an.DropdownFrame:Unlock()
end

if an.Locked then
an:Lock()
end

local function RecalculateCanvasSize()
an.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,an.UIElements.UIListLayout.AbsoluteContentSize.Y)

end

local function RecalculateListSize()
if an.UIElements.UIListLayout.AbsoluteContentSize.Y>300 then
an.UIElements.MenuCanvas.Size=UDim2.fromOffset(an.UIElements.MenuCanvas.AbsoluteSize.X,392)
else
an.UIElements.MenuCanvas.Size=UDim2.fromOffset(an.UIElements.MenuCanvas.AbsoluteSize.X,an.UIElements.UIListLayout.AbsoluteContentSize.Y+(an.SearchBarEnabled and(ak.SearchBarHeight+(ak.MenuPadding*3))or 0))
end
end

function UpdatePosition()
local ap=an.UIElements.Dropdown
local aq=an.UIElements.MenuCanvas

local ar=ae.ViewportSize.Y-(ap.AbsolutePosition.Y+ap.AbsoluteSize.Y)-ak.MenuPadding-54
local as=aq.AbsoluteSize.Y+ak.MenuPadding

local at=-54
if ar<as then
at=as-ar-54
end

aq.Position=UDim2.new(
0,
ap.AbsolutePosition.X+ap.AbsoluteSize.X,
0,
ap.AbsolutePosition.Y+ap.AbsoluteSize.Y-at+ak.MenuPadding
)
end

local ap


function an.Display(aq)
local ar=an.Values
local as=""

if an.Multi then
for at,au in next,ar do
if table.find(an.Value,au)then
as=as..au..", "
end
end
as=as:sub(1,#as-2)
else
as=an.Value or""
end

an.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(as==""and"--"or as)
end

function an.Refresh(aq,ar)
for as,at in next,an.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not at:IsA"UIListLayout"then
at:Destroy()
end
end

an.Tabs={}

if an.SearchBarEnabled then
if not ap then
ap=aj("Search...","search",an.UIElements.Menu,nil,function(au)
for av,aw in next,an.Tabs do
if string.find(string.lower(aw.Name),string.lower(au),1,true)then
aw.UIElements.TabItem.Visible=true
else
aw.UIElements.TabItem.Visible=false
end
RecalculateListSize()
end
end,true)
ap.Size=UDim2.new(1,0,0,ak.SearchBarHeight)
ap.Position=UDim2.new(0,0,0,0)
ap.Name="SearchBar"
end
end

for au,av in next,ar do

local aw={
Name=av,
Selected=false,
UIElements={},
}
aw.UIElements.TabItem=af.NewRoundFrame(ak.MenuCorner-ak.MenuPadding,"Squircle",{
Size=UDim2.new(1,0,0,36),

ImageTransparency=1,
Parent=an.UIElements.Menu.Frame.ScrollingFrame,

ImageColor3=Color3.new(1,1,1),

},{
af.NewRoundFrame(ak.MenuCorner-ak.MenuPadding,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
Name="Highlight",
},{
ag("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
ag("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ag("UIPadding",{

PaddingLeft=UDim.new(0,ak.TabPadding),
PaddingRight=UDim.new(0,ak.TabPadding),

}),
ag("UICorner",{
CornerRadius=UDim.new(0,ak.MenuCorner-ak.MenuPadding)
}),













ag("TextLabel",{
Text=av,
TextXAlignment="Left",
FontFace=Font.new(af.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text"
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=.4,
AutomaticSize="Y",

Size=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
})
})
},true)


if an.Multi then
aw.Selected=table.find(an.Value or{},aw.Name)
else
aw.Selected=an.Value==aw.Name
end

if aw.Selected then
aw.UIElements.TabItem.ImageTransparency=.95
aw.UIElements.TabItem.Highlight.ImageTransparency=.75


aw.UIElements.TabItem.Frame.TextLabel.TextTransparency=0.05
end

an.Tabs[au]=aw

an:Display()

local function Callback()
an:Display()
task.spawn(function()
af.SafeCallback(an.Callback,an.Value)
end)
end

af.AddSignal(aw.UIElements.TabItem.MouseButton1Click,function()
if an.Multi then
if not aw.Selected then
aw.Selected=true
ah(aw.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
ah(aw.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

ah(aw.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0}):Play()
table.insert(an.Value,aw.Name)
else
if not an.AllowNone and#an.Value==1 then
return
end
aw.Selected=false
ah(aw.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
ah(aw.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

ah(aw.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.4}):Play()
for ax,ay in ipairs(an.Value)do
if ay==aw.Name then
table.remove(an.Value,ax)
break
end
end
end
else
for ax,ay in next,an.Tabs do

ah(ay.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
ah(ay.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

ah(ay.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.5}):Play()
ay.Selected=false
end
aw.Selected=true
ah(aw.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
ah(aw.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

ah(aw.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0.05}):Play()
an.Value=aw.Name
end
Callback()
end)

RecalculateCanvasSize()
RecalculateListSize()
end

local aw=0
for ax,ay in next,an.Tabs do
if ay.UIElements.TabItem.Frame.TextLabel then

local az=ay.UIElements.TabItem.Frame.TextLabel.TextBounds.X
aw=math.max(aw,az)
end
end

an.UIElements.MenuCanvas.Size=UDim2.new(0,aw+6+6+5+5+18+6+6,an.UIElements.MenuCanvas.Size.Y.Scale,an.UIElements.MenuCanvas.Size.Y.Offset)


end


an:Refresh(an.Values)

function an.Select(aq,ar)
if ar then
an.Value=ar
else
if an.Multi then
an.Value={}
else
an.Value=nil

end
end
an:Refresh(an.Values)
end






RecalculateListSize()

function an.Open(aq)
if ao then
an.UIElements.Menu.Visible=true
an.UIElements.MenuCanvas.Visible=true
an.UIElements.MenuCanvas.Active=true
an.UIElements.Menu.Size=UDim2.new(
1,0,
0,0
)
ah(an.UIElements.Menu,0.1,{
Size=UDim2.new(
1,0,
1,0
),
ImageTransparency=0.05
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(.1)
an.Opened=true
end)




UpdatePosition()
end
end
function an.Close(aq)
an.Opened=false

ah(an.UIElements.Menu,0.25,{
Size=UDim2.new(
1,0,
0,0
),
ImageTransparency=1,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()


task.spawn(function()
task.wait(.1)
an.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(.25)
an.UIElements.MenuCanvas.Visible=false
an.UIElements.MenuCanvas.Active=false
end)
end

af.AddSignal(an.UIElements.Dropdown.MouseButton1Click,function()
an:Open()
end)

af.AddSignal(aa.InputBegan,function(aq)
if
aq.UserInputType==Enum.UserInputType.MouseButton1
or aq.UserInputType==Enum.UserInputType.Touch
then
local ar,at=an.UIElements.MenuCanvas.AbsolutePosition,an.UIElements.MenuCanvas.AbsoluteSize
if
am.Window.CanDropdown
and an.Opened
and(ac.X<ar.X
or ac.X>ar.X+at.X
or ac.Y<(ar.Y-20-1)
or ac.Y>ar.Y+at.Y
)
then
an:Close()
end
end
end)

af.AddSignal(an.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition",UpdatePosition)

return an.__type,an
end

return ak end function a.I()






local aa={}
local ac={
lua={
"and","break","or","else","elseif","if","then","until","repeat","while","do","for","in","end",
"local","return","function","export",
},
rbx={
"game","workspace","script","math","string","table","task","wait","select","next","Enum",
"tick","assert","shared","loadstring","tonumber","tostring","type",
"typeof","unpack","Instance","CFrame","Vector3","Vector2","Color3","UDim","UDim2","Ray","BrickColor",
"OverlapParams","RaycastParams","Axes","Random","Region3","Rect","TweenInfo",
"collectgarbage","not","utf8","pcall","xpcall","_G","setmetatable","getmetatable","os","pairs","ipairs"
},
operators={
"#","+","-","*","%","/","^","=","~","=","<",">",
}
}

local ae={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(af)
local ag={}
for ah,ai in ipairs(af)do
ag[ai]=true
end
return ag
end

local af=createKeywordSet(ac.lua)
local ag=createKeywordSet(ac.rbx)
local ah=createKeywordSet(ac.operators)

local function getHighlight(ai,aj)
local ak=ai[aj]

if ae[ak.."_color"]then
return ae[ak.."_color"]
end

if tonumber(ak)then
return ae.numbers
elseif ak=="nil"then
return ae.null
elseif ak:sub(1,2)=="--"then
return ae.comment
elseif ah[ak]then
return ae.operator
elseif af[ak]then
return ae.lua
elseif ag[ak]then
return ae.rbx
elseif ak:sub(1,1)=="\""or ak:sub(1,1)=="\'"then
return ae.str
elseif ak=="true"or ak=="false"then
return ae.boolean
end

if ai[aj+1]=="("then
if ai[aj-1]==":"then
return ae.self_call
end

return ae.call
end

if ai[aj-1]=="."then
if ai[aj-2]=="Enum"then
return ae.rbx
end

return ae.local_property
end
end

function aa.run(ai)
local aj={}
local ak=""

local al=false
local am=false
local an=false

for ao=1,#ai do
local ap=ai:sub(ao,ao)

if am then
if ap=="\n"and not an then
table.insert(aj,ak)
table.insert(aj,ap)
ak=""

am=false
elseif ai:sub(ao-1,ao)=="]]"and an then
ak=ak.."]"

table.insert(aj,ak)
ak=""

am=false
an=false
else
ak=ak..ap
end
elseif al then
if ap==al and ai:sub(ao-1,ao-1)~="\\"or ap=="\n"then
ak=ak..ap
al=false
else
ak=ak..ap
end
else
if ai:sub(ao,ao+1)=="--"then
table.insert(aj,ak)
ak="-"
am=true
an=ai:sub(ao+2,ao+3)=="[["
elseif ap=="\""or ap=="\'"then
table.insert(aj,ak)
ak=ap
al=ap
elseif ah[ap]then
table.insert(aj,ak)
table.insert(aj,ap)
ak=""
elseif ap:match"[%w_]"then
ak=ak..ap
else
table.insert(aj,ak)
table.insert(aj,ap)
ak=""
end
end
end

table.insert(aj,ak)

local ao={}

for ap,aq in ipairs(aj)do
local ar=getHighlight(aj,ap)

if ar then
local at=string.format("<font color = \"#%s\">%s</font>",ar:ToHex(),aq:gsub("<","&lt;"):gsub(">","&gt;"))

table.insert(ao,at)
else
table.insert(ao,aq)
end
end

return table.concat(ao)
end

return aa end function a.J()
local aa={}

local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'I'

function aa.New(ah,ai,aj,ak,al)
local am={
Radius=12,
Padding=10
}

local an=ae("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=14,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,am.Padding+3),
PaddingLeft=UDim.new(0,am.Padding+3),
PaddingRight=UDim.new(0,am.Padding+3),
PaddingBottom=UDim.new(0,am.Padding+3),
})
})
an.Font="Code"

local ao=ae("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize="X",
ScrollingDirection="X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
an
})

local ap=ae("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,30,0,30),
Position=UDim2.new(1,-am.Padding/2,0,am.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=ak and true or false,
},{
ac.NewRoundFrame(am.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
ae("UIScale",{
Scale=1,
}),
ae("ImageLabel",{
Image=ac.Icon"copy"[1],
ImageRectSize=ac.Icon"copy"[2].ImageRectSize,
ImageRectOffset=ac.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.1,
})
})
})

ac.AddSignal(ap.MouseEnter,function()
af(ap.Button,.05,{ImageTransparency=.95}):Play()
af(ap.Button.UIScale,.05,{Scale=.9}):Play()
end)
ac.AddSignal(ap.InputEnded,function()
af(ap.Button,.08,{ImageTransparency=1}):Play()
af(ap.Button.UIScale,.08,{Scale=1}):Play()
end)

local aq=ac.NewRoundFrame(am.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=.035,
Size=UDim2.new(1,0,0,20+(am.Padding*2)),
AutomaticSize="Y",
Parent=aj,
},{
ac.NewRoundFrame(am.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.955,
}),
ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
},{
ac.NewRoundFrame(am.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.96,
Size=UDim2.new(1,0,0,20+(am.Padding*2)),
Visible=ai and true or false
},{
ae("ImageLabel",{
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Image="rbxassetid://132464694294269",



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.2,
}),
ae("TextLabel",{
Text=ai,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=.2,
TextSize=16,
AutomaticSize="Y",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,ap and-20-(am.Padding*2),0,0)
}),
ae("UIPadding",{

PaddingLeft=UDim.new(0,am.Padding+3),
PaddingRight=UDim.new(0,am.Padding+3),

}),
ae("UIListLayout",{
Padding=UDim.new(0,am.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ao,
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
})
}),
ap,
})

ac.AddSignal(an:GetPropertyChangedSignal"TextBounds",function()
ao.Size=UDim2.new(1,0,0,(an.TextBounds.Y/(al or 1))+((am.Padding+3)*2))
end)

function am.Set(ar)
an.Text=ag.run(ar)
end

function am.Destroy()
aq:Destroy()
am=nil
end

am.Set(ah)

ac.AddSignal(ap.MouseButton1Click,function()
if ak then
ak()
local ar=ac.Icon"check"
ap.Button.ImageLabel.Image=ar[1]
ap.Button.ImageLabel.ImageRectSize=ar[2].ImageRectSize
ap.Button.ImageLabel.ImageRectOffset=ar[2].ImageRectPosition

task.wait(1)
local at=ac.Icon"copy"
ap.Button.ImageLabel.Image=at[1]
ap.Button.ImageLabel.ImageRectSize=at[2].ImageRectSize
ap.Button.ImageLabel.ImageRectOffset=at[2].ImageRectPosition
end
end)
return am
end


return aa end function a.K()
local aa=a.load'a'local ac=
aa.New


local ae=a.load'J'

local af={}

function af.New(ag,ah)
local ai={
__type="Code",
Title=ah.Title,
Code=ah.Code,
OnCopy=ah.OnCopy,
UIElements={}
}

local aj=not ai.Locked











local ak=ae.New(ai.Code,ai.Title,ah.Parent,function()
if aj then
local ak=ai.Title or"code"
local al,am=pcall(function()
toclipboard(ai.Code)

if ai.OnCopy then ai.OnCopy()end
end)
if not al then
ah.WindUI:Notify{
Title="Error",
Content="The "..ak.." is not copied. Error: "..am,
Icon="x",
Duration=5,
}
end
end
end,ah.WindUI.UIScale,ai)

function ai.SetCode(al,am)
ak.Set(am)
end

function ai.Destroy(al)
ak.Destroy()
ai=nil
end

return ai.__type,ai
end

return af end function a.L()
local aa=a.load'a'
local ac=aa.New local ae=
aa.Tween

local af=game:GetService"UserInputService"
game:GetService"TouchInputService"
local ag=game:GetService"RunService"
local ah=game:GetService"Players"

local ai=ag.RenderStepped
local aj=ah.LocalPlayer
local ak=aj:GetMouse()

local al=a.load'j'.New
local am=a.load'k'.New

local an={
UICorner=8,
UIPadding=8
}

function an.Colorpicker(ao,ap,aq,ar)
local at={
__type="Colorpicker",
Title=ap.Title,
Desc=ap.Desc,
Default=ap.Default,
Callback=ap.Callback,
Transparency=ap.Transparency,
UIElements=ap.UIElements,

TextPadding=10,
}

function at.SetHSVFromRGB(au,av)
local aw,ax,ay=Color3.toHSV(av)
at.Hue=aw
at.Sat=ax
at.Vib=ay
end

at:SetHSVFromRGB(at.Default)

local au=a.load'l'.Init(aq)
local av=au.Create()

at.ColorpickerFrame=av

av.UIElements.Main.Size=UDim2.new(1,0,0,0)



local aw,ax,ay=at.Hue,at.Sat,at.Vib

at.UIElements.Title=ac("TextLabel",{
Text=at.Title,
TextSize=20,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=av.UIElements.Main
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,at.TextPadding/2),
PaddingLeft=UDim.new(0,at.TextPadding/2),
PaddingRight=UDim.new(0,at.TextPadding/2),
PaddingBottom=UDim.new(0,at.TextPadding/2),
})
})





local az=ac("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=HueDragHolder,
BackgroundColor3=at.Default
},{
ac("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ac("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

at.UIElements.SatVibMap=ac("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40+at.TextPadding),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(aw,1,1),
BackgroundTransparency=0,
Parent=av.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ac("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),

az,
})

at.UIElements.Inputs=ac("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(at.Transparency and 240 or 210,40+at.TextPadding),
BackgroundTransparency=1,
Parent=av.UIElements.Main
},{
ac("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
})
})





local aA=ac("Frame",{
BackgroundColor3=at.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=at.Transparency,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ac("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208+at.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=av.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ac("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),







aA,
})

local aB=ac("Frame",{
BackgroundColor3=at.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ac("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208+at.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=av.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),







aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ac("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),
aB,
})

local aC={}

for aD=0,1,0.1 do
table.insert(aC,ColorSequenceKeypoint.new(aD,Color3.fromHSV(aD,1,1)))
end

local aD=ac("UIGradient",{
Color=ColorSequence.new(aC),
Rotation=90,
})

local aE=ac("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local b=ac("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=aE,


BackgroundColor3=at.Default
},{
ac("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ac("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local e=ac("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(180,40+at.TextPadding),
Parent=av.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
aD,
aE,
})


function CreateNewInput(g,h)
local i=am(g,nil,at.UIElements.Inputs)

ac("TextLabel",{
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=17,
FontFace=Font.new(aa.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=i.Frame,
Text=g,
})

ac("UIScale",{
Parent=i,
Scale=.85,
})

i.Frame.Frame.TextBox.Text=h
i.Size=UDim2.new(0,150,0,42)

return i
end

local function ToRGB(g)
return{
R=math.floor(g.R*255),
G=math.floor(g.G*255),
B=math.floor(g.B*255)
}
end

local g=CreateNewInput("Hex","#"..at.Default:ToHex())

local h=CreateNewInput("Red",ToRGB(at.Default).R)
local i=CreateNewInput("Green",ToRGB(at.Default).G)
local j=CreateNewInput("Blue",ToRGB(at.Default).B)
local l
if at.Transparency then
l=CreateNewInput("Alpha",((1-at.Transparency)*100).."%")
end

local m=ac("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254+at.TextPadding),
BackgroundTransparency=1,
Parent=av.UIElements.Main,
LayoutOrder=4,
},{
ac("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),






})

local p={
{
Title="Cancel",
Variant="Secondary",
Callback=function()end
},
{
Title="Apply",
Icon="chevron-right",
Variant="Primary",
Callback=function()ar(Color3.fromHSV(at.Hue,at.Sat,at.Vib),at.Transparency)end
}
}

for r,x in next,p do
local z=al(x.Title,x.Icon,x.Callback,x.Variant,m,av,false)
z.Size=UDim2.new(0.5,-3,0,40)
z.AutomaticSize="None"
end



local z,A,B
if at.Transparency then
local C=ac("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

A=ac("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=C,

},{
ac("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ac("UICorner",{
CornerRadius=UDim.new(1,0),
})

})

B=ac("Frame",{
Size=UDim2.fromScale(1,1),
},{
ac("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
ac("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

z=ac("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(210,40+at.TextPadding),
Parent=av.UIElements.Main,
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
ac("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
B,
C,
})
end

function at.Round(C,F,G)
if G==0 then
return math.floor(F)
end
F=tostring(F)
return F:find"%."and tonumber(F:sub(1,F:find"%."+G))or F
end


function at.Update(C,F,G)
if F then aw,ax,ay=Color3.toHSV(F)else aw,ax,ay=at.Hue,at.Sat,at.Vib end

at.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(aw,1,1)
az.Position=UDim2.new(ax,0,1-ay,0)
az.BackgroundColor3=Color3.fromHSV(aw,ax,ay)
aB.BackgroundColor3=Color3.fromHSV(aw,ax,ay)
b.BackgroundColor3=Color3.fromHSV(aw,1,1)
b.Position=UDim2.new(0.5,0,aw,0)

g.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(aw,ax,ay):ToHex()
h.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aw,ax,ay)).R
i.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aw,ax,ay)).G
j.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aw,ax,ay)).B

if G or at.Transparency then
aB.BackgroundTransparency=at.Transparency or G
B.BackgroundColor3=Color3.fromHSV(aw,ax,ay)
A.BackgroundColor3=Color3.fromHSV(aw,ax,ay)
A.BackgroundTransparency=at.Transparency or G
A.Position=UDim2.new(0.5,0,1-at.Transparency or G,0)
l.Frame.Frame.TextBox.Text=at:Round((1-at.Transparency or G)*100,0).."%"
end
end

at:Update(at.Default,at.Transparency)




local function GetRGB()
local C=Color3.fromHSV(at.Hue,at.Sat,at.Vib)
return{R=math.floor(C.r*255),G=math.floor(C.g*255),B=math.floor(C.b*255)}
end



local function clamp(C,F,G)
return math.clamp(tonumber(C)or 0,F,G)
end

aa.AddSignal(g.Frame.Frame.TextBox.FocusLost,function(C)
if C then
local F=g.Frame.Frame.TextBox.Text:gsub("#","")
local G,H=pcall(Color3.fromHex,F)
if G and typeof(H)=="Color3"then
at.Hue,at.Sat,at.Vib=Color3.toHSV(H)
at:Update()
at.Default=H
end
end
end)

local function updateColorFromInput(C,F)
aa.AddSignal(C.Frame.Frame.TextBox.FocusLost,function(G)
if G then
local H=C.Frame.Frame.TextBox
local J=GetRGB()
local L=clamp(H.Text,0,255)
H.Text=tostring(L)

J[F]=L
local M=Color3.fromRGB(J.R,J.G,J.B)
at.Hue,at.Sat,at.Vib=Color3.toHSV(M)
at:Update()
end
end)
end

updateColorFromInput(h,"R")
updateColorFromInput(i,"G")
updateColorFromInput(j,"B")

if at.Transparency then
aa.AddSignal(l.Frame.Frame.TextBox.FocusLost,function(C)
if C then
local F=l.Frame.Frame.TextBox
local G=clamp(F.Text,0,100)
F.Text=tostring(G)

at.Transparency=1-G*0.01
at:Update(nil,at.Transparency)
end
end)
end



local C=at.UIElements.SatVibMap
aa.AddSignal(C.InputBegan,function(F)
if F.UserInputType==Enum.UserInputType.MouseButton1 or F.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local G=C.AbsolutePosition.X
local H=G+C.AbsoluteSize.X
local J=math.clamp(ak.X,G,H)

local L=C.AbsolutePosition.Y
local M=L+C.AbsoluteSize.Y
local N=math.clamp(ak.Y,L,M)

at.Sat=(J-G)/(H-G)
at.Vib=1-((N-L)/(M-L))
at:Update()

ai:Wait()
end
end
end)

aa.AddSignal(e.InputBegan,function(F)
if F.UserInputType==Enum.UserInputType.MouseButton1 or F.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local G=e.AbsolutePosition.Y
local H=G+e.AbsoluteSize.Y
local J=math.clamp(ak.Y,G,H)

at.Hue=((J-G)/(H-G))
at:Update()

ai:Wait()
end
end
end)

if at.Transparency then
aa.AddSignal(z.InputBegan,function(F)
if F.UserInputType==Enum.UserInputType.MouseButton1 or F.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local G=z.AbsolutePosition.Y
local H=G+z.AbsoluteSize.Y
local J=math.clamp(ak.Y,G,H)

at.Transparency=1-((J-G)/(H-G))
at:Update()

ai:Wait()
end
end
end)
end

return at
end

function an.New(ao,ap)
local aq={
__type="Colorpicker",
Title=ap.Title or"Colorpicker",
Desc=ap.Desc or nil,
Locked=ap.Locked or false,
Default=ap.Default or Color3.new(1,1,1),
Callback=ap.Callback or function()end,

Transparency=ap.Transparency,
UIElements={}
}

local ar=true

if ap.Window.NewElements then an.UICorner=14 end

aq.ColorpickerFrame=a.load'y'{
Title=aq.Title,
Desc=aq.Desc,
Parent=ap.Parent,
TextOffset=40,
Hover=false,
Tab=ap.Tab,
Index=ap.Index,
Window=ap.Window,
ElementTable=aq,
}

aq.UIElements.Colorpicker=aa.NewRoundFrame(an.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=aq.Default,
Parent=aq.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,30,0,30),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
ZIndex=2
},nil,true)


function aq.Lock(at)
aq.Locked=true
ar=false
return aq.ColorpickerFrame:Lock()
end
function aq.Unlock(at)
aq.Locked=false
ar=true
return aq.ColorpickerFrame:Unlock()
end

if aq.Locked then
aq:Lock()
end


function aq.Update(at,au,av)
aq.UIElements.Colorpicker.ImageTransparency=av or 0
aq.UIElements.Colorpicker.ImageColor3=au
aq.Default=au
if av then
aq.Transparency=av
end
end

function aq.Set(at,au,av)
return aq:Update(au,av)
end

aa.AddSignal(aq.UIElements.Colorpicker.MouseButton1Click,function()
if ar then
an:Colorpicker(aq,ap.Window,function(at,au)
aq:Update(at,au)
aq.Default=at
aq.Transparency=au
aa.SafeCallback(aq.Callback,at,au)
end).ColorpickerFrame:Open()
end
end)

return aq.__type,aq
end

return an end function a.M()
local aa=a.load'a'
local ac=aa.New
local ae=aa.Tween

local af={}

function af.New(ag,ah)
local ai={
__type="Section",
Title=ah.Title or"Section",
Icon=ah.Icon,
TextXAlignment=ah.TextXAlignment or"Left",
TextSize=ah.TextSize or 19,
TextTransparency=ah.TextTransparency or 0.05,
UIElements={},

HeaderSize=42,
IconSize=20,
Padding=10,

Elements={},

Expandable=false,
}

local aj


function ai.SetIcon(ak,al)
ai.Icon=al or nil
if aj then aj:Destroy()end
if al then
aj=aa.Image(
al,
al..":"..ai.Title,
0,
ah.Window.Folder,
ai.__type,
true
)
aj.Size=UDim2.new(0,ai.IconSize,0,ai.IconSize)
end
end

local ak=ac("Frame",{
Size=UDim2.new(0,ai.IconSize,0,ai.IconSize),
BackgroundTransparency=1,
Visible=false
},{
ac("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=aa.Icon"chevron-down"[1],
ImageRectSize=aa.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=aa.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})


if ai.Icon then
ai:SetIcon(ai.Icon)
end

local al=ac("TextLabel",{
BackgroundTransparency=1,
TextXAlignment="Left",
AutomaticSize="Y",
TextSize=ai.TextSize,
TextTransparency=ai.TextTransparency,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),


Text=ai.Title,
Size=UDim2.new(
1,
aj and(-ai.IconSize-8)*2
or(-ai.IconSize-8),

0,
0
),
TextWrapped=true,
})

local am=ac("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Parent=ah.Parent,
ClipsDescendants=true,
AutomaticSize="Y",
},{
ac("TextButton",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Text="",
Name="Top",
},{
aj,
al,
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=not aj and ai.TextXAlignment or"Left",
}),
ak,
}),
ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=false,
Position=UDim2.new(0,0,0,ai.HeaderSize)
},{
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ah.Tab.Gap),
VerticalAlignment="Bottom",
}),
})
})







local an=ah.ElementsModule

an.Load(ai,am.Content,an.Elements,ah.Window,ah.WindUI,function()
if not ai.Expandable then
ai.Expandable=true
ak.Visible=true
end
end)


function ai.SetTitle(ao,ap)
al.Text=ap
end

function ai.Destroy(ao)
for ap,aq in next,ai.Elements do
aq:Destroy()
end








am:Destroy()
end

function ai.Open(ao)
if ai.Expandable then
ai.Opened=true
ae(am,0.33,{
Size=UDim2.new(1,0,0,ai.HeaderSize+(am.Content.AbsoluteSize.Y/ah.UIScale))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ae(ak.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function ai.Close(ao)
if ai.Expandable then
ai.Opened=false
ae(am,0.26,{
Size=UDim2.new(1,0,0,ai.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ae(ak.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

aa.AddSignal(am.Top.MouseButton1Click,function()
if ai.Expandable then
if ai.Opened then
ai:Close()
else
ai:Open()
end
end
end)

if ai.Opened then
task.spawn(function()
task.wait()
ai:Open()
end)
end

task.spawn(function()
task.wait()
if ai.Expandable then








am.Size=UDim2.new(1,0,0,ai.HeaderSize)
am.AutomaticSize="None"
am.Top.Size=UDim2.new(1,0,0,ai.HeaderSize)
am.Top.AutomaticSize="None"
am.Content.Visible=true
end
end)

return ai.__type,ai
end

return af end function a.N()
local aa=a.load'a'
local ac=aa.New

local ae={}

function ae.New(af,ag)
local ah=ac("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
ac("Frame",{
Parent=ag.Parent,
Size=UDim2.new(1,-7,0,7),
BackgroundTransparency=1,
},{
ah
})

return"Divider",{__type="Divider"}
end

return ae end function a.O()
local aa=a.load'a'
local ac=aa.New

local ae={}

function ae.New(af,ag)
ac("Frame",{
Parent=ag.Parent,
Size=UDim2.new(1,-7,0,7),
BackgroundTransparency=1,
})

return"Space",{__type="Space"}
end

return ae end function a.P()
return{
Elements={
Paragraph=a.load'z',
Button=a.load'A',
Toggle=a.load'D',
Slider=a.load'E',
Keybind=a.load'F',
Input=a.load'G',
Dropdown=a.load'H',
Code=a.load'K',
Colorpicker=a.load'L',
Section=a.load'M',
Divider=a.load'N',
Space=a.load'O',
},
Load=function(aa,ac,ae,af,ag,ah,ai,aj)
for ak,al in next,ae do
aa[ak]=function(am,an)
an=an or{}
an.Tab=aa
an.Index=#aa.Elements+1
an.GlobalIndex=#af.AllElements+1
an.Parent=ac
an.Window=af
an.WindUI=ag
an.UIScale=aj
an.ElementsModule=ai local

ao, ap=al:New(an)


local aq
for ar,at in pairs(ap)do
if typeof(at)=="table"and ar:match"Frame$"then
aq=at
break
end
end

if aq then
function ap.SetTitle(au,av)
aq:SetTitle(av)
end
function ap.SetDesc(au,av)
aq:SetDesc(av)
end
function ap.Destroy(au)

table.remove(af.AllElements,an.GlobalIndex)
table.remove(aa.Elements,an.Index)
aa:UpdateAllElementShapes(aa)

aq:Destroy()
end
end



table.insert(af.AllElements,ap)
table.insert(aa.Elements,ap)

aa:UpdateAllElementShapes(aa)

if ah then
ah()
end
return ap
end
end
function aa.UpdateAllElementShapes(am,an)
for ao,ap in next,an.Elements do
local aq
for ar,at in pairs(ap)do
if typeof(at)=="table"and ar:match"Frame$"then
aq=at
break
end
end

if aq then

aq.Index=ao
if aq.UpdateShape then

aq.UpdateShape(an)
end
end
end
end
end,

}end function a.Q()
game:GetService"UserInputService"
local aa=game.Players.LocalPlayer:GetMouse()

local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'x'.New
local ah=a.load't'.New





local ai={


Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(ai)end
}

function ai.Init(aj,ak,al,am)
Window=aj
WindUI=ak
ai.ToolTipParent=al
ai.TabHighlight=am
return ai
end

function ai.New(aj,ak)
local al={
__type="Tab",
Title=aj.Title or"Tab",
Desc=aj.Desc,
Icon=aj.Icon,
IconThemed=aj.IconThemed,
Locked=aj.Locked,
ShowTabTitle=aj.ShowTabTitle,
Selected=false,
Index=nil,
Parent=aj.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=Window.UICorner-(Window.UIPadding/2),

Gap=Window.NewElements and 1 or 6,
}

ai.TabCount=ai.TabCount+1

local am=ai.TabCount
al.Index=am

al.UIElements.Main=ac.NewRoundFrame(al.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=aj.Parent,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
},{
ac.NewRoundFrame(al.UICorner,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
ae("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
ac.NewRoundFrame(al.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ae("TextLabel",{
Text=al.Title,
ThemeTag={
TextColor3="Text"
},
TextTransparency=not al.Locked and 0.4 or.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,2+(Window.UIPadding/2)),
PaddingLeft=UDim.new(0,4+(Window.UIPadding/2)),
PaddingRight=UDim.new(0,4+(Window.UIPadding/2)),
PaddingBottom=UDim.new(0,2+(Window.UIPadding/2)),
})
}),
},true)

local an=0
local ao
local ap

if al.Icon then
ao=ac.Image(
al.Icon,
al.Icon..":"..al.Title,
0,
Window.Folder,
al.__type,
true,
al.IconThemed
)
ao.Size=UDim2.new(0,16,0,16)
ao.Parent=al.UIElements.Main.Frame
ao.ImageLabel.ImageTransparency=not al.Locked and 0 or.7
al.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,-30,0,0)
an=-30

al.UIElements.Icon=ao


ap=ac.Image(
al.Icon,
al.Icon..":"..al.Title,
0,
Window.Folder,
al.__type,
true,
al.IconThemed
)
ap.Size=UDim2.new(0,16,0,16)
ap.ImageLabel.ImageTransparency=not al.Locked and 0 or.7
an=-30




end

al.UIElements.ContainerFrame=ae("ScrollingFrame",{
Size=UDim2.new(1,0,1,al.ShowTabTitle and-((Window.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingLeft=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingRight=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingBottom=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
}),
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,al.Gap),
HorizontalAlignment="Center",
})
})





al.UIElements.ContainerFrameCanvas=ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=Window.UIElements.MainBar,
ZIndex=5,
},{
al.UIElements.ContainerFrame,
ae("Frame",{
Size=UDim2.new(1,0,0,((Window.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=al.ShowTabTitle or false,
Name="TabTitle"
},{
ap,
ae("TextLabel",{
Text=al.Title,
ThemeTag={
TextColor3="Text"
},
TextSize=20,
TextTransparency=.1,
Size=UDim2.new(1,-an,1,0),
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
TextTruncate="AtEnd",
RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ae("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
},
Position=UDim2.new(0,0,0,((Window.UIPadding*2.4)+12)),
Visible=al.ShowTabTitle or false,
})
})

ai.Containers[am]=al.UIElements.ContainerFrameCanvas
ai.Tabs[am]=al

al.ContainerFrame=ContainerFrameCanvas

ac.AddSignal(al.UIElements.Main.MouseButton1Click,function()
if not al.Locked then
ai:SelectTab(am)
end
end)

if Window.ScrollBarEnabled then
ah(al.UIElements.ContainerFrame,al.UIElements.ContainerFrameCanvas,Window,3)
end

local aq
local ar
local at
local au=false



if al.Desc then


ac.AddSignal(al.UIElements.Main.InputBegan,function()
au=true
ar=task.spawn(function()
task.wait(0.35)
if au and not aq then
aq=ag(al.Desc,ai.ToolTipParent)

local function updatePosition()
if aq then
aq.Container.Position=UDim2.new(0,aa.X,0,aa.Y-20)
end
end

updatePosition()
at=aa.Move:Connect(updatePosition)
aq:Open()
end
end)
end)

end

ac.AddSignal(al.UIElements.Main.MouseEnter,function()
if not al.Locked then
af(al.UIElements.Main.Frame,0.08,{ImageTransparency=.97}):Play()
end
end)
ac.AddSignal(al.UIElements.Main.InputEnded,function()
if al.Desc then
au=false
if ar then
task.cancel(ar)
ar=nil
end
if at then
at:Disconnect()
at=nil
end
if aq then
aq:Close()
aq=nil
end
end

if not al.Locked then
af(al.UIElements.Main.Frame,0.08,{ImageTransparency=1}):Play()
end
end)



al.ElementsModule=a.load'P'

al.ElementsModule.Load(al,al.UIElements.ContainerFrame,al.ElementsModule.Elements,Window,WindUI,nil,al.ElementsModule,ak)



function al.LockAll(av)

for aw,ax in next,Window.AllElements do
if ax.Tab and ax.Tab.Index and ax.Tab.Index==al.Index and ax.Lock then
ax:Lock()
end
end
end
function al.UnlockAll(av)
for aw,ax in next,Window.AllElements do
if ax.Tab and ax.Tab.Index and ax.Tab.Index==al.Index and ax.Unlock then
ax:Unlock()
end
end
end
function al.GetLocked(av)
local aw={}

for ax,ay in next,Window.AllElements do
if ay.Tab and ay.Tab.Index and ay.Tab.Index==al.Index and ay.Locked==true then
table.insert(aw,ay)
end
end

return aw
end
function al.GetUnlocked(av)
local aw={}

for ax,ay in next,Window.AllElements do
if ay.Tab and ay.Tab.Index and ay.Tab.Index==al.Index and ay.Locked==false then
table.insert(aw,ay)
end
end

return aw
end

function al.Select(av)
return al:SelectTab(al.Index)
end

task.spawn(function()
local av=ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=al.UIElements.ContainerFrame
},{
ae("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),
ae("ImageLabel",{
Size=UDim2.new(0,48,0,48),
Image=ac.Icon"frown"[1],
ImageRectOffset=ac.Icon"frown"[2].ImageRectPosition,
ImageRectSize=ac.Icon"frown"[2].ImageRectSize,
ThemeTag={
ImageColor3="Icon"
},
BackgroundTransparency=1,
ImageTransparency=.6,
}),
ae("TextLabel",{
AutomaticSize="XY",
Text="This tab is empty",
ThemeTag={
TextColor3="Text"
},
TextSize=18,
TextTransparency=.5,
BackgroundTransparency=1,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
})
})





local aw
aw=ac.AddSignal(al.UIElements.ContainerFrame.ChildAdded,function()
av.Visible=false
aw:Disconnect()
end)
end)

return al
end

function ai.OnChange(aj,ak)
ai.OnChangeFunc=ak
end

function ai.SelectTab(aj,ak)
if not ai.Tabs[ak].Locked then
ai.SelectedTab=ak

for al,am in next,ai.Tabs do
if not am.Locked then
af(am.UIElements.Main,0.15,{ImageTransparency=1}):Play()
af(am.UIElements.Main.Outline,0.15,{ImageTransparency=1}):Play()
af(am.UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0.3}):Play()
if am.UIElements.Icon then
af(am.UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.4}):Play()
end
am.Selected=false
end
end
af(ai.Tabs[ak].UIElements.Main,0.15,{ImageTransparency=0.95}):Play()
af(ai.Tabs[ak].UIElements.Main.Outline,0.15,{ImageTransparency=0.85}):Play()
af(ai.Tabs[ak].UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0}):Play()
if ai.Tabs[ak].UIElements.Icon then
af(ai.Tabs[ak].UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.1}):Play()
end
ai.Tabs[ak].Selected=true


task.spawn(function()
for an,ao in next,ai.Containers do
ao.AnchorPoint=Vector2.new(0,0.05)
ao.Visible=false
end
ai.Containers[ak].Visible=true
af(ai.Containers[ak],0.15,{AnchorPoint=Vector2.new(0,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
end)

ai.OnChangeFunc(ak)
end
end

return ai end function a.R()
local aa={}


local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'Q'

function aa.New(ah,ai,aj,ak,al)
local am={
Title=ah.Title or"Section",
Icon=ah.Icon,
IconThemed=ah.IconThemed,
Opened=ah.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local an
if am.Icon then
an=ac.Image(
am.Icon,
am.Icon,
0,
aj,
"Section",
true,
am.IconThemed
)

an.Size=UDim2.new(0,am.IconSize,0,am.IconSize)
an.ImageLabel.ImageTransparency=.25
end

local ao=ae("Frame",{
Size=UDim2.new(0,am.IconSize,0,am.IconSize),
BackgroundTransparency=1,
Visible=false
},{
ae("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=ac.Icon"chevron-down"[1],
ImageRectSize=ac.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=ac.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local ap=ae("Frame",{
Size=UDim2.new(1,0,0,am.HeaderSize),
BackgroundTransparency=1,
Parent=ai,
ClipsDescendants=true,
},{
ae("TextButton",{
Size=UDim2.new(1,0,0,am.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
an,
ae("TextLabel",{
Text=am.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
an and(-am.IconSize-10)*2
or(-am.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
ae("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
ao,
ae("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,am.HeaderSize)
},{
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,al.Gap),
VerticalAlignment="Bottom",
}),
})
})


function am.Tab(aq,ar)
if not am.Expandable then
am.Expandable=true
ao.Visible=true
end
ar.Parent=ap.Content
return ag.New(ar,ak)
end

function am.Open(aq)
if am.Expandable then
am.Opened=true
af(ap,0.33,{
Size=UDim2.new(1,0,0,am.HeaderSize+(ap.Content.AbsoluteSize.Y/ak))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

af(ao.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function am.Close(aq)
if am.Expandable then
am.Opened=false
af(ap,0.26,{
Size=UDim2.new(1,0,0,am.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
af(ao.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

ac.AddSignal(ap.TextButton.MouseButton1Click,function()
if am.Expandable then
if am.Opened then
am:Close()
else
am:Open()
end
end
end)

if am.Opened then
task.spawn(function()
task.wait()
am:Open()
end)
end



return am
end


return aa end function a.S()
return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.T()
game:GetService"UserInputService"

local aa={
Margin=8,
Padding=9,
}


local ac=a.load'a'
local ae=ac.New
local af=ac.Tween


function aa.new(ag,ah,ai)
local aj={
IconSize=14,
Padding=14,
Radius=18,
Width=400,
MaxHeight=380,

Icons=a.load'S'
}


local ak=ae("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(
1,
-((aj.IconSize*2)+(aj.Padding*2)),
0,
0
),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Regular),
TextSize=17,
})

local al=ae("ImageLabel",{
Image=ac.Icon"x"[1],
ImageRectSize=ac.Icon"x"[2].ImageRectSize,
ImageRectOffset=ac.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
},{
ae("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})

local am=ae("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false
},{
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,aj.Padding),
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
PaddingBottom=UDim.new(0,aj.Padding),
})
})

local an=ac.NewRoundFrame(aj.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Accent",
},
ImageTransparency=0,
},{
ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
},{
ae("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ae("ImageLabel",{
Image=ac.Icon"search"[1],
ImageRectSize=ac.Icon"search"[2].ImageRectSize,
ImageRectOffset=ac.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.05,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
}),
ak,
al,
ae("UIListLayout",{
Padding=UDim.new(0,aj.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ae("UIPadding",{
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
})
})
}),
ae("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
ae("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=.9,
Visible=false,
}),
am,
ae("UISizeConstraint",{
MaxSize=Vector2.new(aj.Width,aj.MaxHeight),
}),
}),
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
})
})

local ao=ae("Frame",{
Size=UDim2.new(0,aj.Width,0,0),
AutomaticSize="Y",
Parent=ah,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
ae("UIScale",{
Scale=.9,
}),
an,
ac.NewRoundFrame(aj.Radius,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=1,
},{
ae("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

local function CreateSearchTab(ap,aq,ar,at,au,av)
local aw=ae("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=at or nil
},{
ac.NewRoundFrame(aj.Radius-6,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main"
},{
ac.NewRoundFrame(aj.Radius-6,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=1,
Name="Outline",
},{
ae("UIGradient",{
Rotation=65,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,aj.Padding-2),
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
PaddingBottom=UDim.new(0,aj.Padding-2),
}),
ae("ImageLabel",{
Image=ac.Icon(ar)[1],
ImageRectSize=ac.Icon(ar)[2].ImageRectSize,
ImageRectOffset=ac.Icon(ar)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
}),
ae("Frame",{
Size=UDim2.new(1,-aj.IconSize-aj.Padding,0,0),
BackgroundTransparency=1,
},{
ae("TextLabel",{
Text=ap,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title"
}),
ae("TextLabel",{
Text=aq or"",
Visible=aq and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=.25,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc"
})or nil,
ae("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
})
}),
ae("UIListLayout",{
Padding=UDim.new(0,aj.Padding),
FillDirection="Horizontal",
})
}),
},true),
ae("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-aj.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=au,

},{
ac.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.9,
}),
ae("Frame",{
Size=UDim2.new(1,-aj.Padding-2,0,0),
Position=UDim2.new(0,aj.Padding+2,0,0),
BackgroundTransparency=1,
},{
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right"
})
})



aw.Main.Size=UDim2.new(
1,
0,
0,
aw.Main.Outline.Frame.Desc.Visible and(((aj.Padding-2)*2)+aw.Main.Outline.Frame.Title.TextBounds.Y+6+aw.Main.Outline.Frame.Desc.TextBounds.Y)
or(((aj.Padding-2)*2)+aw.Main.Outline.Frame.Title.TextBounds.Y)
)

ac.AddSignal(aw.Main.MouseEnter,function()
af(aw.Main,.04,{ImageTransparency=.95}):Play()
af(aw.Main.Outline,.04,{ImageTransparency=.7}):Play()
end)
ac.AddSignal(aw.Main.InputEnded,function()
af(aw.Main,.08,{ImageTransparency=1}):Play()
af(aw.Main.Outline,.08,{ImageTransparency=1}):Play()
end)
ac.AddSignal(aw.Main.MouseButton1Click,function()
if av then
av()
end
end)

return aw
end

local function ContainsText(ap,aq)
if not aq or aq==""then
return false
end

if not ap or ap==""then
return false
end

local ar=string.lower(ap)
local at=string.lower(aq)

return string.find(ar,at,1,true)~=nil
end

local function Search(ap)
if not ap or ap==""then
return{}
end

local aq={}
for ar,at in next,ag.Tabs do
local au=ContainsText(at.Title or"",ap)
local av={}

for aw,ax in next,at.Elements do
if ax.__type~="Section"then
local ay=ContainsText(ax.Title or"",ap)
local az=ContainsText(ax.Desc or"",ap)

if ay or az then
av[aw]={
Title=ax.Title,
Desc=ax.Desc,
Original=ax,
__type=ax.__type
}
end
end
end

if au or next(av)~=nil then
aq[ar]={
Tab=at,
Title=at.Title,
Icon=at.Icon,
Elements=av,
}
end
end
return aq
end

function aj.Search(ap,aq)
aq=aq or""

local ar=Search(aq)

am.Visible=true
an.Frame.Results.Frame.Visible=true
for at,au in next,am:GetChildren()do
if au.ClassName~="UIListLayout"and au.ClassName~="UIPadding"then
au:Destroy()
end
end

if ar and next(ar)~=nil then
for av,aw in next,ar do
local ax=aj.Icons.Tab
local ay=CreateSearchTab(aw.Title,nil,ax,am,true,function()
aj:Close()
ag:SelectTab(av)
end)
if aw.Elements and next(aw.Elements)~=nil then
for az,aA in next,aw.Elements do
local aB=aj.Icons[aA.__type]
CreateSearchTab(aA.Title,aA.Desc,aB,ay:FindFirstChild"ParentContainer"and ay.ParentContainer.Frame or nil,false,function()
aj:Close()
ag:SelectTab(av)

end)

end
end
end
elseif aq~=""then
ae("TextLabel",{
Size=UDim2.new(1,0,0,70),
BackgroundTransparency=1,
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=.2,
BackgroundTransparency=1,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Parent=am,
Name="NotFound",
})
else
am.Visible=false
an.Frame.Results.Frame.Visible=false
end
end

ac.AddSignal(ak:GetPropertyChangedSignal"Text",function()
aj:Search(ak.Text)
end)

ac.AddSignal(am.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

af(am,.06,{Size=UDim2.new(
1,
0,
0,
math.clamp(am.UIListLayout.AbsoluteContentSize.Y+(aj.Padding*2),0,aj.MaxHeight)
)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function aj.Open(ap)
task.spawn(function()
an.Frame.Visible=true
ao.Visible=true
af(ao.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function aj.Close(ap)
task.spawn(function()
ai()
an.Frame.Visible=false
af(ao.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.12)
ao.Visible=false
end)
end

ac.AddSignal(al.TextButton.MouseButton1Click,function()
aj:Close()
end)

aj:Open()

return aj
end

return aa end function a.U()

local aa=game:GetService"UserInputService"
game:GetService"RunService"

local ac=workspace.CurrentCamera

local ae=a.load'q'

local af=a.load'a'
local ag=af.New
local ah=af.Tween


local ai=a.load's'.New
local aj=a.load'j'.New
local ak=a.load't'.New
local al=a.load'u'

local am=a.load'v'



return function(an)
local ao={
Title=an.Title or"UI Library",
Author=an.Author,
Icon=an.Icon,
IconThemed=an.IconThemed,
Folder=an.Folder,
Resizable=an.Resizable,
Background=an.Background,
BackgroundImageTransparency=an.BackgroundImageTransparency or 0,
User=an.User or{},

Size=an.Size,

MinSize=an.MinSize or Vector2.new(560,350),
MaxSize=an.MaxSize or Vector2.new(850,560),

ToggleKey=an.ToggleKey,
Transparent=an.Transparent or false,
HideSearchBar=an.HideSearchBar,
ScrollBarEnabled=an.ScrollBarEnabled or false,
SideBarWidth=an.SideBarWidth or 200,
Acrylic=an.Acrylic or false,
NewElements=an.NewElements or false,
HidePanelBackground=an.HidePanelBackground or false,

Position=UDim2.new(0.5,0,0.5,0),
IconSize=22,
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=an.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=false,
IsOpenButtonEnabled=true,

ConfigManager=nil,
AcrylicPaint=nil,
CurrentTab=nil,
TabModule=nil,

OnOpenCallback=nil,
OnCloseCallback=nil,
OnDestroyCallback=nil,

Gap=5,

TopBarButtons={},
AllElements={},
}

local ap=ao.Size or UDim2.new(0,580,0,460)
ao.Size=UDim2.new(
ap.X.Scale,
math.clamp(ap.X.Offset,ao.MinSize.X,ao.MaxSize.X),
ap.Y.Scale,
math.clamp(ap.Y.Offset,ao.MinSize.Y,ao.MaxSize.Y)
)

if ao.HideSearchBar~=false then
ao.HideSearchBar=true
end
if ao.Resizable~=false then
ao.CanResize=true
ao.Resizable=true
end

if ao.Folder then
makefolder("WindUI/"..ao.Folder)
end

local aq=ag("UICorner",{
CornerRadius=UDim.new(0,ao.UICorner)
})

if ao.Folder then
ao.ConfigManager=am:Init(ao)
end local



ar, at=ae.AcrylicPaint{UseAcrylic=ao.Acrylic}

ao.AcrylicPaint=ar

local au=ag("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(.5,.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true
},{
ag("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
})
})
local av=af.NewRoundFrame(ao.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
ag("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=af.Icon"expand"[1],
ImageRectOffset=af.Icon"expand"[2].ImageRectPosition,
ImageRectSize=af.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local aw=af.NewRoundFrame(ao.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})










ao.UIElements.SideBar=ag("ScrollingFrame",{
Size=UDim2.new(
1,
ao.ScrollBarEnabled and-3-(ao.UIPadding/2)or 0,
1,
not ao.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
ag("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,ao.UIPadding/2),


PaddingBottom=UDim.new(0,ao.UIPadding/2),
}),
ag("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,ao.Gap)
})
}),
ag("UIPadding",{

PaddingLeft=UDim.new(0,ao.UIPadding/2),
PaddingRight=UDim.new(0,ao.UIPadding/2),

}),

})

ao.UIElements.SideBarContainer=ag("Frame",{
Size=UDim2.new(0,ao.SideBarWidth,1,ao.User.Enabled and-94-(ao.UIPadding*2)or-52),
Position=UDim2.new(0,0,0,52),
BackgroundTransparency=1,
Visible=true,
},{
ag("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(
1,
0,
1,
not ao.HideSearchBar and-45-ao.UIPadding/2 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
}),
ao.UIElements.SideBar,
})

if ao.ScrollBarEnabled then
ak(ao.UIElements.SideBar,ao.UIElements.SideBarContainer.Content,ao,3)
end


ao.UIElements.MainBar=ag("Frame",{
Size=UDim2.new(1,-ao.UIElements.SideBarContainer.AbsoluteSize.X,1,-52),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
af.NewRoundFrame(ao.UICorner-(ao.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ZIndex=3,
ImageTransparency=.95,
Name="Background",
Visible=not ao.HidePanelBackground
}),
ag("UIPadding",{
PaddingTop=UDim.new(0,ao.UIPadding/2),
PaddingLeft=UDim.new(0,ao.UIPadding/2),
PaddingRight=UDim.new(0,ao.UIPadding/2),
PaddingBottom=UDim.new(0,ao.UIPadding/2),
})
})

local ax=ag("ImageLabel",{
Image="rbxassetid://8992230677",
ImageColor3=Color3.new(0,0,0),
ImageTransparency=1,
Size=UDim2.new(1,120,1,116),
Position=UDim2.new(0,-60,0,-58),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})


if aa.TouchEnabled and not aa.KeyboardEnabled then
ao.IsPC=false
elseif aa.KeyboardEnabled then
ao.IsPC=true
else
ao.IsPC=nil
end









local ay
if ao.User then
local function getUserThumb()local
az, aA=game.Players:GetUserThumbnailAsync(
ao.User.Anonymous and 1 or game.Players.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
return az
end


ay=ag("TextButton",{
Size=UDim2.new(0,
(ao.UIElements.SideBarContainer.AbsoluteSize.X)-(ao.UIPadding/2),
0,
42+(ao.UIPadding)
),
Position=UDim2.new(0,ao.UIPadding/2,1,-(ao.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
Visible=ao.User.Enabled or false,
},{
af.NewRoundFrame(ao.UICorner-(ao.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
ag("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
af.NewRoundFrame(ao.UICorner-(ao.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
ag("ImageLabel",{
Image=getUserThumb(),
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=.93,
},{
ag("UICorner",{
CornerRadius=UDim.new(1,0)
})
}),
ag("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ag("TextLabel",{
Text=ao.User.Anonymous and"Anonymous"or game.Players.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="DisplayName"
}),
ag("TextLabel",{
Text=ao.User.Anonymous and"anonymous"or game.Players.LocalPlayer.Name,
TextSize=15,
TextTransparency=.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="UserName"
}),
ag("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
})
}),
ag("UIListLayout",{
Padding=UDim.new(0,ao.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ag("UIPadding",{
PaddingLeft=UDim.new(0,ao.UIPadding/2),
PaddingRight=UDim.new(0,ao.UIPadding/2),
})
})
})


function ao.User.Enable(az)
ao.User.Enabled=true
ah(ao.UIElements.SideBarContainer,.25,{Size=UDim2.new(0,ao.SideBarWidth,1,-94-(ao.UIPadding*2))},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ay.Visible=true
end
function ao.User.Disable(az)
ao.User.Enabled=false
ah(ao.UIElements.SideBarContainer,.25,{Size=UDim2.new(0,ao.SideBarWidth,1,-52)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ay.Visible=false
end
function ao.User.SetAnonymous(az,aA)
if aA~=false then aA=true end
ao.User.Anonymous=aA
ay.UserIcon.ImageLabel.Image=getUserThumb()
ay.UserIcon.Frame.DisplayName.Text=aA and"Anonymous"or game.Players.LocalPlayer.DisplayName
ay.UserIcon.Frame.UserName.Text=aA and"anonymous"or game.Players.LocalPlayer.Name
end

if ao.User.Enabled then
ao.User:Enable()
else
ao.User:Disable()
end

if ao.User.Callback then
af.AddSignal(ay.MouseButton1Click,function()
ao.User.Callback()
end)
af.AddSignal(ay.MouseEnter,function()
ah(ay.UserIcon,0.04,{ImageTransparency=.95}):Play()
ah(ay.Outline,0.04,{ImageTransparency=.85}):Play()
end)
af.AddSignal(ay.InputEnded,function()
ah(ay.UserIcon,0.04,{ImageTransparency=1}):Play()
ah(ay.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local az
local aA



local aB=false
local aC

local aD=typeof(ao.Background)=="string"and string.match(ao.Background,"^video:(.+)")or nil

if typeof(ao.Background)=="string"and aD then
aB=true

if string.find(aD,"http")then
local function SanitizeFilename(aE)
aE=aE:gsub("[%s/\\:*?\"<>|]+","-")
aE=aE:gsub("[^%w%-_%.]","")
return aE
end

local aE=ao.Folder.."/Assets/."..SanitizeFilename(aD)..".webm"
if not isfile(aE)then
local b,e=pcall(function()
local b=game:HttpGet(aD)
writefile(aE,b)
end)

if not b then
warn("[ WindUI.Background ]  Failed to download video: "..tostring(e))
return
end
end
aD=getcustomasset(aE)
end

aC=ag("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=aD,
Looped=true,
Volume=0,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,ao.UICorner)
}),
})
aC:Play()
elseif ao.Background then
aC=ag("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=typeof(ao.Background)=="string"and ao.Background or"",
ImageTransparency=1,
ScaleType="Crop",
},{
ag("UICorner",{
CornerRadius=UDim.new(0,ao.UICorner)
}),
})
end


local aE=af.NewRoundFrame(99,"Squircle",{
ImageTransparency=.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
ag("Frame",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
})
})

function createAuthor(b)
return ag("TextLabel",{
Text=b,
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.35,
AutomaticSize="XY",
Parent=ao.UIElements.Main and ao.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
Name="Author",
})
end

local b
local e

if ao.Author then
b=createAuthor(ao.Author)
end


local g=ag("TextLabel",{
Text=ao.Title,
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="Text"
}
})

ao.UIElements.Main=ag("Frame",{
Size=ao.Size,
Position=ao.Position,
BackgroundTransparency=1,
Parent=an.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
},{
ao.AcrylicPaint.Frame,
ax,
af.NewRoundFrame(ao.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,-240),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="Background"
},

},{
aC,
aE,
au,



}),
UIStroke,
aq,
av,
aw,
ag("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,ao.UICorner)
}),
ao.UIElements.SideBarContainer,
ao.UIElements.MainBar,

ay,

aA,
ag("Frame",{
Size=UDim2.new(1,0,0,52),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar"
},{
az,






ag("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left"
},{
ag("UIListLayout",{
Padding=UDim.new(0,ao.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ag("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
ag("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Center",
}),
g,
b,
}),
ag("UIPadding",{
PaddingLeft=UDim.new(0,4)
})
}),
ag("ScrollingFrame",{
Name="Center",
BackgroundTransparency=1,
AutomaticSize="Y",
ScrollBarThickness=0,
ScrollingDirection="X",
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
Size=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
Visible=false,
},{
ag("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,ao.UIPadding/2)
})
}),
ag("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Name="Right",
},{
ag("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),

}),
ag("UIPadding",{
PaddingTop=UDim.new(0,ao.UIPadding),
PaddingLeft=UDim.new(0,ao.UIPadding),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,ao.UIPadding),
})
})
})
})

af.AddSignal(ao.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
local h=0
local i=ao.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
if g and b then
h=math.max(g.TextBounds.X,b.TextBounds.X)
else
h=g.TextBounds.X
end
if e then
h=h+ao.IconSize+ao.UIPadding+4
end
ao.UIElements.Main.Main.Topbar.Center.Position=UDim2.new(0,h+ao.UIPadding,0.5,0)
ao.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-h-i-(ao.UIPadding*2),
1,
0
)
end)

function ao.CreateTopbarButton(h,i,j,l,m,p)
local r=af.Image(
j,
j,
0,
ao.Folder,
"TopbarIcon",
true,
p
)
r.Size=UDim2.new(0,16,0,16)
r.AnchorPoint=Vector2.new(0.5,0.5)
r.Position=UDim2.new(0.5,0,0.5,0)

local x=af.NewRoundFrame(9,"Squircle",{
Size=UDim2.new(0,36,0,36),
LayoutOrder=m or 999,
Parent=ao.UIElements.Main.Main.Topbar.Right,

ZIndex=9999,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=1
},{
af.NewRoundFrame(9,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
ag("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
r
},true)



ao.TopBarButtons[100-m]={
Name=i,
Object=x
}

af.AddSignal(x.MouseButton1Click,function()
l()
end)
af.AddSignal(x.MouseEnter,function()
ah(x,.15,{ImageTransparency=.93}):Play()
ah(x.Outline,.15,{ImageTransparency=.75}):Play()

end)
af.AddSignal(x.MouseLeave,function()
ah(x,.1,{ImageTransparency=1}):Play()
ah(x.Outline,.1,{ImageTransparency=1}):Play()

end)

return x
end



local h=af.Drag(
ao.UIElements.Main,
{ao.UIElements.Main.Main.Topbar,aE.Frame},
function(h,i)
if not ao.Closed then
if h and i==aE.Frame then
ah(aE,.1,{ImageTransparency=.35}):Play()
else
ah(aE,.2,{ImageTransparency=.8}):Play()
end
end
end
)

if not aB and ao.Background and typeof(ao.Background)=="table"then

local i=ag"UIGradient"
for j,l in next,ao.Background do
i[j]=l
end

ao.UIElements.BackgroundGradient=af.NewRoundFrame(ao.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
Parent=ao.UIElements.Main.Background,
ImageTransparency=ao.Transparent and an.WindUI.TransparencyValue or 0
},{
i
})
end














local i=a.load'w'.New(ao)


task.spawn(function()
if ao.Icon then

e=af.Image(
ao.Icon,
ao.Title,
0,
ao.Folder,
"Window",
true,
ao.IconThemed
)
e.Parent=ao.UIElements.Main.Main.Topbar.Left
e.Size=UDim2.new(0,ao.IconSize,0,ao.IconSize)

i:SetIcon(ao.Icon)











else
i:SetIcon(ao.Icon)

end
end)

function ao.SetToggleKey(j,l)
ao.ToggleKey=l
end

function ao.SetTitle(j,l)
ao.Title=l
g.Text=l
end

function ao.SetAuthor(j,l)
ao.Author=l
if not b then
b=createAuthor(ao.Author)
end

b.Text=l
end

function ao.SetBackgroundImage(j,l)
ao.UIElements.Main.Background.ImageLabel.Image=l
end
function ao.SetBackgroundImageTransparency(j,l)
ao.UIElements.Main.Background.ImageLabel.ImageTransparency=l
ao.BackgroundImageTransparency=l
end

local j
local l
af.Icon"minimize"
af.Icon"maximize"

ao:CreateTopbarButton("Fullscreen","maximize",function()
ao:ToggleFullscreen()
end,998)

function ao.ToggleFullscreen(m)
local p=ao.IsFullscreen

h:Set(p)

if not p then
j=ao.UIElements.Main.Position
l=ao.UIElements.Main.Size

ao.CanResize=false
else
if ao.Resizable then
ao.CanResize=true
end
end

ah(ao.UIElements.Main,0.45,{Size=p and l or UDim2.new(1,-20,1,-72)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ah(ao.UIElements.Main,0.45,{Position=p and j or UDim2.new(0.5,0,0.5,26)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()



ao.IsFullscreen=not p
end


ao:CreateTopbarButton("Minimize","minus",function()
ao:Close()
task.spawn(function()
task.wait(.3)
if not ao.IsPC and ao.IsOpenButtonEnabled then

i:Visible(true)
end
end)















end,997)

function ao.OnOpen(m,p)
ao.OnOpenCallback=p
end
function ao.OnClose(m,p)
ao.OnCloseCallback=p
end
function ao.OnDestroy(m,p)
ao.OnDestroyCallback=p
end





function ao.SetIconSize(m,p)
local r
if typeof(p)=="number"then
r=UDim2.new(0,p,0,p)
ao.IconSize=p
elseif typeof(p)=="UDim2"then
r=p
ao.IconSize=p.X.Offset
end

if e then
e.Size=r
end
end

function ao.Open(m)
task.spawn(function()
if ao.OnOpenCallback then
task.spawn(function()
af.SafeCallback(ao.OnOpenCallback)
end)
end


task.wait(.06)
ao.Closed=false

ah(ao.UIElements.Main.Background,0.2,{
ImageTransparency=ao.Transparent and an.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if ao.UIElements.BackgroundGradient then
ah(ao.UIElements.BackgroundGradient,0.2,{
ImageTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

ah(ao.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,0),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

if aC then
if aC:IsA"VideoFrame"then
aC.Visible=true
end
ah(aC,0.2,{
ImageTransparency=aC:IsA"ImageLabel"and 0 or nil,

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end


ah(ax,0.25,{ImageTransparency=.7},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
ah(UIStroke,0.25,{Transparency=.8},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

task.spawn(function()
task.wait(.5)
ah(aE,.45,{Size=UDim2.new(0,200,0,4),ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
h:Set(true)
task.wait(.45)
if ao.Resizable then
ah(au.ImageLabel,.45,{ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
ao.CanResize=true
end
end)


ao.CanDropdown=true

ao.UIElements.Main.Visible=true
task.spawn(function()
task.wait(.05)
ao.UIElements.Main:WaitForChild"Main".Visible=true

an.WindUI:ToggleAcrylic(true)
end)
end)
end
function ao.Close(m)
local p={}

if ao.OnCloseCallback then
task.spawn(function()
af.SafeCallback(ao.OnCloseCallback)
end)
end

an.WindUI:ToggleAcrylic(false)

ao.UIElements.Main:WaitForChild"Main".Visible=false

ao.CanDropdown=false
ao.Closed=true

ah(ao.UIElements.Main.Background,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
if ao.UIElements.BackgroundGradient then
ah(ao.UIElements.BackgroundGradient,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

ah(ao.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,-240),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()


if aC then
if aC:IsA"VideoFrame"then
aC.Visible=false
end
ah(aC,0.2,{
ImageTransparency=aC:IsA"ImageLabel"and 1 or nil,

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
ah(ax,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
ah(UIStroke,0.25,{Transparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

ah(aE,.3,{Size=UDim2.new(0,0,0,4),ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()
ah(au.ImageLabel,.3,{ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
h:Set(false)
ao.CanResize=false

task.spawn(function()
task.wait(0.4)
ao.UIElements.Main.Visible=false
end)

function p.Destroy(r)
if ao.OnDestroyCallback then
task.spawn(function()
af.SafeCallback(ao.OnDestroyCallback)
end)
end
if ao.AcrylicPaint.Model then
ao.AcrylicPaint.Model:Destroy()
end
ao.Destroyed=true
task.wait(0.4)
an.Parent.Parent:Destroy()


end

return p
end
function ao.Destroy(m)
ao:Close():Destroy()
end
function ao.Toggle(m)
if ao.Closed then
ao:Open()
else
ao:Close()
end
end


function ao.ToggleTransparency(m,p)

ao.Transparent=p
an.WindUI.Transparent=p

ao.UIElements.Main.Background.ImageTransparency=p and an.WindUI.TransparencyValue or 0

ao.UIElements.MainBar.Background.ImageTransparency=p and 0.97 or 0.95

end

function ao.LockAll(m)
for p,r in next,ao.AllElements do
if r.Lock then r:Lock()end
end
end
function ao.UnlockAll(m)
for p,r in next,ao.AllElements do
if r.Unlock then r:Unlock()end
end
end
function ao.GetLocked(m)
local p={}

for r,x in next,ao.AllElements do
if x.Locked then table.insert(p,x)end
end

return p
end
function ao.GetUnlocked(m)
local p={}

for r,x in next,ao.AllElements do
if x.Locked==false then table.insert(p,x)end
end

return p
end

function ao.SetUIScale(m,p)
an.WindUI.UIScale=p
ah(an.WindUI.ScreenGui.UIScale,.2,{Scale=p},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

do

if(ac.ViewportSize.X-40<ao.UIElements.Main.AbsoluteSize.X)
or(ac.ViewportSize.Y-40<ao.UIElements.Main.AbsoluteSize.Y)then
if not ao.IsFullscreen then
ao:SetUIScale(.9)
end
end
end

if not ao.IsPC and ao.IsOpenButtonEnabled then
af.AddSignal(i.Button.TextButton.MouseButton1Click,function()

i:Visible(false)
ao:Open()
end)
end

af.AddSignal(aa.InputBegan,function(m,p)
if p then return end

if ao.ToggleKey then
if m.KeyCode==ao.ToggleKey then
ao:Toggle()
end
end
end)

task.spawn(function()

ao:Open()
end)

function ao.EditOpenButton(m,p)
return i:Edit(p)
end


local m=a.load'Q'
local p=a.load'R'
local r=m.Init(ao,an.WindUI,an.Parent.Parent.ToolTips)
r:OnChange(function(x)ao.CurrentTab=x end)

ao.TabModule=m

function ao.Tab(x,z)
z.Parent=ao.UIElements.SideBar.Frame
return r.New(z,an.WindUI.UIScale)
end

function ao.SelectTab(x,z)
r:SelectTab(z)
end

function ao.Section(x,z)
return p.New(z,ao.UIElements.SideBar.Frame,ao.Folder,an.WindUI.UIScale,ao)
end

function ao.IsResizable(x,z)
ao.Resizable=z
ao.CanResize=z
end

function ao.Divider(x)
local z=ag("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local A=ag("Frame",{
Parent=ao.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
z
})

return A
end

local x=a.load'l'.Init(ao,nil)
function ao.Dialog(z,A)
local B={
Title=A.Title or"Dialog",
Width=A.Width or 320,
Content=A.Content,
Buttons=A.Buttons or{},

TextPadding=10,
}
local C=x.Create(false)

C.UIElements.Main.Size=UDim2.new(0,B.Width,0,0)

local F=ag("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=C.UIElements.Main
},{
ag("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,C.UIPadding),
VerticalAlignment="Center"
}),
ag("UIPadding",{
PaddingTop=UDim.new(0,B.TextPadding/2),
PaddingLeft=UDim.new(0,B.TextPadding/2),
PaddingRight=UDim.new(0,B.TextPadding/2),
})
})

local G
if A.Icon then
G=af.Image(
A.Icon,
B.Title..":"..A.Icon,
0,
ao,
"Dialog",
true,
A.IconThemed
)
G.Size=UDim2.new(0,22,0,22)
G.Parent=F
end

C.UIElements.UIListLayout=ag("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
Parent=C.UIElements.Main
})

ag("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=C.UIElements.Main,
})


C.UIElements.Title=ag("TextLabel",{
Text=B.Title,
TextSize=20,
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,G and-26-C.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=F
})
if B.Content then
ag("TextLabel",{
Text=B.Content,
TextSize=18,
TextTransparency=.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=C.UIElements.Main
},{
ag("UIPadding",{
PaddingLeft=UDim.new(0,B.TextPadding/2),
PaddingRight=UDim.new(0,B.TextPadding/2),
PaddingBottom=UDim.new(0,B.TextPadding/2),
})
})
end

local H=ag("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
})

local J=ag("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=C.UIElements.Main,
LayoutOrder=4,
},{
H,






})


local L={}

for M,N in next,B.Buttons do
local O=aj(N.Title,N.Icon,N.Callback,N.Variant,J,C,false)
table.insert(L,O)
end

local function CheckButtonsOverflow()
H.FillDirection=Enum.FillDirection.Horizontal
H.HorizontalAlignment=Enum.HorizontalAlignment.Right
H.VerticalAlignment=Enum.VerticalAlignment.Center
J.AutomaticSize=Enum.AutomaticSize.None

for O,P in ipairs(L)do
P.Size=UDim2.new(0,0,1,0)
P.AutomaticSize=Enum.AutomaticSize.X
end

wait()

local Q=H.AbsoluteContentSize.X
local R=J.AbsoluteSize.X

if Q>R then
H.FillDirection=Enum.FillDirection.Vertical
H.HorizontalAlignment=Enum.HorizontalAlignment.Right
H.VerticalAlignment=Enum.VerticalAlignment.Bottom
J.AutomaticSize=Enum.AutomaticSize.Y

for S,T in ipairs(L)do
T.Size=UDim2.new(1,0,0,40)
T.AutomaticSize=Enum.AutomaticSize.None
end
else
local S=R-Q
if S>0 then
local T
local U=math.huge

for V,W in ipairs(L)do
local X=W.AbsoluteSize.X
if X<U then
U=X
T=W
end
end

if T then
T.Size=UDim2.new(0,U+S,1,0)
T.AutomaticSize=Enum.AutomaticSize.None
end
end
end
end

af.AddSignal(C.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",CheckButtonsOverflow)
CheckButtonsOverflow()

wait()
C:Open()

return C
end


ao:CreateTopbarButton("Close","x",function()
ah(ao.UIElements.Main,0.35,{Position=UDim2.new(0.5,0,0.5,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ao:Dialog{

Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()ao:Close():Destroy()end,
Variant="Primary",
}
}
}
end,999)

function ao.Tag(z,A)
if ao.UIElements.Main.Main.Topbar.Center.Visible==false then ao.UIElements.Main.Main.Topbar.Center.Visible=true end
return al:New(A,ao.UIElements.Main.Main.Topbar.Center)
end


local function startResizing(z)
if ao.CanResize then
isResizing=true
av.Active=true
initialSize=ao.UIElements.Main.Size
initialInputPosition=z.Position


ah(au.ImageLabel,0.1,{ImageTransparency=.35}):Play()

af.AddSignal(z.Changed,function()
if z.UserInputState==Enum.UserInputState.End then
isResizing=false
av.Active=false


ah(au.ImageLabel,0.17,{ImageTransparency=.8}):Play()
end
end)
end
end

af.AddSignal(au.InputBegan,function(z)
if z.UserInputType==Enum.UserInputType.MouseButton1 or z.UserInputType==Enum.UserInputType.Touch then
if ao.CanResize then
startResizing(z)
end
end
end)

af.AddSignal(aa.InputChanged,function(z)
if z.UserInputType==Enum.UserInputType.MouseMovement or z.UserInputType==Enum.UserInputType.Touch then
if isResizing and ao.CanResize then
local A=z.Position-initialInputPosition
local B=UDim2.new(0,initialSize.X.Offset+A.X*2,0,initialSize.Y.Offset+A.Y*2)

B=UDim2.new(
B.X.Scale,
math.clamp(B.X.Offset,ao.MinSize.X,ao.MaxSize.X),
B.Y.Scale,
math.clamp(B.Y.Offset,ao.MinSize.Y,ao.MaxSize.Y)
)

ah(ao.UIElements.Main,0,{
Size=B
}):Play()

ao.Size=B
end
end
end)





if not ao.HideSearchBar then
local z=a.load'T'
local A=false





















local B=ai("Search","search",ao.UIElements.SideBarContainer)
B.Size=UDim2.new(1,-ao.UIPadding/2,0,39)
B.Position=UDim2.new(0,ao.UIPadding/2,0,ao.UIPadding/2)

af.AddSignal(B.MouseButton1Click,function()
if A then return end

z.new(ao.TabModule,ao.UIElements.Main,function()

A=false
if ao.Resizable then
ao.CanResize=true
end

ah(aw,0.1,{ImageTransparency=1}):Play()
aw.Active=false
end)
ah(aw,0.1,{ImageTransparency=.65}):Play()
aw.Active=true

A=true
ao.CanResize=false
end)
end




function ao.DisableTopbarButtons(z,A)
for B,C in next,A do
for F,G in next,ao.TopBarButtons do
if G.Name==C then
G.Object.Visible=false
end
end
end
end

return ao
end end end
local aa={
Window=nil,
Theme=nil,
Creator=a.load'a',
LocalizationModule=a.load'b',
NotificationModule=a.load'c',
Themes=a.load'd',
Transparent=false,

TransparencyValue=.15,

UIScale=1,


Version="0.0.0",

Services=a.load'h',

OnThemeChangeFunction=nil,
}


local ac=game:GetService"HttpService"


local ae=ac:JSONDecode(a.load'i')
if ae then
aa.Version=ae.version

end

local af=a.load'm'local ag=

aa.Services

local ah=aa.Themes
local ai=aa.Creator

local aj=ai.New local ak=
ai.Tween

ai.Themes=ah

local al=a.load'q'local am=

game:GetService"Players"and game:GetService"Players".LocalPlayer or nil


local an=protectgui or(syn and syn.protect_gui)or function()end

local ao=gethui and gethui()or game.CoreGui


aa.ScreenGui=aj("ScreenGui",{
Name="WindUI",
Parent=ao,
IgnoreGuiInset=true,
ScreenInsets="None",
},{
aj("UIScale",{
Scale=aa.Scale,
}),
aj("Folder",{
Name="Window"
}),






aj("Folder",{
Name="KeySystem"
}),
aj("Folder",{
Name="Popups"
}),
aj("Folder",{
Name="ToolTips"
})
})

aa.NotificationGui=aj("ScreenGui",{
Name="WindUI/Notifications",
Parent=ao,
IgnoreGuiInset=true,
})
aa.DropdownGui=aj("ScreenGui",{
Name="WindUI/Dropdowns",
Parent=ao,
IgnoreGuiInset=true,
})
an(aa.ScreenGui)
an(aa.NotificationGui)
an(aa.DropdownGui)

ai.Init(aa)

math.clamp(aa.TransparencyValue,0,1)

local ap=aa.NotificationModule.Init(aa.NotificationGui)

function aa.Notify(aq,ar)
ar.Holder=ap.Frame
ar.Window=aa.Window

return aa.NotificationModule.New(ar)
end

function aa.SetNotificationLower(aq,ar)
ap.SetLower(ar)
end

function aa.SetFont(aq,ar)
ai.UpdateFont(ar)
end

function aa.OnThemeChange(aq,ar)
aa.OnThemeChangeFunction=ar
end

function aa.AddTheme(aq,ar)
ah[ar.Name]=ar
return ar
end

function aa.SetTheme(aq,ar)
if ah[ar]then
aa.Theme=ah[ar]
ai.SetTheme(ah[ar])

if aa.OnThemeChangeFunction then
aa.OnThemeChangeFunction(ar)
end


return ah[ar]
end
return nil
end

function aa.GetThemes(aq)
return ah
end
function aa.GetCurrentTheme(aq)
return aa.Theme.Name
end
function aa.GetTransparency(aq)
return aa.Transparent or false
end
function aa.GetWindowSize(aq)
return Window.UIElements.Main.Size
end
function aa.Localization(aq,ar)
return aa.LocalizationModule:New(ar,ai)
end

function aa.SetLanguage(aq,ar)
if ai.Localization then
return ai.SetLanguage(ar)
end
return false
end

function aa.ToggleAcrylic(aq,ar)
if aa.Window and aa.Window.AcrylicPaint and aa.Window.AcrylicPaint.Model then
aa.Window.Acrylic=ar
aa.Window.AcrylicPaint.Model.Transparency=ar and 0.98 or 1
if ar then
al.Enable()
else
al.Disable()
end
end
end


aa:SetTheme"Dark"
aa:SetLanguage(ai.Language)


function aa.Gradient(aq,ar,at)
local au={}
local av={}

for aw,ax in next,ar do
local ay=tonumber(aw)
if ay then
ay=math.clamp(ay/100,0,1)
table.insert(au,ColorSequenceKeypoint.new(ay,ax.Color))
table.insert(av,NumberSequenceKeypoint.new(ay,ax.Transparency or 0))
end
end

table.sort(au,function(ay,az)return ay.Time<az.Time end)
table.sort(av,function(ay,az)return ay.Time<az.Time end)


if#au<2 then
error"ColorSequence requires at least 2 keypoints"
end


local ay={
Color=ColorSequence.new(au),
Transparency=NumberSequence.new(av),
}

if at then
for az,aA in pairs(at)do
ay[az]=aA
end
end

return ay
end


function aa.Popup(aq,ar)
ar.WindUI=aa
return a.load'r'.new(ar)
end


function aa.CreateWindow(aq,ar)
local at=a.load'U'

if not isfolder"WindUI"then
makefolder"WindUI"
end
if ar.Folder then
makefolder(ar.Folder)
else
makefolder(ar.Title)
end

ar.WindUI=aa
ar.Parent=aa.ScreenGui.Window

if aa.Window then
warn"You cannot create more than one window"
return
end

local au=true

local av=ah[ar.Theme or"Dark"]


ai.SetTheme(av)


local aw=gethwid or function()
return game:GetService"Players".LocalPlayer.UserId
end

local ax=aw()

if ar.KeySystem then
au=false

local function loadKeysystem()
af.new(ar,ax,function(ay)au=ay end)
end

local ay=ar.Folder.."/"..ax..".key"

if not ar.KeySystem.API then
if ar.KeySystem.SaveKey and isfile(ay)then
local az=readfile(ay)
local aA=(type(ar.KeySystem.Key)=="table")
and table.find(ar.KeySystem.Key,az)
or tostring(ar.KeySystem.Key)==tostring(az)

if aA then
au=true
else
loadKeysystem()
end
else
loadKeysystem()
end
else
if isfile(ay)then
local az=readfile(ay)
local aA=false

for aB,aC in next,ar.KeySystem.API do
local aD=aa.Services[aC.Type]
if aD then
local aE={}
for b,e in next,aD.Args do
table.insert(aE,aC[e])
end

local g=aD.New(table.unpack(aE))
local h=g.Verify(az)
if h then
aA=true
break
end
end
end

au=aA
if not aA then loadKeysystem()end
else
loadKeysystem()
end
end

repeat task.wait()until au
end

local ay=at(ar)

aa.Transparent=ar.Transparent
aa.Window=ay

if ar.Acrylic then
al.init()
end













return ay
end

return aa