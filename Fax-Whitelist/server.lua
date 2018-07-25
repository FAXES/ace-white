---------------------------------------
-- Ace Perm Whitelist, Made by FAXES --
---------------------------------------
-- Config
nonWL = "Server restriction is set to Registered Members and above" -- Displayed when a player is not allowed into the server
gametypemsg = "Server Restriction : Verified Members Only" -- Displays on the serverlist under the "GameType" section

-- Main Code
AddEventHandler('onResourceStart', function()
	Citizen.Wait(150)
    SetGameType(gametypemsg)
end)

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local s = source
    deferrals.defer()
    deferrals.update("Checking Permissions")
    Wait(1000)
    local allowed = false
    if IsPlayerAceAllowed(s, "fax-whitelist") then
        deferrals.done()
        allowed = true
    else
        deferrals.done(nonWL)
    end
end)