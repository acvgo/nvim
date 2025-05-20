return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		-- Enable Copilot for Neovim
		vim.g.copilot_enabled = true

		-- Use <C-l> to accept Copilot suggestion
		vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

		-- Configure Copilot panel behavior
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_assume_mapped = true

		-- Optional: Customize file types for Copilot
		vim.g.copilot_filetypes = {
			["*"] = true, -- Enable Copilot for all file types
			["markdown"] = true, -- Enable for Markdown
			["lua"] = true, -- Enable for Lua
			["text"] = true, -- Enable for plain text
		}

		-- Optional: Set the Copilot inline suggestion highlight
		vim.cmd([[
      highlight CopilotSuggestion guifg=#6B7280 ctermfg=8
    ]])
	end,
}
