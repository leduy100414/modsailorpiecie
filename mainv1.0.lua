loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()

       local Window = MakeWindow({
         Hub = {
         Title = "TristanGaming",
         Animation = "Youtube: TristanGaming"
         },
        Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
        Notifications = true,
        CorrectKey = "Running the Script...",
       Incorrectkey = "The key is incorrect",
       CopyKeyLink = "Copied to Clipboard"
      }
    }
  })

       MinimizeButton({
       Image = "https://p16-sign-sg.tiktokcdn.com/tos-alisg-avt-0068/0b1ed71eebdff447143b51d3c0e06428~tplv-tiktokx-cropcenter:1080:1080.jpeg?dr=14579&refresh_token=50b09850&x-expires=1775613600&x-signature=4FWAwJhVtoYPj%2FfIoZlwXLfZpB8%3D&t=4d5b0474&ps=13740610&shp=a5d48078&shcp=81f88b70&idc=my",
       Size = {60, 60},
       Color = Color3.fromRGB(10, 10, 10),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "Speed Player"})
     local Tab2o = MakeTab({Name = "Reset Player"})
     local Tab3o = MakeTab({Name = "Size Player"})
     local Tab4o = MakeTab({Name = "Spawm Auto"})
     
------- BUTTON
    
    -- =========================
-- SPEED SYSTEM
-- =========================
getgenv().PlayerSpeed = 16
local player = game.Players.LocalPlayer

local function UpdateSpeed()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = getgenv().PlayerSpeed
    end
end

-- Respawn giu speed
player.CharacterAdded:Connect(function()
    task.wait(1)
    UpdateSpeed()
end)

-- Anti reset
task.spawn(function()
    while task.wait(0.5) do
        pcall(UpdateSpeed)
    end
end)

-- =========================
-- BUTTON TRONG TAB3o
-- =========================

AddButton(Tab1o, {
    Name = "Speed +10",
    Callback = function()
        getgenv().PlayerSpeed += 10
        UpdateSpeed()
    end
})

AddButton(Tab1o, {
    Name = "Speed -10",
    Callback = function()
        getgenv().PlayerSpeed -= 10
        if getgenv().PlayerSpeed < 16 then
            getgenv().PlayerSpeed = 1
        end
        UpdateSpeed()
    end
})

AddButton(Tab2o, {
    Name = "Reset Speed",
    Callback = function()
        getgenv().PlayerSpeed = 16
        UpdateSpeed()
    end
})

-- =========================
-- SIZE PLAYER
-- =========================
getgenv().PlayerSize = 1

local function UpdateSize()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()

    -- Scale cho R15
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local bodyHeight = humanoid:FindFirstChild("BodyHeightScale")
        local bodyWidth = humanoid:FindFirstChild("BodyWidthScale")
        local bodyDepth = humanoid:FindFirstChild("BodyDepthScale")
        local headScale = humanoid:FindFirstChild("HeadScale")

        if bodyHeight then bodyHeight.Value = getgenv().PlayerSize end
        if bodyWidth then bodyWidth.Value = getgenv().PlayerSize end
        if bodyDepth then bodyDepth.Value = getgenv().PlayerSize end
        if headScale then headScale.Value = getgenv().PlayerSize end
    end
end

-- Respawn giu size
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    UpdateSize()
end)

-- Anti reset size
task.spawn(function()
    while task.wait(1) do
        pcall(UpdateSize)
    end
end)

-- =========================
-- BUTTON SIZE
-- =========================

AddButton(Tab3o, {
    Name = "Size +1",
    Callback = function()
        getgenv().PlayerSize += 1
        UpdateSize()
        print("Size:", getgenv().PlayerSize)
    end
})

AddButton(Tab3o, {
    Name = "Size -1",
    Callback = function()
        getgenv().PlayerSize -= 1
        
        -- Khong nho hon 1
        if getgenv().PlayerSize < 1 then
            getgenv().PlayerSize = 1
        end
        
        UpdateSize()
        print("Size:", getgenv().PlayerSize)
    end
})

AddButton(Tab2o, {
    Name = "Reset Size",
    Callback = function()
        getgenv().PlayerSize = 2
        UpdateSize()
    end
})

AddButton(Tab4o, {
    Name = "TP Cursed King",
    Callback = function()
        for _,v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("Cursed King") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
            end
        end
    end
})
