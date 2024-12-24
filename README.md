# Notify Integration for QB-Core

Thank you for using the `notify` system! This script provides a seamless integration to enhance the notification functionality in your QBCore-based project.

## Installation

1. Add the provided code snippet to your `qbcore/client/functions.lua` file.

## How to Use

-- notify frs-notify
QBCore.Functions.Notify = function(text, texttype, length)
    if type(text) == "table" then
        local ttext = text.text or 'Placeholder'
        local caption = text.caption or 'Placeholder'
        texttype = texttype or 'success'
        length = length or 3000
        exports['frs-notify']:ShowNotification(texttype, text)
    else
        texttype = texttype or 'success'
        length = length or 3000
        exports['frs-notify']:ShowNotification(texttype, text)
    end
end

exports('Notify', QBCore.Functions.Notify)
