-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlyGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создаем главное окно
local mainWindow = Instance.new("Frame")
mainWindow.Name = "MainWindow"
mainWindow.Size = UDim2.new(0, 300, 0, 200)
mainWindow.Position = UDim2.new(0.5, -150, 0.5, -100)
mainWindow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainWindow.BackgroundTransparency = 0.4
mainWindow.Active = true
mainWindow.Draggable = true
mainWindow.Parent = screenGui

-- Закругление окна
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = mainWindow

-- Кнопка закрытия окна "X"
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 20
closeButton.Parent = mainWindow

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeButton

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
end)
closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Заголовок
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 10, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "IqokczHub - Fly"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainWindow

-- Поле для ввода скорости
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0.8, 0, 0, 30)
speedInput.Position = UDim2.new(0.1, 0, 0.25, 0)
speedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.PlaceholderText = "Введите скорость (1-50)"
speedInput.Font = Enum.Font.SourceSansBold
speedInput.TextSize = 18
speedInput.Parent = mainWindow

speedInput.MouseEnter:Connect(function()
    speedInput.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
end)
speedInput.MouseLeave:Connect(function()
    speedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 4)
inputCorner.Parent = speedInput

-- Полет, управление, изменение скорости и остановка
local flying = false
local speed = 20 -- Начальная скорость (1 * 20)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local userInputService = game:GetService("UserInputService")
local moveDirection = Vector3.new()
local movementKeys = {}

local bg, bv

-- Переменные для управления
local moveDirection = Vector3.new()
local isTouching = false

-- Обработчик начала касания
userInputService.TouchStarted:Connect(function(touchInput, processed)
    if not processed then
        isTouching = true
    end
end)

-- Обработчик перемещения касания
userInputService.TouchMoved:Connect(function(touchInput, processed)
    if not processed and isTouching then
        local touchPos = touchInput.Position
        local screenSize = workspace.CurrentCamera.ViewportSize
        local center = screenSize / 2

        -- Определяем направление свайпа относительно центра экрана
        local delta = (touchPos - center)
        moveDirection = Vector3.new(delta.X, 0, delta.Y).Unit
    end
end)

-- Обработчик окончания касания
userInputService.TouchEnded:Connect(function(touchInput, processed)
    if not processed then
        isTouching = false
        moveDirection = Vector3.new() -- Сбрасываем направление при отпускании
    end
end)

-- Функция для вертикального управления (вверх/вниз)
local function handleVerticalMovement(touchInput)
    local touchPos = touchInput.Position
    local screenSize = workspace.CurrentCamera.ViewportSize

    -- Если касание в верхней части экрана, двигаемся вверх
    if touchPos.Y < screenSize.Y * 0.3 then
        moveDirection = moveDirection + Vector3.new(0, 1, 0)
    -- Если касание в нижней части экрана, двигаемся вниз
    elseif touchPos.Y > screenSize.Y * 0.7 then
        moveDirection = moveDirection - Vector3.new(0, 1, 0)
    end
end

-- Обработчик касания для вертикального управления
userInputService.TouchStarted:Connect(function(touchInput, processed)
    if not processed then
        handleVerticalMovement(touchInput)
    end
end)

-- Основной цикл полета
task.spawn(function()
    while true do
        if flying then
            if moveDirection.Magnitude > 0 then
                bv.Velocity = moveDirection.Unit * speed -- Применяем скорость
            else
                bv.Velocity = Vector3.new(0, 0, 0)
            end
            bg.CFrame = CFrame.new(hrp.Position, hrp.Position + game.Workspace.CurrentCamera.CFrame.LookVector)
        end
        task.wait()
    end
end)

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

    player.Character.Humanoid.PlatformStand = true

    task.spawn(function()
        while flying do
            task.wait()
            updateMoveDirection()
            if moveDirection.Magnitude > 0 then
                bv.Velocity = moveDirection.Unit * speed -- Применяем скорость
            else
                bv.Velocity = Vector3.new(0, 0, 0)
            end
            bg.CFrame = CFrame.new(hrp.Position, hrp.Position + game.Workspace.CurrentCamera.CFrame.LookVector)
        end
    end)
end

local function stopFly()
    flying = false
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
    hrp.Velocity = Vector3.new(0, 0, 0)
    player.Character.Humanoid.PlatformStand = false
    player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    movementKeys = {}
end

-- Обработчик ввода скорости
speedInput.FocusLost:Connect(function()
    local newSpeed = tonumber(speedInput.Text)
    if newSpeed and newSpeed > 0 then
        -- Ограничиваем максимальную скорость до 50 (1000 после умножения)
        if newSpeed > 50 then
            newSpeed = 50
            speedInput.Text = "50" -- Обновляем текст в поле ввода
        end
        speed = newSpeed * 20 -- Умножаем на 20 (1 -> 20, 2 -> 40, ..., 50 -> 1000)
        print("Скорость установлена на:", speed) -- Отладочный вывод
    else
        speedInput.Text = "1" -- Если введено некорректное значение, сбрасываем на 1
        speed = 1 * 20 -- Устанавливаем минимальную скорость (20)
        print("Скорость сброшена на:", speed) -- Отладочный вывод
    end
end)

-- Кнопка старта
local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0.8, 0, 0, 30)
startButton.Position = UDim2.new(0.1, 0, 0.45, 0)
startButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.Text = "Запустить Fly"
startButton.Font = Enum.Font.SourceSansBold
startButton.TextSize = 18
startButton.Parent = mainWindow

startButton.MouseButton1Click:Connect(startFly)

startButton.MouseEnter:Connect(function()
    startButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
end)
startButton.MouseLeave:Connect(function()
    startButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 4)
inputCorner.Parent = startButton

-- Кнопка остановки
local stopButton = Instance.new("TextButton")
stopButton.Size = UDim2.new(0.8, 0, 0, 30)
stopButton.Position = UDim2.new(0.1, 0, 0.65, 0)
stopButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
stopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
stopButton.Text = "Выключить Fly"
stopButton.Font = Enum.Font.SourceSansBold
stopButton.TextSize = 18
stopButton.Parent = mainWindow

stopButton.MouseButton1Click:Connect(stopFly)

stopButton.MouseEnter:Connect(function()
    stopButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
end)
stopButton.MouseLeave:Connect(function()
    stopButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 4)
inputCorner.Parent = stopButton

-- Обработчик смерти игрока
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    hrp = character:WaitForChild("HumanoidRootPart")
    stopFly() -- Отключаем полет при смерти
end)

-- Меню сохраняется после смерти
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui
