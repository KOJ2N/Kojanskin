local windowOpen = false

-- Toggle hotkey changed to the 'N' key
local toggleKey = ac.ControlButton("skinSelector/Toggle", { 
    keyboard = { key = ui.KeyIndex.N } 
})

function script.update(dt)
    if toggleKey:pressed() then
        windowOpen = not windowOpen
    end
end

function script.windowMain(dt)
    if not windowOpen then return end

    -- Creates a movable, clean popup window anywhere on screen mid-race
    ui.toolWindow("Server Skin Selector", vec2(300, 250), vec2(400, 350), false, true, function()
        ui.text("Choose a Skin Mid-Race:")
        ui.textColored("Press N to open/close", rgbm.colors.gray)
        ui.separator()
        ui.spacing()

        -- Skin buttons
        if ui.button("Apply Skin: Red", vec2(-1, 0)) then
            ac.sendChatMessage("!skin red")
            ui.toast(ui.ToastType.Success, "Requested Red Skin")
        end

        if ui.button("Apply Skin: Blue", vec2(-1, 0)) then
            ac.sendChatMessage("!skin blue")
            ui.toast(ui.ToastType.Success, "Requested Blue Skin")
        end

        ui.separator()
        if ui.button("Close Menu", vec2(-1, 0)) then
            windowOpen = false
        end
    end)
end
