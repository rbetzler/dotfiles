-- Set keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Visual mode mappings
keymap("v", "<C-c>", "y", opts)
keymap("v", "<C-x>", "x", opts)

-- Insert mode mapping
keymap("i", "<C-v>", "<Esc>P", opts)

-- Normal mode mappings
keymap("n", "<C-h>", "<CMD>wincmd h<CR>", opts)
keymap("n", "<C-j>", "<CMD>wincmd j<CR>", opts)
keymap("n", "<C-k>", "<CMD>wincmd k<CR>", opts)
keymap("n", "<C-l>", "<CMD>wincmd l<CR>", opts)

vim.keymap.set("n", "<C-S-h>", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
  vim.cmd("wincmd H")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-S-j>", function()
  vim.cmd("split")
  vim.cmd("wincmd j")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-S-k>", function()
  vim.cmd("split")
  vim.cmd("wincmd j")
  vim.cmd("wincmd K")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-S-l>", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
end, { noremap = true, silent = true })

keymap("n", "<C-a>", ":NERDTreeFocus<CR>", opts)
keymap("n", "<F9>", ":setlocal spell! spelllang=en_us<CR>", opts)
