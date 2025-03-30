-- Statut du cheat : "ON" ou "OFF"
local cheatStatus = "ON"  -- Change cette valeur pour "OFF" si tu veux désactiver le cheat

-- Si le cheat est désactivé ("OFF"), le script s'arrête ici
if cheatStatus == "OFF" then
    print("Le cheat est désactivé.")
    return  -- Arrête l'exécution du script si le statut est "OFF"
elseif cheatStatus == "ON" then
    print("Le cheat est activé.")
else
    print("Statut inconnu, le cheat est désactivé.")
    return  -- Arrête l'exécution si le statut n'est ni "ON" ni "OFF"
end

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Variables
local silentAimActive = true
local espActive = true
local espList = {} -- Keep track of ESP drawings

-- Function to get the nearest target's head
local function getNearestHead()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end

    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
        return closestPlayer.Character.Head
    end

    return nil
end

-- Silent aim functionality with headshots
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and silentAimActive then
        local targetHead = getNearestHead()
        if targetHead then
            local aimPosition = targetHead.Position
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, aimPosition)
            ReplicatedStorage.Remotes.Attack:FireServer(targetHead)
        end
    end
end)

-- ESP Function for a player
local function createESP(player)
    if player ~= LocalPlayer then
        local espCircle = Drawing.new("Circle") -- Remplace "Quad" par "Circle"
        espCircle.Thickness = 2
        espCircle.Color = Color3.fromRGB(0, 255, 0) -- Green color for ESP
        espCircle.Transparency = 1
        espCircle.Filled = false -- Cercle creux
        espCircle.Visible = true

        espList[player.Name] = espCircle

        RunService.RenderStepped:Connect(function()
            if espActive and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local rootPart = player.Character.HumanoidRootPart
                if rootPart then
                    local rootPos, rootVisible = Camera:WorldToViewportPoint(rootPart.Position)

                    if rootVisible then
                        espCircle.Position = Vector2.new(rootPos.X, rootPos.Y) -- Centre du cercle
                        espCircle.Radius = 50 -- Taille du cercle
                        espCircle.Visible = true
                    else
                        espCircle.Visible = false
                    end
                else
                    espCircle.Visible = false
                end
            else
                espCircle.Visible = false
            end
        end)
    end
end

for _, player in pairs(Players:GetPlayers()) do
    createESP(player)
end

Players.PlayerAdded:Connect(function(player)
    createESP(player)
end)

Players.PlayerRemoving:Connect(function(player)
    if espList[player.Name] then
        espList[player.Name]:Remove()
        espList[player.Name] = nil
    end
end)

print("Silent Aim and ESP Script for Rivals loaded successfully.")
