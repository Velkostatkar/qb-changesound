local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("cs", function()
    OpenEngineSoundMenu()
end)


function OpenEngineSoundMenu()
    local menuOptions = {}


    for soundName, soundFile in pairs(Config.EngineSounds) do
        table.insert(menuOptions, {
            header = soundName,
            txt = "Set the engine sound to " .. soundName,
            params = {
                event = "qb-changesound:client:applyEngineSound",
                args = soundFile
            }
        })
    end


    table.insert(menuOptions, {
        header = "Close menu",
        txt = "",
        params = {
            event = "qb-menu:closeMenu"
        }
    })

    TriggerEvent('qb-menu:client:openMenu', menuOptions)
end

RegisterNetEvent("qb-changesound:client:applyEngineSound")
AddEventHandler("qb-changesound:client:applyEngineSound", function(sound)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then  
        ForceVehicleEngineAudio(vehicle, sound)  
        TriggerServerEvent('qb-changesound:server:syncVehicleSound', vehicle, sound)
        QBCore.Functions.Notify("Engine sound set to: " .. sound, "success")
    else
        QBCore.Functions.Notify("You're not in the vehicle!", "error")
    end
end)
