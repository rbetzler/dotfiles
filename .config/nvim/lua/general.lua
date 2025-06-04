vim.g.python3_host_prog = "~/venv/bin/python"

-- Syntax highlighting
vim.g.python_highlight_all = 1
vim.cmd("syntax on")

-- Line numbering
vim.o.number = true

-- Access system clipboard
vim.o.clipboard = "unnamedplus"

-- Keep the most recently pasted item in clipboard
vim.keymap.set("x", "p", "pgvy", { noremap = true, silent = true })

-- Set color scheme
vim.o.background = "dark"
vim.cmd("colorscheme dracula")

-- Allow mouse
vim.opt.mouse = "a"
vim.g.is_mouse_enabled = 1

-- Set ctags
-- vim.opt.tags:append(vim.fn.expand("$HOME/.ctags/tags"))

-- Disable line wrapping
vim.o.wrap = false

-- Split new windows below
vim.o.splitbelow = true

-- Set file to autoread on open
vim.o.autoread = true

-- Set tabs, indentation
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smarttab = true

-- Disable search highlighting
vim.o.hlsearch = false

-- Disable omnicomplete preview window
vim.opt.completeopt:remove("preview")

-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1

-- Align comments left
vim.g.NERDDefaultAlign = "left"

vim.api.nvim_set_hl(0, "IncSearch", { link = "DraculaOrange" })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("GitGutter")
    end,
})

-- Enable filetype plugins and indentation
vim.cmd("filetype plugin indent on")
