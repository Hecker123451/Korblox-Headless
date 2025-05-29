--// ShadowStyle Hub - Korblox & Headless v2
--// Entwickler: Flo (hecker_123huh) & BobderBaumeister2525
--// Funktioniert in allen Spielen - Executor erforderlich

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidDescription = Humanoid:WaitForChild("HumanoidDescription")

--// GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "ShadowStyleHub"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local Close = Instance.new("TextButton", Frame)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.Text = "X"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local KorbloxBtn = Instance.new("TextButton", Frame)
KorbloxBtn.Size = UDim2.new(1, -20, 0, 30)
KorbloxBtn.Position = UDim2.new(0, 10, 0, 50)
KorbloxBtn.Text = "Korblox"
KorbloxBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KorbloxBtn.TextColor3 = Color3.new(1, 1, 1)

local HeadlessBtn = Instance.new("TextButton", Frame)
HeadlessBtn.Size = UDim2.new(1, -20, 0, 30)
HeadlessBtn.Position = UDim2.new(0, 10, 0, 90)
HeadlessBtn.Text = "Headless"
HeadlessBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
HeadlessBtn.TextColor3 = Color3.new(1, 1, 1)

--// Funktionen
local function applyKorblox(side)
    if side == "left" then
        HumanoidDescription.LeftLeg = 139607673
    elseif side == "right" then
        HumanoidDescription.RightLeg = 139607718
    end
    Humanoid:ApplyDescription(HumanoidDescription)
end

local function applyHeadless(normal)
    if normal then
        HumanoidDescription.Head = 15093053680 -- Headless Head (sichtbar für alle mit R15)
    else
        HumanoidDescription.Head = 16580493236 -- Korblox Deathwalker Kopf (Fake mit Augen)
    end
    Humanoid:ApplyDescription(HumanoidDescription)
end

--// Sub-Menüs
KorbloxBtn.MouseButton1Click:Connect(function()
    local korMenu = Instance.new("Frame", Frame)
    korMenu.Size = UDim2.new(0, 180, 0, 80)
    korMenu.Position = UDim2.new(0, 10, 0, 130)
    korMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    local corner = Instance.new("UICorner", korMenu)
    corner.CornerRadius = UDim.new(0, 6)

    local leftBtn = Instance.new("TextButton", korMenu)
    leftBtn.Size = UDim2.new(0.5, -5, 0, 30)
    leftBtn.Position = UDim2.new(0, 0, 0, 10)
    leftBtn.Text = "Linkes Bein"
    leftBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    leftBtn.TextColor3 = Color3.new(1, 1, 1)
    leftBtn.MouseButton1Click:Connect(function()
        applyKorblox("left")
    end)

    local rightBtn = Instance.new("TextButton", korMenu)
    rightBtn.Size = UDim2.new(0.5, -5, 0, 30)
    rightBtn.Position = UDim2.new(0.5, 5, 0, 10)
    rightBtn.Text = "Rechtes Bein"
    rightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    rightBtn.TextColor3 = Color3.new(1, 1, 1)
    rightBtn.MouseButton1Click:Connect(function()
        applyKorblox("right")
    end)
end)

HeadlessBtn.MouseButton1Click:Connect(function()
    local headMenu = Instance.new("Frame", Frame)
    headMenu.Size = UDim2.new(0, 180, 0, 80)
    headMenu.Position = UDim2.new(0, 10, 0, 130)
    headMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    local corner = Instance.new("UICorner", headMenu)
    corner.CornerRadius = UDim.new(0, 6)

    local normalBtn = Instance.new("TextButton", headMenu)
    normalBtn.Size = UDim2.new(0.5, -5, 0, 30)
    normalBtn.Position = UDim2.new(0, 0, 0, 10)
    normalBtn.Text = "Normal"
    normalBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    normalBtn.TextColor3 = Color3.new(1, 1, 1)
    normalBtn.MouseButton1Click:Connect(function()
        applyHeadless(true)
    end)

    local eyesBtn = Instance.new("TextButton", headMenu)
    eyesBtn.Size = UDim2.new(0.5, -5, 0, 30)
    eyesBtn.Position = UDim2.new(0.5, 5, 0, 10)
    eyesBtn.Text = "Blaue Augen"
    eyesBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    eyesBtn.TextColor3 = Color3.new(1, 1, 1)
    eyesBtn.MouseButton1Click:Connect(function()
        applyHeadless(false)
    end)
end)
