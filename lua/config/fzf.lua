require("fzf-lua").setup({
	winopts = {
		split = "belowright new",
		border = "single",
		preview = {
			hidden = "hidden",
			border = "border",
			layout = "horizontal",
			horizontal = "right:50%",
		},
	},
})
