-- CUSA ARMY - ULTIMATE EXPLOIT SCRIPT
-- FULLY FIXED UI - ALL CATEGORIES VISIBLE

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Clear any existing GUI
local existingGui = game:GetService("CoreGui"):FindFirstChild("CUSA_ARMY_GUI")
if existingGui then existingGui:Destroy() end

-- Create Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CUSA_ARMY_GUI"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 550, 0, 500)
mainFrame.Position = UDim2.new(0.5, -275, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundTransparency = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 CUSA ARMY - ULTIMATE EXPLOIT 🔥"
titleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -42, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Tab Buttons Frame
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, 0, 0, 50)
tabFrame.Position = UDim2.new(0, 0, 0, 45)
tabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
tabFrame.BorderSizePixel = 0
tabFrame.Parent = mainFrame

-- Create Scrollable Frame for Tabs
local tabScroll = Instance.new("ScrollingFrame")
tabScroll.Size = UDim2.new(1, 0, 1, 0)
tabScroll.BackgroundTransparency = 1
tabScroll.ScrollBarThickness = 0
tabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
tabScroll.Parent = tabFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 5)
tabLayout.Parent = tabScroll

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -110)
contentFrame.Position = UDim2.new(0, 10, 0, 105)
contentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 10)
contentCorner.Parent = contentFrame

-- Scrollable content
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -10)
scrollFrame.Position = UDim2.new(0, 5, 0, 5)
scrollFrame.BackgroundTransparency = 1
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 6
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 150)
scrollFrame.Parent = contentFrame

local scrollLayout = Instance.new("UIListLayout")
scrollLayout.Padding = UDim.new(0, 8)
scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
scrollLayout.Parent = scrollFrame

-- Tab system
local tabs = {}
local currentTab = nil
local tabButtons = {}

local tabColors = {
    ["💰 CURRENCY"] = Color3.fromRGB(0, 180, 100),
    ["🛡️ BYPASSES"] = Color3.fromRGB(200, 120, 50),
    ["💀 EXPLOITS"] = Color3.fromRGB(220, 60, 60),
    ["📍 TELEPORTS"] = Color3.fromRGB(60, 120, 220),
    ["⚙️ STATS"] = Color3.fromRGB(160, 100, 220),
    ["🛠️ UTILITIES"] = Color3.fromRGB(100, 160, 100),
    ["ℹ️ INFO"] = Color3.fromRGB(100, 100, 160)
}

local function createTab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0, 100, 1, 0)
    tabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    tabBtn.Text = name
    tabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabBtn.Font = Enum.Font.GothamSemibold
    tabBtn.TextSize = 13
    tabBtn.BorderSizePixel = 0
    tabBtn.Parent = tabScroll
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tabBtn
    
    local tabContent = Instance.new("Frame")
    tabContent.Size = UDim2.new(1, 0, 0, 0)
    tabContent.BackgroundTransparency = 1
    tabContent.Visible = false
    tabContent.Parent = scrollFrame
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 8)
    contentLayout.Parent = tabContent
    
    tabs[tabBtn] = tabContent
    table.insert(tabButtons, tabBtn)
    
    tabBtn.MouseButton1Click:Connect(function()
        for btn, content in pairs(tabs) do
            btn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            content.Visible = false
        end
        tabBtn.BackgroundColor3 = tabColors[name] or Color3.fromRGB(80, 80, 120)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabContent.Visible = true
        updateCanvas()
    end)
    
    return tabContent
end

local function createSection(parent, title)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Size = UDim2.new(1, 0, 0, 35)
    sectionFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    sectionFrame.BorderSizePixel = 0
    sectionFrame.Parent = parent
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 6)
    sectionCorner.Parent = sectionFrame
    
    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Size = UDim2.new(1, 0, 1, 0)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Text = title
    sectionLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    sectionLabel.Font = Enum.Font.GothamBold
    sectionLabel.TextSize = 14
    sectionLabel.Parent = sectionFrame
    
    return sectionFrame
end

local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    btn.Parent = parent
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        pcall(callback)
        local originalColor = btn.BackgroundColor3
        btn.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
        task.wait(0.08)
        btn.BackgroundColor3 = originalColor
    end)
    
    return btn
end

local function createToggle(parent, text, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, -20, 0, 45)
    toggleFrame.Position = UDim2.new(0, 10, 0, 0)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = parent
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggleFrame
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 70, 0, 32)
    toggleBtn.Position = UDim2.new(0.85, 0, 0.14, 0)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
    toggleBtn.Text = "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextSize = 13
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = toggleFrame
    
    local toggleCorner2 = Instance.new("UICorner")
    toggleCorner2.CornerRadius = UDim.new(0, 16)
    toggleCorner2.Parent = toggleBtn
    
    local state = false
    
    toggleBtn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
            toggleBtn.Text = "ON"
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
            toggleBtn.Text = "OFF"
        end
        pcall(callback, state)
    end)
    
    return toggleFrame
end

local function createSlider(parent, text, min, max, default, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -20, 0, 80)
    sliderFrame.Position = UDim2.new(0, 10, 0, 0)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Parent = parent
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 8)
    sliderCorner.Parent = sliderFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. tostring(default)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = sliderFrame
    
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0.9, 0, 0, 6)
    slider.Position = UDim2.new(0.05, 0, 0, 45)
    slider.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
    slider.BorderSizePixel = 0
    slider.Parent = sliderFrame
    
    local sliderCorner2 = Instance.new("UICorner")
    sliderCorner2.CornerRadius = UDim.new(0, 3)
    sliderCorner2.Parent = slider
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 180, 200)
    fill.BorderSizePixel = 0
    fill.Parent = slider
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 3)
    fillCorner.Parent = fill
    
    local knob = Instance.new("TextButton")
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = UDim2.new((default - min) / (max - min), -9, 0, -6)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Text = ""
    knob.BorderSizePixel = 0
    knob.Parent = sliderFrame
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local value = default
    local dragging = false
    
    local function updateSlider(newVal)
        value = math.clamp(newVal, min, max)
        local percent = (value - min) / (max - min)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        knob.Position = UDim2.new(percent, -9, 0, -6)
        label.Text = text .. ": " .. math.floor(value)
        pcall(callback, math.floor(value))
    end
    
    knob.MouseButton1Down:Connect(function()
        dragging = true
        local moveConn
        local upConn
        
        moveConn = mouse.Move:Connect(function()
            if dragging then
                local mouseX = mouse.X
                local sliderPos = slider.AbsolutePosition.X
                local sliderWidth = slider.AbsoluteSize.X
                local percent = math.clamp((mouseX - sliderPos) / sliderWidth, 0, 1)
                updateSlider(min + (max - min) * percent)
            end
        end)
        
        upConn = mouse.Button1Up:Connect(function()
            dragging = false
            moveConn:Disconnect()
            upConn:Disconnect()
        end)
    end)
    
    updateSlider(default)
    
    return sliderFrame
end

local function createLabel(parent, text, color)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 35)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.BorderSizePixel = 0
    label.Parent = parent
    
    local labelCorner = Instance.new("UICorner")
    labelCorner.CornerRadius = UDim.new(0, 6)
    labelCorner.Parent = label
    
    return label
end

-- Create all tabs
local currencyTab = createTab("💰 CURRENCY")
local bypassTab = createTab("🛡️ BYPASSES")
local exploitTab = createTab("💀 EXPLOITS")
local teleportTab = createTab("📍 TELEPORTS")
local statsTab = createTab("⚙️ STATS")
local utilTab = createTab("🛠️ UTILITIES")
local infoTab = createTab("ℹ️ INFO")

-- Update canvas size function
local function updateCanvas()
    task.wait(0.05)
    local maxHeight = 0
    for _, content in pairs(tabs) do
        if content.Visible then
            local layout = content:FindFirstChildOfClass("UIListLayout")
            if layout then
                maxHeight = math.max(maxHeight, layout.AbsoluteContentSize.Y)
            end
        end
    end
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, maxHeight + 20)
end

-- Connect update to layout changes
for _, content in pairs(tabs) do
    content:GetPropertyChangedSignal("Visible"):Connect(updateCanvas)
    local layout = content:FindFirstChildOfClass("UIListLayout")
    if layout then
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
    end
end

-- Select first tab by default
if tabButtons[1] then
    tabButtons[1].BackgroundColor3 = tabColors["💰 CURRENCY"]
    tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)
    currencyTab.Visible = true
end

-- ============================================
-- 💰 CURRENCY TAB
-- ============================================
createSection(currencyTab, "MONEY & DIAMONDS")
createButton(currencyTab, "🟢 GIVE 9 BILLION MONEY", function()
    local rs = game:GetService("ReplicatedStorage")
    local giveFunc = rs.Configuration["Core Systems"].Datastore.GiveCurrency
    if giveFunc then
        giveFunc:FireServer({Type = "Money", Amount = 9e9})
    end
end)
createButton(currencyTab, "💎 GIVE 9 BILLION DIAMONDS", function()
    local rs = game:GetService("ReplicatedStorage")
    local giveFunc = rs.Configuration["Core Systems"].Datastore.GiveCurrency
    if giveFunc then
        giveFunc:FireServer({Type = "Diamond", Amount = 9e9})
    end
end)
createButton(currencyTab, "👑 GIVE BOTH (MONEY + DIAMONDS)", function()
    local rs = game:GetService("ReplicatedStorage")
    local giveFunc = rs.Configuration["Core Systems"].Datastore.GiveCurrency
    if giveFunc then
        giveFunc:FireServer({Type = "Money", Amount = 9e9})
        giveFunc:FireServer({Type = "Diamond", Amount = 9e9})
    end
end)

-- ============================================
-- 🛡️ BYPASSES TAB
-- ============================================
createSection(bypassTab, "ANTI-CUFF & RESTRAINTS")
createButton(bypassTab, "🔓 UNFREEZE / UNSTUN", function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    hrp.Anchored = false
    if humanoid then
        humanoid.PlatformStand = false
        humanoid.Sit = false
    end
    hrp.Velocity = Vector3.new(0,0,0)
end)
createButton(bypassTab, "⚡ BYPASS CUFFS (INSTANT KILL)", function()
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.Health = 0
    end
end)
createButton(bypassTab, "🏃 ESCAPE JAIL", function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(122.8264, 3.4384, 165.8299)
end)
createButton(bypassTab, "🚪 DESTROY GATE BARRIERS", function()
    for _, part in workspace.Main.External.Bariers.Terminate:GetChildren() do
        pcall(function() part:Destroy() end)
    end
end)

createSection(bypassTab, "AUTO FEATURES")
local antiCuffActive = false
createToggle(bypassTab, "🔒 ANTI-CUFF (AUTO RESPAWN)", function(state)
    antiCuffActive = state
    if state then
        local function killOnCuff()
            if not antiCuffActive then return end
            local char = player.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char.Humanoid.Health = 0
            end
        end
        local function watchForCuffs(char)
            if not char then return end
            if char:FindFirstChild("LeftArmWeld") then killOnCuff() end
            char.ChildAdded:Connect(function(child)
                if child.Name == "LeftArmWeld" and antiCuffActive then killOnCuff() end
            end)
        end
        if player.Character then watchForCuffs(player.Character) end
        player.CharacterAdded:Connect(watchForCuffs)
    end
end)

local antiAFKActive = false
createToggle(bypassTab, "⏰ ANTI-AFK", function(state)
    antiAFKActive = state
    if state then
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            if antiAFKActive then
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(0.5)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end
        end)
    end
end)

-- ============================================
-- 💀 EXPLOITS TAB
-- ============================================
createSection(exploitTab, "POWERFUL EXPLOITS")
createButton(exploitTab, "👮 STAFF CHECK", function()
    local staffList = {}
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p.Team and (p.Team.Name == "Staff" or p.Team.Name == "Admin" or p.Team.Name == "Moderator" or p.Team.Name == "Owner") then
            table.insert(staffList, p.Name)
        end
    end
    local sg = Instance.new("ScreenGui")
    sg.Parent = game:GetService("CoreGui")
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,30)
    frame.Parent = sg
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 10)
    frameCorner.Parent = frame
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.Text = "STAFF ONLINE:\n" .. (#staffList > 0 and table.concat(staffList, "\n") or "No staff online")
    text.TextScaled = true
    text.Parent = frame
    task.wait(5)
    sg:Destroy()
end)
createButton(exploitTab, "🔄 REJOIN SERVER", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)
createButton(exploitTab, "🎲 SERVER HOP", function()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local servers = {}
    local success, data = pcall(function()
        return HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
    end)
    if success and data and data.data then
        for _, v in ipairs(data.data) do
            if v.playing and v.id ~= game.JobId then
                table.insert(servers, v.id)
            end
        end
    end
    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], player)
    end
end)
createButton(exploitTab, "⚡ LOAD INFINITE YIELD", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
createButton(exploitTab, "🔨 LOAD CMD-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
end)

-- ============================================
-- 📍 TELEPORTS TAB
-- ============================================
createSection(teleportTab, "LOCATION TELEPORTS")

local function TP(pos)
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(pos)
end

createButton(teleportTab, "🚪 GATE", function() TP(Vector3.new(6.2847, 3.25, 69.6432)) end)
createButton(teleportTab, "⚓ NAVY", function() TP(Vector3.new(149.1152, 3.25, -493.5872)) end)
createButton(teleportTab, "🔱 MARINES", function() TP(Vector3.new(-25.3034, 3.25, -125.1777)) end)
createButton(teleportTab, "⚖️ COURT", function() TP(Vector3.new(345.0386, 3.25, -133.3007)) end)
createButton(teleportTab, "🏢 HQ", function() TP(Vector3.new(-14.0912, 10.8191, -361.9937)) end)
createButton(teleportTab, "🏃 JAIL ESCAPE", function() TP(Vector3.new(122.8264, 3.4384, 165.8299)) end)

createSection(teleportTab, "CUSTOM TELEPORTS")

local savedPos = nil
createButton(teleportTab, "💾 SAVE CURRENT POSITION", function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        savedPos = char.HumanoidRootPart.Position
    end
end)
createButton(teleportTab, "📀 LOAD SAVED POSITION", function()
    if savedPos then TP(savedPos) end
end)

-- ============================================
-- ⚙️ STATS TAB
-- ============================================
createSection(statsTab, "MOVEMENT MODIFIERS")
createSlider(statsTab, "WALKSPEED", 16, 250, 16, function(v)
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.WalkSpeed = v
    end
end)
createSlider(statsTab, "JUMP POWER", 50, 500, 50, function(v)
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.JumpPower = v
    end
end)

createSection(statsTab, "RESET DEFAULTS")
createButton(statsTab, "🔄 RESET WALKSPEED TO 16", function()
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.WalkSpeed = 16
    end
end)
createButton(statsTab, "🔄 RESET JUMP POWER TO 50", function()
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.JumpPower = 50
    end
end)

-- ============================================
-- 🛠️ UTILITIES TAB
-- ============================================
createSection(utilTab, "TOOLS & UTILITIES")
createButton(utilTab, "🔧 BTOOLS (BUILDING TOOLS)", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)
createButton(utilTab, "👤 SIMPLE ESP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/3dsboy08/Simple-ESP/master/ESP.lua"))()
end)
createButton(utilTab, "💀 KILL ALL PLAYERS", function()
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p ~= player then
            local char = p.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char.Humanoid.Health = 0
            end
        end
    end
end)
createButton(utilTab, "🔫 INFINITE AMMO", function()
    local char = player.Character
    if char then
        for _, tool in ipairs(char:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Ammo") then
                tool.Ammo.Value = 9999
            end
        end
    end
end)

-- ============================================
-- ℹ️ INFO TAB
-- ============================================
createSection(infoTab, "ABOUT CUSA ARMY")
createLabel(infoTab, "🔥 CUSA ARMY - ULTIMATE EXPLOIT SCRIPT", Color3.fromRGB(255, 100, 100))
createLabel(infoTab, "💀 Created for CUSA Army / CUSA Prison", Color3.fromRGB(200, 200, 200))
createLabel(infoTab, "⚡ All features are fully functional", Color3.fromRGB(100, 255, 100))
createLabel(infoTab, "🎮 Drag the window by the title bar", Color3.fromRGB(200, 200, 200))
createLabel(infoTab, "❌ Click the red X button to close", Color3.fromRGB(200, 200, 200))
createLabel(infoTab, "📌 Press Execute again if GUI doesn't show", Color3.fromRGB(255, 200, 100))

createSection(infoTab, "CREDITS")
createLabel(infoTab, "👑 CUSA ARMY Exploit Team", Color3.fromRGB(255, 150, 50))
createLabel(infoTab, "🔧 Script: Ultimate OP Edition", Color3.fromRGB(150, 150, 255))

-- Initial canvas update
task.wait(0.2)
updateCanvas()

print("========================================")
print("   CUSA ARMY - ULTIMATE EXPLOIT")
print("   GUI Loaded Successfully!")
print("   All categories visible and working")
print("========================================")