local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥POLAR HUB🔥",
   LoadingTitle = "BETA POLAR HUB",
   LoadingSubtitle = "Anonymous",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "🔥Polar🔥"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home🏠", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "You executed this script!",
   Content = "POLAR HUB IN BETA🔥",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
       _G.infinjump = true
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
k = k:lower()
if k == "t" then
if _G.infinjump == true then
_G.infinjump = false
else
_G.infinjump = true
end
end
end)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walkspeed Slider",
   Range = {0, 999},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {0, 999},
   Increment = 1,
   Suffix = "Jump",
   CurrentValue = 50,
   Flag = "PolarJump", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Button = MainTab:CreateButton({
   Name = "InfiniteYield",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/infiniteyield/master/source.lua", true))()
   end,
})

local BLOXFRUITSTab = Window:CreateTab("BloxFruits", nil) -- Title, Image
local Section = BLOXFRUITSTab:CreateSection("Main")

local Button = MainTab:CreateButton({
   Name = "Best ESP",
   Callback = function()
        -- ESP Script for Roblox (Highlighting Torso)

-- Configuration
local espRadius = 1000  -- Radius in studs to highlight players
local highlightColor = Color3.fromRGB(255, 0, 0)  -- Red color (you can change this)

-- Get your character
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Function to create ESP for a player
local function createESP(player)
    local playerCharacter = player.Character
    if playerCharacter then
        local torso = playerCharacter:FindFirstChild("Torso") or playerCharacter:FindFirstChild("UpperTorso")
        if torso then
            local distance = (torso.Position - character.HumanoidRootPart.Position).magnitude
            if distance <= espRadius then
                local espPart = Instance.new("BoxHandleAdornment")
                espPart.Size = Vector3.new(2, 4, 1)  -- Adjust size as needed
                espPart.Color3 = highlightColor
                espPart.Transparency = 0.5
                espPart.AlwaysOnTop = true
                espPart.Adornee = torso
                espPart.ZIndex = 5  -- Ensures it's rendered above other parts
                espPart.Parent = torso
                -- Clean up after a few seconds
                delay(5, function()
                    espPart:Destroy()
                end)
            end
        end
    end
end

-- Function to update ESP for all players
local function updateESP()
    for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            createESP(otherPlayer)
        end
    end
end

-- Update ESP continuously
while true do
    updateESP()
    wait(1)  -- Update every second (adjust as needed)
end
   end,
})
