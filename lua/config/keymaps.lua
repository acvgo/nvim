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
-- Go to next error
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
-- Go to previous error
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
