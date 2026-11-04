require("monitors")
require("programs")
require("bindings/general")
require("bindings/ghostty")
require("bindings/miscellaneous")
require("bindings/workspaces")


-- https://wiki.hyprland.org/Configuring/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- https://wiki.hyprland.org/Configuring/Variables/#general
-- https://draculatheme.com/hyprland

hl.window_rule({
    name = "windowrule-1",
    match = {
        xwayland = 1,
    },
    border_color = "rgb(ff5555)",
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})
hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})
hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = { top = 5, right = 10, bottom = 10, left = 10 },
        border_size = 2,
        col = {
            active_border = { colors = { "rgb(8be9fd)", "rgb(bd93f9)" }, angle = 90 },
            inactive_border = "rgba(44475aaa)",
            nogroup_border = "rgba(282a36dd)",
            nogroup_border_active = { colors = { "rgb(bd93f9)", "rgb(44475a)" }, angle = 45 },
        },
        -- no_border_on_floating = false
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    group = {
        groupbar = {
            col = {
                active = { colors = { "rgb(bd93f9)", "rgb(44475a)" }, angle = 90 },
                inactive = "rgba(282a36dd)",
            },
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1e202966)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
        enabled = true,
        -- https://wiki.hyprland.org/Configuring/Animations/
    },
    -- https://wiki.hyprland.org/Configuring/Dwindle-Layout/
    dwindle = {
        preserve_split = true,
        force_split = 1,
    },
    -- https://wiki.hyprland.org/Configuring/Master-Layout/
    master = {
        new_status = "master",
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        key_press_enables_dpms = true,
        mouse_move_enables_dpms = true,
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        repeat_rate = 100,
        repeat_delay = 140,
        sensitivity = 0.9,
        numlock_by_default = true,
        natural_scroll = true,
        touchpad = {
            natural_scroll = true,
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#cursor
    cursor = {
        inactive_timeout = 5,
    },
})

