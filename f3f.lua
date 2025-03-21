-- MM2 
-- Создаем маленькое меню
local MiniScreenGui = Instance.new("ScreenGui")
MiniScreenGui.ResetOnSpawn = false
MiniScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local miniMenu = Instance.new("Frame")
miniMenu.Name = "MiniMenu"
miniMenu.Size = UDim2.new(0, 100, 0, 50)
miniMenu.Position = UDim2.new(0, 20, 0.5, -75)
miniMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
miniMenu.BackgroundTransparency = 0.4
miniMenu.Active = true
miniMenu.Draggable = true
miniMenu.Parent = MiniScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 4)
MiniCorner.Parent = miniMenu

-- Добавляем обводку к маленькому меню
local uiStrokeMini = Instance.new("UIStroke")
uiStrokeMini.Thickness = 1 
uiStrokeMini.Color = Color3.fromRGB(255, 255, 255)
uiStrokeMini.Parent = miniMenu

-- Водяной знак "IqokczHub"
local watermark1 = Instance.new("TextLabel")
watermark1.Name = "Watermark"
watermark1.Size = UDim2.new(1, 0, 0, 20)
watermark1.Position = UDim2.new(0, 0, 0, 5)
watermark1.BackgroundTransparency = 1
watermark1.Text = "IqokczHub"
watermark1.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark1.Font = Enum.Font.SourceSansBold
watermark1.TextSize = 18
watermark1.TextXAlignment = Enum.TextXAlignment.Center
watermark1.Parent = miniMenu

-- Белая линия 1 см
local miniline = Instance.new("Frame")
miniline.Name = "Line"
miniline.Size = UDim2.new(0.8, 0, 0, 1) 
miniline.Position = UDim2.new(0.1, 0, 0.5, 0) 
miniline.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
miniline.BorderSizePixel = 0
miniline.Parent = miniMenu

-- Кнопка "+"
local plusButton = Instance.new("TextButton")
plusButton.Name = "PlusButton"
plusButton.Size = UDim2.new(0.5, 0, 0, 20) 
plusButton.Position = UDim2.new(0.25, 0, 0.55, 0) 
plusButton.BackgroundTransparency = 1 
plusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
plusButton.Text = "+"
plusButton.Font = Enum.Font.SourceSansBold
plusButton.TextSize = 20
plusButton.Parent = miniMenu







-- Главное меню
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local UserInputService = game:GetService("UserInputService")

-- Создание главного меню
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BackgroundTransparency = 0.4
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Закругление главного меню
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 4)
mainCorner.Parent = mainFrame

-- Белая обводка главного меню
local outline = Instance.new("UIStroke")
outline.Color = Color3.new(1, 1, 1)
outline.Thickness = 1 
outline.Parent = mainFrame



-- Водянной знак
local watermark = Instance.new("TextLabel")
watermark.Text = "IqokczHub"
watermark.Size = UDim2.new(0, 150, 0, 25) 
watermark.Position = UDim2.new(0, 10, 0, 10)
watermark.TextColor3 = Color3.new(1, 1, 1)
watermark.TextSize = 16
watermark.BackgroundTransparency = 1
watermark.Parent = mainFrame



-- Место для табов
local tabFrame = Instance.new("ScrollingFrame")
tabFrame.Size = UDim2.new(0, 150, 0, 320)
tabFrame.Position = UDim2.new(0, 10, 0, 60)
tabFrame.BackgroundColor3 = Color3.new(0, 0, 0)
tabFrame.ScrollBarThickness = 0
tabFrame.BackgroundTransparency = 0.4
tabFrame.Parent = mainFrame

-- Закругление табов
local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 4)
tabCorner.Parent = tabFrame



-- Место для кнопок из табов
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(0, 430, 0, 320)
contentFrame.Position = UDim2.new(0, 162.5, 0, 60)
contentFrame.BackgroundColor3 = Color3.new(0, 0, 0)
contentFrame.ScrollBarThickness = 0
contentFrame.BackgroundTransparency = 0.4
contentFrame.Parent = mainFrame



-- Белая линия
local whiteLine = Instance.new("Frame")
whiteLine.Size = UDim2.new(1, -20, 0, 2) 
whiteLine.Position = UDim2.new(0, 10, 0, 47)
whiteLine.BackgroundColor3 = Color3.new(1, 1, 1)
whiteLine.Parent = mainFrame



-- Кнопка закрытия меню
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(0, 0, 0)
closeButton.BackgroundColor3 = Color3.new(255, 255, 255)
closeButton.Parent = mainFrame

-- Синее докасание
closeButton.MouseEnter:Connect(function()
    closeButton.TextColor3 = Color3.new(1, 1, 1)  
    closeButton.BackgroundColor3 = Color3.new(0, 0.5, 1)  
end)

closeButton.MouseLeave:Connect(function()
    closeButton.TextColor3 = Color3.new(0, 0, 0) 
    closeButton.BackgroundColor3 = Color3.new(1, 1, 1) 
end)

-- Закругление окна
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = closeButton

-- Функция кнопки
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    MiniScreenGui:Destroy()
end)




-- Кнопка скрытия меню
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -80, 0, 10) 
minimizeButton.Text = "—"
minimizeButton.TextColor3 = Color3.new(0, 0, 0)
minimizeButton.BackgroundColor3 = Color3.new(255, 255, 255)
minimizeButton.Parent = mainFrame

-- Синее докасание
minimizeButton.MouseEnter:Connect(function()
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)  
    minimizeButton.BackgroundColor3 = Color3.new(0, 0.5, 1)  
end)

minimizeButton.MouseLeave:Connect(function()
    minimizeButton.TextColor3 = Color3.new(0, 0, 0) 
    minimizeButton.BackgroundColor3 = Color3.new(1, 1, 1) 
end)

-- Закругление окна
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = minimizeButton

-- Функция кнопки
minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)



-- Создание табов
local tabs = {}
local currentTab = nil

local function createTab(name)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, 140, 0, 30)
    tabButton.Position = UDim2.new(0, 5, 0, 5 + (#tabs * 35))
    tabButton.Text = name
    tabButton.TextColor3 = Color3.new(0, 0, 0) 
    tabButton.BackgroundColor3 = Color3.new(1, 1, 1) 
    tabButton.Parent = tabFrame

    -- Закругление кнопок табов
    local tabButtonCorner = Instance.new("UICorner")
    tabButtonCorner.CornerRadius = UDim.new(0, 4)
    tabButtonCorner.Parent = tabButton

    local tabContent = Instance.new("Frame")
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.Position = UDim2.new(0, 0, 0, 0)
    tabContent.BackgroundTransparency = 1
    tabContent.Visible = false
    tabContent.Parent = contentFrame

    table.insert(tabs, {button = tabButton, content = tabContent})

    tabButton.MouseButton1Click:Connect(function()
        if currentTab == tabContent then
            tabContent.Visible = not tabContent.Visible
        else
            if currentTab then
                currentTab.Visible = false
            end
            currentTab = tabContent
            tabContent.Visible = true
        end
    end)

    tabButton.MouseEnter:Connect(function()
        tabButton.TextColor3 = Color3.new(1, 1, 1)  
        tabButton.BackgroundColor3 = Color3.new(0, 0.5, 1)  
    end)

    tabButton.MouseLeave:Connect(function()
        tabButton.TextColor3 = Color3.new(0, 0, 0) 
        tabButton.BackgroundColor3 = Color3.new(1, 1, 1) 
    end)
end



-- Создание кнопок
local function createButton(tab, text, scriptUrl)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 140, 0, 30)
    button.Position = UDim2.new(0, 5, 0, 5 + (#tab.content:GetChildren() * 35))
    button.Text = text
    button.TextColor3 = Color3.new(0, 0, 0)
    button.BackgroundColor3 = Color3.new(1, 1, 1)
    button.TextXAlignment = Enum.TextXAlignment.Center
    button.Parent = tab.content

    -- Закругление кнопок
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button

    -- Подключение функции для запуска скрипта
    button.MouseButton1Click:Connect(function()
        print("Кнопка нажата! Загрузка скрипта...")

        -- Проверяем, что scriptUrl не равен nil
        if not scriptUrl then
            warn("Ошибка: URL скрипта не указан!")
            return
        end

        -- Проверяем, что URL начинается с https://
        if not scriptUrl:match("^https://") then
            warn("Ошибка: URL должен начинаться с https://")
            return
        end

        -- Используем coroutine.wrap для выполнения в отдельном потоке
        coroutine.wrap(function()
            local success, err = pcall(function()
                -- Загружаем и выполняем скрипт
                loadstring(game:HttpGet(scriptUrl))()
            end)

            -- Проверка на ошибки
            if not success then
                warn("Ошибка при загрузке скрипта: " .. err)
            else
                print("Скрипт успешно запущен!")
            end
        end)()
    end)

    -- Синии докасание
    button.MouseEnter:Connect(function()
        button.TextColor3 = Color3.new(1, 1, 1)
        button.BackgroundColor3 = Color3.new(0, 0.5, 1)
    end)

    button.MouseLeave:Connect(function()
        button.TextColor3 = Color3.new(0, 0, 0)
        button.BackgroundColor3 = Color3.new(1, 1, 1)
    end)
end


-- Пример создания табов и кнопок
createTab("Murder")
createButton(tabs[1], "Kill all", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Kill%20all.lua")
createButton(tabs[1], "-")

createTab("Sherif")
createButton(tabs[2], "Aim Bot", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Aim%20Bot.lua")
createButton(tabs[2], "Auto shoot murderer", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/AutoShootMurderer.lua")

createTab("Player")
createButton(tabs[3], "Speed")
createButton(tabs[3], "Noclip")
createButton(tabs[3], "Fly")
createButton(tabs[3], "Esp players", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Esp.lua")

createTab("Teleport")
createButton(tabs[4], "Teleport to lobby", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Teleport%20to%20lobby.lua")
createButton(tabs[4], "Teleport to player")
createButton(tabs[4], "Teleport to gun", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Teleport%20to%20gun.lua")
createButton(tabs[4], "Teleport to murder", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Teleport%20to%20murder.lua")
createButton(tabs[4], "Teleport to sherif", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Teleport%20to%20sherif.lua")

createTab("Coins")
createButton(tabs[3], "Esp coins", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Esp%20coins.lua")
createButton(tabs[3], "Auto farm coins", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Auto%20farm%20coins.lua")

createTab("Misc")
createButton(tabs[6], "-")

createTab("Another")
createButton(tabs[7], "Rejoin server", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Rejoin%20Server.lua")
createButton(tabs[7], "Join another server", "https://raw.githubusercontent.com/iqoksz95-debug/IqokczHubMM2/refs/heads/main/Join%20another%20server.lua")



-- Бинд на клавишу "H"
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.H and not gameProcessed then
        togglemainFrame()
    end
end)


-- Шрифты и размер текста
watermark.Font = Enum.Font.FredokaOne
watermark.TextSize = 24 

closeButton.Font = Enum.Font.FredokaOne
closeButton.TextSize = 18

minimizeButton.Font = Enum.Font.FredokaOne
minimizeButton.TextSize = 18

watermark1.Font = Enum.Font.FredokaOne
watermark1.TextSize = 18

plusButton.Font = Enum.Font.FredokaOne
plusButton.TextSize = 24

-- Для кнопок в табах
for _, tab in ipairs(tabs) do
    tab.button.Font = Enum.Font.FredokaOne
    tab.button.TextSize = 16
    for _, child in ipairs(tab.content:GetChildren()) do
        if child:IsA("TextButton") then
            child.Font = Enum.Font.FredokaOne
            child.TextSize = 16 
        end
    end
end



-- Передвижение главного меню по экрану
local dragging = false
local dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)



-- Функция для видимости главного меню
local function togglemainFrame()
    mainFrame.Visible = not mainFrame.Visible
end

plusButton.MouseButton1Click:Connect(togglemainFrame)

-- Изначально маленькое меню видимо, главное меню скрыто
miniMenu.Visible = true
mainFrame.Visible = false
