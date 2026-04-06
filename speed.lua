loadstring(game:HttpGet("https://raw.githubusercontent.com/leduy100414/modsailorpiecie/refs/heads/main/speed.lua"))()
-- =========================
-- ⚡ SPEED SYSTEM
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

-- Respawn giữ speed
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
-- 🎮 BUTTON TRONG TAB3o
-- =========================

AddButton(Tab3o, {
    Name = "⚡ Speed +10",
    Callback = function()
        getgenv().PlayerSpeed += 10
        UpdateSpeed()
    end
})

AddButton(Tab3o, {
    Name = "🐢 Speed -10",
    Callback = function()
        getgenv().PlayerSpeed -= 10
        if getgenv().PlayerSpeed < 16 then
            getgenv().PlayerSpeed = 16
        end
        UpdateSpeed()
    end
})

AddButton(Tab3o, {
    Name = "🔄 Reset Speed",
    Callback = function()
        getgenv().PlayerSpeed = 16
        UpdateSpeed()
    end
})
