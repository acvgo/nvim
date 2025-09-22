return {
	{
		"stevearc/conform.nvim",
		opts = {
			ormat_on_save = { timeout_ms = 500, lsp_fallback = true },
			notify_on_error = true,
			formatters = {
				xmlformatter = {
					command = "xmlformatter",
					args = { "--indentation", "2" },
					stdin = true,
				},
			},
			formatters_by_ft = {
				xml = { "xmlformatter" },
			},
		},
	},
}
