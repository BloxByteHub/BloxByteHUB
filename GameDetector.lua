local GameID = game.PlaceId
local BaseUrl = "https://raw.githubusercontent.com/BloxByteHub/BloxByteHUB/main/Games/"

local Games = {
    [11796791326] = "MarbleMergeTycoon.lua",
    [121863161094252] = "AxeRNG.lua",
    [126213452886809] = "KnowledgeIncremental.lua",
    [139992937215031] = "DropBallsForBrainrots.lua",
    [110627433764494] = "FakeaBrainrot.lua"
}

local gameScript = Games[GameID]

if gameScript then
    local scriptUrl = BaseUrl .. gameScript
    print("BloxByte HUB: Supported game detected. Loading: " .. gameScript)

    local success, err = pcall(function()
        local content = game:HttpGet(scriptUrl, true)
        
        if loadstring then
            local loadedFunc, loadError = loadstring(content)
            
            if loadedFunc then
                loadedFunc(passedKey)
            else
                error("Loadstring failed! Error in downloaded script: " .. tostring(loadError))
            end
        else
            warn("BloxByte HUB: loadstring is disabled in your executor!")
        end
    end)

    if not success then
        warn("BloxByte HUB: Failed to load the game script. Error: " .. tostring(err))
    end
else
    warn("BloxByte HUB: This game is not supported!")

    local StarterGui = game:GetService("StarterGui")
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "BloxByte HUB",
            Text = "Game not supported yet!",
            Duration = 10
        })
    end)
end