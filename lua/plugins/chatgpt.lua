return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			-- api_key_cmd = "echo " .. vim.env.OPENAI_API_KEY,
			welcome_message = "Shift-Enter to sendf",
			chat = {
				keymaps = {
					submit = "<S-CR>",
				},
			},
			openai_params = {
				-- NOTE: model can be a function returning the model name
				-- this is useful if you want to change the model on the fly
				-- using commands
				-- Example:
				-- model = function()
				--     if some_condition() then
				--         return "gpt-4-1106-preview"
				--     else
				--         return "gpt-3.5-turbo"
				--     end
				-- end,
				model = "gpt-4.1",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 1000,
				temperature = 0.7,
				top_p = 0.1,
				n = 1,
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
