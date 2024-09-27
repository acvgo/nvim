return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		filesystem = {
			filtered_items = {
				-- Show filtered items as greyed out
				visible = true,
				-- show the number of items not visible
				show_hidden_count = true,
				-- don't hide dot files
				hide_dotfiles = false,
				-- don't hide gitignored files
				hide_gitignored = false,
				-- Greys out these
				hide_by_name = {
					".git",
					-- '.DS_Store',
					-- 'thumbs.db',
				},
				never_show = {},
			},
		},
	},
}
