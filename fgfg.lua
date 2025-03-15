-- GUI
local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")

-- Настройка GUI
main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.Position = UDim2.new(0.1, 0, 0.38, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)
Frame.Active = true
Frame.Draggable = true

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.5, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.7, 0, 0.5, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "Fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.23, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextSize = 14.000

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.47, 0, 0.5, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextSize = 14.000

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.23, 0, 0.5, 0)
mine.Size = UDim2.new(0, 45, 0, 28)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextSize = 14.000

-- Переменные для флая
local flying = false
local flySpeed = 20
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local bg, bv

-- Функция старта полета
local function startFly()
    if flying then return end
    flying = true

    bg = Instance.new("BodyGyro", hrp)
    bg.P = 9e4
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.CFrame = hrp.CFrame

    bv = Instance.new("BodyVelocity", hrp)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

    humanoid.PlatformStand = true

    task.spawn(function()
        while flying do
            task.wait()
            local moveDirection = humanoid.MoveDirection
            if moveDirection.Magnitude > 0 then
                bv.Velocity = moveDirection.Unit * flySpeed
            else
                bv.Velocity = Vector3.new(0, 0, 0)
            end
            bg.CFrame = CFrame.new(hrp.Position, hrp.Position + game.Workspace.CurrentCamera.CFrame.LookVector)
        end
    end)
end

-- Функция остановки полета
local function stopFly()
    flying = false
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
    hrp.Velocity = Vector3.new(0, 0, 0)
    humanoid.PlatformStand = false
    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
end

-- Переключатель полета
onof.MouseButton1Click:Connect(function()
    if flying then
        stopFly()
    else
        startFly()
    end
end)

-- Движение вверх и вниз
up.MouseButton1Down:Connect(function()
    if flying then
        hrp.CFrame = hrp.CFrame * CFrame.new(0, 2, 0)
    end
end)

down.MouseButton1Down:Connect(function()
    if flying then
        hrp.CFrame = hrp.CFrame * CFrame.new(0, -2, 0)
    end
end)

-- Изменение скорости
plus.MouseButton1Down:Connect(function()
    if flySpeed < 100 then
        flySpeed = flySpeed + 5
        speed.Text = tostring(flySpeed / 20)
    end
end)

mine.MouseButton1Down:Connect(function()
    if flySpeed > 5 then
        flySpeed = flySpeed - 5
        speed.Text = tostring(flySpeed / 20)
    end
end)

-- Сброс при смерти
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    hrp = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
    stopFly()
end)
