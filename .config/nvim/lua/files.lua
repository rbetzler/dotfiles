
----------
-- Generic
----------

-- Autoformat CSV files on open and write
-- Originally borrowed from: https://github.com/chrisbra/csv.vim/blob/master/csv.vmb
vim.api.nvim_create_augroup("CSV_Editing", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
  group = "CSV_Editing",
  pattern = "*.csv",
  command = "%ArrangeColumn",
})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "CSV_Editing",
  pattern = "*.csv",
  command = "%UnArrangeColumn",
})

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

-- TODO Dracula-rize color
local function highlight_trailing_whitespace()
  vim.api.nvim_set_hl(0, "ExtraWhitespace", { ctermbg = "red", bg = "red" })
  vim.fn.matchadd("ExtraWhitespace", [[\s\+\%#\@<!$]])
end
vim.api.nvim_create_autocmd({ "VimEnter", "BufWritePost" }, {
  pattern = "*",
  callback = highlight_trailing_whitespace,
})

local function RemoveWhiteSpaces()
  vim.cmd(':%s/\\s\\+$//e')
end
vim.api.nvim_create_user_command("RemoveWhiteSpaces", RemoveWhiteSpaces, {})
vim.api.nvim_create_user_command("RmWhiteSpaces", RemoveWhiteSpaces, {})

-- Helps performance on files with long lines
local function TurnOffSyntaxLongLines()
  vim.opt.synmaxcol = 300
end
vim.api.nvim_create_user_command("TurnOffSyntaxLongLines", TurnOffSyntaxLongLines, {})

---------
-- Python
---------

local function WritePyBreakpoint()
  local line = vim.fn.line(".")
  local indent = vim.fn.indent(line)
  local pad = string.rep(" ", indent)
  vim.fn.append(line - 1, pad .. "breakpoint()")
end
vim.api.nvim_create_user_command("WritePyBreakpoint", WritePyBreakpoint, {})

local function RemovePythonBreakpoints()
  vim.cmd(':g/breakpoint()/d')
end
vim.api.nvim_create_user_command("RemovePythonBreakpoints", RemovePythonBreakpoints, {})
vim.api.nvim_create_user_command("RmPyBreakpoints", RemovePythonBreakpoints, {})

----------
-- Web Dev
----------

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = "*.tsx",
  callback = function()
    vim.bo.commentstring = "{/* %s */}"
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = "*.svelte",
  callback = function()
    vim.bo.commentstring = "/* %s */"
  end,
})
