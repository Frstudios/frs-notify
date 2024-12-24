local QBCore = exports['qb-core']:GetCoreObject()

local function ShowNotification(type, message)
    SendNUIMessage({
        action = 'notification',
        type = type,
        message = message
    })
end

exports('ShowNotification', ShowNotification)

RegisterNetEvent('frs-notify:show')
AddEventHandler('frs-notify:show', function(type, message)
    ShowNotification(type, message)
end)

RegisterCommand('success', function(source, args)
    local message = table.concat(args, " ")
    if message == "" then message = "You pressed the right button!" end
    ShowNotification('success', message)
end)

RegisterCommand('error', function(source, args)
    local message = table.concat(args, " ")
    if message == "" then message = "Error occurred!" end
    ShowNotification('error', message)
end)

RegisterCommand('warning', function(source, args)
    local message = table.concat(args, " ")
    if message == "" then message = "Warning!" end
    ShowNotification('warning', message)
end)

RegisterCommand('info', function(source, args)
    local message = table.concat(args, " ")
    if message == "" then message = "Information!" end
    ShowNotification('info', message)
end)

RegisterNetEvent('frs-notify:client:notify')
AddEventHandler('frs-notify:client:notify', function(type, message)
    ShowNotification(type, message)
end)
