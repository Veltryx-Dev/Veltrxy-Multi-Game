-- Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
   Name = "Veltrxy Multi Game",
   LoadingTitle = "Loading scripts...",
   LoadingSubtitle = "made with <3",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "VeltrxyConfig",
      FileName = "Config"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- ========== TAB 1: Train Your Fish To Race ==========
local TrainTab = Window:CreateTab("🏁 Fish Race", 4483362458)

-- Section 1: Infinite Power
TrainTab:CreateSection("⚡ Infinite Power")
TrainTab:CreateLabel("Spams [C-S]PlayerTrySceneTrain with arg '2'")
TrainTab:CreateParagraph({
   Title = "How it works",
   Content = "Fires the remote every frame (no delay) when toggled ON. Turn OFF to stop instantly."
})

local FishRemote = game:GetService("ReplicatedStorage")
   :WaitForChild("Remotes")
   :WaitForChild("Event")
   :WaitForChild("GameRun")
   :WaitForChild("[C-S]PlayerTrySceneTrain")

local spammingFish = false
local fishConnection

TrainTab:CreateToggle({
   Name = "Infinite Power",
   CurrentValue = false,
   Flag = "InfPower",
   Callback = function(Value)
      spammingFish = Value
      if spammingFish then
         fishConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if spammingFish then
               pcall(function()
                  FishRemote:FireServer("2")
               end)
            end
         end)
      else
         if fishConnection then
            fishConnection:Disconnect()
            fishConnection = nil
         end
      end
   end
})

-- Section 2: Auto Hatch
TrainTab:CreateSection("🥚 Auto Hatch")
TrainTab:CreateLabel("Opens best eggs continuously")
TrainTab:CreateParagraph({
   Title = "Auto Hatch Best Egg",
   Content = "Spams [C-S]PlayerTryOpenEgg with World1_4_1 and World1_4_2. Turn ON to auto-hatch."
})

local HatchRemote = game:GetService("ReplicatedStorage")
   :WaitForChild("Remotes")
   :WaitForChild("Event")
   :WaitForChild("Luck")
   :WaitForChild("[C-S]PlayerTryOpenEgg")

local spammingHatch = false
local hatchConnection

TrainTab:CreateToggle({
   Name = "Auto Hatch Best Egg",
   CurrentValue = false,
   Flag = "AutoHatch",
   Callback = function(Value)
      spammingHatch = Value
      if spammingHatch then
         hatchConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if spammingHatch then
               pcall(function()
                  HatchRemote:FireServer(1, "Egg4", {
                     World1_4_1 = true,
                     World1_4_2 = true
                  })
               end)
            end
         end)
      else
         if hatchConnection then
            hatchConnection:Disconnect()
            hatchConnection = nil
         end
      end
   end
})

TrainTab:CreateLabel("")
TrainTab:CreateLabel("🎮 Game: Train Your Fish To Race")
TrainTab:CreateLabel("🔧 Status: Active & Undetected")

-- ========== TAB 2: +1 Speed Evolve ==========
local EvolveTab = Window:CreateTab("📈 Speed Evolve", 4483362458)

EvolveTab:CreateSection("⚡ Infinite Speed Lvl")
EvolveTab:CreateLabel("Spams AddSpeedRemoteEvent every frame")
EvolveTab:CreateParagraph({
   Title = "How it works",
   Content = "Continuously fires the speed evolve remote. Turn toggle OFF to stop."
})

local EvolveRemote = game:GetService("ReplicatedStorage")
   :WaitForChild("Modules")
   :WaitForChild("Shared")
   :WaitForChild("RemoteEventService")
   :WaitForChild("AddSpeedRemoteEvent")

local spammingEvolve = false
local evolveConnection

EvolveTab:CreateToggle({
   Name = "Infinite Speed Lvl",
   CurrentValue = false,
   Flag = "InfSpeedLvl",
   Callback = function(Value)
      spammingEvolve = Value
      if spammingEvolve then
         evolveConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if spammingEvolve then
               pcall(function()
                  EvolveRemote:FireServer()
               end)
            end
         end)
      else
         if evolveConnection then
            evolveConnection:Disconnect()
            evolveConnection = nil
         end
      end
   end
})

EvolveTab:CreateLabel("")
EvolveTab:CreateLabel("🎮 Game: +1 Speed Evolve")
EvolveTab:CreateLabel("🔧 Status: Active & Undetected")
