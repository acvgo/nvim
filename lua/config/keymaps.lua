-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Default Lazy-Vim keymaps by module here
-- http://www.lazyvim.org/keymaps

-- Navigate backward through open buffers
vim.keymap.set("n", "<C-z>", ":bp<CR>")
-- Navigate forward through open buffers
vim.keymap.set("n", "<C-x>", ":bn<CR>")
-- Toggle highlight on search results
vim.keymap.set("n", "<C-c>", ":set hlsearch!<CR>")
-- Jump to next diagnostic
vim.keymap.set("n", "]g", function()
	vim.diagnostic.jump({ count = 1 })
end, { silent = true, desc = "Next diagnostic" })

-- Jump to previous diagnostic
vim.keymap.set("n", "[g", function()
	vim.diagnostic.jump({ count = -1 })
end, { silent = true, desc = "Prev diagnostic" })

-- Open Claude Code in right split
vim.keymap.set("n", "<leader>ac", function()
	vim.cmd("vsplit")
	vim.cmd("terminal claude")
	vim.cmd("startinsert")
end, { desc = "Open Claude Code in right split" })
