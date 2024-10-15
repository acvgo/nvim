return {
	"duckdm/neowarrior.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		--- Optional but recommended for nicer inputs
		--- 'folke/noice.nvim',
	},
	--- See config example below
	opts = {
		"duckdm/neowarrior.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			--- Optional but recommended for nicer inputs
			--- 'folke/noice.nvim',
		},
		config = function()
			local nw = require("neowarrior")
			local home = vim.env.HOME
			nw.setup({
				report = "next",
				filter = "\\(due.before:2d or due: \\)",
				dir_setup = {
					{
						dir = home .. "/dev/nvim/neowarrior.nvim",
						filter = "project:neowarrior",
						mode = "tree",
						expanded = true,
					},
				},
				float = {
					width = 55,
				},
				colors = {
					neowarrior = { group = "NeoWarrior", fg = "#3eeafa", bg = "black" },
					neowarrior_inverted = { group = "NeoWarriorInverted", fg = "black", bg = "#3cc8d7" },
					default = { group = "", fg = nil, bg = nil },
					dim = { group = "NeoWarriorTextDim", fg = "#A6ADC8", bg = nil },
					danger = { group = "NeoWarriorTextDanger", fg = "#e06c75", bg = nil },
					warning = { group = "NeoWarriorTextWarning", fg = "#ccaa00", bg = nil },
					success = { group = "NeoWarriorTextSuccess", fg = "#00cc00", bg = nil },
					info = { group = "NeoWarriorTextInfo", fg = "#00aaff", bg = nil },
					danger_bg = { group = "NeoWarriorTextDangerBg", fg = "#ffffff", bg = "#e06c75" },
					info_bg = { group = "NeoWarriorTextInfoBg", fg = "#9399B2", bg = "#00aaff" },
					project = { group = "NeoWarriorGroup", fg = "#00aaff", bg = nil },
					annotation = { group = "NeoWarriorAnnotation", fg = "#00aaff", bg = nil },
					tag = { group = "NeoWarriorTag", fg = "#ffffff", bg = "#A6ADC8" },
					current_date = { group = "NeoWarriorCurrentDate", fg = "#9399B2", bg = "#00aaff" },
					marked_date = { group = "NeoWarriorMarkedDate", fg = "#ffffff", bg = "#00aa66" },
				},
			})
			vim.keymap.set("n", "<leader>nl", function()
				nw.open_left()
			end, { desc = "Open nwarrior on the left side" })
			vim.keymap.set("n", "<leader>nc", function()
				nw.open_current()
			end, { desc = "Open nwarrior below current buffer" })
			vim.keymap.set("n", "<leader>nb", function()
				nw.open_below()
			end, { desc = "Open nwarrior below current buffer" })
			vim.keymap.set("n", "<leader>na", function()
				nw.open_above()
			end, { desc = "Open nwarrior above current buffer" })
			vim.keymap.set("n", "<leader>nr", function()
				nw.open_right()
				-- Manually set the width after opening on the right
				local win_id = vim.api.nvim_get_current_win()
				vim.api.nvim_win_set_width(win_id, 50) -- Set width to 30 columns
			end, { desc = "Open nwarrior on the right side" })
			vim.keymap.set("n", "<leader>nt", function()
				nw.focus()
			end, { desc = "Focus nwarrior" })
		end,
	},
}
