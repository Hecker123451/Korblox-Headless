--// ShadowStyle Hub V3 - Funktionierende Korblox & Headless
--// Entwickler: Flo (hecker_123huh) & BobderBaumeister2525
--// Funktioniert in allen Spielen - sichtbar für andere

local Players = game:GetService("Players")
local InsertService = game:GetService("InsertService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local function applyRealAsset(assetId, partName)
    pcall(function()
        local asset = InsertService:LoadAsset(assetId)
        if not asset then return end
        local model = asset:FindFirstChildOfClass("Accessory") or asset:FindFirstChildOfClass("Model")
        if not model then return end

        -- Entferne vorhandenes Zielpart
        if Character:FindFirstChild(partName) then
            Character[partName]:Destroy()
        end

        if model:IsA("Accessory") then
            Character.Humanoid:AddAccessory(model)
        elseif model:IsA("Model") then
            for _, obj in pairs(model:GetChildren()) do
                if obj:IsA("MeshPart") or obj:IsA("Part") then
                    obj.Name = partName
                    obj.Anchored = false
                    obj.CanCollide = false
                    obj.Parent = Character
                end
            end
        end
    end)
end

local function removeHead()
    if Character:FindFirstChild("Head") then
        Character.Head:Destroy()
    end
    if Character:FindFirstChild("face") then
        Character.face:Destroy()
    end
end

-- GUI Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 240, 0, 160)
frame.Position = UDim2.new(0.35, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local close = Instance.new("TextButton", frame)
close.Text = "X"
close.Position = UDim2.new(1, -35, 0, 5)
close.Size = UDim2.new(0, 30, 0, 30)
close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
close.TextColor3 = Color3.new(1,1,1)
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local korBtn = Instance.new("TextButton", frame)
korBtn.Size = UDim2.new(0.9, 0, 0, 40)
korBtn.Position = UDim2.new(0.05, 0, 0, 50)
korBtn.Text = "Korblox"
korBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
korBtn.TextColor3 = Color3.new(1, 1, 1)

local headBtn = Instance.new("TextButton", frame)
headBtn.Size = UDim2.new(0.9, 0, 0, 40)
headBtn.Position = UDim2.new(0.05, 0, 0, 100)
headBtn.Text = "Headless"
headBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
headBtn.TextColor3 = Color3.new(1, 1, 1)

korBtn.MouseButton1Click:Connect(function()
    local menu = Instance.new("Frame", frame)
    menu.Size = UDim2.new(0.9, 0, 0, 60)
    menu.Position = UDim2.new(0.05, 0, 0, 150)
    menu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 6)

    local left = Instance.new("TextButton", menu)
    left.Size = UDim2.new(0.5, -5, 0, 25)
    left.Position = UDim2.new(0, 0, 0, 5)
    left.Text = "Linkes Bein"
    left.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    left.TextColor3 = Color3.new(1, 1, 1)
    left.MouseButton1Click:Connect(function()
        applyRealAsset(139607673, "LeftLeg")
    end)

    local right = Instance.new("TextButton", menu)
    right.Size = UDim2.new(0.5, -5, 0, 25)
    right.Position = UDim2.new(0.5, 5, 0, 5)
    right.Text = "Rechtes Bein"
    right.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    right.TextColor3 = Color3.new(1, 1, 1)
    right.MouseButton1Click:Connect(function()
        applyRealAsset(139607718, "RightLeg")
    end)
end)

headBtn.MouseButton1Click:Connect(function()
    local menu = Instance.new("Frame", frame)
    menu.Size = UDim2.new(0.9, 0, 0, 60)
    menu.Position = UDim2.new(0.05, 0, 0, 150)
    menu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 6)

    local normal = Instance.new("TextButton", menu)
    normal.Size = UDim2.new(0.5, -5, 0, 25)
    normal.Position = UDim2.new(0, 0, 0, 5)
    normal.Text = "Normal"
    normal.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    normal.TextColor3 = Color3.new(1, 1, 1)
    normal.MouseButton1Click:Connect(function()
        applyRealAsset(15093053680, "Head")
    end)

    local blue = Instance.new("TextButton", menu)
    blue.Size = UDim2.new(0.5, -5, 0, 25)
    blue.Position = UDim2.new(0.5, 5, 0, 5)
    blue.Text = "Blaue Augen"
    blue.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    blue.TextColor3 = Color3.new(1, 1, 1)
    blue.MouseButton1Click:Connect(function()
        removeHead()
        applyRealAsset(16580493236, "Head")
    end)
end)
