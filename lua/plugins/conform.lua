return {
	{
		"stevearc/conform.nvim",
		opts = {
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
