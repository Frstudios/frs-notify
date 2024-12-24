local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.Notify = function(text, texttype, length)
    if type(text) == "table" then
        local ttext = text.text or 'Placeholder'
        local caption = text.caption or 'Placeholder'
        texttype = texttype or 'success'
        length = length or 3000
        exports['frs-notify']:ShowNotification(texttype, ttext)
    else
        texttype = texttype or 'success'
        length = length or 3000
        exports['frs-notify']:ShowNotification(texttype, text)
    end
end

exports('Notify', QBCore.Functions.Notify)
