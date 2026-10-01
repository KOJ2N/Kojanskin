local windowOpen = false

-- Bind a hotkey to open/close the menu (Default: N key)
local toggleKey = ac.ControlButton("liveSkinSelector/Toggle", { 
    keyboard = { key = ui.KeyIndex.N } 
})

function script.update(dt)
    if toggleKey:pressed() then
        windowOpen = not windowOpen
    end
end

function script.windowMain(dt)
    if not windowOpen then return end

    -- Draw the popup window on screen
    ui.toolWindow("Live Skin Selector", vec2(300, 200), vec2(350, 300), false, true, function()
        ui.text("Select Car Skin Mid-Race")
        ui.textColored("Press N to toggle this window", rgbm.colors.gray)
        ui.separator()
        ui.spacing()

        ui.text("Available Liveries:")

        -- Button 1: Triggers skin change action via chat command / server handler
        if ui.button("Skin Variant: Red", vec2(-1, 0)) then
            ac.sendChatMessage("!skin red")  -- Triggers your server-side plugin/bot
            ui.toast(ui.ToastType.Success, "Switching to Red skin...")
        end

        -- Button 2
        if ui.button("Skin Variant: Blue", vec2(-1, 0)) then
            ac.sendChatMessage("!skin blue")
            ui.toast(ui.ToastType.Success, "Switching to Blue skin...")
        end

        -- Button 3
        if ui.button("Skin Variant: Carbon", vec2(-1, 0)) then
            ac.sendChatMessage("!skin carbon")
            ui.toast(ui.ToastType.Success, "Switching to Carbon skin...")
        end

        ui.separator()
        if ui.button("Close", vec2(-1, 0)) then
            windowOpen = false
        end
    end)
end