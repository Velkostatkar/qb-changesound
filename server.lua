
RegisterNetEvent("qb-changesound:server:syncVehicleSound")
AddEventHandler("qb-changesound:server:syncVehicleSound", function(vehicle, sound)
    TriggerClientEvent("qb-changesound:client:syncVehicleSound", -1, vehicle, sound)
end)


RegisterNetEvent('qb-changesound:client:syncVehicleSound')
AddEventHandler('qb-changesound:client:syncVehicleSound', function(vehicle, sound)
    if DoesEntityExist(vehicle) then
        SetVehicleEngineSound(vehicle, sound)
    end
end)
