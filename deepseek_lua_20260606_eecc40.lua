--[[
    ██████╗██╗   ██╗███████╗ █████╗     ██████╗ ██████╗     ██╗   ██╗██████╗ 
   ██╔════╝██║   ██║██╔════╝██╔══██╗   ██╔══██╗██╔══██╗    ██║   ██║╚════██╗
   ██║     ██║   ██║███████╗███████║   ██████╔╝██████╔╝    ██║   ██║ █████╔╝
   ██║     ██║   ██║╚════██║██╔══██║   ██╔═══╝ ██╔══██╗    ╚██╗ ██╔╝██╔═══╝ 
   ╚██████╗╚██████╔╝███████║██║  ██║   ██║     ██║  ██║     ╚████╔╝ ███████╗
    ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝     ╚═╝  ╚═╝      ╚═══╝  ╚══════╝
    
                         CUSA OP V2 - ULTIMATE EXPLOIT HUB
                              Created for CUSA Prison
--]]

-- Load the BEST UI Library (Hydroxide Style)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libraries/main/VenyxUI.lua"))()
local Window = Library:CreateWindow("CUSA OP V2", Vector2.new(610, 630), Enum.KeyCode.RightControl)

-- ============================================
-- 💰 CURRENCY EXPLOITS
-- ============================================
local CurrencyTab = Window:AddTab("💰 CURRENCY")
local CurrencySection = CurrencyTab:AddLeftGroupBox("Money & Diamonds Exploits")

CurrencySection:AddButton("🟢 GIVE 9 BILLION MONEY", "Instantly gives $9,000,000,000", function()
    local rs = game:GetService("ReplicatedStorage")
    local giveFunc = rs.Configuration["Core Systems"].Datastore.GiveCurrency
    if giveFunc then
        giveFunc:FireServer({Type = "Money", Amount = 9e9})
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "💰 +$9,000,000,000 Added!", Duration = 2})
    else
        warn("GiveCurrency not found - game may have updated")
    end
end)

CurrencySection:AddButton("💎 GIVE 9 BILLION DIAMONDS", "Instantly gives 9,000,000,000 Diamonds", function()
    local rs = game:GetService("ReplicatedStorage")
    local giveFunc = rs.Configuration["Core Systems"].Datastore.GiveCurrency
    if giveFunc then
        giveFunc:FireServer({Type = "Diamond", Amount = 9e9})
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "💎 +9,000,000,000 Diamonds Added!", Duration = 2})
    end
end)

CurrencySection:AddButton("👑 GIVE BOTH (MONEY + DIAMONDS)", "Gives you both 9B Money and Diamonds", function()
    local rs = game:GetService("ReplicatedStorage")
    local giveFunc = rs.Configuration["Core Systems"].Datastore.GiveCurrency
    if giveFunc then
        giveFunc:FireServer({Type = "Money", Amount = 9e9})
        giveFunc:FireServer({Type = "Diamond", Amount = 9e9})
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "👑 God Mode Unlocked - You're Rich!", Duration = 3})
    end
end)

-- ============================================
-- 🛡️ BYPASSES & ANTIS
-- ============================================
local BypassTab = Window:AddTab("🛡️ BYPASSES")
local BypassGroup = BypassTab:AddLeftGroupBox("Anti-Cuff & Restraints Bypass")

BypassGroup:AddButton("🔓 UNFREEZE / UNSTUN", "Removes all freeze effects", function()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    
    hrp.Anchored = false
    if humanoid then
        humanoid.PlatformStand = false
        humanoid.Sit = false
    end
    hrp.Velocity = Vector3.new(0,0,0)
    hrp.RotVelocity = Vector3.new(0,0,0)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "✅ Unfrozen Successfully!", Duration = 1})
end)

BypassGroup:AddButton("⚡ BYPASS CUFFS (INSTANT DEATH)", "Kills you instantly to break cuffs", function()
    local player = game.Players.LocalPlayer
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.Health = 0
    end
end)

BypassGroup:AddButton("🏃 ESCAPE JAIL", "Teleports out of jail without removing prisoner status", function()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(122.8264, 3.4384, 165.8299)
end)

BypassGroup:AddButton("🚪 BYPASS GATE BARRIERS", "Destroys all gate barriers", function()
    local count = 0
    for _, part in workspace.Main.External.Bariers.Terminate:GetChildren() do
        pcall(function()
            part:Destroy()
            count = count + 1
        end)
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "🚪 Destroyed " .. count .. " gate barriers!", Duration = 2})
end)

-- Anti Features
local AntiGroup = BypassTab:AddRightGroupBox("Auto Anti Features")

local antiCuffActive = false
AntiGroup:AddToggle("🔒 ANTI-CUFF (AUTO RESPAWN)", "Automatically kills you when cuffed", function(state)
    antiCuffActive = state
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    if state then
        local function killOnCuff()
            if not antiCuffActive then return end
            local char = LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char.Humanoid.Health = 0
            end
        end
        
        local function watchForCuffs(char)
            if not char then return end
            if char:FindFirstChild("LeftArmWeld") then
                killOnCuff()
            end
            char.ChildAdded:Connect(function(child)
                if child.Name == "LeftArmWeld" and antiCuffActive then
                    killOnCuff()
                end
            end)
        end
        
        if LocalPlayer.Character then watchForCuffs(LocalPlayer.Character) end
        LocalPlayer.CharacterAdded:Connect(watchForCuffs)
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "🛡️ Anti-Cuff ENABLED", Duration = 1})
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "Anti-Cuff DISABLED", Duration = 1})
    end
end)

local antiAFKActive = false
AntiGroup:AddToggle("⏰ ANTI-AFK", "Prevents being kicked for idling", function(state)
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
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "⏰ Anti-AFK ENABLED", Duration = 1})
    end
end)

-- ============================================
-- 💀 EXPLOITS
-- ============================================
local ExploitTab = Window:AddTab("💀 EXPLOITS")
local ExploitGroup = ExploitTab:AddLeftGroupBox("Powerful Exploits")

ExploitGroup:AddButton("👮 STAFF CHECK", "Shows all online staff members", function()
    local staffList = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Team and (player.Team.Name == "Staff" or player.Team.Name == "Admin" or player.Team.Name == "Moderator" or player.Team.Name == "Owner") then
            table.insert(staffList, player.Name .. " - [" .. player.Team.Name .. "]")
        end
    end
    
    local msg = "👮 STAFF ONLINE 👮\n"
    if #staffList > 0 then
        msg = msg .. table.concat(staffList, "\n")
    else
        msg = msg .. "No staff currently online!"
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = #staffList .. " staff online", Duration = 3})
    -- Create popup GUI
    local sg = Instance.new("ScreenGui")
    sg.Parent = game:GetService("CoreGui")
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    frame.BorderColor3 = Color3.fromRGB(255,0,0)
    frame.BorderSizePixel = 2
    frame.Parent = sg
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.TextScaled = true
    text.Text = msg
    text.Parent = frame
    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0, 30, 0, 20)
    close.Position = UDim2.new(1, -35, 0, 5)
    close.BackgroundColor3 = Color3.fromRGB(255,0,0)
    close.Text = "X"
    close.TextColor3 = Color3.fromRGB(255,255,255)
    close.Parent = frame
    close.MouseButton1Click:Connect(function() sg:Destroy() end)
    task.wait(8)
    pcall(function() sg:Destroy() end)
end)

ExploitGroup:AddButton("🔄 REJOIN SERVER", "Quickly rejoins the current game", function()
    local ts = game:GetService("TeleportService")
    local pl = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, pl)
end)

ExploitGroup:AddButton("🎲 SERVER HOP", "Hops to a random different server", function()
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
        TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game:GetService("Players").LocalPlayer)
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "❌ No other servers found!", Duration = 2})
    end
end)

ExploitGroup:AddButton("⚡ INFINITE YIELD (ADMIN)", "Loads the best admin script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- ============================================
-- 📍 TELEPORTS
-- ============================================
local TeleportTab = Window:AddTab("📍 TELEPORTS")
local TeleGroup = TeleportTab:AddLeftGroupBox("Location Teleports")
local TeleGroup2 = TeleportTab:AddRightGroupBox("Custom Teleports")

local function TP(pos)
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(pos)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "✨ Teleported!", Duration = 0.5})
end

TeleGroup:AddButton("🚪 GATE", "Teleports to the main gate", function() TP(Vector3.new(6.2847, 3.25, 69.6432)) end)
TeleGroup:AddButton("⚓ NAVY", "Teleports to Navy base", function() TP(Vector3.new(149.1152, 3.25, -493.5872)) end)
TeleGroup:AddButton("🔱 MARINES", "Teleports to Marines base", function() TP(Vector3.new(-25.3034, 3.25, -125.1777)) end)
TeleGroup:AddButton("⚖️ COURT", "Teleports to the courthouse", function() TP(Vector3.new(345.0386, 3.25, -133.3007)) end)
TeleGroup:AddButton("🏢 HQ", "Teleports to Headquarters", function() TP(Vector3.new(-14.0912, 10.8191, -361.9937)) end)
TeleGroup:AddButton("🏃 JAIL ESCAPE", "Teleports to jail escape spot", function() TP(Vector3.new(122.8264, 3.4384, 165.8299)) end)

-- Save/Load Positions
local savedPos = nil
TeleGroup2:AddButton("💾 SAVE CURRENT POSITION", "Saves your current location", function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        savedPos = char.HumanoidRootPart.Position
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "📍 Position Saved!", Duration = 1})
    end
end)

TeleGroup2:AddButton("📀 LOAD SAVED POSITION", "Teleports to saved location", function()
    if savedPos then
        TP(savedPos)
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "CUSA OP V2", Text = "❌ No saved position!", Duration = 1})
    end
end)

-- ============================================
-- ⚙️ STATS & MOVEMENT
-- ============================================
local StatsTab = Window:AddTab("⚙️ STATS")
local StatsGroup = StatsTab:AddLeftGroupBox("Movement Modifiers")

local wsSlider = StatsGroup:AddSlider("🏃 WALKSPEED", "Changes your walkspeed", 16, 250, 16, function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.WalkSpeed = v
    end
end)

local jpSlider = StatsGroup:AddSlider("🦘 JUMP POWER", "Changes your jumppower", 50, 500, 50, function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.JumpPower = v
    end
end)

local StatsGroup2 = StatsTab:AddRightGroupBox("Reset Stats")

StatsGroup2:AddButton("🔄 RESET WALKSPEED", "Resets to default walkspeed", function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.WalkSpeed = 16
        wsSlider:SetValue(16)
    end
end)

StatsGroup2:AddButton("🔄 RESET JUMP POWER", "Resets to default jumppower", function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.JumpPower = 50
        jpSlider:SetValue(50)
    end
end)

-- ============================================
-- 🛠️ UTILITIES
-- ============================================
local UtilTab = Window:AddTab("🛠️ UTILS")
local UtilGroup = UtilTab:AddLeftGroupBox("Tools & Utilities")

UtilGroup:AddButton("🔧 BTOOLS", "Spawns building tools (Delete, Move, etc.)", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)

UtilGroup:AddButton("🔨 CMD-X (ADMIN)", "Loads CMD-X Admin Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
end)

UtilGroup:AddButton("👤 ESP (NAME TAGS)", "Shows player names through walls", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/3dsboy08/Simple-ESP/master/ESP.lua"))()
end)

UtilGroup:AddButton("💀 KILL ALL", "Kills all players in the server", function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local char = player.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char.Humanoid.Health = 0
            end
        end
    end
end)

-- ============================================
-- ℹ️ INFO
-- ============================================
local InfoTab = Window:AddTab("ℹ️ INFO")
local InfoGroup = InfoTab:AddLeftGroupBox("About CUSA OP V2")

InfoGroup:AddLabel("🔥 CUSA OP V2 - Ultimate Exploit Hub")
InfoGroup:AddLabel("💀 Created for CUSA Prison")
InfoGroup:AddLabel("⭐ Features: Currency, Bypasses, Teleports, Stats")
InfoGroup:AddLabel("🎮 Press RightControl to toggle GUI")
InfoGroup:AddLabel("📌 Use responsibly - Enjoy!")

-- ============================================
-- INITIALIZATION MESSAGE
-- ============================================
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "CUSA OP V2",
    Text = "✅ Loaded Successfully!\nPress RightControl to open menu",
    Duration = 5
})

print("========================================")
print("   CUSA OP V2 - ULTIMATE EXPLOIT HUB")
print("   Press RightControl to open menu")
print("   Created for CUSA Prison")
print("========================================")