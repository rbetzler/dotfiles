return {
	"anuvyklack/hydra.nvim",
	dependencies = { "anuvyklack/keymap-layer.nvim" },
	config = function()
		local Hydra = require("hydra")
		local Windows = require("windows")
		local resize = function(win, amt, dir)
			return function()
				require("winresize").resize(win, amt, dir)
			end
		end

		Hydra({
			name = "Windows",
			mode = "n",
			body = "<leader>w",
			heads = {
				{ "a", "<CMD>NERDTreeFocus<CR>" },

				{ "h", "<CMD>wincmd h<CR>" },
				{ "j", "<CMD>wincmd j<CR>" },
				{ "k", "<CMD>wincmd k<CR>" },
				{ "l", "<CMD>wincmd l<CR>" },

				{ "<C-h>", Windows.openSplitLeft() },
				{ "<C-j>", Windows.openSplitDown() },
				{ "<C-k>", Windows.openSplitUp() },
				{ "<C-l>", Windows.openSplitRight() },

				{ "<C-S-h>", resize(0, 2, "left") },
				{ "<C-S-j>", resize(0, 2, "down") },
				{ "<C-S-k>", resize(0, 1, "up") },
				{ "<C-S-l>", resize(0, 2, "right") },
				{ "q", nil, { exit = true, desc = "Quit Hydra" } },
				{ "<Esc>", nil, { exit = true, desc = "Quit Hydra" } },
			},
			config = {
				invoke_on_body = true,
				timeout = false,
				hint = {
					type = "statusline",
				},
			},
		})
	end,
}
