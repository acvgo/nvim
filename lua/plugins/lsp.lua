return {
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		opts = {
			PATH = "append",
			ensure_installed = {
				"bash-language-server",
				"css-lsp",
				"eslint_d",
				"gopls",
				"html-lsp",
				"json-lsp",
				"lemminx",
				"python-lsp-server",
				-- don't install ts_ls (typescript-language-server); we'll use vtsls
				"vtsls",
				"vue-language-server",
				"xmlformatter",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			servers = {
				-- Start vtsls for TS/JS
				vtsls = {
					cmd = { vim.fn.stdpath("data") .. "/mason/bin/vtsls", "--stdio" },
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
				},
				-- Use the new name directly (volar is deprecated alias)
				vue_ls = {
					filetypes = { "vue" },
				},
			},
			setup = {
				-- Safety valve: if anything tries to set up the old alias 'volar', skip it
				volar = function()
					return true
				end,

				-- Optional: formatting toggle for Vue
				vue_ls = function(_, _)
					require("snacks.util").lsp.on(function(client, _)
						if client.name == "vue_ls" then
							client.server_capabilities.documentFormattingProvider = true
						end
					end)
				end,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
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
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
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
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icon support
		config = function()
			require("fzf-lua").setup({})
		end,
	},
}
