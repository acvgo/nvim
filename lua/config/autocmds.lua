-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree show")
	end,
})

vim.api.nvim_create_user_command("FormatAll", function()
	local files = vim.fn.systemlist("git ls-files")
	for _, file in ipairs(files) do
		vim.cmd("edit " .. file)
		vim.lsp.buf.format()
		vim.cmd("write")
	end
end, {})
