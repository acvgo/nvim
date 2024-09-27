-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

cmp.setup({
	formatting = {
		format = require("nvim-highlight-colors").format,
	},
})
