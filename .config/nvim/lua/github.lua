-- Generate a github link for the highlighted line
local function GenerateGithubLink(opts)
    -- Get current branch name (empty if detached HEAD)
    local branch = vim.fn.system("git branch --show-current"):gsub("%s+$", "")

    -- If branch is empty, get commit hash
    if branch == "" then
        branch = vim.fn.system("git rev-parse HEAD"):gsub("%s+$", "")
    end

    -- Get and parse remote URL
    local raw_url = vim.fn.system("git config --get remote.origin.url"):gsub("%s+$", "")
    local repo_path = raw_url:match("[:/]([^:]+/[^/]+)%.git") or raw_url:match("[:/]([^:]+/[^/]+)")

    -- Get file path relative to repo root
    local file_name = vim.fn.expand("%")
    local file_path = vim.fn.trim(vim.fn.system("git ls-files --full-name " .. file_name))

    -- Build URL (line range already provided via opts)
    if repo_path and branch ~= "" and file_path ~= "" then
        local url = string.format(
            "https://github.com/%s/blob/%s/%s#L%d-L%d",
            repo_path, branch, file_path, opts.line1, opts.line2
        )

        vim.fn.setreg("+", url)
        print(url)
    else
        print("Error: Could not generate GitHub URL")
    end
end
vim.api.nvim_create_user_command("GenerateGithubLink", GenerateGithubLink, { range = true })
