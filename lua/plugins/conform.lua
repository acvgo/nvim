return {
	{
		"stevearc/conform.nvim",
		opts = {
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
