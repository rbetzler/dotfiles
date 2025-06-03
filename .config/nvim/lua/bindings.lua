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
keymap("n", "<C-S-h>", "<CMD>wincmd h<CR>", opts)
keymap("n", "<C-S-j>", "<CMD>wincmd j<CR>", opts)
keymap("n", "<C-S-k>", "<CMD>wincmd k<CR>", opts)
keymap("n", "<C-S-l>", "<CMD>wincmd l<CR>", opts)

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
vim.keymap.set('n', '<C-S-Left>', '<CMD>vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-S-Down>', '<CMD>resize +2<CR>', opts)
vim.keymap.set('n', '<C-S-Up>', '<CMD>resize -2<CR>', opts)
vim.keymap.set('n', '<C-S-Right>', '<CMD>vertical resize +2<CR>', opts)

-- Random
keymap("n", "<leader><C-a>", "<CMD>NERDTreeFocus<CR>", opts)
keymap("n", "<F9>", ":setlocal spell! spelllang=en_us<CR>", opts)
