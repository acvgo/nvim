-- Lualine Configuration
-- This configuration is mainly implemented from their github repository.
local function get_active_lsp()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if not clients or vim.tbl_isempty(clients) then
		return "No Active LSP"
	end
	local names = {}
	for _, c in ipairs(clients) do
		table.insert(names, c.name)
	end
	return table.concat(names, ",")
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype", { get_active_lsp } },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { { color = { bg = "#3e4451", fg = "#abb2bf" } } },
		lualine_b = { { color = { bg = "#3e4451", fg = "#abb2bf" } } },
		lualine_c = { { "filename", color = { bg = "#3e4451", fg = "#abb2bf" } } },
		lualine_x = { { "location", color = { bg = "#3e4451", fg = "#abb2bf" } } },
		lualine_y = { { color = { bg = "#3e4451", fg = "#abb2bf" } } },
		lualine_z = { { color = { bg = "#3e4451", fg = "#abb2bf" } } },
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
