-- ~/.config/nvim/lua/config/vtsls.lua
-- Ensure a vtsls workspace client exists when opening .vue files so vue_ls won't complain.
-- vtsls never stays attached to .vue buffers.

local util = require("lspconfig.util")
local uv = vim.uv or vim.loop

local mason_data = vim.fn.stdpath("data") .. "/mason"
local VTSLS = mason_data .. "/bin/vtsls"
local VUE_PLUGIN_DIR = mason_data .. "/packages/vue-language-server/node_modules/@vue/language-server"

local function workspace_root(bufnr)
	local fname = vim.api.nvim_buf_get_name(bufnr)
	return util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(fname) or uv.cwd()
end

local function ensure_vtsls(bufnr)
	if vim.fn.executable(VTSLS) == 0 then
		-- vtsls not installed / not executable; vue_ls will warn until this is fixed
		return
	end

	local root = workspace_root(bufnr)

	-- Already running for this workspace?
	for _, c in ipairs(vim.lsp.get_clients()) do
		if c.name == "vtsls" and c.config and c.config.root_dir == root then
			return
		end
	end

	-- Start a workspace vtsls (unattached to .vue)
	vim.lsp.start({
		name = "vtsls",
		cmd = { VTSLS, "--stdio" },
		root_dir = root,
		settings = {
			vtsls = {
				autoUseWorkspaceTsdk = true,
				tsserver = {
					globalPlugins = {
						{
							name = "@vue/typescript-plugin",
							location = VUE_PLUGIN_DIR,
							languages = { "vue" },
						},
					},
				},
			},
		},
		on_attach = function(client, b)
			if vim.bo[b].filetype == "vue" then
				vim.schedule(function()
					pcall(vim.lsp.buf_detach_client, b, client.id) -- ? correct API
				end)
			end
		end,
	})
end

-- Start vtsls shortly after a .vue is opened (faster NVIM startup).
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.vue",
	callback = function(args)
		vim.defer_fn(function()
			pcall(ensure_vtsls, args.buf)
		end, 25)
	end,
})

-- Extra guard: if vtsls ever attaches to a .vue buffer, drop it.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "vtsls" and vim.bo[args.buf].filetype == "vue" then
			vim.schedule(function()
				pcall(vim.lsp.buf_detach_client, args.buf, client.id) -- ? correct API
			end)
		end
	end,
})
