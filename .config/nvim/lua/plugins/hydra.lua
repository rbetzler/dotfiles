return {
	"anuvyklack/hydra.nvim",
	dependencies = { "anuvyklack/keymap-layer.nvim" },
	config = function()
		local Hydra = require("hydra")
		local resize = function(win, amt, dir)
			return function()
				require("winresize").resize(win, amt, dir)
			end
		end
		local hfunction = function()
			return function()
				vim.cmd("vsplit")
				vim.cmd("wincmd l")
				vim.cmd("wincmd H")
			end
		end
		local jfunction = function()
			return function()
				vim.cmd("split")
				vim.cmd("wincmd j")
			end
		end
		local kfunction = function()
			return function()
				vim.cmd("split")
				vim.cmd("wincmd j")
				vim.cmd("wincmd K")
			end
		end
		local lfunction = function()
			return function()
				vim.cmd("vsplit")
				vim.cmd("wincmd l")
			end
		end

		Hydra({
			name = "Window resize",
			mode = "n",
			body = "<leader>w",
			heads = {
				{ "h", "<CMD>wincmd h<CR>" },
				{ "j", "<CMD>wincmd j<CR>" },
				{ "k", "<CMD>wincmd k<CR>" },
				{ "l", "<CMD>wincmd l<CR>" },

				{ "<C-h>", hfunction() },
				{ "<C-j>", jfunction() },
				{ "<C-k>", kfunction() },
				{ "<C-l>", lfunction() },

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
