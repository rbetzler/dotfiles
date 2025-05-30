-- Generate a github link for the highlighted line
local function GenerateGithubLink()
	-- Get current branch name
	local branch = vim.fn.system("git branch --show-current"):gsub("%s+$", "")

	-- Get and parse remote URL
	local raw_url = vim.fn.system("git config --get remote.origin.url")
	local repo_path = raw_url:match("[:/]([^:]+/[^/]+)%.git")

	-- Get the file path relative to repo root
	local file_name = vim.fn.expand("%")
	local file_path = vim.fn.trim(vim.fn.system("git ls-files --full-name " .. file_name))

	-- Get current line number
	local line_nbr = vim.fn.line(".")

	-- Send to clipboard and print full github url
	if repo_path and branch ~= "" and file_path ~= "" then
		local url = "https://github.com/" .. repo_path .. "/blob/" .. branch .. "/" .. file_path .. "#L" .. line_nbr
		vim.fn.setreg("+", url)
		print(url)
	else
		print("Error: Could not generate GitHub URL")
	end
end
vim.api.nvim_create_user_command("GenerateGithubLink", GenerateGithubLink, {})
