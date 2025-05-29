-- Set keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Visual mode mappings
keymap("v", "<C-c>", "y", opts)
keymap("v", "<C-x>", "x", opts)

-- Insert mode mapping
keymap("i", "<C-v>", "<Esc>P", opts)

-- Normal mode mappings
keymap("n", "<C-k>", ":wincmd k<CR>", opts)
keymap("n", "<C-j>", ":wincmd j<CR>", opts)
keymap("n", "<C-l>", ":wincmd l<CR>", opts)
keymap("n", "<C-h>", ":wincmd h<CR>", opts)
keymap("n", "<C-a>", ":NERDTreeFocusToggle<CR>", opts)
keymap("n", "<F9>", ":setlocal spell! spelllang=en_us<CR>", opts)
