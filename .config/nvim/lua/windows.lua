local M = {}

M.openSplitLeft = function()
    return function()
        vim.cmd("vsplit")
        vim.cmd("wincmd l")
        vim.cmd("wincmd H")
    end
end
M.openSplitDown = function()
    return function()
        vim.cmd("split")
        vim.cmd("wincmd j")
    end
end
M.openSplitUp = function()
    return function()
        vim.cmd("split")
        vim.cmd("wincmd j")
        vim.cmd("wincmd K")
    end
end
M.openSplitRight = function()
    return function()
        vim.cmd("vsplit")
        vim.cmd("wincmd l")
    end
end

return M
