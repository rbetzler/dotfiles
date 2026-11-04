---------
-- Common
---------

local terminal = "terminator"
local fileManager = "nautilus"
local menu = "rofi -show drun"

------------
-- Autostart
------------
-- exec-once = hyprsunset

-- exec-once = [workspace 3 silent] zen-browser
-- exec-once = [workspace special silent] ghostty

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 4,
    bezier = "default",
    style = "slidevert",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("copyq --start-server")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("swaync")
    hl.exec_cmd("waybar")
    hl.exec_cmd("slack", { workspace = "1 silent" })
    hl.exec_cmd("ghostty -e ncspot", { workspace = "2 silent" })
end)

