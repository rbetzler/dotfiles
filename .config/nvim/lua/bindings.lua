local Windows = require("windows")
local opts = { noremap = true, silent = true }

-- Visual mode mappings
vim.keymap.set("v", "<C-c>", "y", opts)
vim.keymap.set("v", "<C-x>", "x", opts)

-- Insert mode mapping
vim.keymap.set("i", "<C-v>", "<Esc>P", opts)

-- Match visual selector vim-native bindings with arrow keys
vim.keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)", opts)
vim.keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)", opts)
vim.keymap.set("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)
vim.keymap.set("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts)

-- Duplicative but quicker than entering submode
vim.keymap.set("n", "<leader>h", "<CMD>wincmd h<CR>", opts)
vim.keymap.set("n", "<leader>j", "<CMD>wincmd j<CR>", opts)
vim.keymap.set("n", "<leader>k", "<CMD>wincmd k<CR>", opts)
vim.keymap.set("n", "<leader>l", "<CMD>wincmd l<CR>", opts)
vim.keymap.set("n", "<leader>a", "<CMD>NERDTreeFocus<CR>", opts)
vim.keymap.set("n", "<leader><C-h>", Windows.openSplitLeft(), opts)
vim.keymap.set("n", "<leader><C-j>", Windows.openSplitDown(), opts)
vim.keymap.set("n", "<leader><C-k>", Windows.openSplitUp(), opts)
vim.keymap.set("n", "<leader><C-l>", Windows.openSplitRight(), opts)

-- Random
vim.keymap.set("n", "<F9>", ":setlocal spell! spelllang=en_us<CR>", opts)
