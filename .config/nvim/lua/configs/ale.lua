vim.g.ale_fixers = {
    ["*"] = { "remove_trailing_lines", "trim_whitespace" },
    python = { "autoflake", "black", "isort" },
}

vim.g.ale_linters_ignore = {
    sql = { "sqlfluff" },
}

vim.g.ale_sign_error = "✘"
vim.g.ale_sign_warning = "⚠"
vim.g.ale_echo_msg_format = "[%linter%] %s [%severity%]"
vim.g.ale_virtualtext_cursor = "current"
vim.g.ale_virtualtext_prefix = "    %comment% %type%: "
