return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"bash-language-server",
				"css-lsp",
				"eslint_d",
				"gopls",
				"html-lsp",
				"json-lsp",
				"python-lsp-server",
				"typescript-language-server",
				"vue-language-server",
			},
		},
	},
	{
		"nvim-lspconfig",
		opts = {
			setup = {
				volar = function()
					require("lazyvim.util").lsp.on_attach(function(client, _)
						if client.name == "volar" then
							client.server_capabilities.documentFormattingProvider = true
						end
					end)
				end,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"go",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
				"vue", -- Ensure vue is installed
			},
			--[[
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
            ]]
		},
	},
	{
		"folke/trouble.nvim",
		-- opts will be merged with the parent spec
		opts = { use_diagnostic_signs = true },
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local trouble = require("trouble")
			if not trouble.statusline then
				LazyVim.error("You have enabled the **trouble-v3** extra,\nbut still need to update it with `:Lazy`")
				return
			end

			local symbols = trouble.statusline({
				mode = "symbols",
				groups = {},
				title = false,
				filter = { range = true },
				format = "{kind_icon}{symbol.name:Normal}",
				hl_group = "lualine_c_normal",
			})
			table.insert(opts.sections.lualine_c, {
				symbols.get,
				cond = symbols.has,
			})
		end,
	},
	{
		"fei6409/log-highlight.nvim",
		config = function()
			require("log-highlight").setup({})
		end,
	},
}
