
local Flashlights = {}

AddEventHandler('playerDropped', function ()
    if Flashlights[source] then Flashlights[source] = nil end
end)

RegisterServerEvent('Weapons:Server:Toggle')
AddEventHandler('Weapons:Server:Toggle', function(bool, flashlight, weapon)
    if bool then
        Flashlights[source] = {flashlight, weapon}
    else
        Flashlights[source] = nil
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        TriggerClientEvent('Weapons:Client:Return', -1, Flashlights)
    end
end)