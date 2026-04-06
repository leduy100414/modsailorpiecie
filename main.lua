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
            getgenv().PlayerSpeed = 16
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
