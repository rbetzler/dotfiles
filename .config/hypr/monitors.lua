-- https://wiki.hyprland.org/Configuring/Monitors/

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

------------------
-- Toggle monitors
------------------

hl.workspace_rule({
    workspace = "1",
    persistent = true,
})

hl.workspace_rule({
    workspace = "2",
    persistent = true,
})

hl.workspace_rule({
    workspace = "3",
    persistent = true,
})

hl.workspace_rule({
    workspace = "4",
    persistent = true,
})

hl.workspace_rule({
    workspace = "5",
    persistent = true,
})

hl.workspace_rule({
    workspace = "6",
    persistent = true,
})

hl.workspace_rule({
    workspace = "7",
    persistent = true,
})

hl.workspace_rule({
    workspace = "8",
    persistent = true,
})

hl.workspace_rule({
    workspace = "9",
    persistent = true,
})

hl.workspace_rule({
    workspace = "10",
    persistent = true,
})

-- Toggle monitors based on what is plugged in.

local function restart_waybar()
    hl.exec_cmd("pkill -x waybar; waybar")
end

local function configure_monitors()
    -- Build a set of connected monitor names.
    local connected = {}

    for _, monitor in ipairs(hl.get_monitors()) do
        connected[monitor.name] = true
    end

    -- DP-1 is required for this layout.
    if not connected["DP-1"] then
        return
    end

    -- Prefer DP-3 over HDMI-A-1.
    local secondary = nil

    if connected["DP-3"] then
        secondary = "DP-3"
    elseif connected["HDMI-A-1"] then
        secondary = "HDMI-A-1"
    end

    -- Disable the laptop display.
    hl.monitor({
        output = "eDP-1",
        disabled = true,
    })

    -- Configure primary display.
    hl.monitor({
        output = "DP-1",
        mode = "1920x1080",
        position = "1920x0",
        scale = 1,
        transform = 3,
    })

    -- Configure secondary display, if present.
    if secondary then
        hl.monitor({
            output = secondary,
            mode = "2560x1440",
            position = "3000x0",
            scale = 1,
        })
    end

    -- Move existing workspaces.
    for _, ws in ipairs(hl.get_workspaces()) do
        local target = "DP-1"

        if secondary and ws.id >= 6 then
            -- Bind workspaces 1 through 5 to primary display
            hl.workspace_rule({ workspace = "1", monitor = target, default = true })
            hl.workspace_rule({ workspace = "2", monitor = target })
            hl.workspace_rule({ workspace = "3", monitor = target })
            hl.workspace_rule({ workspace = "4", monitor = target })
            hl.workspace_rule({ workspace = "5", monitor = target })

            -- Bind workspaces 6 through 10 to secondary display
            hl.workspace_rule({ workspace = "6",  monitor = secondary, default = true })
            hl.workspace_rule({ workspace = "7",  monitor = secondary })
            hl.workspace_rule({ workspace = "8",  monitor = secondary })
            hl.workspace_rule({ workspace = "9",  monitor = secondary })
            hl.workspace_rule({ workspace = "10", monitor = secondary })
        end
    end

    restart_waybar()
end

configure_monitors()

hl.bind("SUPER + SHIFT + M", configure_monitors)
