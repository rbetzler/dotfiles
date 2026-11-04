-- https://wiki.hyprland.org/Configuring/Keywords/

local mainMod = "SUPER"
local fileManager = "nautilus"
local menu = "rofi -show drun"

-- https://wiki.hyprland.org/Configuring/Binds/
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- bind = $mainMod, C, killactive,
-- bind = $mainMod, E, exec, $fileManager
-- bind = $mainMod, V, togglefloating,
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
-- bind = $mainMod, P, pseudo,

hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))
-- bind = $mainMod, D, exec, rofi -show drun
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("copyq -e \"toggle()\""))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("pavucontrol"))

-- Lock
hl.bind(mainMod .. " + CONTROL + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
-- Logout
hl.bind(mainMod .. " + CONTROL + SHIFT + O", hl.dsp.exit())
-- Poweroff
hl.bind(mainMod .. " + CONTROL + SHIFT + P", hl.dsp.exec_cmd("systemctl poweroff"))
-- Reboot
hl.bind(mainMod .. " + CONTROL + SHIFT + R", hl.dsp.exec_cmd("systemctl reboot"))
-- Sleep
hl.bind(mainMod .. " + CONTROL + SHIFT + S", hl.dsp.exec_cmd("systemctl suspend"))
