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

-- Random
keymap("n", "<leader><C-a>", "<CMD>NERDTreeFocus<CR>", opts)
keymap("n", "<F9>", ":setlocal spell! spelllang=en_us<CR>", opts)
