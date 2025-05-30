local wilder = require("wilder")

-- Menu for vim commands
wilder.setup({
	modes = { ":", "/", "?" },
})
vim.o.wildmenu = true
vim.o.wildmode = "longest"

-- Set the highlighters
local highlighters = {
	wilder.lua_fzy_highlighter(),
}

-- Define popupmenu renderer with border theme
local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
	border = "rounded",
	highlights = {
		border = "Normal",
	},
	highlighter = highlighters,
	min_width = "100%",
	min_height = "25%",
}))

-- Define wildmenu renderer
local wildmenu_renderer = wilder.wildmenu_renderer({
	highlighter = highlighters,
})

-- Set renderer mux based on command mode
wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = popupmenu_renderer,
		["/"] = wildmenu_renderer,
		substitute = wildmenu_renderer,
	})
)

-- Set the pipeline with fuzzy finding and Python engine
wilder.set_option("pipeline", {
	wilder.branch(
		wilder.cmdline_pipeline({
			language = "python",
			fuzzy = 1,
		}),
		wilder.python_search_pipeline({
			pattern = wilder.python_fuzzy_pattern(),
			sorter = wilder.python_difflib_sorter(),
			engine = "re",
		})
	),
})
