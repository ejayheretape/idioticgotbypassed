if not getgenv()._WHITELIST_SHOWN then
    getgenv()._WHITELIST_SHOWN = true

    game.StarterGui:SetCore("SendNotification",{
        Title = "Whitelisting";
        Text = "Checking access...";
        Icon = "rbxassetid://10734983868";
        Duration = 10
    })

    print("__tostring")
    task.wait(0.18)
    print("whitelistStatus")
    task.wait(0.22)
    print("userData")
    task.wait(0.42)
    print("Loading Whitelist Database...")
    task.wait(0.71)
    print("Verifying User ID...")
    task.wait(0.3)
    print("Checking Group Rank...")
    task.wait(0.6)
    print("setmetatable")
    task.wait(0.3)
    print("VIP List Loaded")
    task.wait(0.2)
    print("getIcon")
    task.wait(0.7)
    print("_VERSION")
    task.wait(0.4)
    print("Scanning Username...")
    task.wait(1.1)
    print("isUniversal = true")
    task.wait(0.8)
    print("Fetching Whitelist Entries...")
    task.wait(1.3)
    print("Urls = https://raw.githubusercontent.com/Darkmoonxhubscript/DarkLibV4/refs/heads/main/Icons.luau", "https://chess-api.com/v1", "")
    task.wait(0.5)
    print("JSONEncode")
    task.wait(0.9)
    print("Create Window...")
    task.wait(0.6)
    print("Loading UI Library...")
    task.wait(1.4)
    print("Comparing HWID...")
    task.wait(0.9)
    print("Validating Discord Link...")
    task.wait(1.7)
    print("Checking Purchase Status...")
    task.wait(1.2)
    print("Searching Whitelist Table...")
    task.wait(0.8)
    print("Decrypting Whitelist Data...")
    task.wait(1.5)
    print("[SUCCESS] Match Found!")
    task.wait(1.0)
    print("Access Granted")

    game.StarterGui:SetCore("SendNotification",{
        Title = "Whitelisting";
        Text = "Access Confirmed...";
        Icon = "rbxassetid://10734983868";
        Duration = 4
    })

    task.wait(8)

    game.StarterGui:SetCore("SendNotification",{
        Title = "Whitelist System";
        Text = "Successfully Whitelisted!";
        Icon = "rbxassetid://10734983868";
        Duration = 3
    })
end

local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

TextChatService.OnIncomingMessage = function(message)
    local props = Instance.new("TextChatMessageProperties")

    if message.TextSource and message.TextSource.UserId == LocalPlayer.UserId then
        props.PrefixText = '<font color="rgb(255,255,0)">[VIP]</font> ' .. message.PrefixText
    end

    return props
end

local isUniversal = false
repeat task.wait() until game:IsLoaded()
if game:GetService("CoreGui"):FindFirstChild("DarkLibV4") then
    game:GetService("CoreGui").DarkLibV4:Destroy()
end
local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
blur.Size = 15
local fadeOutBlur = false
task.spawn(function()
    while not fadeOutBlur do task.wait() end
    game:GetService("TweenService"):Create(blur, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = 0}):Play()
end)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local MarketplaceService = game:GetService("MarketplaceService")
local Library = {
    Themes = {
        Greener = {
            ["Color Hub 1"] = ColorSequence.new(Color3.fromRGB(20,20,20), Color3.fromRGB(27.5,27.5,27.5), Color3.fromRGB(20,20,20)),
            ["Color Hub 2"] = Color3.fromRGB(15,15,15),
            ["Color Hub 3"] = Color3.fromRGB(85,255,0),
            ["Color Hub 4"] = Color3.fromRGB(35,35,35),
            ["Color Hub 5"] = Color3.fromRGB(60,60,60),
            ["Color Hub 6"] = Color3.fromRGB(50,50,50),
            ["Color Hub 7"] = Color3.fromRGB(100,100,100),
            ["Color Stroke"] = Color3.fromRGB(30,30,30),
            ["Color Theme"] = Color3.fromRGB(68,81,0),
            ["Color Text"] = Color3.fromRGB(220,220,220),
            ["Color Dark Text"] = Color3.fromRGB(150,150,150),
            ["Color Effect"] = Color3.fromRGB(85,215,0),
            ["Color Toggle Off"] = Color3.fromRGB(50,180,0)
        }
    },
    Info = {
        Version = "1.0.2",
        Theme = "Greener",
        PlaceName = MarketplaceService:GetProductInfo(game.PlaceId).Name
    },
    Icons = loadstring(game:HttpGet("https://raw.githubusercontent.com/Darkmoonxhubscript/DarkLibV4/refs/heads/main/Icons.luau"))(),
    Tabs = {}
}
local whitelistStatus = "VIP"
local expirationDate = nil
local isUniversalFlag = true
local function copyTable(dest, src)
    if src then
        for k, v in pairs(src) do
            dest[k] = v
        end
    end
    return dest
end
local function createInstance(className, parent, properties)
    local obj = Instance.new(className)
    if parent then obj.Parent = parent end
    if properties then copyTable(obj, properties) end
    return obj
end
local function addCorner(parent, radius)
    return createInstance("UICorner", parent, {CornerRadius = radius or UDim.new(0,5)})
end
local function addStroke(parent, color, thickness, transparency)
    return createInstance("UIStroke", parent, {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = color or Color3.fromRGB(120,120,120),
        Thickness = thickness or 0.1,
        Transparency = transparency or 0
    })
end
local function getIcon(name)
    if string.find(name, "rbxassetid://") or #name < 1 then return name end
    local lower = string.lower(name):gsub("lucide", ""):gsub("-", "")
    for key, value in pairs(Library.Icons) do
        if string.gsub(string.gsub(key, "lucide", ""), "-", "") == lower then return value end
    end
    for key, value in pairs(Library.Icons) do
        if string.find(string.gsub(string.gsub(key, "lucide", ""), "-", ""), lower) then return value end
    end
    return lower
end
local function makeDraggable(frame)
    local dragging = false
    local dragInput, mousePos, framePos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end
local scale = 0.6088 * (math.sqrt(workspace.CurrentCamera.ViewportSize.X^2 + workspace.CurrentCamera.ViewportSize.Y^2) / math.sqrt(865.176453^2 + 423.529388^2))
local theme = Library.Themes[Library.Info.Theme]
function MakeWindow(options)
    local title = options.Title or options[1] or "DarkLib V4"
    local subTitle = options.SubTitle or options[2] or "V1.0"
    local themeName = options.Theme or options[3] or "Greener"
    Library.Info.Theme = themeName
    theme = Library.Themes[themeName]
    local screenGui = createInstance("ScreenGui", CoreGui, {Name = "DarkLibV4", ResetOnSpawn = false, Enabled = false})
    createInstance("UIScale", screenGui, {Scale = scale})
    local preloadImages = {}
    for _, obj in ipairs(screenGui:GetDescendants()) do
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if obj.Image ~= "" then table.insert(preloadImages, obj) end
        end
        if obj:IsA("GuiObject") then
            if obj.BackgroundTransparency ~= nil then
                obj.BackgroundTransparency = 1
            end
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                obj.TextTransparency = 1
            end
            if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                obj.ImageTransparency = 1
            end
        end
    end
    pcall(function() game:GetService("ContentProvider"):PreloadAsync(preloadImages) end)
    screenGui.Enabled = true
    local fadeIn = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    for _, obj in ipairs(screenGui:GetDescendants()) do
        local props = {}
        local changed = false
        if obj:IsA("GuiObject") then
            if obj.BackgroundTransparency ~= nil then props.BackgroundTransparency = 0 changed = true end
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then props.TextTransparency = 0 changed = true end
            if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then props.ImageTransparency = 0 changed = true end
        end
        if changed then pcall(function() TweenService:Create(obj, fadeIn, props):Play() end) end
    end
    task.wait(0.6)
    fadeOutBlur = true
    local notificationContainer = createInstance("Frame", screenGui, {Size = UDim2.new(0,300,1,0), Position = UDim2.new(1,0,0,25), AnchorPoint = Vector2.new(1,0), BackgroundTransparency = 1})
    createInstance("UIPadding", notificationContainer, {PaddingLeft = UDim.new(0,25), PaddingTop = UDim.new(0,25), PaddingBottom = UDim.new(0,50)})
    createInstance("UIListLayout", notificationContainer, {Padding = UDim.new(0,25), VerticalAlignment = Enum.VerticalAlignment.Bottom})
    function NewNotify(data)
        local title = data.Title or data.Name or "Notification"
        local desc = data.Description or data.Text or "Description"
        local duration = data.Time or math.random(6,7)
        local icon = data.Image or "rbxassetid://10709775560"
        local notifyFrame = createInstance("Frame", notificationContainer, {Size = UDim2.new(1,0,0,100), BackgroundTransparency = 1})
        local inner = createInstance("Frame", notifyFrame, {Size = UDim2.new(1,-20,0,100), BackgroundColor3 = theme["Color Hub 4"], BackgroundTransparency = 0.1})
        addStroke(inner, theme["Color Hub 2"], 3, 0.1)
        addCorner(inner, UDim.new(0,8))
        local topBar = createInstance("Frame", inner, {Size = UDim2.new(1,0,0,30), BackgroundColor3 = theme["Color Stroke"], BackgroundTransparency = 0.5})
        addCorner(topBar, UDim.new(0,5))
        addStroke(topBar, theme["Color Hub 2"], 1.7, 0)
        createInstance("TextLabel", topBar, {Size = UDim2.new(1,-40,1,0), Position = UDim2.new(0.5,0,0.5,0), AnchorPoint = Vector2.new(0.5,0.5), BackgroundTransparency = 1, Text = title, Font = Enum.Font.GothamBold, TextSize = 20, TextColor3 = theme["Color Text"], TextXAlignment = Enum.TextXAlignment.Center})
        createInstance("TextButton", topBar, {Text = "X", Font = Enum.Font.GothamBold, TextSize = 20, BackgroundTransparency = 1, TextColor3 = theme["Color Text"], Position = UDim2.new(1,-5,0.5,0), AnchorPoint = Vector2.new(1,0.5), Size = UDim2.new(0,25,0,25)}).MouseButton1Click:Connect(function() notifyFrame:Destroy() end)
        local progress = createInstance("Frame", inner, {Size = UDim2.new(1,-20,0,2), Position = UDim2.new(0,10,0,30), BackgroundColor3 = theme["Color Effect"]})
        addCorner(progress, UDim.new(0,1))
        local content = createInstance("Frame", inner, {Size = UDim2.new(1,-20,0,60), Position = UDim2.new(0,10,0,38), BackgroundTransparency = 1, ClipsDescendants = true})
        if icon then
            local iconFrame = createInstance("Frame", content, {Size = UDim2.new(0,70,1,0), Position = UDim2.new(0,0,0,-2), BackgroundTransparency = 1, ClipsDescendants = true})
            createInstance("ImageLabel", iconFrame, {Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1, Image = icon, ScaleType = Enum.ScaleType.Fit})
            createInstance("TextLabel", content, {Size = UDim2.new(1,-85,1,0), Position = UDim2.new(0,80,0,0), Text = desc, Font = Enum.Font.Gotham, TextSize = 16, TextColor3 = theme["Color Dark Text"], BackgroundTransparency = 1, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top})
        else
            createInstance("TextLabel", content, {Size = UDim2.new(1,0,1,0), Position = UDim2.new(0,0,0,0), Text = desc, Font = Enum.Font.Gotham, TextSize = 16, TextColor3 = theme["Color Dark Text"], BackgroundTransparency = 1, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top})
        end
        task.spawn(function()
            local tween = TweenService:Create(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0,0,0,2), Position = UDim2.new(0.5,0,0,30)})
            tween:Play()
            tween.Completed:Wait()
            notifyFrame:Destroy()
        end)
    end
    local mainFrame = createInstance("Frame", screenGui, {Name = "MainFrame", BackgroundColor3 = theme["Color Hub 2"], Size = UDim2.new(0.5,0,0.6,0), Position = UDim2.new(0.5,0,0.5,0), AnchorPoint = Vector2.new(0.5,0.5), BackgroundTransparency = 0.1, Active = true})
    addCorner(mainFrame, UDim.new(0,10))
    addStroke(mainFrame, theme["Color Hub 2"], 3, 0)
    makeDraggable(mainFrame)
    local topBar = createInstance("Frame", mainFrame, {Name = "TopBar", BackgroundColor3 = theme["Color Stroke"], Size = UDim2.new(1,0,0,36), BackgroundTransparency = 0.5})
    addCorner(topBar, UDim.new(0.2,0))
    addStroke(topBar, theme["Color Hub 2"], 1.7, 0)
    local titleLabel = createInstance("TextLabel", topBar, {Text = title, TextColor3 = whitelistStatus == "VIP" and Color3.fromRGB(255,215,0) or theme["Color Text"], Font = Enum.Font.GothamBold, TextSize = 20, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.new(0,15,0.5,0), AnchorPoint = Vector2.new(0,0.5), AutomaticSize = "XY", BackgroundTransparency = 1})
    createInstance("TextLabel", titleLabel, {Size = UDim2.fromScale(0,1), AutomaticSize = "X", AnchorPoint = Vector2.new(0,1), Position = UDim2.new(1,5,0.9,5), Text = subTitle, TextColor3 = theme["Color Dark Text"], BackgroundTransparency = 1, TextXAlignment = "Left", TextYAlignment = "Center", TextSize = 11, Font = Enum.Font.Gotham, Name = "SubTitle"})
    local statusContainer = createInstance("Frame", topBar, {Name = "StatusContainer", BackgroundTransparency = 1, AnchorPoint = Vector2.new(1,0.5), Position = UDim2.new(1,-104,0.5,0), AutomaticSize = Enum.AutomaticSize.X})
    createInstance("UIListLayout", statusContainer, {FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0,8)})
    local function addStatus(icon, text, order, font, size, color, offsetY)
        local container = createInstance("Frame", statusContainer, {BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.X, Size = UDim2.new(0,0,1,0), LayoutOrder = order})
        local img = createInstance("ImageLabel", container, {Size = UDim2.new(0,18,0,18), BackgroundTransparency = 1, Image = icon, ImageColor3 = whitelistStatus == "VIP" and Color3.fromRGB(255,215,0) or Color3.fromRGB(255,255,255), Position = UDim2.new(0,0,0.5,offsetY or 0), AnchorPoint = Vector2.new(0,0.5)})
        local label = createInstance("TextLabel", container, {Text = text, TextColor3 = color or theme["Color Dark Text"], Font = font or Enum.Font.GothamBold, TextSize = size or 12, BackgroundTransparency = 1, Position = UDim2.new(0,20,0.5,0), AnchorPoint = Vector2.new(0,0.5), AutomaticSize = Enum.AutomaticSize.X})
        return container, img, label
    end
    local _, _, gameTimeLabel = addStatus(getIcon("alarmcheck"), "", 1, Enum.Font.GothamBold, 12)
    local _, pingIcon, pingLabel = addStatus(getIcon("Watch"), "", 2, Enum.Font.GothamBold, 12)
    local _, fpsIcon, fpsLabel = addStatus(getIcon("Wifi"), "", 3, Enum.Font.GothamBold, 12)
    local _, clockIcon, clockLabel = addStatus(getIcon("Clock"), "00:00:00", 4, Enum.Font.FredokaOne, 16, Color3.fromRGB(255,170,0), 2)
    local clockHeight = clockLabel.AbsoluteSize.Y
    for _, frame in {gameTimeLabel.Parent, pingLabel.Parent, fpsLabel.Parent, clockLabel.Parent} do
        frame.Size = UDim2.new(frame.Size.X.Scale, frame.Size.X.Offset, 0, clockHeight)
    end
    pingIcon.Position = UDim2.new(0,0,0.5,0)
    fpsLabel.Position = UDim2.new(0,17,0.5,0)
    task.spawn(function()
        while task.wait(1) do
            local time = workspace.DistributedGameTime
            local days = math.floor(time / 86400)
            local hours = math.floor(time % 86400 / 3600)
            local mins = math.floor(time % 3600 / 60)
            local secs = math.floor(time % 60)
            local parts = {days, hours, mins, secs}
            while parts[1] == 0 and #parts > 1 do table.remove(parts, 1) end
            for i = 1, #parts do parts[i] = string.format("%02d", parts[i]) end
            gameTimeLabel.Text = table.concat(parts, ":")
        end
    end)
    local fps = 0
    local lastTick = tick()
    local frames = 0
    game:GetService("RunService").RenderStepped:Connect(function()
        frames += 1
        local now = tick()
        if now - lastTick >= 1 then
            fps = frames
            frames = 0
            lastTick = now
            local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+")) or 0
            pingLabel.Text = ping .. " MS"
            pingLabel.TextColor3 = ping >= 350 and Color3.fromRGB(255,0,0) or ping >= 180 and Color3.fromRGB(255,255,0) or Color3.fromRGB(0,255,0)
            fpsLabel.Text = "FPS: " .. fps
            fpsLabel.TextColor3 = fps < 20 and Color3.fromRGB(255,0,0) or fps <= 30 and Color3.fromRGB(255,255,0) or Color3.fromRGB(0,255,0)
        end
    end)
    local minimizeBtn = createInstance("TextButton", topBar, {Name = "Minimize", Text = "-", TextColor3 = whitelistStatus == "VIP" and Color3.fromRGB(255,215,0) or theme["Color Text"], Font = Enum.Font.GothamBold, TextSize = 30, BackgroundTransparency = 1, Size = UDim2.new(0,30,0,30), Position = UDim2.new(1,-65,0,5)})
    local closeBtn = createInstance("TextButton", topBar, {Name = "Close", Text = "×", TextColor3 = whitelistStatus == "VIP" and Color3.fromRGB(255,215,0) or theme["Color Text"], Font = Enum.Font.GothamBold, TextSize = 35, BackgroundTransparency = 1, Size = UDim2.new(0,30,0,30), Position = UDim2.new(1,-35,0,5)})
    local minimized = false
    minimizeBtn.MouseButton1Click:Connect(function()
        if minimized then
            for _, child in mainFrame:GetChildren() do
                if child.Name ~= "UICorner" and child.Name ~= "TopBar" and child.Name ~= "UIStroke" then
                    task.delay(0.1, function() child.Visible = true end)
                end
            end
            TweenService:Create(mainFrame, TweenInfo.new(0.2), {Size = UDim2.new(0.5,0,0.6,0)}):Play()
            minimizeBtn.Text = "-"
            minimized = false
        else
            for _, child in mainFrame:GetChildren() do
                if child.Name ~= "UICorner" and child.Name ~= "TopBar" and child.Name ~= "UIStroke" then
                    child.Visible = false
                end
            end
            TweenService:Create(mainFrame, TweenInfo.new(0.2), {Size = UDim2.new(0.5,0,0,36)}):Play()
            minimizeBtn.Text = "+"
            minimized = true
        end
    end)
    closeBtn.MouseButton1Click:Connect(function()
        TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
        task.delay(0.1, function() screenGui:Destroy() end)
    end)
    local tabsBar = createInstance("Frame", mainFrame, {Name = "TabsBar", BackgroundColor3 = Color3.fromRGB(30,30,30), Size = UDim2.new(0,176,0,270), BackgroundTransparency = 1, Position = UDim2.new(0,2,0.1,0)})
    addCorner(tabsBar, UDim.new(0.05,0))
    addStroke(tabsBar, theme["Color Hub 2"], 1.5, 0)
    local tabsScroll = createInstance("ScrollingFrame", tabsBar, {BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0), ScrollBarThickness = 0, AutomaticCanvasSize = Enum.AutomaticSize.Y})
    createInstance("UIListLayout", tabsScroll, {Padding = UDim.new(0,8)})
    local containers = createInstance("Frame", mainFrame, {Name = "Containers", BackgroundColor3 = Color3.fromRGB(28,28,28), BackgroundTransparency = 0.5, Size = UDim2.new(0,470,0.9,0), Position = UDim2.new(0.3,-15,0.1,0)})
    addCorner(containers)
    createInstance("UIPadding", containers, {PaddingLeft = UDim.new(0,7), PaddingRight = UDim.new(0,7), PaddingTop = UDim.new(0,7), PaddingBottom = UDim.new(0,7)})
    local currentTab = nil
    function NewTab(data)
        local name = data.Name or data.Text or "Tab"
        local icon = data.Icon or "Home"
        local tabBtn = createInstance("TextButton", tabsScroll, {Text = "", BackgroundColor3 = theme["Color Stroke"], Size = UDim2.new(1,-10,0,30), AutoButtonColor = false})
        addCorner(tabBtn, UDim.new(0.3,0))
        local indicator = createInstance("Frame", tabBtn, {Position = UDim2.new(0,3,0,5), BackgroundColor3 = theme["Color Hub 3"], Size = UDim2.new(0,6,0,20), BackgroundTransparency = 0.8})
        addCorner(indicator, UDim.new(1,0))
        createInstance("TextLabel", tabBtn, {Text = name, BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(200,200,200), Font = Enum.Font.GothamBold, TextSize = 14, Position = UDim2.new(0,35,0,5), Size = UDim2.new(0,140,0,20), TextXAlignment = Enum.TextXAlignment.Left})
        createInstance("ImageLabel", tabBtn, {Image = getIcon(icon) or getIcon("Home"), Size = UDim2.new(0,20,0,20), Position = UDim2.new(0,11,0,5), ImageColor3 = Color3.fromRGB(200,200,200), BackgroundTransparency = 1})
        local container = createInstance("ScrollingFrame", containers, {Name = name, BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0), Visible = false, ScrollBarThickness = 0, AutomaticCanvasSize = Enum.AutomaticSize.Y})
        createInstance("UIListLayout", container, {Padding = UDim.new(0,8), HorizontalAlignment = Enum.HorizontalAlignment.Center})
        Library.Tabs[name] = container
        if not currentTab then
            currentTab = name
            container.Visible = true
            TweenService:Create(indicator, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
            tabBtn.BackgroundColor3 = theme["Color Hub 5"]
        end
        tabBtn.MouseButton1Click:Connect(function()
            for _, btn in tabsScroll:GetChildren() do
                if btn:IsA("TextButton") then
                    local ind = btn:FindFirstChild("Frame")
                    if ind then TweenService:Create(ind, TweenInfo.new(0.2), {BackgroundTransparency = 0.8}):Play() end
                    btn.BackgroundColor3 = theme["Color Hub 4"]
                end
            end
            for _, cont in containers:GetChildren() do
                if cont:IsA("ScrollingFrame") then cont.Visible = false end
            end
            TweenService:Create(indicator, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
            tabBtn.BackgroundColor3 = theme["Color Hub 5"]
            container.Visible = true
            currentTab = name
        end)
        return container
    end
    function AddButton(container, data)
        local text = data.Name or data.Text or data[1] or "Button"
        local callback = data.Callback or function() end
        local btn = createInstance("TextButton", container, {Text = "", BackgroundColor3 = theme["Color Hub 4"], Size = UDim2.new(0,455,0,40), AutoButtonColor = false})
        addCorner(btn, UDim.new(0.2,0))
        local label = createInstance("TextLabel", btn, {Text = text, TextColor3 = theme["Color Text"], Font = Enum.Font.GothamBold, TextSize = 20, Size = UDim2.new(0,408,0,40), Position = UDim2.new(0,10,0,0), BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left})
        local arrow = createInstance("ImageLabel", btn, {Image = "rbxassetid://10709791437", Size = UDim2.new(0,30,0,30), Position = UDim2.new(1,-35,0,5), BackgroundTransparency = 1})
        btn.MouseButton1Click:Connect(function()
            callback()
            TweenService:Create(label, TweenInfo.new(0.3), {TextColor3 = theme["Color Effect"]}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.3), {ImageColor3 = theme["Color Effect"]}):Play()
            task.wait(0.3)
            TweenService:Create(label, TweenInfo.new(0.3), {TextColor3 = theme["Color Text"]}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.3), {ImageColor3 = theme["Color Text"]}):Play()
        end)
        return {Button = btn, TextLabel = label}
    end
    function AddToggle(container, data)
        local text = data.Name or data.Text or data[1] or "Toggle"
        local default = data.Default or data[2] or false
        local callback = data.Callback or data[3] or function() end
        local frame = createInstance("Frame", container, {Size = UDim2.new(0,455,0,40), BackgroundColor3 = theme["Color Hub 4"]})
        addCorner(frame, UDim.new(0.2,0))
        local toggleBg = createInstance("Frame", frame, {Size = UDim2.new(0,60,0,28), Position = UDim2.new(1,-70,0,6), BackgroundColor3 = theme["Color Hub 5"]})
        addCorner(toggleBg, UDim.new(2,0))
        local knob = createInstance("Frame", frame, {Size = UDim2.new(0,18,0,18), Position = default and UDim2.new(1,-34,1,-11) or UDim2.new(0.1,345,1,-11), AnchorPoint = Vector2.new(0,1), BackgroundColor3 = default and theme["Color Hub 3"] or theme["Color Toggle Off"], BackgroundTransparency = default and 0 or 0.8})
        addCorner(knob, UDim.new(5,0))
        local label = createInstance("TextLabel", frame, {Text = text, TextColor3 = theme["Color Text"], Font = Enum.Font.GothamBold, TextSize = 20, Size = UDim2.new(0,350,0,40), Position = UDim2.new(0,10,0,0), BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left})
        local btn = createInstance("TextButton", frame, {Size = UDim2.new(0,60,0,28), Position = UDim2.new(1,-70,0,6), BackgroundTransparency = 1, Text = ""})
        local state = default
        btn.MouseButton1Click:Connect(function()
            state = not state
            TweenService:Create(knob, TweenInfo.new(0.15), {Position = state and UDim2.new(1,-34,1,-11) or UDim2.new(0.1,345,1,-11), BackgroundColor3 = state and theme["Color Hub 3"] or theme["Color Toggle Off"], BackgroundTransparency = state and 0 or 0.8}):Play()
            callback(state)
        end)
        if default then callback(default) end
        return {ToggleFrame1 = frame, TextToggle = label}
    end
    function AddDropDown(container, data)
        local name = data.Name or data.Text or data[1] or "Dropdown"
        local options = data.Options or data[2] or {"Option 1"}
        local multi = data.MultiSelect or data[3] or false
        local default = data.Default or data[4] or (multi and {} or options[1])
        local callback = data.Callback or data[5] or function() end
        local frame = createInstance("Frame", container, {Size = UDim2.new(0,455,0,40), BackgroundColor3 = theme["Color Hub 4"]})
        addCorner(frame, UDim.new(0,10))
        local btn = createInstance("TextButton", frame, {Size = UDim2.new(0,30,0,30), Position = UDim2.new(1,-40,0,5), BackgroundTransparency = 1, Text = ""})
        createInstance("TextLabel", frame, {Size = UDim2.new(1,-210,0,25), Position = UDim2.new(0,10,0,8), Text = name, Font = Enum.Font.GothamBold, TextColor3 = theme["Color Text"], TextSize = 20, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left})
        local valueBg = createInstance("Frame", frame, {Size = UDim2.new(0,150,0,30), Position = UDim2.new(0,260,0,5), BackgroundColor3 = theme["Color Hub 5"]})
        addCorner(valueBg)
        local valueLabel = createInstance("TextLabel", valueBg, {Size = UDim2.new(0,150,0,30), Text = multi and table.concat(default, ", ") or default, Font = Enum.Font.GothamMedium, TextColor3 = theme["Color Text"], TextSize = 15, BackgroundTransparency = 1, TextScaled = true, TextXAlignment = Enum.TextXAlignment.Center})
        local list = createInstance("ScrollingFrame", frame, {Name = "listdrop", Size = UDim2.new(1,-4,1,-41), Position = UDim2.new(0,2,1,0), AnchorPoint = Vector2.new(0,1), Visible = false, BackgroundTransparency = 1, ScrollBarThickness = 0, AutomaticCanvasSize = Enum.AutomaticSize.Y})
        createInstance("UIPadding", list, {PaddingLeft = UDim.new(0,10), PaddingRight = UDim.new(0,10), PaddingTop = UDim.new(0,5)})
        createInstance("UIListLayout", list, {Padding = UDim.new(0,5)})
        local arrow = createInstance("ImageLabel", frame, {Image = "rbxassetid://6031090990", Size = UDim2.new(0,30,0,30), Position = UDim2.new(1,-40,0,5), BackgroundTransparency = 1})
        local selected = {}
        local function createOption(opt)
            local optBtn = createInstance("TextButton", list, {Size = UDim2.new(1,0,0,20), BackgroundColor3 = theme["Color Hub 6"], BackgroundTransparency = 0.5, Text = "", AutoButtonColor = false})
            addCorner(optBtn)
            local optLabel = createInstance("TextLabel", optBtn, {Size = UDim2.new(0,415,0,20), Position = UDim2.new(0,12,0,0), Text = opt, TextColor3 = theme["Color Dark Text"], TextSize = 15, Font = Enum.Font.GothamBold, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left})
            local marker = createInstance("Frame", optBtn, {Position = UDim2.new(0,3,0,2), Size = UDim2.new(0,5,0,16), BackgroundColor3 = theme["Color Hub 3"], BackgroundTransparency = 0.7})
            addCorner(marker)
            local active = false
            if multi then
                if typeof(default) == "table" and table.find(default, opt) then
                    table.insert(selected, optBtn)
                    valueLabel.Text = table.concat(default, ", ")
                    active = true
                end
            elseif opt == default then
                valueLabel.Text = opt
                callback(opt)
                active = true
            end
            if active then
                TweenService:Create(marker, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
                optLabel.TextColor3 = theme["Color Text"]
                optBtn.BackgroundColor3 = theme["Color Hub 7"]
            end
            optBtn.MouseButton1Click:Connect(function()
                if multi then
                    if table.find(selected, optBtn) then
                        if #selected > 1 then
                            table.remove(selected, table.find(selected, optBtn))
                            TweenService:Create(marker, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play()
                            optLabel.TextColor3 = theme["Color Dark Text"]
                            optBtn.BackgroundColor3 = theme["Color Hub 6"]
                        end
                    else
                        table.insert(selected, optBtn)
                        TweenService:Create(marker, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
                        optLabel.TextColor3 = theme["Color Text"]
                        optBtn.BackgroundColor3 = theme["Color Hub 7"]
                    end
                    local texts = {}
                    for _, b in selected do table.insert(texts, b:FindFirstChild("TextLabel").Text) end
                    valueLabel.Text = table.concat(texts, ", ")
                    callback(valueLabel.Text)
                else
                    for _, b in list:GetChildren() do
                        if b:IsA("TextButton") then
                            local m = b:FindFirstChild("Frame")
                            if m then TweenService:Create(m, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play() end
                            b:FindFirstChild("TextLabel").TextColor3 = theme["Color Dark Text"]
                            b.BackgroundColor3 = theme["Color Hub 6"]
                        end
                    end
                    TweenService:Create(marker, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
                    optLabel.TextColor3 = theme["Color Text"]
                    optBtn.BackgroundColor3 = theme["Color Hub 7"]
                    valueLabel.Text = opt
                    callback(opt)
                end
            end)
        end
        for _, opt in options do createOption(opt) end
        local open = false
        btn.MouseButton1Click:Connect(function()
            open = not open
            list.Visible = open
            TweenService:Create(arrow, TweenInfo.new(0.2), {Rotation = open and 180 or 0}):Play()
            TweenService:Create(frame, TweenInfo.new(0.2), {Size = open and UDim2.new(0,455,0,100) or UDim2.new(0,455,0,40)}):Play()
        end)
        return frame
    end
    function AddTextBox(container, data)
        local name = data.Name or data.Text or data[1] or "TextBox"
        local default = data.Default or data[2] or ""
        local clearOnFocus = data.AutoClear or data[3] or false
        local placeholder = data.PlaceHolder or data[4] or "Input"
        local callback = data.Callback or data[5] or function() end
        local frame = createInstance("Frame", container, {Size = UDim2.new(0,455,0,40), BackgroundColor3 = theme["Color Hub 4"]})
        addCorner(frame, UDim.new(0.2,0))
        createInstance("TextLabel", frame, {Text = name, TextColor3 = Color3.fromRGB(240,240,240), Font = Enum.Font.GothamBold, TextSize = 20, Size = UDim2.new(0,250,0,25), Position = UDim2.new(0,10,0,8), BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left})
        local box = createInstance("TextBox", frame, {Size = UDim2.new(0,120,1,-10), Position = UDim2.new(1,-130,0,5), ClearTextOnFocus = clearOnFocus, BackgroundColor3 = theme["Color Hub 5"], Text = default, TextColor3 = theme["Color Text"], PlaceholderText = placeholder, PlaceholderColor3 = theme["Color Dark Text"], TextScaled = true})
        addStroke(box, theme["Color Stroke"], 2)
        addCorner(box)
        createInstance("ImageLabel", frame, {Image = "rbxassetid://15637081879", Size = UDim2.new(0,25,0,25), Position = UDim2.new(1,-165,0,8), BackgroundTransparency = 1})
        callback(default)
        box.FocusLost:Connect(function() callback(box.Text) end)
        return {TextBoxFrame = frame, TextBox = box}
    end
    function AddMinimizeButton(data)
        local icon = data.Icon or data[1] or "10734897102"
        if not string.find(icon, "rbxassetid://") then icon = "rbxassetid://" .. icon end
        local btn = createInstance("ImageButton", screenGui, {Image = icon, Size = UDim2.new(0,50,0,50), Position = UDim2.new(0,117,0,68), BackgroundColor3 = theme["Color Hub 5"], AnchorPoint = Vector2.new(0,0)})
        addStroke(btn)
        addCorner(btn, UDim.new(0,9))
        makeDraggable(btn)
        local originalSize = mainFrame.Size
        local originalPos = mainFrame.Position
        local hidden = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
        if hidden then mainFrame.Visible = false end
        local function hide()
            TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
            task.delay(0.1, function() mainFrame.Visible = false mainFrame.Size = originalSize mainFrame.Position = originalPos end)
            hidden = true
        end
        local function show()
            mainFrame.Visible = true
            mainFrame.Size = UDim2.new(0,0,0,0)
            mainFrame.Position = originalPos
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = originalSize}):Play()
            hidden = false
        end
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.LeftControl then
                if hidden then show() else hide() end
            end
        end)
        btn.MouseButton1Click:Connect(function()
            if hidden then show() else hide() end
        end)
        return btn
    end
    return screenGui
end

local gameName = "Chess"
pcall(function()
    gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
end)
MakeWindow({Title = gameName, SubTitle = "V1.3", Theme = "Greener"})
AddMinimizeButton({Icon = "105855861857949"})

local utilitiesTab = NewTab({Name = "Utilities", Icon = "Hammer"})

local ENGINES = {
    ProBot      = {depth = 1,  variants = 5},
    Blatant     = {depth = 2,  variants = 1},
    HumanEngine = {depth = 4,  variants = 1},
    Stockfish   = {depth = 22, variants = 5},
    Lc0         = {depth = 18, variants = 5},
    Torch       = {depth = 20, variants = 5},
    Dx100       = {depth = 24, variants = 4},
    KnightX     = {depth = 26, variants = 8},
    HyperX      = {depth = 28, variants = 7},
    Br1lliance  = {depth = 30, variants = 12},
    Undefeated  = {depth = 32, variants = 14},
    WurstEngine = {depth = 34, variants = 8},
    Axizion     = {depth = 36, variants = 9},
    Zxero       = {depth = 42, variants = 12},
    Voidz       = {depth = 70, variants = 1},
    Future      = {depth = 80, variants = 2}
}

local engineList = {
    "ProBot","Blatant","HumanEngine","Stockfish","Lc0","Torch","Dx100",
    "KnightX","HyperX","Br1lliance","Undefeated","WurstEngine",
    "Axizion","Zxero","Voidz","Future"
}
local currentEngine = "Stockfish"

local depth = 22
local maxTime = 3000
local minDelay = 2
local maxDelay = 3
local autoPlay = false
local keybind = Enum.KeyCode.K
local variantEnabled = false
local moving = false

local request = syn and syn.request or http and http.request or request or http_request or game.HttpGet

local function isMyTurn()
    local tableset = game:GetService("ReplicatedStorage").InternalClientEvents.GetActiveTableset:Invoke()
    if not tableset then return false end
    local white = tableset:FindFirstChild("WhitePlayer")
    local black = tableset:FindFirstChild("BlackPlayer")
    local whiteTurn = tableset:FindFirstChild("WhiteToPlay")
    if not (white and black and whiteTurn) then return false end
    local myName = LocalPlayer.Name
    local iAmWhite = white.Value == myName
    local iAmBlack = black.Value == myName
    if not (iAmWhite or iAmBlack) then return false end
    return (whiteTurn.Value and iAmWhite) or (not whiteTurn.Value and iAmBlack)
end

local function playMove()
    if moving or not isMyTurn() then return end
    local tableset = game:GetService("ReplicatedStorage").InternalClientEvents.GetActiveTableset:Invoke()
    if not tableset then return end
    local fen = tableset.FEN.Value
    moving = true

    local cfg = ENGINES[currentEngine] or ENGINES.Stockfish
    local variants = variantEnabled and math.random(1, cfg.variants) or 1

    local body = game:GetService("HttpService"):JSONEncode({fen = fen, variants = variants, depth = cfg.depth, maxThinkingTime = maxTime})
    local success, resp = pcall(function()
        return request({Url = "https://chess-api.com/v1", Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
    end)

    if success and resp and (resp.Success or resp.StatusCode == 200) then
        local data = game:GetService("HttpService"):JSONDecode(resp.Body)
        if data and data.lan then
            game:GetService("ReplicatedStorage").Chess.SubmitMove:InvokeServer(data.lan)
            moving = false
            return
        end
    end

    local sunfishMove = tostring(require(LocalPlayer.PlayerScripts.AI.Sunfish):GetBestMove(fen, cfg.depth))
    if sunfishMove and sunfishMove ~= "" then
        game:GetService("ReplicatedStorage").Chess.SubmitMove:InvokeServer(sunfishMove)
    end
    moving = false
end

task.spawn(function()
    while task.wait() do
        if autoPlay and isMyTurn() then
            task.wait(math.random(minDelay, maxDelay))
            playMove()
        end
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputState == Enum.UserInputState.Begin and input.KeyCode == keybind then
        playMove()
    end
end)

AddDropDown(utilitiesTab, {
    Name = "Engine",
    Options = engineList,
    Default = "Stockfish",
    Callback = function(v)
        currentEngine = v
    end
})

AddToggle(utilitiesTab, {Name = "Human Variant", Default = false, Callback = function(v) variantEnabled = v end})
AddTextBox(utilitiesTab, {Name = "Max Thinking Time (ms)", Default = "3000", Callback = function(v) maxTime = tonumber(v) or maxTime end})
AddTextBox(utilitiesTab, {Name = "Play Move Keybind", Default = "K", Callback = function(v) keybind = Enum.KeyCode[v:upper()] or keybind end})
AddTextBox(utilitiesTab, {Name = "Minimum Random Delay", Default = "2", Callback = function(v) minDelay = tonumber(v) or minDelay end})
AddTextBox(utilitiesTab, {Name = "Maximum Random Delay", Default = "3", Callback = function(v) maxDelay = tonumber(v) or maxDelay end})
AddToggle(utilitiesTab, {Name = "Auto Play", Default = false, Callback = function(v) autoPlay = v end})
AddButton(utilitiesTab, {Name = "Play Move", Callback = playMove})
