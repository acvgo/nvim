-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree show")
	end,
})

vim.api.nvim_create_user_command("FormatAll", function()
	-- get tracked files via `vim.system`
	local r = vim.system({ "git", "ls-files" }, { text = true }):wait()
	if r.code ~= 0 or not r.stdout or r.stdout == "" then
		vim.notify("FormatAll: no git-tracked files found", vim.log.levels.WARN)
		return
	end

	local files = {}
	for line in r.stdout:gmatch("[^\r\n]+") do
		table.insert(files, line)
	end
	if #files == 0 then
		vim.notify("FormatAll: no git-tracked files found", vim.log.levels.WARN)
		return
	end

	local has_conform, conform = pcall(require, "conform")
	local cur = vim.api.nvim_get_current_buf()

	local function edit_silent(path)
		vim.api.nvim_cmd(
			{ cmd = "edit", args = { path } },
			{ mods = { noautocmd = true, keepalt = true, keepjumps = true }, output = false }
		)
	end

	local function write_silent()
		vim.api.nvim_cmd({ cmd = "write" }, { mods = { silent = true }, output = false })
	end

	for _, f in ipairs(files) do
		local path = vim.fn.fnameescape(f)
		edit_silent(path)

		if has_conform then
			-- sync format with LSP fallback
			conform.format({ lsp_fallback = true, timeout_ms = 3000 })
		else
			-- built-in LSP formatting (sync)
			vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
		end

		write_silent()
	end

	if vim.api.nvim_buf_is_valid(cur) then
		vim.api.nvim_set_current_buf(cur)
	end

	vim.notify("FormatAll: done", vim.log.levels.INFO)
end, {})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.xml" },
	command = "set filetype=xml",
})
