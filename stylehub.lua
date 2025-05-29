--[[

📛 Style Hub by Flo
📁 Features:
- GUI mit Schließen-Button (X)
- Korblox Menü: Linkes/Rechtes Bein entfernen (Fake Korblox, sichtbar!)
- Headless Menü: Headless (unsichtbar) oder mit blauen Augen (Effekt!)
- Draggable, mobil-kompatibel
🛠️ Erstellt für Executor (z. B. Swift)

👤 Credits: hecker_123huh & BobderBaumeister2525

--]]

-- Vorherige GUI entfernen
pcall(function() game.CoreGui:FindFirstChild("StyleHub"):Destroy() end)

-- GUI Setup
local hub = Instance.new("ScreenGui", game.CoreGui)
hub.Name = "StyleHub"
local frame = Instance.new("Frame", hub)
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Style Hub"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -30, 0, 5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
close.MouseButton1Click:Connect(function()
    hub:Destroy()
end)

-- Menü-Funktion
local function loadMainMenu()
    for _, v in pairs(frame:GetChildren()) do if not v:IsA("TextLabel") and not v:IsA("TextButton") then v:Destroy() end end
    title.Text = "Style Hub"

    local korblox = Instance.new("TextButton", frame)
    korblox.Size = UDim2.new(0.9, 0, 0, 35)
    korblox.Position = UDim2.new(0.05, 0, 0, 50)
    korblox.Text = "Korblox"
    korblox.BackgroundColor3 = Color3.fromRGB(50, 100, 255)
    korblox.MouseButton1Click:Connect(function()
        title.Text = "Korblox Menü"
        for _, v in pairs(frame:GetChildren()) do if not v:IsA("TextLabel") then v:Destroy() end end

        local back = Instance.new("TextButton", frame)
        back.Size = UDim2.new(0.3, 0, 0, 25)
        back.Position = UDim2.new(0.05, 0, 0, 10)
        back.Text = "< Zurück"
        back.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        back.MouseButton1Click:Connect(loadMainMenu)

        local left = Instance.new("TextButton", frame)
        left.Size = UDim2.new(0.9, 0, 0, 35)
        left.Position = UDim2.new(0.05, 0, 0, 60)
        left.Text = "Linkes Bein (Korblox)"
        left.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
        left.MouseButton1Click:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char:FindFirstChild("Left Leg") then char["Left Leg"]:Destroy()
            elseif char:FindFirstChild("LeftLowerLeg") then char.LeftLowerLeg:Destroy()
            end
        end)

        local right = Instance.new("TextButton", frame)
        right.Size = UDim2.new(0.9, 0, 0, 35)
        right.Position = UDim2.new(0.05, 0, 0, 110)
        right.Text = "Rechtes Bein (Korblox)"
        right.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
        right.MouseButton1Click:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char:FindFirstChild("Right Leg") then char["Right Leg"]:Destroy()
            elseif char:FindFirstChild("RightLowerLeg") then char.RightLowerLeg:Destroy()
            end
        end)
    end)

    local headless = Instance.new("TextButton", frame)
    headless.Size = UDim2.new(0.9, 0, 0, 35)
    headless.Position = UDim2.new(0.05, 0, 0, 100)
    headless.Text = "Headless"
    headless.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    headless.MouseButton1Click:Connect(function()
        title.Text = "Headless Menü"
        for _, v in pairs(frame:GetChildren()) do if not v:IsA("TextLabel") then v:Destroy() end end

        local back = Instance.new("TextButton", frame)
        back.Size = UDim2.new(0.3, 0, 0, 25)
        back.Position = UDim2.new(0.05, 0, 0, 10)
        back.Text = "< Zurück"
        back.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        back.MouseButton1Click:Connect(loadMainMenu)

        local normal = Instance.new("TextButton", frame)
        normal.Size = UDim2.new(0.9, 0, 0, 35)
        normal.Position = UDim2.new(0.05, 0, 0, 60)
        normal.Text = "Headless (Fake)"
        normal.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        normal.MouseButton1Click:Connect(function()
            local head = game.Players.LocalPlayer.Character:FindFirstChild("Head")
            if head then
                head.Transparency = 1
                if head:FindFirstChild("face") then head.face:Destroy() end
            end
        end)

        local blue = Instance.new("TextButton", frame)
        blue.Size = UDim2.new(0.9, 0, 0, 35)
        blue.Position = UDim2.new(0.05, 0, 0, 110)
        blue.Text = "Headless mit blauen Augen"
        blue.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        blue.MouseButton1Click:Connect(function()
            local head = game.Players.LocalPlayer.Character:FindFirstChild("Head")
            if head then
                head.Transparency = 1
                if head:FindFirstChild("face") then head.face:Destroy() end
                local att = Instance.new("Attachment", head)
                local beam = Instance.new("ParticleEmitter", att)
                beam.Texture = "rbxassetid://6862951782"
                beam.Color = ColorSequence.new(Color3.fromRGB(0, 170, 255))
                beam.Rate = 5
            end
        end)
    end)
end

loadMainMenu()
