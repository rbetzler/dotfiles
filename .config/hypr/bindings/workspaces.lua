-- Monitors

local mainMod = "SUPER"

-- Make fullscreen
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- Pivot
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.layout("togglesplit"))

-- Toggle scratchpad / special workspace
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("special"))

-- Switch window via arrows
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch window vim-like
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move windows via arrows
hl.bind(mainMod .. " + CONTROL + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CONTROL + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CONTROL + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CONTROL + down", hl.dsp.window.move({ direction = "d" }))

-- Move windows vim-like
hl.bind(mainMod .. " + CONTROL + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CONTROL + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CONTROL + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CONTROL + j", hl.dsp.window.move({ direction = "d" }))

-- Resize window via arrows
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- Resize window vim-like
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- Switch workspaces
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + KP_End", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + KP_Down", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + KP_Next", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + KP_Left", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + KP_Begin", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + KP_Right", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + KP_Home", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + KP_Up", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + KP_Prior", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + KP_Insert", hl.dsp.focus({ workspace = 10 }))

-- Move window to another workspace
hl.bind(mainMod .. " + CONTROL + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + CONTROL + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + CONTROL + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + CONTROL + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + CONTROL + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + CONTROL + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + CONTROL + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + CONTROL + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + CONTROL + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + CONTROL + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + CONTROL + KP_End", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + CONTROL + KP_Down", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + CONTROL + KP_Next", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + CONTROL + KP_Left", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + CONTROL + KP_Begin", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + CONTROL + KP_Right", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + CONTROL + KP_Home", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + CONTROL + KP_Up", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + CONTROL + KP_Prior", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + CONTROL + KP_Insert", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8, follow = false }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9, follow = false }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_End", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Down", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Next", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Left", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Begin", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Right", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Home", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Up", hl.dsp.window.move({ workspace = 8, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Prior", hl.dsp.window.move({ workspace = 9, follow = false }))
hl.bind(mainMod .. " + SHIFT + KP_Insert", hl.dsp.window.move({ workspace = 10, follow = false }))

-- Scroll through existing workspaces via mouse
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Scroll through existing workspaces via keyboard
hl.bind(mainMod .. " + page_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + page_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move, resize windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
