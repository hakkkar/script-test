-- Fullscreen Infinite "Loading" Screen
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

-- Remove existing fake loader if it exists (safety)
pcall(function()
    CoreGui:FindFirstChild("FakeLoadingGui"):Destroy()
end)

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "FakeLoadingGui"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.Parent = CoreGui

-- Main frame
local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.Position = UDim2.new(0, 0, 0, 0)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Loading text
local text = Instance.new("TextLabel")
text.Text = "SCRIPT LOADING"
text.Font = Enum.Font.SourceSansBold
text.TextSize = 48
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.BackgroundTransparency = 1
text.Size = UDim2.new(1, 0, 0, 100)
text.Position = UDim2.new(0, 0, 0.4, 0)
text.Parent = frame

-- Loading bar background
local barBack = Instance.new("Frame")
barBack.Size = UDim2.new(0.5, 0, 0, 30)
barBack.Position = UDim2.new(0.25, 0, 0.55, 0)
barBack.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
barBack.BorderSizePixel = 0
barBack.Parent = frame

-- Loading bar fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBack

-- Loading % label
local percent = Instance.new("TextLabel")
percent.Text = "0%"
percent.Font = Enum.Font.SourceSansBold
percent.TextSize = 24
percent.TextColor3 = Color3.fromRGB(255, 255, 255)
percent.BackgroundTransparency = 1
percent.Size = UDim2.new(1, 0, 1, 0)
percent.Position = UDim2.new(0, 0, 0, 30)
percent.Parent = barBack

-- Loop animation
task.spawn(function()
	local progress = 0
	while true do
		progress = (progress + 1) % 101
		barFill.Size = UDim2.new(progress / 100, 0, 1, 0)
		percent.Text = progress .. "%"
		wait(0.05)
	end
end)
