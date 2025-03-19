local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

vim.g.python3_host_prog = '~/venv/bin/python'
