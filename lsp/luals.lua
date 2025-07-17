local mason_path = vim.fn.stdpath("data") .. "/mason/packages/lua-language-server/lua-language-server"

return {
	cmd = { mason_path },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	telemetry = { enabled = false },
	formatters = {
		ignoreComments = false,
	},
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				version = "LuaJIT",
			},
			signatureHelp = { enabled = true },
		},
	},
}
