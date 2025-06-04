-- Set keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Visual mode mappings
keymap("v", "<C-c>", "y", opts)
keymap("v", "<C-x>", "x", opts)

-- Insert mode mapping
keymap("i", "<C-v>", "<Esc>P", opts)

-- Match visual selector vim-native bindings with arrow keys
vim.keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)", opts)
vim.keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)", opts)
vim.keymap.set("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)
vim.keymap.set("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts)

-- Normal mode navigation mappings
keymap("n", "<leader><C-h>", "<CMD>wincmd h<CR>", opts)
keymap("n", "<leader><C-j>", "<CMD>wincmd j<CR>", opts)
keymap("n", "<leader><C-k>", "<CMD>wincmd k<CR>", opts)
keymap("n", "<leader><C-l>", "<CMD>wincmd l<CR>", opts)
keymap("n", "<leader><C-Left>", "<CMD>wincmd h<CR>", opts)
keymap("n", "<leader><C-Down>", "<CMD>wincmd j<CR>", opts)
keymap("n", "<leader><C-Up>", "<CMD>wincmd k<CR>", opts)
keymap("n", "<leader><C-Right>", "<CMD>wincmd l<CR>", opts)

-- Create splits
vim.keymap.set("n", "<leader><C-S-h>", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
	vim.cmd("wincmd H")
end, opts)

vim.keymap.set("n", "<leader><C-S-j>", function()
	vim.cmd("split")
	vim.cmd("wincmd j")
end, opts)

vim.keymap.set("n", "<leader><C-S-k>", function()
	vim.cmd("split")
	vim.cmd("wincmd j")
	vim.cmd("wincmd K")
end, opts)

vim.keymap.set("n", "<leader><C-S-l>", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
end, opts)

-- Resize splits
local resize = function(win, amt, dir)
    return function()
        require("winresize").resize(win, amt, dir)
    end
end
vim.keymap.set("n", "<C-S-h>", resize(0, 2, "left"))
vim.keymap.set("n", "<C-S-j>", resize(0, 1, "down"))
vim.keymap.set("n", "<C-S-k>", resize(0, 1, "up"))
vim.keymap.set("n", "<C-S-l>", resize(0, 2, "right"))
vim.keymap.set("n", "<C-S-Left>", resize(0, 2, "left"))
vim.keymap.set("n", "<C-S-Down>", resize(0, 1, "down"))
vim.keymap.set("n", "<C-S-Up>", resize(0, 1, "up"))
vim.keymap.set("n", "<C-S-Right>", resize(0, 2, "right"))

-- Random
keymap("n", "<leader><C-a>", "<CMD>NERDTreeFocus<CR>", opts)
keymap("n", "<F9>", ":setlocal spell! spelllang=en_us<CR>", opts)
