if getgenv().XenonLoaded then
    if getgenv().XenonScreenGui then
        getgenv().XenonScreenGui:Destroy()
    end
    if getgenv().MobileButton then
        getgenv().MobileButton:Destroy()
    end
end
getgenv().XenonLoaded = true

local VALID_KEY = "Jkfq12lvwfwg51vdc"
local GETKEY_LINK = "https://discord.gg/9Fyh42Hs"

local hasAccess = false

if not hasAccess then
    local TweenService = game:GetService("TweenService")

    local gui = Instance.new("ScreenGui")
    gui.Name = "XenonKeyUI"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = game.CoreGui

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game.Lighting
    TweenService:Create(blur, TweenInfo.new(0.4), {Size = 20}):Play()

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 1
    bg.Parent = gui
    TweenService:Create(bg, TweenInfo.new(0.4), {BackgroundTransparency = 0.4}):Play()

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0.5,0,0.5,0)
    main.AnchorPoint = Vector2.new(0.5,0.5)
    main.BackgroundColor3 = Color3.fromRGB(15,15,15)
    main.Parent = gui

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

    local grad = Instance.new("UIGradient", main)
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20,20,20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10,10,10))
    }

    TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 340, 0, 220)
    }):Play()

    local line = Instance.new("Frame", main)
    line.Size = UDim2.new(1,0,0,2)
    line.BackgroundColor3 = Color3.fromRGB(0,160,255)

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1,0,0,50)
    title.BackgroundTransparency = 1
    title.Text = "XENON"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 20
    title.TextColor3 = Color3.fromRGB(255,255,255)

    local sub = Instance.new("TextLabel", main)
    sub.Size = UDim2.new(1,0,0,20)
    sub.Position = UDim2.new(0,0,0,35)
    sub.BackgroundTransparency = 1
    sub.Text = "Premium Access Required"
    sub.Font = Enum.Font.Gotham
    sub.TextSize = 12
    sub.TextColor3 = Color3.fromRGB(130,130,130)

    local input = Instance.new("TextBox", main)
    input.Size = UDim2.new(0.8,0,0,40)
    input.Position = UDim2.new(0.1,0,0.45,0)
    input.BackgroundColor3 = Color3.fromRGB(25,25,25)
    input.Text = ""
    input.PlaceholderText = "Enter your key..."
    input.Font = Enum.Font.Gotham
    input.TextSize = 14
    input.TextColor3 = Color3.new(1,1,1)

    Instance.new("UICorner", input).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", input).Color = Color3.fromRGB(40,40,40)

    local unlock = Instance.new("TextButton", main)
    unlock.Size = UDim2.new(0.8,0,0,35)
    unlock.Position = UDim2.new(0.1,0,0.68,0)
    unlock.Text = "Unlock"
    unlock.Font = Enum.Font.GothamBold
    unlock.TextSize = 14
    unlock.TextColor3 = Color3.new(1,1,1)

    Instance.new("UICorner", unlock).CornerRadius = UDim.new(0,10)

    local unlockGrad = Instance.new("UIGradient", unlock)
    unlockGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,160,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,90,200))
    }

    Instance.new("UIStroke", unlock).Color = Color3.fromRGB(0,160,255)

    local getkey = Instance.new("TextButton", main)
    getkey.Size = UDim2.new(0.8,0,0,28)
    getkey.Position = UDim2.new(0.1,0,0.85,0)
    getkey.Text = "Get Key"
    getkey.Font = Enum.Font.Gotham
    getkey.TextSize = 12
    getkey.TextColor3 = Color3.fromRGB(200,200,200)
    getkey.BackgroundColor3 = Color3.fromRGB(30,30,30)

    Instance.new("UICorner", getkey).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", getkey).Color = Color3.fromRGB(60,60,60)

    local status = Instance.new("TextLabel", main)
    status.Size = UDim2.new(1,0,0,18)
    status.Position = UDim2.new(0,0,1,-18)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.Font = Enum.Font.Gotham
    status.TextSize = 12
    status.TextColor3 = Color3.fromRGB(255,80,80)

    getkey.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(GETKEY_LINK)
            status.TextColor3 = Color3.fromRGB(100,255,100)
            status.Text = "Link copied!"
        else
            status.Text = "Clipboard not supported"
        end
    end)

    local unlocked = false

    unlock.MouseButton1Click:Connect(function()
        if input.Text == VALID_KEY then
            status.TextColor3 = Color3.fromRGB(100,255,100)
            status.Text = "Access granted"

            unlocked = true

            TweenService:Create(main, TweenInfo.new(0.3), {
                Size = UDim2.new(0,0,0,0)
            }):Play()

            task.wait(0.3)
            gui:Destroy()
            blur:Destroy()
        else
            status.Text = "Invalid key"
        end
    end)

    repeat task.wait() until unlocked
end

local XenonLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xenon150/Xenon-GUI/refs/heads/main/GUI.lua"))()
local Notification = XenonLib:CreateNotification()
local Logging = XenonLib:CreateLogger()

local UserInputService = game:GetService("UserInputService")
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local autoScale = isMobile and XenonLib.Scales.Mobile or XenonLib.Scales.Default

local window = XenonLib:CreateWindow({
    Logo = XenonLib.GlobalLogo,
    Name = "Xenon",
    Content = "JUST ONE MORE ASYM",
    Size = autoScale,
    ConfigFolder = "XenonConfigs",
    Enable3DRenderer = false,
    Keybind = "K"
})

getgenv().XenonScreenGui = XenonLib.ScreenGui

if isMobile then
    task.wait(0.2)
    window:SetSize(XenonLib.Scales.Mobile)
end

pcall(function()
    for _, v in pairs(XenonLib.ScreenGui:GetDescendants()) do
        if v:IsA("Frame") and v:FindFirstChild("pencil-square") then
            v.Visible = false
        end
        if v:IsA("TextLabel") and v.Text == "pencil-square" then
            local parent = v.Parent
            if parent then parent.Visible = false end
        end
    end
end)

if isMobile then
    local mobileButton = Instance.new("ScreenGui")
    mobileButton.Name = "XenonMobileButton"
    mobileButton.ResetOnSpawn = false
    mobileButton.Parent = game:GetService("CoreGui")
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 60, 0, 60)
    button.Position = UDim2.new(0.5, -30, 0.9, -30)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.BackgroundTransparency = 0.3
    button.Text = "Menu"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 20
    button.Font = Enum.Font.SourceSansBold
    button.BorderSizePixel = 0
    button.Parent = mobileButton
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 30)
    corner.Parent = button
    
    local dragToggle = nil
    local dragStart = nil
    local startPos = nil
    local function updateDrag(input)
        local delta = input.Position - dragStart
        local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        button.Position = newPos
    end
    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = button.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    button.InputChanged:Connect(function(input)
        if dragToggle and input.UserInputType == Enum.UserInputType.Touch then
            updateDrag(input)
        end
    end)
    
    button.MouseButton1Click:Connect(function()
        window:ToggleInterface()
    end)
    
    getgenv().MobileButton = mobileButton
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local LP = Players.LocalPlayer

local survivorEspEnabled = false
local entityEspEnabled = false
local underMapEnabled = false
local underMapDepth = -0.5
local savedPosition = nil
local speedHackEnabled = false
local speedHackValue = 50
local autoTeleportEnabled = false
local autoTeleportInterval = 10
local unlockJumpEnabled = false
local infJumpEnabled = false
local jumpConnection = nil
local teleportThread = nil

local SPAWN_CFRAME = CFrame.new(1774.47, 327.50, -421.79)

local function getChar() return LP.Character end
local function getRoot(c) return c and c:FindFirstChild("HumanoidRootPart") end
local function getHum(c) return c and c:FindFirstChildOfClass("Humanoid") end

local function applyJumpUnlock(char)
    local hum = getHum(char)
    if not hum then return end
    pcall(function()
        hum.UseJumpPower = true
        hum.JumpPower = 50
        hum.AutoRotate = true
        if hum:GetState() == Enum.HumanoidStateType.Seated then
            hum.Sit = false
        end
    end)
end

local function setupInfinityJump(enable)
    if jumpConnection then jumpConnection:Disconnect(); jumpConnection = nil end
    if enable then
        jumpConnection = UserInputService.JumpRequest:Connect(function()
            local hum = getHum(getChar())
            if hum then pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) end) end
        end)
    end
end

local function enableUnderMap()
    local root = getRoot(getChar())
    if not root then return end
    pcall(function()
        savedPosition = CFrame.new(root.Position.X, root.Position.Y, root.Position.Z)
        root.Anchored = true
        root.CFrame = CFrame.new(root.Position.X, underMapDepth, root.Position.Z)
    end)
end

local function disableUnderMap()
    local root = getRoot(getChar())
    if not root then return end
    pcall(function()
        root.Anchored = false
        if savedPosition then
            root.CFrame = savedPosition
            savedPosition = nil
        end
    end)
end

local function applyUnderMap()
    local root = getRoot(getChar())
    if not root then return end
    pcall(function()
        if not root.Anchored then root.Anchored = true end
        root.CFrame = CFrame.new(root.Position.X, underMapDepth, root.Position.Z)
    end)
end

local function teleportToSpawn()
    if underMapEnabled then
        underMapEnabled = false
        savedPosition = nil
        local root = getRoot(getChar())
        if root then pcall(function() root.Anchored = false end) end
    end
    local root = getRoot(getChar())
    if not root then return end
    pcall(function() root.CFrame = SPAWN_CFRAME end)
end

local CONFIG_FOLDER = "XenonConfigs"

local function ensureFolder()
    if not isfolder(CONFIG_FOLDER) then
        makefolder(CONFIG_FOLDER)
    end
end

local function getCurrentData()
    return {
        survivorEsp = survivorEspEnabled,
        entityEsp = entityEspEnabled,
        underMapDepth = underMapDepth,
        speedHack = speedHackEnabled,
        speedValue = speedHackValue,
        unlockJump = unlockJumpEnabled,
        infJump = infJumpEnabled,
        autoTeleport = autoTeleportEnabled,
        teleportInterval = autoTeleportInterval,
    }
end

local function saveConfig(name)
    if not name or name == "" then
        Logging.new("triangle-exclamation", "Enter config name", 3)
        return
    end
    ensureFolder()
    local ok, encoded = pcall(function()
        return HttpService:JSONEncode(getCurrentData())
    end)
    if ok then
        writefile(CONFIG_FOLDER .. "/" .. name .. ".json", encoded)
        Logging.new("folder", "Saved: " .. name, 3)
    end
end

local function getConfigList()
    ensureFolder()
    local list = {}
    local ok, files = pcall(listfiles, CONFIG_FOLDER)
    if not ok then return list end
    for _, path in pairs(files) do
        local name = string.match(path, "([^/\\]+)%.json$")
        if name then
            table.insert(list, name)
        end
    end
    return list
end

local function applyData(data, toggles)
    if not data then return end
    if data.survivorEsp ~= nil then toggles.survivorToggle:SetValue(data.survivorEsp) end
    if data.entityEsp ~= nil then toggles.entityToggle:SetValue(data.entityEsp) end
    if data.speedHack ~= nil then toggles.speedToggle:SetValue(data.speedHack) end
    if data.speedValue ~= nil then toggles.speedSlider:SetValue(data.speedValue) end
    if data.unlockJump ~= nil then toggles.jumpToggle:SetValue(data.unlockJump) end
    if data.infJump ~= nil then toggles.infJumpToggle:SetValue(data.infJump) end
    if data.underMapDepth ~= nil then toggles.underSlider:SetValue(data.underMapDepth) end
    if data.autoTeleport ~= nil then toggles.autoTpToggle:SetValue(data.autoTeleport) end
    if data.teleportInterval ~= nil then toggles.autoTpSlider:SetValue(data.teleportInterval) end
end

local function addHighlight(model, color, transparency)
    if model:FindFirstChild("BankShot_Highlight") then return end
    local h = Instance.new("Highlight")
    h.Name = "BankShot_Highlight"
    h.FillColor = color
    h.OutlineColor = Color3.new(1, 1, 1)
    h.FillTransparency = transparency
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = model
end

local function removeHighlights(folder)
    if not folder then return end
    for _, m in pairs(folder:GetChildren()) do
        local h = m:FindFirstChild("BankShot_Highlight")
        if h then h:Destroy() end
    end
end

local survivorConn, entityConn

local function connectSurvivorESP()
    local f = workspace:FindFirstChild("Survivors")
    if not f then return end
    for _, m in pairs(f:GetChildren()) do
        if m:IsA("Model") and m.Name ~= LP.Name then
            addHighlight(m, Color3.fromRGB(0, 160, 255), 0.5)
        end
    end
    survivorConn = f.ChildAdded:Connect(function(m)
        if survivorEspEnabled and m:IsA("Model") and m.Name ~= LP.Name then
            addHighlight(m, Color3.fromRGB(0, 160, 255), 0.5)
        end
    end)
end

local function connectEntityESP()
    local f = workspace:FindFirstChild("Entities")
    if not f then return end
    for _, m in pairs(f:GetChildren()) do
        if m:IsA("Model") and m.Name ~= LP.Name then
            addHighlight(m, Color3.fromRGB(255, 0, 0), 0.4)
        end
    end
    entityConn = f.ChildAdded:Connect(function(m)
        if entityEspEnabled and m:IsA("Model") and m.Name ~= LP.Name then
            addHighlight(m, Color3.fromRGB(255, 0, 0), 0.4)
        end
    end)
end

local function disconnectSurvivorESP()
    if survivorConn then survivorConn:Disconnect(); survivorConn = nil end
    removeHighlights(workspace:FindFirstChild("Survivors"))
end

local function disconnectEntityESP()
    if entityConn then entityConn:Disconnect(); entityConn = nil end
    removeHighlights(workspace:FindFirstChild("Entities"))
end

if getgenv().XenonConnections then
    for _, c in pairs(getgenv().XenonConnections) do
        pcall(function() c:Disconnect() end)
    end
end
getgenv().XenonConnections = {}

local Watermark = window:Watermark()
local UITogg = Watermark:AddBlock("cube-vertexes", "Xenon")
UITogg:Input(function() window:ToggleInterface() end)

Watermark:AddBlock(
    isMobile and "smartphone-portrait" or "teletype",
    isMobile and "Mobile" or "PC"
)

local EspTab = window:AddTab({ Icon = "eye", Name = "ESP" })
local EspSection = EspTab:AddSection({ Name = "ESP" })

local survivorToggle = EspSection:AddLabel("Survivor ESP"):AddToggle({
    Default = false, Flag = "SurvivorESP",
    Callback = function(v)
        survivorEspEnabled = v
        if v then connectSurvivorESP() else disconnectSurvivorESP() end
    end
})

local entityToggle = EspSection:AddLabel("Entity ESP"):AddToggle({
    Default = false, Flag = "EntityESP",
    Callback = function(v)
        entityEspEnabled = v
        if v then connectEntityESP() else disconnectEntityESP() end
    end
})

local MovTab = window:AddTab({ Icon = "person-running", Name = "Movement" })
local SpeedSection = MovTab:AddSection({ Name = "SPEED HACK" })

local speedToggle = SpeedSection:AddLabel("Speed Hack"):AddToggle({
    Default = false, Flag = "SpeedHack",
    Callback = function(v)
        speedHackEnabled = v
        if not v then
            local hum = getHum(getChar())
            if hum then hum.WalkSpeed = 16 end
        end
    end
})

local speedSlider = SpeedSection:AddLabel("Speed"):AddSlider({
    Min = 16, Max = 150, Rounding = 0,
    Default = 50, Type = "ws", Size = 100, Flag = "SpeedValue",
    Callback = function(v) speedHackValue = v end
})

local JumpSection = MovTab:AddSection({ Name = "JUMP CONTROL" })

local jumpToggle = JumpSection:AddLabel("Unlock Jump"):AddToggle({
    Default = false, Flag = "UnlockJump",
    Callback = function(v)
        unlockJumpEnabled = v
        if v then applyJumpUnlock(getChar()) end
    end
})

local infJumpToggle = JumpSection:AddLabel("Infinity Jump"):AddToggle({
    Default = false, Flag = "InfJump",
    Callback = function(v)
        infJumpEnabled = v
        setupInfinityJump(v)
    end
})

local WorldTab = window:AddTab({ Icon = "globe-simplified", Name = "World" })
local UnderSection = WorldTab:AddSection({ Name = "UNDER MAP" })

local underToggle = UnderSection:AddLabel("Under Map"):AddToggle({
    Default = false, Flag = "UnderMap",
    Callback = function(v)
        underMapEnabled = v
        if v then
            enableUnderMap()
            Logging.new("arrow-large-down", "Position saved", 2)
        else
            disableUnderMap()
            Logging.new("arrow-large-up", "Returned to position", 2)
        end
    end
})

local underSlider = UnderSection:AddLabel("Y Offset"):AddSlider({
    Min = -200, Max = 200, Rounding = 0,
    Default = -1, Type = "u", Size = 100, Flag = "UnderMapDepth",
    Callback = function(v)
        underMapDepth = v
        if underMapEnabled then applyUnderMap() end
    end
})

local TpSection = WorldTab:AddSection({ Name = "TELEPORT" })

TpSection:AddButton({
    Name = "Teleport to Spawn",
    Icon = "person-teleport",
    Callback = function() teleportToSpawn() end
})

-- Функции управления потоком автотелепорта
local function stopAutoTeleportThread()
    if teleportThread then
        task.cancel(teleportThread)
        teleportThread = nil
    end
end

local function startAutoTeleportThread()
    stopAutoTeleportThread()
    teleportThread = task.spawn(function()
        while autoTeleportEnabled do
            task.wait(autoTeleportInterval)
            teleportToSpawn()
        end
    end)
end

local autoTpToggle = TpSection:AddLabel("Auto Teleport"):AddToggle({
    Default = false, Flag = "AutoTeleport",
    Callback = function(v)
        autoTeleportEnabled = v
        if v then
            startAutoTeleportThread()
        else
            stopAutoTeleportThread()
        end
    end
})

local autoTpSlider = TpSection:AddLabel("Interval (sec)"):AddSlider({
    Min = 1, Max = 60, Rounding = 0,
    Default = 10, Type = "s", Size = 100, Flag = "AutoTeleportInterval",
    Callback = function(v)
        autoTeleportInterval = v
        if autoTeleportEnabled then
            startAutoTeleportThread()
        end
    end
})

local CfgTab = window:AddTab({ Icon = "folder", Name = "Config" })
local CfgSection = CfgTab:AddSection({ Name = "SAVE / LOAD" })

local configNameInput = CfgSection:AddLabel("Config Name"):AddTextInput({
    Default = "",
    Placeholder = "Enter name...",
    Size = 120,
    Flag = "ConfigName",
    Callback = function() end
})

CfgSection:AddButton({
    Name = "Save Config",
    Icon = "arrow-down-to-line",
    Callback = function()
        local name = configNameInput:GetValue()
        saveConfig(name)
    end
})

local CfgListSection = CfgTab:AddSection({ Name = "CONFIGS" })

local configDropdown = CfgListSection:AddLabel("Select Config"):AddDropdown({
    Default = nil,
    Values = getConfigList(),
    AutoUpdate = true,
    Size = 120,
    Flag = "ConfigSelect",
    Callback = function() end
})

CfgListSection:AddButton({
    Name = "Load Selected",
    Icon = "arrow-right-from-portrait-rectangle",
    Callback = function()
        local name = configDropdown:GetValue()
        if not name or name == "" then
            Logging.new("triangle-exclamation", "Select a config", 3)
            return
        end
        local path = CONFIG_FOLDER .. "/" .. name .. ".json"
        if not isfile(path) then
            Logging.new("triangle-exclamation", "File not found", 3)
            return
        end
        local ok, data = pcall(function()
            return HttpService:JSONDecode(readfile(path))
        end)
        if not ok or not data then
            Logging.new("triangle-exclamation", "Load error", 3)
            return
        end
        applyData(data, {
            survivorToggle = survivorToggle,
            entityToggle = entityToggle,
            speedToggle = speedToggle,
            speedSlider = speedSlider,
            jumpToggle = jumpToggle,
            infJumpToggle = infJumpToggle,
            underSlider = underSlider,
            autoTpToggle = autoTpToggle,
            autoTpSlider = autoTpSlider,
        })
        Logging.new("folder", "Loaded: " .. name, 3)
    end
})

CfgListSection:AddButton({
    Name = "Delete Selected",
    Icon = "trash-can",
    Callback = function()
        local name = configDropdown:GetValue()
        if not name or name == "" then
            Logging.new("triangle-exclamation", "Select a config", 3)
            return
        end
        local path = CONFIG_FOLDER .. "/" .. name .. ".json"
        if isfile(path) then
            delfile(path)
            configDropdown:SetValues(getConfigList())
            configDropdown:SetValue(nil)
            Logging.new("trash-can", "Deleted: " .. name, 3)
        end
    end
})

CfgListSection:AddButton({
    Name = "Refresh List",
    Icon = "arrow-rotate-right",
    Callback = function()
        configDropdown:SetValues(getConfigList())
        Logging.new("arrow-rotate-right", "List refreshed", 2)
    end
})

window.UserSettings:AddLabel("Menu Keybind"):AddKeybind({
    Default = "K",
    Callback = function(v)
        window.Keybind = v
        Logging.new("ps4-touchpad", "Keybind: " .. tostring(v), 5)
    end,
})

window.UserSettings:AddLabel("Menu Scale"):AddDropdown({
    Default = isMobile and "Mobile" or "Default",
    Values = {"Default", "Large", "Mobile", "Small"},
    Callback = function(v)
        window:SetSize(XenonLib.Scales[v])
        Logging.new("crop", "Scale: " .. tostring(v), 5)
    end,
})

local charConn = LP.CharacterAdded:Connect(function(newChar)
    task.wait(1)
    savedPosition = nil
    if underMapEnabled then enableUnderMap() end
    if speedHackEnabled then
        local hum = getHum(newChar)
        if hum then hum.WalkSpeed = speedHackValue end
    end
    if unlockJumpEnabled then applyJumpUnlock(newChar) end
    if infJumpEnabled then setupInfinityJump(true) end
    if survivorEspEnabled then disconnectSurvivorESP(); connectSurvivorESP() end
    if entityEspEnabled then disconnectEntityESP(); connectEntityESP() end
end)
table.insert(getgenv().XenonConnections, charConn)

local steppedConn = RunService.Stepped:Connect(function()
    if underMapEnabled then
        applyUnderMap()
    end

    if speedHackEnabled then
        local hum = getHum(getChar())
        if hum and hum.WalkSpeed ~= speedHackValue then
            hum.WalkSpeed = speedHackValue
        end
    end

    if unlockJumpEnabled then
        local hum = getHum(getChar())
        if hum then
            if not hum.UseJumpPower or hum.JumpPower ~= 50 then
                hum.UseJumpPower = true
                hum.JumpPower = 50
            end
        end
    end
end)
table.insert(getgenv().XenonConnections, steppedConn)

Notification.new({
    Title = "Xenon",
    Content = "Initialized | " .. (isMobile and "Mobile mode (button added)" or "PC mode (press K)"),
    Duration = 5,
})
