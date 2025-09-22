-- cmp may be lazy-loaded; guard the require
local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then
	return
end

-- try to load the colors formatter
local ok_colors, colors = pcall(require, "nvim-highlight-colors")

-- compose with any existing formatter (if you had one)
local existing = (cmp.get_config().formatting or {}).format

local function compose_formatters(a, b)
	if a and b then
		return function(entry, item)
			item = a(entry, item) or item
			return b(entry, item) or item
		end
	end
	return a or b
end

cmp.setup({
	formatting = {
		format = compose_formatters(
			existing,
			ok_colors and colors.format or nil -- only add if available
		),
	},
})
