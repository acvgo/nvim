return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		filesystem = {
			-- follow_current_file = { enabled = true }, -- auto-jump to the file you’re editing
			-- group_empty_dirs = true, -- collapses long chains of empty dirs
			-- use_libuv_file_watcher = true, -- instant updates on file changes
			filtered_items = {
				visible = true, -- Show filtered items as greyed out
				show_hidden_count = true, -- show the number of items not visible
				hide_dotfiles = false, -- don't hide dot files
				hide_gitignored = false, -- don't hide gitignored files
				hide_by_name = { -- Greys out these
					".git",
					-- '.DS_Store',
					-- 'thumbs.db',
				},
				never_show = {},
			},
		},
	},
}
