local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

vim.g.python3_host_prog = '~/venv/bin/python'


local function FormatJSON()
  vim.cmd(':%!python -m json.tool')
end
vim.api.nvim_create_user_command("FormatJSON", FormatJSON, {})
vim.api.nvim_create_user_command("FmtJSON", FormatJSON, {})

local function CSVEnable()
  vim.cmd(':%ArrangeColumn')
end
vim.api.nvim_create_user_command("CSVEnable", CSVEnable, {})

local function CSVDisable()
  vim.cmd(':%UnArrangeColumn')
end
vim.api.nvim_create_user_command("CSVDisable", CSVDisable, {})

local function RemoveWhiteSpaces()
  vim.cmd(':%s/\\s\\+$//e')
end
vim.api.nvim_create_user_command("RemoveWhiteSpaces", RemoveWhiteSpaces, {})
vim.api.nvim_create_user_command("RmWhiteSpaces", RemoveWhiteSpaces, {})

local function RemovePythonBreakpoints()
  vim.cmd(':g/breakpoint()/d')
end
vim.api.nvim_create_user_command("RemovePythonBreakpoints", RemovePythonBreakpoints, {})
vim.api.nvim_create_user_command("RmPyBreakpoints", RemovePythonBreakpoints, {})
